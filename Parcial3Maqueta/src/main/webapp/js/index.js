const jParcialTemplates = {
    postHTML: async (url, body, wrapperId) => {
        try {
            jUtils.clean("modalWrapper");
            jUtils.showLoading();

            const response = await fetch(url, {
                method: "POST",
                headers: {
                    "Content-Type": "application/x-www-form-urlencoded"
                },
                body
            });

            const html = await response.text();

            if (!response.ok) {
                jUtils.show("modalWrapper", html);
                return;
            }

            jUtils.show(wrapperId, html);
        } catch (error) {
            jUtils.show("modalWrapper", `
                <div class="alert alert-danger">
                    ${error.message}
                </div>
            `);
        } finally {
            jUtils.hideLoading();
        }
    },

    bindForm: (formId, url, wrapperId) => {
        const form = document.getElementById(formId);
        if (!form) {
            return;
        }

        form.addEventListener("submit", async (event) => {
            event.preventDefault();
            const data = new FormData(event.target);
            const body = new URLSearchParams(data);
            await jParcialTemplates.postHTML(url, body, wrapperId);
        });
    },

    init: () => {
        jParcialTemplates.bindForm("statementForm", "./statementConsulta.jsp", "statementWrapper");
        jParcialTemplates.bindForm("preparedQueryForm", "./preparedConsulta.jsp", "preparedQueryWrapper");
        jParcialTemplates.bindForm("preparedUpdateForm", "./preparedActualizacion.jsp", "preparedUpdateWrapper");
        jParcialTemplates.bindForm("callableQueryForm", "./callableConsulta.jsp", "callableQueryWrapper");
        jParcialTemplates.bindForm("callableUpdateForm", "./callableActualizacion.jsp", "callableUpdateWrapper");
        jParcialTemplates.bindForm("callableOutForm", "./callableSalida.jsp", "callableOutWrapper");
    }
};

document.addEventListener("DOMContentLoaded", jParcialTemplates.init);
