<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Tickets JDBC</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/js/bootstrap.bundle.min.js" defer></script>

    <script src="${pageContext.request.contextPath}/js/tickets.js" defer></script>
    <script src="${pageContext.request.contextPath}/js/utils.js" defer></script>
</head>
<body>
<div id="iError" class="d-none"></div>

<div class="container">

<!-- ========================================================
     TÍTULO
======================================================== -->
<div class="row mb-4">
    <div class="col">
        <h2 class="fw-bold text-primary">Sistema de Tickets</h2>
        <hr/>
    </div>
</div>

<!-- ========================================================
     SECCIÓN (1) — CRITERIO DE BÚSQUEDA
======================================================== -->
<div class="card mb-4 shadow-sm">
    <div class="card-header bg-primary text-white fw-semibold">
        Criterio de búsqueda
    </div>
    <div class="card-body">
        <div class="row g-3 align-items-end">

            <form action="javascript:void(0)" method="post" id="iFormBusqueda">

                <!-- Campo de búsqueda -->
                <div class="col-md-5">
                    <label for="txtBusqueda" class="form-label fw-semibold">
                        Cadena de búsqueda
                    </label>
                    <input
                            type="text"
                            id="txtBusqueda"
                            name="busqueda"
                            class="form-control"
                            placeholder="Ingrese texto a buscar..."
                    />
                </div>

                <!-- Radio buttons de orden -->
                <div class="col-md-5">
                    <label class="form-label fw-semibold">Ordenar por</label>
                    <div class="d-flex gap-4">
                        <div class="form-check">
                            <input
                                    class="form-check-input"
                                    type="radio"
                                    name="orden"
                                    id="ordenS"
                                    value="S"
                            />
                            <label class="form-check-label" for="ordenS">
                                Por solicitante
                            </label>
                        </div>
                        <div class="form-check">
                            <input
                                    class="form-check-input"
                                    type="radio"
                                    name="orden"
                                    id="ordenF"
                                    value="F"
                                    checked
                            />
                            <label class="form-check-label" for="ordenF">
                                Por fecha
                            </label>
                        </div>
                        <div class="form-check">
                            <input
                                    class="form-check-input"
                                    type="radio"
                                    name="orden"
                                    id="ordenT"
                                    value="T"
                            />
                            <label class="form-check-label" for="ordenT">
                                Por número
                            </label>
                        </div>
                    </div>
                </div>

                <!-- Botón Buscar -->
                <div class="col-md-2 d-grid">
                    <button type="submit" class="btn btn-primary">
                        Buscar
                    </button>
                </div>
            </form>
        </div>
    </div>
</div><!-- /card criterio -->

<div class="d-none" id="iResultado"></div>

</div><!-- /container -->
</body>
</html>