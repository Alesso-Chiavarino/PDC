<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="table-responsive">
  <table class="table table-bordered table-hover">
    <thead class="table-light">
    <tr>
      <th>Nro. subtipo</th>
      <th>Cód. tipo cliente</th>
      <th>Nombre tipo cliente</th>
      <th>Habilitado</th>
    </tr>
    </thead>
    <tbody>

      <c:forEach var="s" items="${subtipos}">
        <tr>
          <td>${s.nro_subtipo}</td>
          <td>${s.cod_tipo_cliente}</td>
          <td>${s.nom_tipo_cliente}</td>
          <td>
            <input type="checkbox" ${s.habilitado == 'S' ? 'checked' : ''}>
          </td>
        </tr>
      </c:forEach>

    </tbody>
  </table>

  <div>
    <button class="btn btn-success">Guardar</button>
    <button class="btn btn-danger">Cancelar</button>
  </div>
</div>

