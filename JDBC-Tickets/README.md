El caso de estudio se corresponde a un “Sistema de Tickets”, cada punto se corresponde con una funcionalidad requerida
para su implementación.

Restricciones

- No se permite el uso de scriptlet.
- Deberán aplicarse los estilos de Bootstrap para presentar la página de manera prolija.

(1)    Desarrollar una página que presente un criterio de búsqueda que contenga un campo para la cadena de búsqueda, una
lista de valores presentadas como radiobuttons que sirve para ordenar los resultados y un botón “Buscar”.
Los valores de la lista serán:

- S: Por solicitante
- F: Por fecha
- T: Por número

Mostrar marcado por defecto el valor “F”.

(2)    Programar el comportamiento del botón “Buscar” que deberá invocar con AJAX un servlet que utilice la consulta SQL
correspondiente recibiendo los parámetros de búsqueda especificados en el criterio y luego presente una tabla con los
resultados obtenidos.
Al cargarse por primera vez la página se deberá ejecutar automáticamente la consulta.
Finalmente, al final de la tabla mostrar un botón “Nuevo ticket”.

Ticket N° Fecha Solicitante Asunto Texto
2014-00001 08/02/2014 17:12 SOLICITANTE 1 ASUNTO 1 TEXTO 1 TEXTO 1 TEXTO 1 TEXTO 1…
2014-00002 07/03/2014 16:00 SOLICITANTE 2 ASUNTO 2 TEXTO 2 TEXTO 2 TEXTO 2 TEXTO 2…
2014-00003 16/05/2014 10:30 SOLICITANTE 3 ASUNTO 3 TEXTO 3 TEXTO 3 TEXTO 3 TEXTO 3…
… … … … …

(3)    Programar el comportamiento del botón “Nuevo ticket” que oculte “transitoriamente” la presentación de los
resultados para invocar con AJAX un archivo JSP que presente un formulario que permita cargar un nuevo ticket. El
formulario deberá contar con campos para informar el nombre del solicitante, un correo, un asunto y un texto. A su vez,
deberá tener dos botones “Registrar” y “Cancelar”.

(4)    Programar el comportamiento de los botones del formulario:

- Registrar: Deberá controlarse que todos los campos estén informados. Luego, se deberá invocar con AJAX un servlet que
  ejecute el procedimiento dbo.ins_ticket. Si la grabación fue exitosa, se deberá volver a mostrar los resultados y
  lanzar la búsqueda. De presentarse un error deberá seguir mostrándose el formulario.
- Cancelar: Deberá volver a mostrar los resultados limpiando el formulario presentado en su momento.


