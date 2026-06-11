<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="description" content="Ejemplo de JDBC">
    <meta name="author" content="Lic. Mariela Pastarini">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	
	<title>Listados</title>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/css/bootstrap.min.css">
	<script src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/js/bootstrap.bundle.min.js" defer></script>
	<script type="text/javascript" src="./js/utils.js" defer></script>
	<script type="text/javascript" src="./js/listados.js" defer></script>
</head>
<body class="container">
	<h4>Listados</h4>
	<div id="iError" class="d-none"></div>
	<form id="iForm" action="javascript:void(0)">
		<div class="row mb-3">
			<div class="col-12 col-md-6">
				<select name="cod_pais" class="form-select" required>
					<option value="">Selecciona un país</option>
					<c:forEach var="pais" items="${sessionScope.paises}">
						<option value="${pais.codPais}">${pais.nomPais}</option>
					</c:forEach>
				</select>
			</div>
			<div id="iProvincias" class="col-12 col-md-6 d-none"></div>
		</div>
		<div class="row">
			<div id="iLocalidades" class="col-12 col-md-6 d-none"></div>
			<div id="iNuevaLocalidad" class="col-12 col-md-6 d-none d-flex flex-row">
				<input type="text" name="nom_localidad" class="form-control" maxlength="255" required disabled>
				<button type="submit" class="btn btn-primary">Agregar</button>
			</div>
		</div>
	</form>
</body>
</html>