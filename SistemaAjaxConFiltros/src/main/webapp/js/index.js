let busquedaTimeout;

const actualizarPanel = async (url, params) => {
    try {
        const response = await fetch(url, {
            method: "POST",
            headers: {"Content-Type": "application/x-www-form-urlencoded"},
            body: new URLSearchParams(params)
        });

        if (!response.ok) {
            throw new Error(`HTTP ${response.status}`);
        }

        const html = await response.text();
        const panel = document.getElementById("pedidos-panel");
        if (panel) {
            panel.outerHTML = html;
        }
    } catch (err) {
        console.error("Error AJAX:", err);
    }
};

const onBusquedaInput = (event) => {
    clearTimeout(busquedaTimeout);
    const textoBusqueda = event.target.value;

    busquedaTimeout = setTimeout(() => {
        buscarPedidos(textoBusqueda);
    }, 300);
};

const buscarPedidosDesdeBoton = () => {
    const input = document.getElementById("busqueda-input");
    buscarPedidos(input ? input.value : "");
};

const limpiarBusqueda = () => {
    buscarPedidos("");
};

const buscarPedidos = (textoBusqueda) => {
    actualizarPanel("acciones/buscarPedidos.jsp", {textoBusqueda});
};

const cambiarFiltro = (filtroNuevo) => {
    actualizarPanel("acciones/cambiarFiltro.jsp", {filtroNuevo});
};

const cambiarPagina = (paginaNueva) => {
    actualizarPanel("acciones/cambiarPagina.jsp", {paginaNueva});
};

const ordenarPedidos = (campo) => {
    actualizarPanel("acciones/ordenarPedidos.jsp", {campo});
};

const cambiarEstadoPedido = (idPedido, estadoNuevo) => {
    actualizarPanel("acciones/cambiarEstadoPedido.jsp", {idPedido, estadoNuevo});
};
