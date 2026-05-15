const editarVehiculo = (nroChasis) => {
    const saveBtn = document.getElementById(`saveBtn-${nroChasis}`);
    const cancelBtn = document.getElementById(`cancelBtn-${nroChasis}`);
    const editBtn = document.getElementById(`editBtn-${nroChasis}`)
    const estadoSelect = document.getElementById(`estadoSelect-${nroChasis}`)

    const hideClass = "visually-hidden";

    estadoSelect.disabled = false;

    saveBtn.classList.remove(hideClass)
    cancelBtn.classList.remove(hideClass)
    editBtn.classList.add(hideClass)


}

const guardarVehiculo = async (nroChasis) => {
    const saveBtn = document.getElementById(`saveBtn-${nroChasis}`);
    const cancelBtn = document.getElementById(`cancelBtn-${nroChasis}`);
    const editBtn = document.getElementById(`editBtn-${nroChasis}`)
    const hideClass = "visually-hidden";
    const cuilInput = document.getElementById(`cuilInput-${nroChasis}`)
    const dominioInput = document.getElementById(`dominioInput-${nroChasis}`)
    const estadoSelect = document.getElementById(`estadoSelect-${nroChasis}`)
    const estadoActualVehiculo = estadoSelect.value;

    const cuilPropietarioNuevo = cuilInput.value
    const nuevoEstado = estadoActualVehiculo
    const nuevoDominio = dominioInput.value;

    saveBtn.classList.add(hideClass)
    cancelBtn.classList.add(hideClass)
    editBtn.classList.remove(hideClass)

    const selectedRow = document.getElementById(`vehiculoFila-${nroChasis}`);

    const urls = {
        PE: "actions/registrarDominio.jsp",
        DE: "actions/registrarDominio.jsp",
        ENT: "actions/registrarEntrega.jsp",
        BA: "actions/registrarBaja.jsp"
    };
    const URL = urls[estadoActualVehiculo];

    try {
        const response = await fetch(URL, {
            method: "POST",
            headers: {"Content-Type": "application/x-www-form-urlencoded"},
            body: new URLSearchParams({nroChasis, cuilPropietarioNuevo, nuevoEstado, nuevoDominio, action: "update"})
        });

        const html = await response.text();

        selectedRow.outerHTML = html;
    } catch (err) {
        console.log(err);
    }
}


const cancelarEditarVehiculo = (nroChasis) => {
    const saveBtn = document.getElementById(`saveBtn-${nroChasis}`);
    const cancelBtn = document.getElementById(`cancelBtn-${nroChasis}`);
    const editBtn = document.getElementById(`editBtn-${nroChasis}`)

    const hideClass = "visually-hidden";

    saveBtn.classList.add(hideClass)
    cancelBtn.classList.add(hideClass)
    editBtn.classList.remove(hideClass)
}

const onChangeEstado = (event, nroChasis) => {
    const seleccion = event.target.value;
    const dominioInput = document.getElementById(`dominioInput-${nroChasis}`)
    const cuilInput = document.getElementById(`cuilInput-${nroChasis}`)
    dominioInput.disabled = true;
    cuilInput.disabled = true;

    switch (seleccion) {
        case "DE": {
            dominioInput.disabled = false;
            break;
        }
        case "PE": {
            dominioInput.disabled = false;
            break;
        }
        case "ENT": {
            cuilInput.disabled = false;
            break;
        }
        case "BA": {
            break;
        }

    }
}
