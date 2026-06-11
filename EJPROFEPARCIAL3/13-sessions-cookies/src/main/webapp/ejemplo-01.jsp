<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="description" content="Ejemplos de Cookies">
    <meta name="author" content="Lic. Mariela Pastarini">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	
	<title>Cookies - Ejemplo 1</title>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/css/bootstrap.min.css">
	<script src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/js/bootstrap.bundle.min.js" defer></script>

	<script type="application/javascript" src="js/utils.js" defer></script>
	<script type="application/javascript" src="js/ejemplo-01.js" defer></script>
</head>
<body class="container">
	<h3>Cookies</h3>
	<div id="iError" class="d-none"></div>
	<div id="iMain">
		<form id="iForm" action="javascript:void(0)" method="post">
			<table class="table table-bordered table-striped">
				<thead>
					<tr>
						<th class="text-left">Nombre</th>
						<th class="text-left">Valor</th>
						<th class="text-left"></th>
					</tr>
				</thead>			
				<tbody>
					<c:forEach var="c" items="${cookie}">
						<jsp:include page="ejemplo-01-data.jsp">
							<jsp:param name="attrName" value="${c.key}"/>
							<jsp:param name="attrValue" value="${c.value.value}"/>
						</jsp:include>
					</c:forEach>
					<tr>
						<td><input type="text" class="form-control" name="attrName" maxlength="255" autofocus required></td>
						<td><input type="text" class="form-control" name="attrValue" maxlength="255" required></td>
						<td><button type="submit" class="btn btn-success">Agregar</button></td>
					</tr>
				</tbody>
			</table>
		</form>
		<a href="./index.jsp">Volver al index principal</a>			
	</div>
</body>
</html>