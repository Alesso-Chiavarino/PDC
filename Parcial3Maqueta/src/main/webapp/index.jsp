<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Parcial 3 Maqueta JDBC</title>
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
                    <h1 class="h3 mb-3">Maqueta rápida para JDBC</h1>
                    <p class="mb-2">Pensada para copiar, renombrar y adaptar en el parcial sin perder tiempo.</p>
                    <div class="row g-3">
                        <div class="col-md-4">
                            <div class="border rounded p-3 h-100">
                                <h2 class="h6">Statement</h2>
                                <p class="small mb-0">Consulta simple sin parámetros. Normalmente con <code>executeQuery()</code>.</p>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="border rounded p-3 h-100">
                                <h2 class="h6">PreparedStatement</h2>
                                <p class="small mb-0">Consulta o actualización con parámetros <code>?</code>. Para <code>select</code>, <code>insert</code>, <code>update</code> y <code>delete</code>.</p>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="border rounded p-3 h-100">
                                <h2 class="h6">CallableStatement</h2>
                                <p class="small mb-0">Siempre que el enunciado diga procedimiento almacenado. Puede devolver resultset, update count y parámetros de salida.</p>
                            </div>
                        </div>
                    </div>
                    <div class="row g-3 mt-1">
                        <div class="col-md-4">
                            <div class="border rounded p-3 h-100">
                                <h2 class="h6">executeQuery()</h2>
                                <p class="small mb-0">Cuando esperás un <code>ResultSet</code>.</p>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="border rounded p-3 h-100">
                                <h2 class="h6">executeUpdate()</h2>
                                <p class="small mb-0">Para <code>insert</code>, <code>update</code> o <code>delete</code> sin filas devueltas.</p>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="border rounded p-3 h-100">
                                <h2 class="h6">execute()</h2>
                                <p class="small mb-0">Útil cuando un SP puede mezclar operaciones y no sabés si vuelve resultset o no.</p>
                            </div>
                        </div>
                    </div>
                    <div class="row g-3 mt-1">
                        <div class="col-md-6">
                            <div class="border rounded p-3 h-100">
                                <h2 class="h6">AutoCommit true</h2>
                                <p class="small mb-0">Dos try: conexión y statement. Ideal para consultas sin manejo transaccional.</p>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="border rounded p-3 h-100">
                                <h2 class="h6">AutoCommit false</h2>
                                <p class="small mb-0">Tres try: conexión, transacción y statement. Si hay modificación de datos, usá <code>commit()</code> y <code>rollback()</code>.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-12">
            <div id="modalWrapper" class="d-none"></div>
        </div>

        <div class="col-lg-6">
            <div class="card border-0 shadow-sm h-100">
                <div class="card-body">
                    <h2 class="h5">1. Statement simple</h2>
                    <p class="text-muted small">Consulta sin parámetros, sin transacción, con <code>executeQuery()</code>.</p>
                    <form id="statementForm" action="javascript:void(0)" method="post">
                        <button type="submit" class="btn btn-primary">Ejecutar plantilla</button>
                    </form>
                    <div id="statementWrapper" class="d-none mt-3"></div>
                </div>
            </div>
        </div>

        <div class="col-lg-6">
            <div class="card border-0 shadow-sm h-100">
                <div class="card-body">
                    <h2 class="h5">2. Prepared query</h2>
                    <p class="text-muted small">Consulta con parámetros, sin transacción, con <code>executeQuery()</code>.</p>
                    <form id="preparedQueryForm" action="javascript:void(0)" method="post" class="row g-3">
                        <div class="col-12">
                            <label for="textoBusqueda" class="form-label">Texto búsqueda</label>
                            <input id="textoBusqueda" name="textoBusqueda" type="text" class="form-control" value="ejemplo">
                        </div>
                        <div class="col-12">
                            <label class="form-label d-block">Orden</label>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="orden" id="ordenCodigo" value="C" checked>
                                <label class="form-check-label" for="ordenCodigo">Código</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="orden" id="ordenDescripcion" value="D">
                                <label class="form-check-label" for="ordenDescripcion">Descripción</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="orden" id="ordenEstado" value="E">
                                <label class="form-check-label" for="ordenEstado">Estado</label>
                            </div>
                        </div>
                        <div class="col-12">
                            <button type="submit" class="btn btn-primary">Ejecutar plantilla</button>
                        </div>
                    </form>
                    <div id="preparedQueryWrapper" class="d-none mt-3"></div>
                </div>
            </div>
        </div>

        <div class="col-lg-6">
            <div class="card border-0 shadow-sm h-100">
                <div class="card-body">
                    <h2 class="h5">3. Prepared update</h2>
                    <p class="text-muted small">Alta / baja / modificación con transacción y <code>executeUpdate()</code>.</p>
                    <form id="preparedUpdateForm" action="javascript:void(0)" method="post" class="row g-3">
                        <div class="col-md-4">
                            <label for="preparedCodigo" class="form-label">Código</label>
                            <input id="preparedCodigo" name="codigo" type="text" class="form-control" value="A1">
                        </div>
                        <div class="col-md-4">
                            <label for="preparedDescripcion" class="form-label">Descripción</label>
                            <input id="preparedDescripcion" name="descripcion" type="text" class="form-control" value="Registro">
                        </div>
                        <div class="col-md-4">
                            <label for="preparedEstado" class="form-label">Estado</label>
                            <input id="preparedEstado" name="estado" type="text" class="form-control" value="S">
                        </div>
                        <div class="col-12">
                            <button type="submit" class="btn btn-primary">Ejecutar plantilla</button>
                        </div>
                    </form>
                    <div id="preparedUpdateWrapper" class="d-none mt-3"></div>
                </div>
            </div>
        </div>

        <div class="col-lg-6">
            <div class="card border-0 shadow-sm h-100">
                <div class="card-body">
                    <h2 class="h5">4. Callable query</h2>
                    <p class="text-muted small">Procedimiento almacenado que devuelve resultset.</p>
                    <form id="callableQueryForm" action="javascript:void(0)" method="post" class="row g-3">
                        <div class="col-12">
                            <label for="callableCodigo" class="form-label">Código opcional</label>
                            <input id="callableCodigo" name="codigo" type="text" class="form-control" placeholder="Vacío para probar setNull">
                        </div>
                        <div class="col-12">
                            <button type="submit" class="btn btn-primary">Ejecutar plantilla</button>
                        </div>
                    </form>
                    <div id="callableQueryWrapper" class="d-none mt-3"></div>
                </div>
            </div>
        </div>

        <div class="col-lg-6">
            <div class="card border-0 shadow-sm h-100">
                <div class="card-body">
                    <h2 class="h5">5. Callable update</h2>
                    <p class="text-muted small">SP con transacción y <code>executeUpdate()</code>.</p>
                    <form id="callableUpdateForm" action="javascript:void(0)" method="post" class="row g-3">
                        <div class="col-md-4">
                            <label for="callableUpdateCodigo" class="form-label">Código</label>
                            <input id="callableUpdateCodigo" name="codigo" type="text" class="form-control" value="A">
                        </div>
                        <div class="col-md-4">
                            <label for="callableUpdateNumero" class="form-label">Número</label>
                            <input id="callableUpdateNumero" name="numero" type="number" class="form-control" value="1">
                        </div>
                        <div class="col-md-4">
                            <label for="callableUpdateEstado" class="form-label">Estado</label>
                            <input id="callableUpdateEstado" name="estado" type="text" class="form-control" value="N">
                        </div>
                        <div class="col-12">
                            <button type="submit" class="btn btn-primary">Ejecutar plantilla</button>
                        </div>
                    </form>
                    <div id="callableUpdateWrapper" class="d-none mt-3"></div>
                </div>
            </div>
        </div>

        <div class="col-lg-6">
            <div class="card border-0 shadow-sm h-100">
                <div class="card-body">
                    <h2 class="h5">6. Callable con parámetro de salida</h2>
                    <p class="text-muted small">SP con <code>registerOutParameter()</code> y variable enviada al JSP.</p>
                    <form id="callableOutForm" action="javascript:void(0)" method="post" class="row g-3">
                        <div class="col-md-4">
                            <label for="texto1" class="form-label">Texto 1</label>
                            <input id="texto1" name="texto1" type="text" class="form-control" value="ASUNTO">
                        </div>
                        <div class="col-md-4">
                            <label for="texto2" class="form-label">Texto 2</label>
                            <input id="texto2" name="texto2" type="text" class="form-control" value="SOLICITANTE">
                        </div>
                        <div class="col-md-4">
                            <label for="texto3" class="form-label">Texto 3</label>
                            <input id="texto3" name="texto3" type="text" class="form-control" value="EMAIL">
                        </div>
                        <div class="col-12">
                            <button type="submit" class="btn btn-primary">Ejecutar plantilla</button>
                        </div>
                    </form>
                    <div id="callableOutWrapper" class="d-none mt-3"></div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
