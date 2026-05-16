<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Inventario de vehículos</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/js/bootstrap.bundle.min.js" defer></script>
    <script src="${pageContext.request.contextPath}/js/index.js" defer></script>
</head>
<body class="p-4">

<jsp:useBean id="inventario" class="com.pdc.concesionaria.InventarioBean" scope="session"></jsp:useBean>

<h4 class="mb-3">Inventario de vehículos</h4>

<table class="table table-bordered align-middle">
    <thead class="table-primary">
    <tr>
        <th>Vehículo</th>
        <th>Estado</th>
        <th>Dominio</th>
        <th>CUIL Propietario</th>
    </tr>
    </thead>
    <tbody>

    <c:forEach var="vehiculo" items="${inventario.listado}" varStatus="st">
        <jsp:include page="/components/filaVehiculo.jsp">
            <jsp:param name="estado" value="${vehiculo.estado}"></jsp:param>
            <jsp:param name="cuilPropietario" value="${vehiculo.cuilPropietario}"></jsp:param>
            <jsp:param name="dominio" value="${vehiculo.dominio}"></jsp:param>
            <jsp:param name="fabricadoEn" value="${vehiculo.fabricadoEn}"></jsp:param>
            <jsp:param name="fechaBaja" value="${vehiculo.fechaBaja}"></jsp:param>
            <jsp:param name="fechaEntrega" value="${vehiculo.fechaEntrega}"></jsp:param>
            <jsp:param name="marca" value="${vehiculo.marca}"></jsp:param>
            <jsp:param name="modelo" value="${vehiculo.modelo}"></jsp:param>
            <jsp:param name="nroChasis" value="${vehiculo.nroChasis}"></jsp:param>
            <jsp:param name="nombre" value="${vehiculo.nombre}"></jsp:param>
        </jsp:include>
    </c:forEach>
    </tbody>
</table>

</body>
</html>
