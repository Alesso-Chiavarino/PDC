<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Reclamos Vehículos</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/js/bootstrap.bundle.min.js" defer></script>

    <script src="${pageContext.request.contextPath}/js/vehiculos.js" defer></script>
    <script src="${pageContext.request.contextPath}/js/utils.js" defer></script>
</head>
<body>

<div id="iError" class="d-none"></div>

<div class="container my-5" style="max-width: 700px;">
    <h2 class="fw-bold mb-4" style="color: #d6002a;">Reclamos</h2>
    <h5 class="fw-bold mb-4" style="color: #d6002a;">¿Quiere hacer un reclamo?</h5>

    <form method="post" action="javascript:void(0)" id="iForm">
        <div class="row mb-3 align-items-center">
            <label class="col-sm-4 col-form-label">¿Conocés tu número de chasis? <span class="text-danger">*</span></label>
            <div class="col-sm-8">
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="conoceChasis" id="chasisSi" checked>
                    <label class="form-check-label" for="chasisSi" id="chasisSi">Si</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="conoceChasis" id="chasisNo">
                    <label class="form-check-label" for="chasisNo" id="chasisNo">No</label>
                </div>
            </div>
        </div>

        <div class="row mb-3 align-items-center" id="divChasis">
            <label for="chasis" class="col-sm-4 col-form-label">N° de chasis <span class="text-danger">*</span></label>
            <div class="col-sm-8">
                <input type="text" class="form-control" id="chasis" name="nroChasis">
            </div>
            <div id="imagenValidar"></div>
        </div>

        <div class="row mb-3 align-items-center" id="divPatente">
            <label for="patente" class="col-sm-4 col-form-label">Patente</label>
            <div class="col-sm-8">
                <input type="text" class="form-control" id="patente" name="patente">
            </div>
            <div id="validacionAmbos"></div>
        </div>



        <div class="row mb-3 align-items-center" id="divKilometros">
            <label for="kilometros" class="col-sm-4 col-form-label">Kilómetros</label>
            <div class="col-sm-8">
                <input type="text" class="form-control" id="kilometros" name="kilometros">
            </div>
        </div>

        <div class="row mb-3 align-items-center">
            <label for="apellido" class="col-sm-4 col-form-label">Apellido <span class="text-danger">*</span></label>
            <div class="col-sm-8">
                <input type="text" class="form-control" id="apellido" name="apellido" required>
            </div>
        </div>

        <div class="row mb-3 align-items-center">
            <label for="nombre" class="col-sm-4 col-form-label">Nombre <span class="text-danger">*</span></label>
            <div class="col-sm-8">
                <input type="text" class="form-control" id="nombre" name="nombre" required>
            </div>
        </div>

        <div class="row mb-3 align-items-center">
            <label for="email" class="col-sm-4 col-form-label">E-mail <span class="text-danger">*</span></label>
            <div class="col-sm-8">
                <input type="email" class="form-control" id="email" name="email" required>
            </div>
        </div>

        <div class="row mb-3 align-items-center">
            <label for="telefono" class="col-sm-4 col-form-label">Teléfono</label>
            <div class="col-sm-8">
                <input type="tel" class="form-control" id="telefono" name="telefono">
            </div>
        </div>

        <div class="row mb-3 align-items-center">
            <label class="col-sm-4 col-form-label">¿Desea ser contactado por un vendedor? <span class="text-danger">*</span></label>
            <div class="col-sm-8">
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="contactar" id="contactoSi" value="S" checked>
                    <label class="form-check-label" for="contactoSi">Si</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="contactar" id="contactoNo" value="N">
                    <label class="form-check-label" for="contactoNo">No</label>
                </div>
            </div>
        </div>

        <div class="mb-4">
            <label for="reclamo" class="form-label">Reclamo (4000 caracteres máx.) <span class="text-danger">*</span></label>
            <textarea class="form-control" id="reclamo" name="reclamo" rows="8" maxlength="4000" required></textarea>
        </div>

        <div class="text-center">
            <button type="submit" class="btn btn-lg px-5 text-white" style="background-color: #d6002a;">Registrar</button>
        </div>
    </form>
</div>
</body>
</html>