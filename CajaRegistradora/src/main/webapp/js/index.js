const añadirProdForm = document.getElementById("añadirProdForm");
const prodListTbody = document.getElementById("prodListTbody");
const totalTh = document.getElementById("totalTh");

const jCajaRegistradora = {
    eliminarDelCarrito: async (nroDetalle) => {
        try {
            jUtils.clean("iError");
            jUtils.showLoading()

            const searchParams = new URLSearchParams({nroDetalle});

            const response = await fetch("./eliminarDelCarrito.jsp", {
                method: "POST",
                headers: {
                    "Content-Type": "application/x-www-form-urlencoded"
                },
                body: searchParams
            });

            if (!response.ok) {
                const text = await response.text();
                throw new Error(text || response.statusText);
            }

            jUtils.getElement(`prod-${nroDetalle}`).remove();
            jCajaRegistradora.actualizarDatos();
        } catch (error) {
            console.log(error);
            jUtils.show("iError", error.message);
        } finally {
            jUtils.hideLoading();
        }
    },
    insertarEnCarrito: async (searchParams) => {
        try {
            jUtils.clean("iError");
            jUtils.showLoading()

            const response = await fetch("./insertarEnCarrito.jsp", {
                method: "POST",
                headers: {
                    "Content-Type": "application/x-www-form-urlencoded"
                },
                body: searchParams
            });

            if (!response.ok) {
                const text = await response.text();
                throw new Error(text || response.statusText);
            }

            const html = await response.text();

            prodListTbody.insertAdjacentHTML("beforeend", html);
        } catch (error) {
            console.log(error);
            jUtils.show("iError", error.message);
        } finally {
            jUtils.hideLoading();
        }
    },
    actualizarDatos: () => {
        const rows = prodListTbody.querySelectorAll("tr");

        let total = 0;
        rows.forEach(row => {
            total += parseFloat(row.dataset.precio || 0);
        });


        totalTh.textContent = `$${total}`;

        const ultima = rows[rows.length - 1];
        if (ultima) {
            document.getElementById("ultimoPrecio").textContent = "$" + parseFloat(ultima.dataset.precio).toFixed(2);
            document.getElementById("ultimoNombre").textContent = ultima.dataset.nomProducto;
            document.getElementById("ultimoCodBarra").textContent = ultima.dataset.codBarra;
        } else {
            document.getElementById("ultimoPrecio").textContent = "$0.00";
            document.getElementById("ultimoNombre").textContent = "";
            document.getElementById("ultimoCodBarra").textContent = "";
        }
    }
};

añadirProdForm.addEventListener("submit", async (e) => {
    e.preventDefault();

    const data = new FormData(e.target);

    const searchParams = new URLSearchParams(data);

    await jCajaRegistradora.insertarEnCarrito(searchParams);

    jCajaRegistradora.actualizarDatos();

})

const eliminarProd = async (nroDetalle) => {

    await jCajaRegistradora.eliminarDelCarrito(nroDetalle)
}

document.addEventListener("DOMContentLoaded", () => {
    jCajaRegistradora.actualizarDatos();
})