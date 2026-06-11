# ParcialJDBC — Chuleta de variantes

Proyecto unificado con los 5 ejercicios (Tickets, Reclamos, Caja, TipoCliente, Aerolínea) en una sola webapp.
Conexión unificada: `jdbc:sqlserver://localhost:1435;databaseName=pdc` — usuario `sa` / `Password1!` (ajustar si hace falta).

## Dónde está cada variante

| Variante | Archivo (paquete `com.munoz.parcialjdbc`) | Detalle |
|---|---|---|
| **Statement** — consulta simple SIN parámetros | `clientes/IndexServlet` | `createStatement()` + `executeQuery` + `while` (varios registros) + 2 try (sin transacción) |
| **PreparedStatement** — consulta CON parámetros | `tickets/BusquedaServlet` | `executeQuery` + `while` + lista de beans + `c:forEach` en datos.jsp |
| **PreparedStatement** — consulta de UN registro | `referencia/BuscarUnoServlet` | `executeQuery` + `if` + 2 try |
| **PreparedStatement** — INSERT | `reclamos/RegistrarReclamoServlet` y `aerolinea/EnviarServlet` | `executeUpdate` + autocommit false + 3 try (commit/rollback) + `setNull` para opcionales |
| **PreparedStatement** — UPDATE | `referencia/ActualizarServlet` | `executeUpdate` + transacción (3 try) |
| **PreparedStatement** — DELETE | `referencia/EliminarServlet` | `executeUpdate` + transacción (3 try) |
| **CallableStatement** — SP que devuelve VARIOS registros | `clientes/SubtiposClientesServlet` | `prepareCall` + `executeQuery` + `while` |
| **CallableStatement** — SP que devuelve UN registro | `aerolinea/ValidarServlet` | `prepareCall` + `executeQuery` + `if` + bean |
| **CallableStatement** — SP INSERT (transacción) | `tickets/NuevoServlet` y `caja/InsertarProductoServlet` | `executeUpdate` + autocommit false + 3 try |
| **CallableStatement** — SP con parámetro OUTPUT | `reclamos/ValidarChasisServlet` / `ValidarTodoServlet` | `registerOutParameter` + `execute()` + `getString(n)` → atributo → jsp → el JS lo inyecta en el DOM |

## Reglas rápidas (memorizar)

- `Statement` → consulta simple sin parámetros.
- `PreparedStatement` → consulta / insert / update / delete CON parámetros (`?`).
- `CallableStatement` → SIEMPRE que sea stored procedure (`{call dbo.sp(?,?)}`).
- `executeQuery()` → cuando devuelve ResultSet (selects, SP con select). NUNCA para insert/update/delete.
- `executeUpdate()` → insert / update / delete (devuelve int = filas afectadas).
- `execute()` → booleano; SP con OUTPUT o sentencia sin saber qué devuelve.
- **Transacción (insert/update/delete)** → `conn.setAutoCommit(false)` + 3 try: externo (driver) → connection → statement con `commit()` y `catch { rollback(); throw; }`.
- **Solo consulta** → autocommit default (true) → 2 try (connection + statement en el mismo try-with-resources).
- ResultSet de 1 registro → `if (rs.next())`. De varios → `while (rs.next())` + `List<Bean>` + `c:forEach`.
- Parámetro OUTPUT de SP → `registerOutParameter(n, Types.X)` + `execute()` + `getX(n)` → se guarda en variable → `req.setAttribute` → el jsp lo imprime y el JS lo recibe vía fetch.
- Parámetro opcional → `if (valor != null && !valor.isEmpty()) setString else setNull(n, Types.VARCHAR)`.

## Mapeos URL (cada módulo en su subcarpeta)

- `/` → menú de ejercicios
- `/tickets/` → buscar.jsp (servlet), cargar.jsp (servlet), index.jsp, datos.jsp
- `/reclamos/` → enviar.jsp, validarChasis.jsp, validarTodo.jsp (servlets), index.jsp, validar.jsp, mensaje.jsp
- `/caja/` → insertarProducto.jsp (servlet), index.jsp, producto.jsp
- `/clientes/` → index.jsp (servlet GET → forward a listado.jsp), subtiposclientes.jsp (servlet), clientes.jsp
- `/aerolinea/` → validar.jsp, enviar.jsp (servlets), index.jsp, datos.jsp, mensaje.jsp
- `/referencia/` → actualizar.jsp, eliminar.jsp, buscarUno.jsp (sin front; para copiar código)
- Compartidos en raíz: `error-modal.jsp`, `error-page.jsp`, `/js/*.js`

Nota: los fetch del JS usan rutas relativas ("buscar.jsp", "enviar.jsp", etc.), por eso siguen funcionando: cada página vive en la misma subcarpeta que su servlet.
