const jListados = {
    buscar: async (url, searchParams) => {
        return fetch(url, {
            method: "POST",
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            },
            body: new URLSearchParams(searchParams)
        });
    },
    renderBuscar: async (searchParams) => {
        const response = await jListados.buscar("./buscarSubtipoCliente.jsp", searchParams);

        if (!response.ok) {
            const text = await response.text();
            throw new Error(text || response.statusText);
        }

        const html = await response.text();
        jUtils.show("tableWrapper", html);
    },
    buscarSubtipoCliente: async (unidadNegocio) => {
        try {
            jUtils.clean("iError");
            jUtils.showLoading();

            const searchParams = {
                unidadNegocio: unidadNegocio
            };
            await jListados.renderBuscar(searchParams);
        } catch (error) {
            console.log(error);
            jUtils.show("iError", error.message);
        } finally {
            jUtils.hideLoading();
        }
    },
    guardarSubtiposCliente: async () => {
        try {
            jUtils.clean("iError");
            jUtils.showLoading();

            const rows = document.querySelectorAll("#subtiposClientesBody tr");
            const body = new URLSearchParams();

            rows.forEach((row) => {
                const checkbox = row.querySelector(".subtipo-habilitado");
                body.append("codTipoCliente", row.dataset.codTipoCliente);
                body.append("nroSubtipo", row.dataset.nroSubtipo);
                body.append("habilitado", checkbox.checked ? "S" : "N");
            });

            const response = await fetch("./actualizarSubtiposCliente.jsp", {
                method: "POST",
                headers: {
                    "Content-Type": "application/x-www-form-urlencoded"
                },
                body: body
            });

            if (!response.ok) {
                const text = await response.text();
                throw new Error(text || response.statusText);
            }

            document.getElementById("unidadNegocioSelect").value = "";
            jUtils.clean("tableWrapper");
        } catch (error) {
            console.log(error);
            jUtils.show("iError", error.message);
        } finally {
            jUtils.hideLoading();
        }
    }
};

const seleccionarUnidadNegocio = async (event) => {
    const valorActual = event.target.value;

    if (valorActual === "") {
        jUtils.clean("iError");
        jUtils.clean("tableWrapper");
        return;
    }

    await jListados.buscarSubtipoCliente(valorActual);
};

const guardarCambiosSubtipos = async () => {
    await jListados.guardarSubtiposCliente();
};

const cancelarCambiosSubtipos = async () => {
    const unidadNegocio = document.getElementById("unidadNegocioSelect").value;

    if (unidadNegocio === "") {
        jUtils.clean("tableWrapper");
        return;
    }

    await jListados.buscarSubtipoCliente(unidadNegocio);
};

window.seleccionarUnidadNegocio = seleccionarUnidadNegocio;
window.guardarCambiosSubtipos = guardarCambiosSubtipos;
window.cancelarCambiosSubtipos = cancelarCambiosSubtipos;
