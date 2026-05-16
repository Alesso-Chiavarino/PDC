<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="estados" class="com.pdc.concesionaria.EstadosVehiculoBean" scope="session"></jsp:useBean>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<c:set var="formId" value="vehiculoForm-${param.nroChasis}"/>

<tr id="vehiculoFila-${param.nroChasis}">
    <td>
        ${param.nombre} (${param.modelo}) <br>${param.nroChasis}
        <small class="text-muted">${param.chasis}</small>
    </td>
    <td>
        <select onchange="onChangeEstado(event, '${param.nroChasis}')" id="estadoSelect-${param.nroChasis}" disabled
                class="form-select form-select-sm" name="nuevoEstado" form="${formId}">
            <c:forEach var="estado" items="${estados.listado}" varStatus="st">
                <option value="${estado.key}" ${param.estado == estado.key ? 'selected' : ''}>${estado.value}</option>
            </c:forEach>
        </select>
    </td>
    <td>
        <input id="dominioInput-${param.nroChasis}" disabled type="text" class="form-control form-control-sm"
               value="${param.dominio}" name="nuevoDominio" form="${formId}">
    </td>
    <td>
        <input id="cuilInput-${param.nroChasis}" disabled type="text" class="form-control form-control-sm"
               value="${param.cuilPropietario}" name="cuilPropietarioNuevo" form="${formId}">
    </td>
    <td>
        <form id="${formId}" method="post" class="d-none" data-nro-chasis="${param.nroChasis}">
            <input type="hidden" name="nroChasis" value="${param.nroChasis}">
        </form>

        <c:choose>
            <c:when test="${param.estado == 'ENT' and not empty param.fechaEntrega}">
                <fmt:parseDate value="${param.fechaEntrega}" pattern="EEE MMM dd HH:mm:ss z yyyy" parseLocale="en_US"
                               var="fechaEntregaDate"/>
                <span class="text-success">Entrega: <fmt:formatDate value="${fechaEntregaDate}"
                                                                    pattern="dd/MM/yyyy"/></span>
            </c:when>
            <c:when test="${param.estado == 'BA' and not empty param.fechaBaja}">
                <fmt:parseDate value="${param.fechaBaja}" pattern="EEE MMM dd HH:mm:ss z yyyy" parseLocale="en_US"
                               var="fechaBajaDate"/>
                <span class="text-danger">Baja: <fmt:formatDate value="${fechaBajaDate}" pattern="dd/MM/yyyy"/></span>
            </c:when>
            <c:otherwise>
                <span class="visually-hidden"></span>
            </c:otherwise>
        </c:choose>

        <button id="editBtn-${param.nroChasis}"
                class="btn btn-primary btn-sm ${param.estado == "ENT" ? 'visually-hidden' : ''} ${param.estado == "BA" ? 'visually-hidden' : ''}"
                type="button" onclick="editarVehiculo('${param.nroChasis}')">Editar
        </button>
        <button id="saveBtn-${param.nroChasis}" type="submit" form="${formId}"
                class="btn btn-success btn-sm visually-hidden">Guardar
        </button>
        <button id="cancelBtn-${param.nroChasis}" type="button" onclick="cancelarEditarVehiculo('${param.nroChasis}')"
                class="btn btn-warning btn-sm visually-hidden">Cancelar
        </button>
    </td>
</tr>
