<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<select name="cod_provincia" class="form-select" required>
	<option value="">Selecciona una provincia</option>
	<c:forEach var="provincia" items="${sessionScope.provincias}">
		<option value="${provincia.codProvincia}">${provincia.nomProvincia}</option>
	</c:forEach>
</select>
