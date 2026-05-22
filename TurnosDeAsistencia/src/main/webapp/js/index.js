const asistenciasContainer = document.getElementById("asistenciasContainer");
let action = "";
let idAsistencia;
let asignarBtn;
let cancelarBtn;
let guardarBtn;
let apellidoInput;
let nombreInput;
let correoInput;

const onCancel = (id) => {
    if (!id) {
        asignarBtn = document.getElementById(`asignarBtn`);
        cancelarBtn = document.getElementById(`guardarBtn`);
        guardarBtn = document.getElementById(`cancelarBtn`);
        apellidoInput = document.getElementById("apellidoInput");
        nombreInput = document.getElementById("nombreInput");
        correoInput = document.getElementById("correoInput");

    } else {
        asignarBtn = document.getElementById(`asignarBtn-${id}`);
        cancelarBtn = document.getElementById(`guardarBtn-${id}`);
        guardarBtn = document.getElementById(`cancelarBtn-${id}`);
        apellidoInput = document.getElementById(`apellidoInput-${id}`);
        nombreInput = document.getElementById(`nombreInput-${id}`);
        correoInput = document.getElementById(`correoInput-${id}`);
        idAsistencia = id;

    }

    cancelarBtn.classList.add("visually-hidden");
    guardarBtn.classList.add("visually-hidden");
    asignarBtn.classList.remove("visually-hidden");

    apellidoInput.disabled = true;
    nombreInput.disabled = true;
    correoInput.disabled = true;
}


const onSave = (id) => {
    if (!id) {
        asignarBtn = document.getElementById(`asignarBtn`);
        cancelarBtn = document.getElementById(`guardarBtn`);
        guardarBtn = document.getElementById(`cancelarBtn`);
        apellidoInput = document.getElementById("apellidoInput");
        nombreInput = document.getElementById("nombreInput");
        correoInput = document.getElementById("correoInput");

    } else {
        asignarBtn = document.getElementById(`asignarBtn-${id}`);
        cancelarBtn = document.getElementById(`guardarBtn-${id}`);
        guardarBtn = document.getElementById(`cancelarBtn-${id}`);
        apellidoInput = document.getElementById(`apellidoInput-${id}`);
        nombreInput = document.getElementById(`nombreInput-${id}`);
        correoInput = document.getElementById(`correoInput-${id}`);
        idAsistencia = id;

    }

    cancelarBtn.classList.add("visually-hidden");
    guardarBtn.classList.add("visually-hidden");
    asignarBtn.classList.remove("visually-hidden");
}

const onAssign = (id) => {
    if (!id) {
        asignarBtn = document.getElementById(`asignarBtn`);
        cancelarBtn = document.getElementById(`guardarBtn`);
        guardarBtn = document.getElementById(`cancelarBtn`);
        apellidoInput = document.getElementById("apellidoInput");
        nombreInput = document.getElementById("nombreInput");
        correoInput = document.getElementById("correoInput");

    } else {
        asignarBtn = document.getElementById(`asignarBtn-${id}`);
        cancelarBtn = document.getElementById(`guardarBtn-${id}`);
        guardarBtn = document.getElementById(`cancelarBtn-${id}`);
        apellidoInput = document.getElementById(`apellidoInput-${id}`);
        nombreInput = document.getElementById(`nombreInput-${id}`);
        correoInput = document.getElementById(`correoInput-${id}`);
        action = "Edit"
        idAsistencia = id;

    }


    cancelarBtn.classList.remove("visually-hidden");
    guardarBtn.classList.remove("visually-hidden");
    asignarBtn.classList.add("visually-hidden")

    apellidoInput.disabled = false;
    nombreInput.disabled = false;
    correoInput.disabled = false;
}

const onSubmit = async (e) => {
    e.preventDefault();
    const currentCard = document.getElementById(`asistenciaCard-${idAsistencia}`)

    const isEdit = action === "Edit";
    const URL = isEdit ? "actions/editarAsistencia.jsp" : "actions/asignarCliente.jsp"
    onSave(idAsistencia);
    const formData = new FormData(e.target);
    const params = new URLSearchParams(formData);
    if (isEdit) params.append("idAsistencia", idAsistencia);

    try {
        const response = await fetch(URL, {
            method: "POST",
            headers: {"Content-Type": "application/x-www-form-urlencoded"},
            body: params
        });

        const html = await response.text();

        if (isEdit) {
            currentCard.outerHTML = html;
        } else {
            asistenciasContainer.insertAdjacentHTML("beforeend", html);
        }

        action = "";
        idAsistencia = undefined;
    } catch (err) {
        console.log(err);
    }
}