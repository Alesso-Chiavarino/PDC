# EjemploCookiesJDBC

## Mini enunciado

Construir una pagina que:

1. Liste libros desde base de datos usando paginacion.
2. Permita guardar en una cookie la cantidad de registros por pagina.
3. Use esa cookie en las siguientes consultas.
4. Permita borrar la cookie.

## Estructura

- `guardarPreferencia.jsp`
  - crea la cookie `tamPaginaPreferido`
- `verPreferencia.jsp`
  - lee la cookie y muestra el valor actual
- `borrarPreferencia.jsp`
  - elimina la cookie
- `listarLibros.jsp`
  - consulta la base con `PreparedStatement`
  - usa la cookie para saber cuantas filas mostrar por pagina

## SQL

El script usado esta en:

- `src/main/resources/sql/index.sql`

Base simulada:

- `BibliotecaCookiesDemo`

## Idea de resolucion

- La cookie guarda solo un dato chico: cantidad por pagina.
- La paginacion se hace en backend con `offset ... fetch next`.
- El front usa AJAX para:
  - guardar preferencia
  - ver preferencia
  - borrar preferencia
  - volver a listar
