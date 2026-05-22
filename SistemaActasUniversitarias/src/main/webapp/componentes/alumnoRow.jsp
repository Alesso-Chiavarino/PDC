<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="ausente" value="${param.ausente eq 'true'}"/>

<tr id="alumno-${param.id}" class="${ausente ? 'text-secondary bg-light' : ''}">
    <td class="ps-3 ${ausente ? 'text-decoration-line-through' : ''}">${param.legajo}</td>
    <td class="${ausente ? 'text-decoration-line-through' : ''}">${param.nombreCompleto}</td>
    <td><span
            class="badge ${ausente ? 'bg-danger' : 'bg-primary'}">${ausente ? 'Ausente' : 'Presente'} </span>
    </td>
    <td class="text-center pe-3">
        <c:choose>
            <c:when test="${ausente}">
                Registrado
            </c:when>
            <c:otherwise>
                <button onclick="marcarAusente('${param.actaId}', '${param.id}')"
                        class="btn btn-outline-secondary btn-sm">Marcar Ausente
                </button>
            </c:otherwise>
        </c:choose>

    </td>
</tr>
