<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- ========================================================
SECCIÓN (2) — RESULTADOS DE LA BÚSQUEDA
(visible por defecto; se oculta cuando se abre el formulario)
======================================================== -->
<div id="divResultados">

  <div class="card shadow-sm mb-4">
    <div class="card-header bg-secondary text-white fw-semibold">
      Resultados
    </div>
    <div class="card-body p-0">
      <table class="table table-striped table-hover table-bordered mb-0">
        <thead class="table-dark">
        <tr>
          <th>Ticket N°</th>
          <th>Fecha</th>
          <th>Solicitante</th>
          <th>Asunto</th>
          <th>Texto</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="t" items="${tickets}">
<%--          Recorro los tickets enviados desde BusquedaServlet para mostrarlos en el front, como es un listado tengo que recorrerlo --%>
          <tr>
            <td>${t.ticket}</td>
            <td>${t.fecha_ticket}</td>
            <td>${t.solicitante}</td>
            <td>${t.asunto_ticket}</td>
            <td class="text-truncate" style="max-width:200px;">
                ${t.texto_ticket}
            </td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
    </div>
    <div class="card-footer d-flex justify-content-end">
      <button type="button" class="btn btn-success" id="btnNuevo" onclick="buttonNuevoPressed()">
        Nuevo ticket
      </button>
    </div>
  </div>

</div><!-- /divResultados -->


<!-- ========================================================
SECCIÓN (3) — FORMULARIO NUEVO TICKET
(oculto por defecto; se muestra al hacer clic en "Nuevo ticket")
======================================================== -->
<div id="divFormulario" class="d-none">
  <!--
    NOTE: en la implementación final este div arranca con
    style="display:none" y se muestra/oculta con JS/AJAX.
    Aquí está visible para referencia de la maqueta.
  -->
  <form action="javascript:void(0)" method="post" id="iFormNuevo">
  <div class="card shadow-sm mb-4 border-success">

    <div class="card-header bg-success text-white fw-semibold">
      Nuevo Ticket
    </div>
    <div class="card-body">
      <div class="row g-3">


          <!-- Solicitante -->
          <div class="col-md-6">
            <label for="solicitante" class="form-label fw-semibold">
              Nombre del solicitante <span class="text-danger">*</span>
            </label>
            <input
                    type="text"
                    id="solicitante"
                    name="solicitante"
                    class="form-control"
                    placeholder="Nombre completo"
                    required
            />
          </div>

          <!-- Correo -->
          <div class="col-md-6">
            <label for="correo" class="form-label fw-semibold">
              Correo electrónico <span class="text-danger">*</span>
            </label>
            <input
                    type="email"
                    id="correo"
                    name="correo"
                    class="form-control"
                    placeholder="correo@ejemplo.com"
                    required
            />
          </div>

          <!-- Asunto -->
          <div class="col-12">
            <label for="asunto" class="form-label fw-semibold">
              Asunto <span class="text-danger">*</span>
            </label>
            <input
                    type="text"
                    id="asunto"
                    name="asunto"
                    class="form-control"
                    placeholder="Descripción breve del problema"
                    required
            />
          </div>

          <!-- Texto -->
          <div class="col-12">
            <label for="texto" class="form-label fw-semibold">
              Texto <span class="text-danger">*</span>
            </label>
            <textarea
                    id="texto"
                    name="texto"
                    class="form-control"
                    rows="5"
                    placeholder="Detalle completo del ticket..."
                    required
            ></textarea>
          </div>

          <!-- Indicador campos obligatorios -->
          <div class="col-12">
            <small class="text-muted">
              <span class="text-danger">*</span> Todos los campos son obligatorios.
            </small>
          </div>

      </div>
    </div>
    <div class="card-footer d-flex justify-content-end gap-2">
      <button type="reset" class="btn btn-secondary">
        Cancelar
      </button>
      <button type="submit" class="btn btn-success">
        Registrar
      </button>
    </div>
  </div>
  </form>

</div><!-- /divFormulario -->