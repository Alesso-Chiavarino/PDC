# SistemaActasUniversitarias

Proyecto de práctica JSP + JSTL + AJAX para gestión de actas de examen.

## Objetivo
Simular el flujo de cierre de actas universitarias:

1. Marcar alumnos como ausentes.
2. Filtrar la nómina por estado (`TODOS`, `PRESENTES`, `AUSENTES`).
3. Firmar/cerrar un acta.
4. Actualizar solo una parte del HTML (sin recargar toda la página).
5. Persistir estado en sesión para que al presionar `F5` se mantenga.

## Tecnologías

- Java + Jakarta Servlet/JSP
- JSTL (`core` y `fmt`)
- Bootstrap (WebJars)
- `fetch` API (AJAX)

## Estructura

- `src/main/java/com/alesso/sistemaactasuniversitarias/`
- `ActaBean.java`
- `InscripcionBean.java`
- `ActaManagerBean.java`
- `src/main/webapp/`
- `index.jsp`
- `js/index.js`
- `componentes/actaCard.jsp`
- `componentes/alumnoRow.jsp`
- `acciones/marcarAusente.jsp`
- `acciones/cambiarFiltro.jsp`
- `acciones/toggleFirmaActa.jsp`

## Modelo de datos

### `InscripcionBean`
Representa un alumno dentro del acta:
- `id`
- `legajo`
- `nombreCompleto`
- `ausente`

### `ActaBean`
Representa un acta:
- `id`
- `materia`
- `fechaExamen` (`Date`)
- `inscripciones` (`List<InscripcionBean>`)
- `firmada`
- `filtroActivo`

Además incluye `isAsistenciaPerfecta()` para saber si todos están presentes.

### `ActaManagerBean` (scope sesión)
Contiene la lista de actas y la lógica principal:
- `registrarAusencia(...)`
- `firmarActa(...)`
- `cambiarFiltro(...)`
- `getInscripcionesFiltradas(...)`

## Flujo de render

1. `index.jsp` recorre `manager.actas`.
2. Por cada acta:
- guarda el objeto en `requestScope` (`actaActual`)
- calcula `inscripcionesFiltradas`
- incluye `componentes/actaCard.jsp`
3. `actaCard.jsp` recorre alumnos e incluye `alumnoRow.jsp`.

## Flujo AJAX

## 1) Marcar ausente
Desde `alumnoRow.jsp` se llama:
- `marcarAusente(actaId, alumnoId)` (`index.js`)

Esto hace `POST` a:
- `acciones/marcarAusente.jsp`

En el action:
- ejecuta `manager.registrarAusencia(...)`
- vuelve a renderizar la card completa de esa acta

En frontend:
- si el filtro activo es `PRESENTES`, se elimina la fila del alumno directamente del DOM
- si no, se reemplaza la card completa (`outerHTML`)

## 2) Cambiar filtro
Desde `actaCard.jsp`:
- `marcarFiltro(actaId, filtroNuevo)`

Hace `POST` a:
- `acciones/cambiarFiltro.jsp`

El action:
- actualiza `filtroActivo` en sesión
- recalcula lista filtrada
- devuelve la card renderizada

## 3) Firmar/Cerrar acta
Desde checkbox en `actaCard.jsp`:
- `toggleFirmaActa(event, actaId)`

Hace `POST` a:
- `acciones/toggleFirmaActa.jsp`

El action:
- marca acta como firmada/no firmada
- devuelve la card actualizada

El badge de estado muestra:
- `Acta Cerrada: Asistencia 100%` (verde)
- `Acta Cerrada: Asistencia Parcial` (amarillo)
- `Pendiente de cierre` (gris)

## Persistencia en sesión

`<jsp:useBean ... scope="session">` hace que los cambios queden en memoria de sesión.
Por eso al refrescar (`F5`) se conserva:
- ausencias registradas
- filtro activo por acta
- estado de firma

## Notas importantes (errores típicos)

1. `jsp:param` llega como string
- Si pasás boolean, en el JSP parcial convertí con:
- `${param.ausente eq 'true'}`

2. Para pasar objetos entre includes, usar `requestScope`
- Ejemplo:
- `<c:set var="actaActual" value="${acta}" scope="request"/>`

3. Si el servidor muestra errores tipo `index_jsp ClassNotFound`
- normalmente falló la compilación JSP por otro error real previo
- revisar stacktrace completo y dependencias/versión Java

## Cómo ejecutarlo

1. Abrir el proyecto Maven en IntelliJ/Eclipse.
2. Configurar Tomcat/Jakarta compatible con Servlet 6.
3. Deploy del WAR.
4. Abrir `index.jsp`.

## Ejercicio sugerido para extender

- Agregar buscador por legajo/nombre con debounce.
- Mantener buscador + filtro + estado firmada en sesión.
- Mostrar contador de presentes/ausentes por acta.
