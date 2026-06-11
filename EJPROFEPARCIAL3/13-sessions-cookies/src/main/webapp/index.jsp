<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="description" content="Ejemplos de Sessions y Cookies">
    <meta name="author" content="Lic. Mariela Pastarini">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>Sessions y Cookies</title>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/css/bootstrap.min.css">
	<script src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/js/bootstrap.bundle.min.js" defer></script>
</head>
<body class="container">
	<h2>Ejemplos</h2>
	<ul>
		<li><a href="ejemplo-01.jsp" target="_self">Ejemplo 1: ABM de clave/valor con cookies</a></li>
		<li><a href="ejemplo-02.jsp" target="_self">Ejemplo 2: ABM de clave/valor con sesiones</a></li>
	</ul>
</body>
</html>