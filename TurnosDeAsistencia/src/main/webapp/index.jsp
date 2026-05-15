<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Turnos de Asistencia</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/js/bootstrap.bundle.min.js" defer></script>
    <script src="${pageContext.request.contextPath}/js/index.js" defer></script>
</head>
<body class="bg-white">
<jsp:useBean id="asistencias" class="com.alesso.turnosdeasistencia.AsistenciasBean" scope="session"/>

<div class="container-fluid px-4 py-4">
    <h4 class="mb-3">Asistencias</h4>
    <div class="row g-3">

        <div class="col-12 col-md-6 col-lg-4" id="asistenciasContainer">
            <article class="card border rounded p-3">
                <form class="form-control" onsubmit="onSubmit(event)" id="asistenciaForm" action="javascript:void(0)">
                    <h5 class="card-title text-center fw-bold mb-3">13-05-2024 08:30</h5>
                    <div class="mb-2">
                        <label class="form-label mb-1 small">Apellido</label>
                        <input disabled name="apellido" id="apellidoInput" type="text"
                               class="form-control form-control-sm bg-light border-0"
                               placeholder="Informa el apellido del cliente">
                    </div>
                    <div class="mb-2">
                        <label class="form-label mb-1 small">Nombre</label>
                        <input id="nombreInput" disabled name="nombre" type="text"
                               class="form-control form-control-sm bg-light border-0"
                               placeholder="Informa el nombre del cliente">
                    </div>
                    <div class="mb-3">
                        <label class="form-label mb-1 small">Correo</label>
                        <input id="correoInput" disabled name="correo" type="email"
                               class="form-control form-control-sm bg-light border-0"
                               placeholder="Informa el correo del cliente">
                    </div>
                    <div class="text-center">
                        <button class="btn btn-success btn-sm px-4" type="button" onclick="onAssign()" id="asignarBtn">
                            Asignar
                            cliente
                        </button>
                        <button class="btn btn-warning btn-sm px-4 visually-hidden" type="submit"
                                id="guardarBtn">
                            Guardar
                        </button>
                        <button class="btn btn-danger btn-sm px-4 visually-hidden" type="button" onclick="onCancel()"
                                id="cancelarBtn">
                            Cancelar
                        </button>
                    </div>
                </form>
            </article>
            <c:forEach var="asistencia" items="${asistencias.asistencias}">
                <jsp:include page="/components/asistenciaCard.jsp">
                    <jsp:param name="fecha" value="${asistencia.fecha}"></jsp:param>
                    <jsp:param name="id" value="${asistencia.id}"></jsp:param>
                    <jsp:param name="nombre" value="${asistencia.cliente.nombre}"></jsp:param>
                    <jsp:param name="apellido" value="${asistencia.cliente.apellido}"></jsp:param>
                    <jsp:param name="correo" value="${asistencia.cliente.correo}"></jsp:param>
                    <jsp:param name="hora" value="${asistencia.hora}"></jsp:param>
                </jsp:include>
            </c:forEach>

        </div>


    </div>
</div>
</body>
</html>
