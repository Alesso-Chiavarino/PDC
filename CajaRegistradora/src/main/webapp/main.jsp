<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Maqueta - Caja Registradora</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO" crossorigin="anonymous"
            defer></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css"
          defer>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/utils.js" defer></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/index.js" defer></script>
</head>
<body class="p-4">

<div class="container">
    <form id="añadirProdForm" action="javascript:void(0)" method="post">
        <div class="row mb-4">
            <!-- Ingreso de productos -->
            <div class="col-md-6">
                <div class="input-group">
                    <input name="codBarraProd" type="text" class="form-control"
                           placeholder="Ingrese el código de barras" maxlength="13"
                           required>
                    <button type="submit" class="btn btn-primary">Añadir</button>
                </div>
            </div>
        </div>
    </form>

    <div class="row">
        <!-- Tabla de productos -->
        <div class="col-md-6">
            <div id="iError" class="d-none"></div>
            <table class="table table-bordered">
                <thead class="table-light">
                <tr>
                    <th>Producto</th>
                    <th>Precio</th>
                    <th></th>
                </tr>
                </thead>
                <tbody id="prodListTbody">
                <c:forEach var="producto" items="${sessionScope.carrito}">
                    <tr id="prod-${producto.nroDetalle}" data-nro-detalle="${producto.nroDetalle}"
                        data-nro-carrito="${requestScope.nroCarrito}"
                        data-precio="${producto.precio}"
                        data-nom-producto="${producto.nomProducto}"
                        data-cod-barra="${producto.codBarra}">
                        <td>
                                ${producto.nomProducto}
                            <div class="text-muted small">${producto.codBarra}</div>
                        </td>
                        <td>$${producto.precio}</td>
                        <td class="text-center">
                            <button type="button" onclick="eliminarProd('${producto.nroDetalle}')"
                                    class="btn btn-sm btn-outline-danger eliminar-btn">
                                <i class="bi bi-trash"></i>
                            </button>
                        </td>
                    </tr>

                </c:forEach>
                </tbody>
                <tfoot class="table-light">
                <tr>
                    <th>Total</th>
                    <th id="totalTh">$0</th>
                    <th></th>
                </tr>
                </tfoot>
            </table>
        </div>

        <!-- Detalle del último producto -->
        <div class="col-md-6">
            <div class="border p-4 text-center h-100 d-flex flex-column justify-content-center">
                <h1 id="ultimoPrecio" class="display-3">$0.00</h1>
                <div>
                    <p id="ultimoNombre" class="fs-5 mb-0 text-muted"></p>
                    <div id="ultimoCodBarra" class="text-muted small"></div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
