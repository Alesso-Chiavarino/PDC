<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<form id="nuevoTicketForm" action="javascript:void(0)" class="d-none">
    <div class="card shadow-sm">
        <div class="card-body">
            <div class="row g-3 mb-3">
                <div class="col-12 col-md-6">
                    <label for="solicitanteInput" class="form-label">Solicitante:</label>
                    <input id="solicitanteInput" name="solicitante" type="text" class="form-control">
                </div>
                <div class="col-12 col-md-6">
                    <label for="emailInput" class="form-label">E-mail:</label>
                    <input id="emailInput" name="email" type="email" class="form-control">
                </div>
                <div class="col-12">
                    <label for="asuntoInput" class="form-label">Asunto:</label>
                    <input id="asuntoInput" name="asunto" type="text" class="form-control">
                </div>
                <div class="col-12">
                    <label for="textoInput" class="form-label visually-hidden">Texto</label>
                    <textarea id="textoInput" name="texto" class="form-control" rows="8"></textarea>
                </div>
            </div>

            <div class="d-flex gap-2">
                <button type="submit" class="btn btn-primary">Registrar</button>
                <button type="button" onclick="cancelarNuevoTicket()" class="btn btn-outline-secondary">Cancelar
                </button>
            </div>
        </div>
    </div>
</form>
