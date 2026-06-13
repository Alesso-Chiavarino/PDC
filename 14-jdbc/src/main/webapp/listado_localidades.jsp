<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<select name="nro_localidad" class="form-select" required>
	<option value="">Selecciona una localidad</option>
	<c:forEach var="localidad" items="${sessionScope.localidades}">
		<option value="${localidad.nroLocalidad}">${localidad.nomLocalidad}</option>
	</c:forEach>
	<option value="-1">[Nueva]</option>
</select>
