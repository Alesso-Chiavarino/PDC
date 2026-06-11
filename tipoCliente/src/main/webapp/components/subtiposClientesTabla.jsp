<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<div id="subtiposClientesWrapper">
    <div class="table-responsive">
        <table class="table table-bordered table-striped align-middle mb-3">
            <thead class="table-light">
            <tr>
                <th>Tipo de cliente</th>
                <th class="text-center">Habilitado</th>
            </tr>
            </thead>
            <tbody id="subtiposClientesBody">
            <c:forEach var="subtipoCliente" items="${requestScope.subtiposClienteBean}">
                <tr data-cod-tipo-cliente="${subtipoCliente.codTipoCliente}"
                    data-nro-subtipo="${subtipoCliente.nroSubtipo}">
                    <td>${subtipoCliente.nomTipoCliente}</td>
                    <td class="text-center">
                        <input type="checkbox"
                               class="form-check-input subtipo-habilitado" ${subtipoCliente.habilitado == "S" ? 'checked': ''}>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <div class="d-flex justify-content-end gap-2">
        <button type="button" onclick="guardarCambiosSubtipos()" class="btn btn-primary">Guardar</button>
        <button type="button" onclick="cancelarCambiosSubtipos()" class="btn btn-outline-secondary">Cancelar</button>
    </div>
</div>
