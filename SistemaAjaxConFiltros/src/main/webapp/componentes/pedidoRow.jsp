<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:set var="urgente" value="${param.urgente eq 'true'}"/>

<tr id="pedido-${param.id}" class="${urgente ? 'table-warning' : ''}">
    <td class="ps-3 fw-semibold">#${param.id}</td>
    <td>
        ${param.cliente}
        <c:if test="${urgente}">
            <span class="badge bg-danger ms-1">Urgente</span>
        </c:if>
    </td>
    <td>${param.producto}</td>
    <td>
        <span class="badge ${param.estado eq 'PENDIENTE' ? 'bg-secondary' : (param.estado eq 'EN_PREPARACION' ? 'bg-primary' : (param.estado eq 'ENTREGADO' ? 'bg-success' : 'bg-dark'))}">
            ${param.estado}
        </span>
    </td>
    <td>${param.fechaEntrega}</td>
    <td>$ ${param.total}</td>
    <td class="text-center pe-3">
        <select class="form-select form-select-sm"
                onchange="cambiarEstadoPedido('${param.id}', this.value)">
            <option value="PENDIENTE" ${param.estado eq 'PENDIENTE' ? 'selected' : ''}>PENDIENTE</option>
            <option value="EN_PREPARACION" ${param.estado eq 'EN_PREPARACION' ? 'selected' : ''}>EN_PREPARACION</option>
            <option value="ENTREGADO" ${param.estado eq 'ENTREGADO' ? 'selected' : ''}>ENTREGADO</option>
            <option value="CANCELADO" ${param.estado eq 'CANCELADO' ? 'selected' : ''}>CANCELADO</option>
        </select>
    </td>
</tr>
