<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<form id="unidadNegocioForm" action="javascript:void(0)">
    <div class="row g-3 align-items-end">
        <div class="col-12 col-lg-7">
            <label for="unidadNegocioSelect" class="form-label">Unidad de negocio</label>
            <select onchange="seleccionarUnidadNegocio(event)" id="unidadNegocioSelect" name="unidadNegocio"
                    class="form-select">
                <option value="">Debe seleccionar una unidad de negocio</option>
                <c:forEach var="unidadNegocio" items="${sessionScope.unidadesNegocio}">
                    <option value="${unidadNegocio.codUnidadNegocio}">${unidadNegocio.nomUnidadNegocio}</option>
                </c:forEach>
            </select>
        </div>
    </div>
</form>
