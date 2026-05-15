<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="estados" class="com.pdc.concesionaria.EstadosVehiculoBean" scope="session"></jsp:useBean>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<tr id="vehiculoFila-${param.nroChasis}">
    <td>
        ${param.nombre} (${param.modelo}) <br>${param.nroChasis}
        <small class="text-muted">${param.chasis}</small>
    </td>
    <td>
        <select onchange="onChangeEstado(event, '${param.nroChasis}')" id="estadoSelect-${param.nroChasis}" disabled
                class="form-select form-select-sm">
            <c:forEach var="estado" items="${estados.listado}" varStatus="st">
                <option value="${estado.key}" ${param.estado == estado.key ? 'selected' : ''}>${estado.value}</option>
            </c:forEach>
        </select>
    </td>
    <td>
        <input id="dominioInput-${param.nroChasis}" disabled type="text" class="form-control form-control-sm"
               value="${param.dominio}">
    </td>
    <td>
        <input id="cuilInput-${param.nroChasis}" disabled type="text" class="form-control form-control-sm"
               value="${param.cuilPropietario}">
    </td>
    <td>
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
                onclick="editarVehiculo('${param.nroChasis}')">Editar
        </button>
        <button id="saveBtn-${param.nroChasis}" onclick="guardarVehiculo('${param.nroChasis}')"
                class="btn btn-success btn-sm visually-hidden">Guardar
        </button>
        <button id="cancelBtn-${param.nroChasis}" onclick="cancelarEditarVehiculo('${param.nroChasis}')"
                class="btn btn-warning btn-sm visually-hidden">Cancelar
        </button>
    </td>
</tr>
