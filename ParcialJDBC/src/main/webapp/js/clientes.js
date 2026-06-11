const selectUnidades = document.getElementById('selectUnidades');

selectUnidades.addEventListener('change', async() => {
    console.log(selectUnidades.value);



    try {
        jUtils.clean('iError');
        jUtils.showLoading();
        //     Limpio la capa de error y muestro el loader

        const data = selectUnidades.value;
        // Capturo la data del formulario

        const response = await fetch("subtiposclientes.jsp", {
            method: "POST",
            body: new URLSearchParams({ cod_unidad_negocio: data }),
            // Solo le estoy pasando el parametro que quiero con la data que es el value del select
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            }
        });

        if (!response.ok) {
            const text = await response.text();
            throw new Error(text || response.statusText);
        }

        jUtils.show('iResultado', await response.text());

    }
        //     tengo que cargar la lectura del id del formulario despues, porque el defer hace que se cargue luego que se lea todo, el 2do viene por ajax.
        // show lo que hace es hacer un innerHTML y sacar la clase que estaba como d-none

    catch (e) {
            jUtils.show('iError', e.message);
            //     Llamo a mostrar el div error con el mensaje del error de la data
        }

    finally {
            jUtils.hideLoading();
            //     quito el loader

        }
})