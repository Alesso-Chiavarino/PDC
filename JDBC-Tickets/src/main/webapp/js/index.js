const ticketForm = document.getElementById("ticketForm");
const tableWrapper = document.getElementById("tableWrapper");
const nuevoTicketForm = document.getElementById("nuevoTicketForm");

const getSearchParams = () => {
    const data = new FormData(ticketForm);
    return {
        textoBusqueda: data.get("textoBusqueda") ?? "",
        orden: data.get("orden") ?? "F"
    };
};

const showTicketForm = () => {
    tableWrapper.classList.add("d-none");
    nuevoTicketForm.classList.remove("d-none");
};

const hideTicketForm = () => {
    nuevoTicketForm.classList.add("d-none");
    tableWrapper.classList.remove("d-none");
};

const jListados = {
    buscar: async (searchParams) => {
        return fetch("./buscarTicket.jsp", {
            method: "POST",
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            },
            body: new URLSearchParams(searchParams)
        });
    },
    renderBuscar: async (searchParams) => {
        const response = await jListados.buscar(searchParams);

        if (!response.ok) {
            const text = await response.text();
            throw new Error(text || response.statusText);
        }

        const html = await response.text();
        jUtils.show("tableWrapper", html);
    },
    buscarTicket: async (event) => {
        try {
            event.preventDefault();

            jUtils.clean("iError");
            jUtils.showLoading();

            await jListados.renderBuscar(getSearchParams());
            hideTicketForm();
        } catch (error) {
            console.log(error);
            jUtils.show("iError", error.message);
        } finally {
            jUtils.hideLoading();
        }
    },
    nuevoTicket: async (event) => {
        try {
            event.preventDefault();

            jUtils.clean("iError");
            jUtils.showLoading();

            const data = new FormData(event.target);
            const response = await fetch("./nuevoTicket.jsp", {
                method: "POST",
                headers: {
                    "Content-Type": "application/x-www-form-urlencoded"
                },
                body: new URLSearchParams({
                    solicitante: data.get("solicitante") ?? "",
                    email: data.get("email") ?? "",
                    asunto: data.get("asunto") ?? "",
                    texto: data.get("texto") ?? ""
                })
            });

            if (!response.ok) {
                const text = await response.text();
                throw new Error(text || response.statusText);
            }

            event.target.reset();
            await jListados.renderBuscar(getSearchParams());
            hideTicketForm();
        } catch (error) {
            console.log(error);
            jUtils.show("iError", error.message);
        } finally {
            jUtils.hideLoading();
        }
    }
};

ticketForm.addEventListener("submit", jListados.buscarTicket);
nuevoTicketForm.addEventListener("submit", jListados.nuevoTicket);

const nuevoTicket = () => {
    jUtils.clean("iError");
    showTicketForm();
};

const cancelarNuevoTicket = () => {
    jUtils.clean("iError");
    nuevoTicketForm.reset();
    hideTicketForm();
};

window.nuevoTicket = nuevoTicket;
window.cancelarNuevoTicket = cancelarNuevoTicket;
