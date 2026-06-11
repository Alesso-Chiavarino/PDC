const formBusqueda = document.getElementById("formBusqueda");
const formPreferencia = document.getElementById("formPreferencia");

const jCookiesJDBC = {
    paginaActual: 1,

    fetchHTML: async (url, options = {}) => {
        const response = await fetch(url, options);
        const html = await response.text();

        if (!response.ok) {
            jUtils.show("modalWrapper", html);
            throw new Error("Error en la solicitud");
        }

        return html;
    },

    cargarPreferencia: async () => {
        try {
            const html = await jCookiesJDBC.fetchHTML("./verPreferencia.jsp", {
                method: "GET"
            });
            jUtils.show("preferenciaWrapper", html);
        } catch (error) {
            console.log(error);
        }
    },

    listarLibros: async (pagina = 1) => {
        try {
            jUtils.clean("modalWrapper");
            jUtils.showLoading();

            const data = new FormData(formBusqueda);
            data.append("pagina", pagina);

            const html = await jCookiesJDBC.fetchHTML("./listarLibros.jsp", {
                method: "POST",
                headers: {
                    "Content-Type": "application/x-www-form-urlencoded"
                },
                body: new URLSearchParams(data)
            });

            jCookiesJDBC.paginaActual = pagina;
            jUtils.show("librosWrapper", html);
        } catch (error) {
            console.log(error);
        } finally {
            jUtils.hideLoading();
        }
    },

    guardarPreferencia: async (event) => {
        try {
            event.preventDefault();
            jUtils.clean("modalWrapper");
            jUtils.showLoading();

            const data = new FormData(event.target);

            const html = await jCookiesJDBC.fetchHTML("./guardarPreferencia.jsp", {
                method: "POST",
                headers: {
                    "Content-Type": "application/x-www-form-urlencoded"
                },
                body: new URLSearchParams(data)
            });

            jUtils.show("preferenciaWrapper", html);
            await jCookiesJDBC.cargarPreferencia();
            await jCookiesJDBC.listarLibros(1);
        } catch (error) {
            console.log(error);
        } finally {
            jUtils.hideLoading();
        }
    },

    borrarPreferencia: async () => {
        try {
            jUtils.clean("modalWrapper");
            jUtils.showLoading();

            const html = await jCookiesJDBC.fetchHTML("./borrarPreferencia.jsp", {
                method: "POST"
            });

            jUtils.show("preferenciaWrapper", html);
            await jCookiesJDBC.cargarPreferencia();
            await jCookiesJDBC.listarLibros(1);
        } catch (error) {
            console.log(error);
        } finally {
            jUtils.hideLoading();
        }
    },

    irPagina: async (pagina) => {
        if (pagina < 1) {
            return;
        }
        await jCookiesJDBC.listarLibros(pagina);
    },

    init: () => {
        formBusqueda.addEventListener("submit", async (event) => {
            event.preventDefault();
            await jCookiesJDBC.listarLibros(1);
        });

        formPreferencia.addEventListener("submit", jCookiesJDBC.guardarPreferencia);

        jCookiesJDBC.cargarPreferencia();
        jCookiesJDBC.listarLibros(1);
    }
};

document.addEventListener("DOMContentLoaded", jCookiesJDBC.init);
