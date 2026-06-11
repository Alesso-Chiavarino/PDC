<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/js/bootstrap.bundle.min.js" defer></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css" defer>

    <script src="${pageContext.request.contextPath}/js/caja.js" defer></script>
    <script src="${pageContext.request.contextPath}/js/utils.js" defer></script>
</head>
<body class="py-4">
<div class="d-none" id="iError"></div>

    <div class="container">
        <div class="row mb-4">
            <!-- Ingreso de productos -->
            <div class="col-md-6">
                <form action="javascript:void(0)" method="POST" id="iForm">
                    <div class="input-group">
                        <input type="text" class="form-control" name="cod_barra" placeholder="Ingrese el código de barras" maxlength="13" required>
                        <button type="submit" class="btn btn-primary">Añadir</button>
                    </div>
                </form>
            </div>
        </div>

        <div class="row">
            <!-- Tabla de productos -->
            <div class="col-md-6">
                <table class="table table-bordered">
                    <thead class="table-light">
                    <tr>
                        <th>Producto</th>
                        <th>Precio</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody id="tablaElementos">

                    </tbody>
                    <tfoot class="table-light">
                    <tr>
                        <th>Total</th>
                        <th id="iTotal">$0.00</th>
                        <th></th>
                    </tr>
                    </tfoot>
                </table>
            </div>

            <!-- Detalle del último producto -->
            <div class="col-md-6">
                <div class="border p-4 text-center h-100 d-flex flex-column justify-content-center">
                    <h1 class="display-3" id="iUltimoPrecio">$0.00</h1>
                    <div>
                        <p class="fs-5 mb-0 text-muted" id="iUltimoNombre"></p>
                        <div class="text-muted small" id="iUltimoCod"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>