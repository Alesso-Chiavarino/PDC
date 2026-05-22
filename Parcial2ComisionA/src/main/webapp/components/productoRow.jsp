<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:set var="rechazado" value="${param.rechazado eq 'true'}"/>
<c:set var="textClass" value="${rechazado ? 'text-danger' : ''}"/>

<tr id="producto-${param.id}" class="${rechazado ? 'text-decoration-line-through' : ''}">
    <td class="${textClass}">PRD-${param.id}</td>
    <td class="${textClass}">${param.nombre}</td>
    <td class="${textClass}">${param.cantidad} Kg</td>

    <td>
        <span class="badge ${rechazado ? 'bg-danger' : 'bg-success'}">
            ${rechazado ? 'Rechazado' : 'Disponible'}
        </span>
    </td>

    <td class="text-center">
        <c:choose>
            <c:when test="${rechazado}">
                -
            </c:when>
            <c:otherwise>
                <button onclick="quitarProducto('${param.pedidoId}', '${param.id}')"
                        class="btn btn-outline-danger btn-sm">
                    Quitar
                </button>
            </c:otherwise>
        </c:choose>
    </td>
</tr>