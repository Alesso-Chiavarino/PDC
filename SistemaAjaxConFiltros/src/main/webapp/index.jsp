<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:useBean id="manager" class="com.alesso.sistemaajaxconfiltros.PedidoManagerBean" scope="session"/>

<c:set var="pedidosPaginados" value="${manager.pedidosPaginados}" scope="request"/>

<!DOCTYPE html>
<html>
<head>
    <title>Sistema AJAX Con Filtros</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/js/bootstrap.bundle.min.js" defer></script>
    <script src="${pageContext.request.contextPath}/js/index.js" defer></script>
</head>
<body class="bg-light">

<div class="container py-4">
    <h1 class="h3 mb-1">Sistema de Pedidos</h1>
    <p class="text-muted mb-4">Filtros + búsqueda + paginación + ordenamiento por columnas (todo persistido en sesión).</p>

    <jsp:include page="/componentes/pedidosPanel.jsp"/>
</div>

</body>
</html>
