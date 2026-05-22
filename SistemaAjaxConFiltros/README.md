# SistemaAjaxConFiltros

## Enunciado
Implementar un sistema de gestión de pedidos con **actualización parcial del DOM usando AJAX** y persistencia del estado en sesión.

### Requisitos funcionales
1. Mostrar una tabla de pedidos con los siguientes campos:
- ID
- Cliente
- Producto
- Estado
- Fecha de entrega
- Total
- Acción para cambiar estado

2. Filtrar por estado desde botones tipo tabs:
- Todos
- Pendientes
- En preparación
- Entregados
- Cancelados

3. Búsqueda dinámica:
- Si el texto es numérico, buscar por ID exacto.
- Si es texto, buscar en cliente/producto/estado.

4. Paginación:
- Navegar entre páginas sin recargar toda la vista.
- Al cambiar filtro o búsqueda, volver automáticamente a página 1.

5. Ordenamiento por columna:
- Click en encabezado para ordenar.
- Si se hace click dos veces sobre la misma columna, alternar ASC/DESC.

6. Cambio de estado por fila:
- Cada fila tiene un `select` de estado.
- Si el filtro activo deja de coincidir con el nuevo estado, la fila desaparece al refrescar el panel (por reemplazo AJAX del panel).

7. Persistencia en sesión:
- Deben persistir: filtro activo, texto de búsqueda, página actual, campo y dirección de orden.
- Con `F5`, la pantalla debe mantenerse como quedó.

## Arquitectura usada

### Beans (Java)
- `PedidoBean`: entidad de pedido.
- `PedidoManagerBean` (scope sesión):
- guarda la lista de pedidos.
- guarda estado de UI (filtro, búsqueda, página, orden).
- aplica filtrado, ordenamiento y paginación.

### Componentes JSP
- `componentes/pedidosPanel.jsp`: panel principal renderizable por AJAX.
- `componentes/pedidoRow.jsp`: fila individual.
- `componentes/paginacion.jsp`: botones de página.

### Acciones JSP (AJAX)
- `acciones/buscarPedidos.jsp`
- `acciones/cambiarFiltro.jsp`
- `acciones/cambiarPagina.jsp`
- `acciones/ordenarPedidos.jsp`
- `acciones/cambiarEstadoPedido.jsp`

Todas las acciones:
1. actualizan el estado del `PedidoManagerBean`.
2. recalculan lista paginada.
3. devuelven `pedidosPanel.jsp` para reemplazar `#pedidos-panel`.

### JavaScript
Archivo: `src/main/webapp/js/index.js`

Funciones:
- `onBusquedaInput`: búsqueda con debounce.
- `buscarPedidos`, `cambiarFiltro`, `cambiarPagina`, `ordenarPedidos`, `cambiarEstadoPedido`.
- `actualizarPanel`: helper común para `fetch` + reemplazo de HTML.

## Cómo probar
1. Abrir `index.jsp`.
2. Probar filtros y paginación.
3. Buscar por texto y por ID.
4. Ordenar varias columnas.
5. Cambiar estado de un pedido y verificar refresco.
6. Presionar `F5` y verificar que el estado visual persista.
