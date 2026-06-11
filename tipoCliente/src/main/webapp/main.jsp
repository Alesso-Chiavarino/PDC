<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Tipos de cliente">
    <meta name="author" content="Alessandro Chiavarino">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Tipos de cliente</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/js/bootstrap.bundle.min.js" defer></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/utils.js" defer></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/index.js" defer></script>
</head>
<body class="bg-light">
<main class="container py-4">
    <div class="row justify-content-center">
        <div class="col-12 col-xl-10">
            <div class="card shadow-sm">
                <div class="card-body">
                    <h1 class="h4 mb-4">Actualización de tipos de clientes</h1>

                    <div id="iError" class="d-none"></div>

                    <jsp:include page="components/unidadNegocioForm.jsp"/>

                    <div id="tableWrapper"></div>
                </div>
            </div>
        </div>
    </div>
</main>
</body>
</html>
