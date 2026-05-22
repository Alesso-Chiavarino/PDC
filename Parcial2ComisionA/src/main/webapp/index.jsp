<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Cherries - Administración de Pedidos</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/js/bootstrap.bundle.min.js" defer></script>
    <script src="${pageContext.request.contextPath}/js/index.js" defer></script>
</head>

<body class="bg-light">
<jsp:useBean id="manager" class="com.alesso.parcial2comisiona.PedidoManagerBean" scope="session"></jsp:useBean>

<div class="container mt-4">

    <div class="row mb-4">
        <div class="col">

            <h2>Administración de Pedidos</h2>

            <p class="text-secondary">
                Verdulería Cherries
            </p>

        </div>
    </div>

    <c:forEach var="pedido" items="${manager.pedidos}">
        <c:set var="pedidoActual" value="${pedido}" scope="request"/>
        <jsp:include page="/components/pedidoCard.jsp"/>
    </c:forEach>

</div>

</body>
</html>