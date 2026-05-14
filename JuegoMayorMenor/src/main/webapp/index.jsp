<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/js/bootstrap.bundle.min.js" defer></script>
    <script src="${pageContext.request.contextPath}/js/index.js" defer></script>
</head>
<body>
<main class="container mx-auto py-5">

    <h1>Jueguemos... </h1>


    <div class="w-auto">
        <div class="d-flex gap-2  flex-row w-50">
            <div class="w-50">
                <h4>Menor o iguales a 10</h4>
                <ul id="minorOrEqualThanList">

                </ul>
            </div>
            <div class="w-50">
                <h4>Mayores a 10</h4>
                <ul id="greaterThanList">

                </ul>
            </div>

        </div>
        <h1>El número es 14</h1>
    </div>
    <form id="gameForm">
        <div class="mb-3">
            <label for="predictionSelect">Adivina si el resultado será</label>
            <select name="predictionSelection" required id="predictionSelect" class="form-select"
                    aria-label="Default select example">
                <option value=""></option>
                <option value="MAYOR">Mayor a 10</option>
                <option value="IGUAL">Igual a 10</option>
                <option value="MENOR">Menor a 10</option>
            </select>
        </div>
        <button type="submit" class="btn btn-primary">Probar suerte</button>
    </form>

</main>
</body>
</html>