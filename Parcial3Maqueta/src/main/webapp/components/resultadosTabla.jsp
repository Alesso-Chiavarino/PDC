<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<div class="card border-0 shadow-sm">
    <div class="card-body">
        <h6 class="card-title mb-3">${requestScope.tituloTabla}</h6>
        <div class="table-responsive">
            <table class="table table-sm table-striped align-middle mb-0">
                <thead>
                <tr>
                    <th>Código</th>
                    <th>Descripción</th>
                    <th>Detalle</th>
                    <th>Estado</th>
                </tr>
                </thead>
                <tbody>
                <c:choose>
                    <c:when test="${not empty requestScope.items}">
                        <c:forEach var="item" items="${requestScope.items}">
                            <tr>
                                <td>${item.codigo}</td>
                                <td>${item.descripcion}</td>
                                <td>${item.detalle}</td>
                                <td>${item.estado}</td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td colspan="4" class="text-center text-muted">Sin resultados</td>
                        </tr>
                    </c:otherwise>
                </c:choose>
                </tbody>
            </table>
        </div>
    </div>
</div>
