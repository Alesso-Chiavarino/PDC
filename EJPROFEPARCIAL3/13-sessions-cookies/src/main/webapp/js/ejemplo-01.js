const jCookies = {
    add: async (event) => {
        try {
            event.preventDefault();
            jUtils.clean("iError");

            jUtils.showLoading();

            const data = new FormData(event.target);

            const response = await fetch("cookie.jsp",{
                method: "POST",
                body: new URLSearchParams(new FormData(event.target)),
                headers: {
                    "Content-Type": "application/x-www-form-urlencoded"
                },
                credentials: "include"  //Incluir credenciales (cookies) en la solicitud
            });

            if(!response.ok) {
                const text = await response.text();
                throw new Error(text || response.statusText);
            }

            document.querySelector("table tbody tr:last-child").insertAdjacentHTML('beforebegin', await response.text());
            event.target.reset();
            document.querySelector("table tbody input[type=text]:first-child").focus();
        }
        catch (error) {
            console.log(error);
            jUtils.show("iError", error.message);
        }
        finally {
            jUtils.hideLoading();
        }
    },

    del: async (attrName, btn) => {
        try {
            event.preventDefault();
            jUtils.clean("iError");

            jUtils.showLoading();

            const response = await fetch(`cookie.jsp?delAttrName=${attrName}`,{
                method: "GET",
                credentials: "include"  //Incluir credenciales (cookies) en la solicitud
            });

            if(!response.ok) {
                const text = await response.text();
                throw new Error(text || response.statusText);
            }

            btn.closest("tr").remove();
            document.querySelector("table tbody input[type=text]:first-child").focus();
        }
        catch (error) {
            console.log(error);
            jUtils.show("iError", error.message);
        }
        finally {
            jUtils.hideLoading();
        }
    }
};

document.getElementById("iForm").addEventListener("submit", jCookies.add);