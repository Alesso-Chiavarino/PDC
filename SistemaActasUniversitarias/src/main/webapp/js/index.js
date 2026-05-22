const toggleFirmaActa = async (event, actaId) => {
    const checkbox = event.target;
    const estadoAnterior = !checkbox.checked;
    const firmado = checkbox.checked;

    try {
        const response = await fetch("acciones/toggleFirmaActa.jsp", {
            method: "POST",
            headers: {"Content-Type": "application/x-www-form-urlencoded"},
            body: new URLSearchParams({actaId, firmado})
        });

        if (!response.ok) {
            throw new Error("Error al actualizar estado");
        }

        const html = await response.text();
        document.getElementById(`acta-${actaId}`).outerHTML = html;
    } catch (err) {
        checkbox.checked = estadoAnterior;
        console.error(err);
    }
};

const getFiltroActivoActa = (actaId) => {
    const botonActivo = document.querySelector(`#acta-${actaId} [data-filtro].btn-primary`);
    return botonActivo?.dataset?.filtro || "TODOS";
};

const marcarAusente = async (actaId, alumnoId) => {
    const filtroActivo = getFiltroActivoActa(actaId);
    const filaAlumno = document.getElementById(`alumno-${alumnoId}`);

    try {
        const response = await fetch("acciones/marcarAusente.jsp", {
            method: "POST",
            headers: {"Content-Type": "application/x-www-form-urlencoded"},
            body: new URLSearchParams({actaId, alumnoId})
        });

        if (!response.ok) {
            throw new Error("Error al actualizar ausente");
        }

        const html = await response.text();

        if (filtroActivo === "PRESENTES") {
            filaAlumno?.remove();
            return;
        }

        document.getElementById(`acta-${actaId}`).outerHTML = html;
    } catch (err) {
        console.error(err);
    }
}

const marcarFiltro = async (actaId, filtroNuevo) => {
    try {
        const response = await fetch("acciones/cambiarFiltro.jsp", {
            method: "POST",
            headers: {"Content-Type": "application/x-www-form-urlencoded"},
            body: new URLSearchParams({actaId, filtroNuevo})
        });

        if (!response.ok) {
            throw new Error("Error al cambiar filtro");
        }

        const html = await response.text();
        document.getElementById(`acta-${actaId}`).outerHTML = html;
    } catch (err) {
        console.error(err);
    }
}
