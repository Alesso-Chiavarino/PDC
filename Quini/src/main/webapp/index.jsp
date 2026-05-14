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
    <h1>Quini 6 </h1>

    <ul id="lotteryNumberList" class="list-unstyled d-flex gap-2">
    </ul>

    <div>
        <button id="initLotteryBtn" class="btn btn-primary mt-5">Iniciar Sorteo</button>
    </div>


</main>
</body>
</html>