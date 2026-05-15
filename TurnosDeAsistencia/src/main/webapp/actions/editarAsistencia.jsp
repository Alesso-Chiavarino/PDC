<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:useBean id="asistencias" class="com.alesso.turnosdeasistencia.AsistenciasBean" scope="session"/>
<jsp:useBean id="cliente" class="com.alesso.turnosdeasistencia.ClienteBean"/>
<jsp:useBean id="asistencia" class="com.alesso.turnosdeasistencia.AsistenciaBean"/>

<jsp:setProperty name="cliente" property="*"/>
<c:set var="asistenciaCreada" value="${asistencias.editarAsistencia(param.idAsistencia, cliente)}"/>

<jsp:include page="/components/asistenciaCard.jsp">
    <jsp:param name="fecha" value="${asistenciaCreada.fecha}"/>
    <jsp:param name="id" value="${asistenciaCreada.id}"/>
    <jsp:param name="nombre" value="${asistenciaCreada.cliente.nombre}"/>
    <jsp:param name="apellido" value="${asistenciaCreada.cliente.apellido}"/>
    <jsp:param name="correo" value="${asistenciaCreada.cliente.correo}"/>
    <jsp:param name="hora" value="${asistenciaCreada.hora}"/>
</jsp:include>
