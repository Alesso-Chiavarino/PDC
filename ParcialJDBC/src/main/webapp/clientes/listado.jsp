<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Tipos de clientes</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/js/bootstrap.bundle.min.js" defer></script>

    <script src="${pageContext.request.contextPath}/js/clientes.js" defer></script>
    <script src="${pageContext.request.contextPath}/js/utils.js" defer></script>
</head>
<body>
    <div class="d-none" id="iError"></div>

    <div class="d-flex justify-content-center pt-5">
        <select class="form-select w-25" id="selectUnidades">
            <c:forEach var="u" items="${unidades}">
                <option value="${u.cod_unidad_negocio}">${u.nom_unidad_negocio}</option>
            </c:forEach>
        </select>
    </div>

    <div id="iResultado" class="d-none"></div>

</body>
</html>