<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<table class="table table-bordered table-striped align-middle mb-3">
    <thead class="table-light">
    <tr>
        <th>Ticket N°</th>
        <th>Fecha</th>
        <th>Solicitante</th>
        <th>Asunto</th>
        <th>Texto</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="ticket" items="${sessionScope.tickets}">
        <tr>
            <td>${ticket.nro_ticket}</td>
            <td>${ticket.fecha_ticket}</td>
            <td>${ticket.nro_solicitante}</td>
            <td>${ticket.asunto_ticket}</td>
            <td>${ticket.texto_ticket}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<div class="d-flex justify-content-end">
    <button onclick="nuevoTicket()" type="button" class="btn btn-primary">Nuevo ticket</button>
</div>
