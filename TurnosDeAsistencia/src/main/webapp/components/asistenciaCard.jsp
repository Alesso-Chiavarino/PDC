<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<article class="card border rounded p-3" id="asistenciaCard-${param.id}">
    <form class="form-control" onsubmit="onSubmit(event)" id="asistenciaForm-${param.id}" action="javascript:void(0)">
        <h5 class="card-title text-center fw-bold mb-3">${param.fecha}</h5>
        <div class="mb-2">
            <label class="form-label mb-1 small">Apellido</label>
            <input disabled name="apellido" id="apellidoInput-${param.id}" type="text"
                   class="form-control form-control-sm bg-light border-0"
                   placeholder="Informa el apellido del cliente" value="${param.apellido}">
        </div>
        <div class="mb-2">
            <label class="form-label mb-1 small">Nombre</label>
            <input id="nombreInput-${param.id}" disabled name="nombre" type="text"
                   class="form-control form-control-sm bg-light border-0"
                   placeholder="Informa el nombre del cliente" value="${param.nombre}">
        </div>
        <div class="mb-3">
            <label class="form-label mb-1 small">Correo</label>
            <input id="correoInput-${param.id}" disabled name="correo" type="email"
                   class="form-control form-control-sm bg-light border-0"
                   placeholder="Informa el correo del cliente" value="${param.correo}">
        </div>
        <div class="text-center">
            <button class="btn btn-success btn-sm px-4" type="button" onclick="onAssign('${param.id}')"
                    id="asignarBtn-${param.id}">
                Asignar
                cliente
            </button>
            <button class="btn btn-warning btn-sm px-4 visually-hidden" type="submit"
                    id="guardarBtn-${param.id}">
                Guardar
            </button>
            <button class="btn btn-danger btn-sm px-4 visually-hidden" type="button" onclick="onCancel('${param.id}')"
                    id="cancelarBtn-${param.id}">
                Cancelar
            </button>
        </div>
    </form>
</article>