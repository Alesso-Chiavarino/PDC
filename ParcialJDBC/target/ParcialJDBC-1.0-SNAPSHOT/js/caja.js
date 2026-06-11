const formulario = document.getElementById('iForm');
const tablaElementos = document.getElementById('tablaElementos');
const carrito = [];

formulario.addEventListener('submit', async (e) => {
    e.preventDefault();
    try {
        jUtils.showLoading();

        const data = new FormData(e.target);
        const response = await fetch("insertarProducto.jsp", {
            method: "POST",
            body: new URLSearchParams(data),
            headers: { "Content-Type": "application/x-www-form-urlencoded" }
        });

        const html = await response.text();

        if (!response.ok) {
            jUtils.show('iError', html);
            return;
        }

        tablaElementos.insertAdjacentHTML('beforeend', html);

        const ultimaFila = tablaElementos.lastElementChild;
        carrito.push(filaAObjeto(ultimaFila));
        actualizarUltimoProducto(ultimaFila);
        recalcularTotal();

        e.target.reset();

    } catch (err) {
        jUtils.show('iError', err.message);
    } finally {
        jUtils.hideLoading();
    }
});

function filaAObjeto(fila) {
    return {
        codBarra:    fila.dataset.codBarra,
        nomProducto: fila.dataset.nomProducto,
        precio:      parseFloat(fila.dataset.precio)
    };
}

function actualizarUltimoProducto(fila) {
    const precio = parseFloat(fila.dataset.precio);
    document.getElementById('iUltimoPrecio').textContent = `$${precio.toFixed(2)}`;
    document.getElementById('iUltimoNombre').textContent = fila.dataset.nomProducto;
    document.getElementById('iUltimoCod').textContent = fila.dataset.codBarra;
}

function recalcularTotal() {
    const total = carrito.reduce((acc, producto) => acc + producto.precio, 0);
    document.getElementById('iTotal').textContent = `$${total.toFixed(2)}`;
}
