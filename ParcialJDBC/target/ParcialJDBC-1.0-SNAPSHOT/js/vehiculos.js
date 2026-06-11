const chasisNo = document.getElementById('chasisNo');
const chasisSi = document.getElementById('chasisSi');
const chasis = document.getElementById('chasis');
const patente = document.getElementById('patente');

const divChasis = document.getElementById('divChasis');
const divPatente = document.getElementById('divPatente')
const divKilometros = document.getElementById('divKilometros')

function toggleCamposVehiculo() {
    if (chasisNo.checked) {
        jUtils.hide('divChasis');
        jUtils.hide('divPatente');
        jUtils.hide('divKilometros');
    } else {
        jUtils.show('divChasis');
        jUtils.show('divPatente');
        jUtils.show('divKilometros');
    }
}

chasisSi.addEventListener('change', toggleCamposVehiculo);
chasisNo.addEventListener('change', toggleCamposVehiculo);



chasis.addEventListener('blur', async () => {

    try {
        jUtils.clean('iError');
        jUtils.showLoading();

        const nroChasis = chasis.value;

        const response = await fetch("validarChasis.jsp", {
            method: "POST",
            body: new URLSearchParams({ nroChasis: nroChasis}),
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            }
        });

        if(!response.ok){
            const text = await response.text();
            throw new Error(text || response.statusText);
        }

        const html = await response.text();
        document.getElementById('imagenValidar').innerHTML = html;

    }

    catch (e) {
        jUtils.show('iError', e.message);
    }

    finally {
        jUtils.hideLoading();
    }


})



patente.addEventListener('blur', async () => {

    console.log('patente ' + chasis.value)

    try {
        jUtils.clean('iError');
        jUtils.showLoading();

        const nroPatente = patente.value;

        const response = await fetch("validarTodo.jsp", {
            method: "POST",
            body: new URLSearchParams({ nroChasis: chasis.value, patente: nroPatente }),
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            }
        });

        if(!response.ok){
            const text = await response.text();
            throw new Error(text || response.statusText);
        }

        const html = await response.text();
        document.getElementById('validacionAmbos').innerHTML = html;

    }

    catch (e) {
        jUtils.show('iError', e.message);
    }

    finally {
        jUtils.hideLoading();
    }


})

const formulario = document.getElementById('iForm');

formulario.addEventListener('submit', async (e) => {
    e.preventDefault();

    try {
        jUtils.clean('iError');
        jUtils.showLoading();

        const data = new FormData(e.target);

        const response = await fetch("enviar.jsp", {
            method: "POST",
            body: new URLSearchParams(data),
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            }
        });

        if(!response.ok){
            const text = await response.text();
            throw new Error(text || response.statusText);
        }

        const html = await response.text();
        document.querySelector('body').innerHTML = html;

    }

    catch (e) {
        jUtils.show('iError', e.message);
    }

    finally {
        jUtils.hideLoading();
    }

})