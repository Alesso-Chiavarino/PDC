const formularioBusqueda = document.getElementById('iFormBusqueda');

formularioBusqueda.addEventListener('submit', async (e) => {

    e.preventDefault();

    try {
        jUtils.clean('iError');
        jUtils.showLoading();
        //     Limpio la capa de error y muestro el loader

        const data = new FormData(event.target);
        // Capturo la data del formulario

        const response = await fetch("buscar.jsp", {
            method: "POST",
            body: new URLSearchParams(data),
            // Capturo la data le envio por POST con el resultado del formulario
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            }
        });

        if(!response.ok){
            const text = await response.text();
            throw new Error(text || response.statusText);
        }

        jUtils.show('iResultado', await response.text());
        //     tengo que cargar la lectura del id del formulario despues, porque el defer hace que se cargue luego que se lea todo, el 2do viene por ajax.
        // show lo que hace es hacer un innerHTML y sacar la clase que estaba como d-none

        const formularioNuevo = document.getElementById('iFormNuevo');

        formularioNuevo.addEventListener('submit', async (e) => {
            console.log('aa')

            e.preventDefault();

            try {
                jUtils.clean('iError');
                jUtils.showLoading();
                //     Limpio la capa de error y muestro el loader

                const data = new FormData(event.target);
                // Capturo la data del formulario

                const response = await fetch("cargar.jsp", {
                    method: "POST",
                    body: new URLSearchParams(data),
                    // Capturo la data le envio por POST con el resultado del formulario
                    headers: {
                        "Content-Type": "application/x-www-form-urlencoded"
                    }
                });

                if(!response.ok){
                    const text = await response.text();
                    throw new Error(text || response.statusText);
                }

                jUtils.show('iResultado', await response.text());
                //     tengo que cargar la lectura del id del formulario despues, porque el defer hace que se cargue luego que se lea todo, el 2do viene por ajax.
                // show lo que hace es hacer un innerHTML y sacar la clase que estaba como d-none

            }

            catch (e) {
                jUtils.show('iError', e.message);
                //     Llamo a mostrar el div error con el mensaje del error de la data
            }

            finally {
                jUtils.hideLoading();
                //     quito el loader

            }

        })


    }

    catch (e) {
        jUtils.show('iError', e.message);
        //     Llamo a mostrar el div error con el mensaje del error de la data
    }

    finally {
        jUtils.hideLoading();
        //     quito el loader

    }

})
const divResultados = document.getElementById('divResultados');
const divFormulario = document.getElementById('divFormulario');
const buttonNuevoPressed = () => {
    jUtils.hide('divResultados');
    jUtils.show('divFormulario');
}