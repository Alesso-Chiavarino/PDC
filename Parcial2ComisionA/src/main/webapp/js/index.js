const quitarProducto = async (idPedido, idProducto) => {
    try {
        const expandido = document.getElementById("productos-table-body-" + idPedido)
            .getAttribute("expandido") === "true";

        const response = await fetch("actions/quitarProducto.jsp", {
            method: "POST",
            headers: {"Content-Type": "application/x-www-form-urlencoded"},
            body: new URLSearchParams({pedidoId: idPedido, id: idProducto, expandido})
        });

        if (!response.ok) {
            console.log(await response.text());
            return;
        }

        document.getElementById("pedido-" + idPedido).outerHTML = await response.text();

        if (expandido) {
            document.getElementById("productos-table-body-" + idPedido)
                .setAttribute("expandido", "true");
        }
    } catch (err) {
        console.log(err);
    }
};

const marcarEstadoPedido = async (event, pedidoId) => {
    const checkbox = event.target;
    const estadoAnterior = !checkbox.checked;
    const listo = checkbox.checked;

    try {
        const response = await fetch("actions/marcarEstadoPedido.jsp", {
            method: "POST",
            headers: {"Content-Type": "application/x-www-form-urlencoded"},
            body: new URLSearchParams({pedidoId, listo})
        });

        if (!response.ok) {
            throw new Error("Error al actualizar estado");
        }

        const html = await response.text();
        document.getElementById(`pedido-${pedidoId}`).outerHTML = html;
    } catch (err) {
        checkbox.checked = estadoAnterior;
        console.error(err);
    }
};
const verMasProductos = async (pedidoId, cantidad) => {
    cantidad = cantidad + 5;

    const response = await fetch("actions/verMasProductos.jsp", {
        method: "POST",
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
        body: new URLSearchParams({pedidoId, cantidad})
    });

    if (!response.ok) throw new Error(response.statusText);

    const html = await response.text();
    document.getElementById(`pedido-${pedidoId}`).outerHTML = html;
}
