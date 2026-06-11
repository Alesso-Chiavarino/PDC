# Parcial3Maqueta

Maqueta rápida para parcial JDBC.

## Organización

- `servlets/ServletArquitectura`
  - Plantillas base
  - Casi para copiar y reemplazar nombres
  - Ordenadas por:
    - tipo de statement
    - transacción o no
    - con `ResultSet` o sin `ResultSet`

- `servlets/ServletArquitecturaLlena`
  - Ejemplos completos
  - Ya cargados con parámetros, SQL modelo y forwards
  - Ordenados con la misma lógica que la arquitectura base

## Árbol mental

- `Statement`
  - `SinTransaccion/ConResultSet`
    - `executeQuery()`
  - `ConTransaccion/SinResultSet`
    - `executeUpdate()`

- `PreparedStatement`
  - `SinTransaccion/ConResultSet`
    - `executeQuery()`
  - `ConTransaccion/SinResultSet`
    - `executeUpdate()`

- `CallableStatement`
  - `SinTransaccion/ConResultSet`
    - `executeQuery()`
  - `ConTransaccion/SinResultSet`
    - `executeUpdate()`
    - `execute()` con `registerOutParameter()`

## Qué trae

- `StatementConsultaServlet`
  - Consulta simple
  - Sin parámetros
  - `Statement`
  - `executeQuery()`
  - Sin transacción

- `PreparedConsultaServlet`
  - Consulta con parámetros
  - `PreparedStatement`
  - `executeQuery()`
  - Sin transacción

- `PreparedActualizacionServlet`
  - Insert / update / delete
  - `PreparedStatement`
  - `executeUpdate()`
  - `setAutoCommit(false)`
  - `commit()` / `rollback()`

- `CallableConsultaServlet`
  - Stored procedure con resultset
  - `CallableStatement`
  - `executeQuery()`

- `CallableActualizacionServlet`
  - Stored procedure que modifica datos
  - `CallableStatement`
  - `executeUpdate()`
  - `setAutoCommit(false)`

- `CallableSalidaServlet`
  - Stored procedure con output
  - `CallableStatement`
  - `registerOutParameter()`
  - `execute()`

## Reglas rápidas

- `Statement`: consulta simple sin `?`
- `PreparedStatement`: consulta o modificación con `?`
- `CallableStatement`: procedimiento almacenado
- `executeQuery()`: cuando esperás `ResultSet`
- `executeUpdate()`: cuando hacés `insert`, `update`, `delete`
- `execute()`: cuando el SP puede mezclar cosas o tiene output
- `while(result.next())`: muchos registros
- `if(result.next())`: un solo registro
- `setAutoCommit(false)`: si hay transacción

## Qué cambiar en el parcial

1. Renombrar servlet si hace falta.
2. Cambiar `CONNECTION_URL`.
3. Reemplazar SQL o nombre del SP.
4. Cambiar parámetros `request.getParameter(...)`.
5. Ajustar bean según columnas reales.
6. Ajustar JSP parcial si la profe pide tabla, fila, select o card.

## Manejo de errores

- Para AJAX:
  - `response.setStatus(400)`
  - `request.setAttribute("error", ex.getMessage())`
  - `forward("/components/error-modal.jsp")`

- Para carga inicial con servlet:
  - usar `pages/error-page.jsp`

## Consejo práctico

Si el enunciado dice:

- "consulta SQL": pensá `Statement` o `PreparedStatement`
- "recibe parámetros": `PreparedStatement`
- "procedimiento almacenado": `CallableStatement`
- "actualizar datos": transacción
- "devuelve número / id / salida": `registerOutParameter()`
