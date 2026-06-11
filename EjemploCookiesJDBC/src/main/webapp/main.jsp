<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Ejemplo Cookies + Paginacion</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/js/bootstrap.bundle.min.js" defer></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/utils.js" defer></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/index.js" defer></script>
</head>
<body class="bg-light">
<div class="container py-4">
    <div class="row g-4">
        <div class="col-12">
            <div class="card border-0 shadow-sm">
                <div class="card-body">
                    <h1 class="h3 mb-3">Ejemplo simple de Cookies + Paginacion</h1>
                    <p class="mb-2">
                        Mini enunciado:
                        mostrar un listado paginado de libros desde base de datos,
                        permitir guardar en una cookie la cantidad de registros por pagina,
                        usar esa cookie en las siguientes consultas y permitir borrarla.
                    </p>
                    <ul class="mb-0">
                        <li>`guardarPreferencia.jsp`: crea la cookie</li>
                        <li>`verPreferencia.jsp`: lee y usa la cookie</li>
                        <li>`borrarPreferencia.jsp`: borra la cookie</li>
                        <li>`listarLibros.jsp`: usa la cookie para paginar</li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="col-lg-4">
            <div class="card border-0 shadow-sm h-100">
                <div class="card-body">
                    <h2 class="h5">Preferencia en Cookie</h2>
                    <form id="formPreferencia" action="javascript:void(0)" method="post" class="row g-3">
                        <div class="col-12">
                            <label for="tamPagina" class="form-label">Cantidad por pagina</label>
                            <select id="tamPagina" name="tamPagina" class="form-select">
                                <option value="3">3</option>
                                <option value="5" selected>5</option>
                                <option value="10">10</option>
                            </select>
                        </div>
                        <div class="col-12 d-flex gap-2">
                            <button type="submit" class="btn btn-primary">Guardar cookie</button>
                            <button type="button" class="btn btn-outline-danger" onclick="jCookiesJDBC.borrarPreferencia()">
                                Borrar cookie
                            </button>
                        </div>
                    </form>

                    <div id="preferenciaWrapper" class="d-none mt-3"></div>
                </div>
            </div>
        </div>

        <div class="col-lg-8">
            <div class="card border-0 shadow-sm h-100">
                <div class="card-body">
                    <h2 class="h5">Busqueda paginada</h2>
                    <form id="formBusqueda" action="javascript:void(0)" method="post" class="row g-3">
                        <div class="col-md-9">
                            <label for="textoBusqueda" class="form-label">Titulo o autor</label>
                            <input id="textoBusqueda" name="textoBusqueda" type="text" class="form-control"
                                   placeholder="Buscar libro...">
                        </div>
                        <div class="col-md-3 d-flex align-items-end">
                            <button type="submit" class="btn btn-primary w-100">Buscar</button>
                        </div>
                    </form>

                    <div id="librosWrapper" class="d-none mt-3"></div>
                </div>
            </div>
        </div>

        <div class="col-12">
            <div id="modalWrapper" class="d-none"></div>
        </div>
    </div>
</div>
</body>
</html>
