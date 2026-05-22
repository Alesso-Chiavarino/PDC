<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Universidad - Gestión de Actas</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/js/bootstrap.bundle.min.js" defer></script>
    <script src="${pageContext.request.contextPath}/js/index.js" defer></script>
</head>
<body class="bg-light">
<jsp:useBean id="manager" class="com.alesso.sistemaactasuniversitarias.ActaManagerBean" scope="session"></jsp:useBean>

<div class="container mt-4">

    <div class="row mb-4">
        <div class="col">
            <h2>Sistema de Cierre de Actas</h2>
            <p class="text-secondary">Turno de Exámenes Noviembre</p>
        </div>
    </div>

    <c:forEach var="acta" items="${manager.actas}">
        <c:set var="actaActual" value="${acta}" scope="request"/>
        <c:set var="inscripcionesFiltradas" value="${manager.getInscripcionesFiltradas(acta.id)}" scope="request"/>
        <jsp:include page="/componentes/actaCard.jsp"/>
    </c:forEach>

</div>

</body>
</html>
