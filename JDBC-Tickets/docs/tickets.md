# Ejercicio JDBC 3 - Tickets

## Enunciado

El caso de estudio se corresponde a un "Sistema de Tickets", cada punto se corresponde con una funcionalidad requerida para su implementación.

## Restricciones

- No se permite el uso de scriptlet.
- Deberán aplicarse los estilos de Bootstrap para presentar la página de manera prolija.

## Requerimientos

### 1. Búsqueda de tickets

Desarrollar una página que presente un criterio de búsqueda que contenga:

- un campo para la cadena de búsqueda
- una lista de valores presentadas como radiobuttons que sirve para ordenar los resultados
- un botón `Buscar`

Los valores de la lista serán:

- `S`: Por solicitante
- `F`: Por fecha
- `T`: Por número

Mostrar marcado por defecto el valor `F`.

### 2. Buscar con AJAX

Programar el comportamiento del botón `Buscar` para que invoque con AJAX un servlet que utilice la consulta SQL correspondiente recibiendo los parámetros de búsqueda especificados en el criterio y luego presente una tabla con los resultados obtenidos.

Al cargarse por primera vez la página se deberá ejecutar automáticamente la consulta.

Finalmente, al final de la tabla mostrar un botón `Nuevo ticket`.

Columnas esperadas en la tabla:

- Ticket N°
- Fecha
- Solicitante
- Asunto
- Texto

### 3. Mostrar formulario de alta

Programar el comportamiento del botón `Nuevo ticket` para que oculte transitoriamente la presentación de los resultados e invoque con AJAX un archivo JSP que presente un formulario que permita cargar un nuevo ticket.

El formulario deberá contar con campos para:

- nombre del solicitante
- correo
- asunto
- texto

Además, deberá tener dos botones:

- `Registrar`
- `Cancelar`

### 4. Comportamiento de los botones del formulario

#### Registrar

Se deberá controlar que todos los campos estén informados. Luego, se deberá invocar con AJAX un servlet que ejecute el procedimiento `dbo.ins_ticket`.

Si la grabación fue exitosa:

- se deberá volver a mostrar los resultados
- se deberá lanzar nuevamente la búsqueda

Si se presenta un error:

- deberá seguir mostrándose el formulario

#### Cancelar

Deberá volver a mostrar los resultados limpiando el formulario presentado en su momento.

## Qué practica este ejercicio

- `fetch` con AJAX
- Servlets como controladores
- JSP parciales para renderizar HTML
- JDBC para consultas
- `CallableStatement` o `PreparedStatement`, según lo que entregue la profesora
- recarga parcial de pantalla sin refrescar toda la página

## Orden sugerido para resolverlo

1. Maquetar `index.jsp` con el criterio de búsqueda.
2. Hacer el servlet de búsqueda y el JSP parcial de resultados.
3. Ejecutar la búsqueda automática al cargar.
4. Hacer el JSP parcial del formulario `Nuevo ticket`.
5. Hacer el servlet de alta.
6. Conectar `Registrar` y `Cancelar`.
