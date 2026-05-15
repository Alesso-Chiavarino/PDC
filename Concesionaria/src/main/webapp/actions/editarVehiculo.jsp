<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:useBean id="inventario" class="com.pdc.concesionaria.InventarioBean" scope="session"></jsp:useBean>
<c:set var="vehiculo" value="${inventario.filtrarVehiculo(param.nroChasis)}"/>

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
