<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:useBean id="manager" class="com.alesso.sistemaactasuniversitarias.ActaManagerBean" scope="session"/>

<c:set var="noop" value="${manager.firmarActa(param.actaId, param.firmado)}"/>

<c:forEach var="acta" items="${manager.actas}">
    <c:if test="${acta.id == param.actaId}">
        <c:set var="actaActual" value="${acta}" scope="request"/>
        <c:set var="inscripcionesFiltradas" value="${manager.getInscripcionesFiltradas(acta.id)}" scope="request"/>
        <jsp:include page="/componentes/actaCard.jsp"/>
    </c:if>
</c:forEach>
