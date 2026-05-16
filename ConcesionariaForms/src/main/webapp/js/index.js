const editarVehiculo = (nroChasis) => {
    const saveBtn = document.getElementById(`saveBtn-${nroChasis}`);
    const cancelBtn = document.getElementById(`cancelBtn-${nroChasis}`);
    const editBtn = document.getElementById(`editBtn-${nroChasis}`)
    const estadoSelect = document.getElementById(`estadoSelect-${nroChasis}`)

    const hideClass = "visually-hidden";

    estadoSelect.disabled = false;
    actualizarCamposSegunEstado(nroChasis, estadoSelect.value);

    saveBtn.classList.remove(hideClass)
    cancelBtn.classList.remove(hideClass)
    editBtn.classList.add(hideClass)


}

const cancelarEditarVehiculo = (nroChasis) => {
    const saveBtn = document.getElementById(`saveBtn-${nroChasis}`);
    const cancelBtn = document.getElementById(`cancelBtn-${nroChasis}`);
    const editBtn = document.getElementById(`editBtn-${nroChasis}`)
    const estadoSelect = document.getElementById(`estadoSelect-${nroChasis}`)
    const dominioInput = document.getElementById(`dominioInput-${nroChasis}`)
    const cuilInput = document.getElementById(`cuilInput-${nroChasis}`)

    const hideClass = "visually-hidden";

    saveBtn.classList.add(hideClass)
    cancelBtn.classList.add(hideClass)
    editBtn.classList.remove(hideClass)

    estadoSelect.disabled = true;
    dominioInput.disabled = true;
    cuilInput.disabled = true;
}

const actualizarCamposSegunEstado = (nroChasis, seleccion) => {
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

const onChangeEstado = (event, nroChasis) => {
    actualizarCamposSegunEstado(nroChasis, event.target.value);
}

const resolverUrlAccion = (estadoActualVehiculo) => {
    const urls = {
        PE: "actions/registrarDominio.jsp",
        DE: "actions/registrarDominio.jsp",
        ENT: "actions/registrarEntrega.jsp",
        BA: "actions/registrarBaja.jsp"
    };
    return urls[estadoActualVehiculo];
}

document.addEventListener("submit", async (e) => {
    const form = e.target;

    if (!form.id.startsWith("vehiculoForm-")) {
        return;
    }

    e.preventDefault();

    const nroChasis = form.dataset.nroChasis;
    const estadoSelect = document.getElementById(`estadoSelect-${nroChasis}`);
    const selectedRow = document.getElementById(`vehiculoFila-${nroChasis}`);
    const actionUrl = resolverUrlAccion(estadoSelect.value);

    if (!actionUrl) {
        return;
    }

    const response = await fetch(actionUrl, {
        method: "POST",
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
        body: new URLSearchParams(new FormData(form))
    });

    if (!response.ok) {
        throw new Error(response.statusText);
    }

    const html = await response.text();
    selectedRow.outerHTML = html;
});
