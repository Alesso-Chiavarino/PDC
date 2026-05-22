<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<c:set var="acta" value="${requestScope.actaActual}"/>
<c:set var="alumnosMostrados"
       value="${empty requestScope.inscripcionesFiltradas ? acta.inscripciones : requestScope.inscripcionesFiltradas}"/>

<div id="acta-${acta.id}" class="card mb-4 shadow-sm border-primary border-start border-5">

    <div class="card-header d-flex justify-content-between align-items-center">
        <div>
            <strong>Acta #${acta.id} - ${acta.materia}</strong>

            <!-- REQUISITO: Esta fecha viene como Date. Debe formatearse con JSTL fmt:formatDate pattern="dd/MM/yyyy" -->
            <span class="text-muted ms-2 me-2">
                    <i class="bi bi-calendar-event"></i>
                   (Fecha: <fmt:formatDate value="${acta.fechaExamen}" pattern="dd/MM/yyyy"/>)
                </span>

            <c:choose>
                <c:when test="${acta.firmada}">
                    <span class="badge ${acta.asistenciaPerfecta ? 'bg-success' : 'bg-warning'}">${acta.asistenciaPerfecta ? 'Acta Cerrada: Asistencia 100%' : 'Acta Cerrada: Asistencia Parcial'} </span>
                </c:when>
                <c:otherwise>
                    <span class="badge bg-secondary ms-2">Pendiente de cierre</span>
                </c:otherwise>
            </c:choose>

        </div>
        <div class="form-check">
            <input onchange="toggleFirmaActa(event, '${acta.id}')"
                   class="form-check-input" ${acta.firmada ? 'checked' : ''} type="checkbox">
            <label class="form-check-label fw-bold">Firmar y Cerrar Acta</label>
        </div>
    </div>

    <div class="card-body p-0">

        <!-- NUEVO: BARRA DE FILTROS -->
        <div class="bg-light p-2 border-bottom d-flex justify-content-end align-items-center gap-2">
            <span class="text-muted small me-auto ms-2">Visualización de nómina:</span>
            <!-- El botón activo tiene la clase btn-primary, los inactivos btn-outline-secondary -->
            <button type="button"
                    onclick="marcarFiltro('${acta.id}', 'TODOS')"
                    data-filtro="TODOS"
                    class="btn btn-sm ${acta.filtroActivo eq 'TODOS' ? 'btn-primary' : 'btn-outline-secondary'}">
                Todos
            </button>
            <button type="button"
                    onclick="marcarFiltro('${acta.id}', 'PRESENTES')"
                    data-filtro="PRESENTES"
                    class="btn btn-sm ${acta.filtroActivo eq 'PRESENTES' ? 'btn-primary' : 'btn-outline-secondary'}">
                Solo Presentes
            </button>
            <button type="button"
                    onclick="marcarFiltro('${acta.id}', 'AUSENTES')"
                    data-filtro="AUSENTES"
                    class="btn btn-sm ${acta.filtroActivo eq 'AUSENTES' ? 'btn-primary' : 'btn-outline-secondary'}">
                Solo Ausentes
            </button>
        </div>

        <!-- TABLA A ACTUALIZAR DINÁMICAMENTE -->
        <table class="table table-hover align-middle mb-0">
            <thead class="table-light">
            <tr>
                <th class="ps-3">Legajo</th>
                <th>Apellido y Nombre</th>
                <th>Estado</th>
                <th class="text-center pe-3">Acción</th>
            </tr>
            </thead>
            <tbody>

            <c:forEach var="alumno" items="${alumnosMostrados}">
                <jsp:include page="/componentes/alumnoRow.jsp">
                    <jsp:param name="id" value="${alumno.id}"/>
                    <jsp:param name="legajo" value="${alumno.legajo}"/>
                    <jsp:param name="nombreCompleto" value="${alumno.nombreCompleto}"/>
                    <jsp:param name="ausente" value="${alumno.ausente}"/>
                    <jsp:param name="actaId" value="${acta.id}"/>
                </jsp:include>
            </c:forEach>

            </tbody>
        </table>
    </div>
</div>
