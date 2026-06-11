<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<div class="card border-0 shadow-sm">
    <div class="card-body">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h5 class="card-title mb-0">Listado paginado</h5>
            <span class="badge text-bg-secondary">
                ${requestScope.totalRegistros} registros
            </span>
        </div>

        <div class="table-responsive">
            <table class="table table-sm table-striped align-middle mb-0">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Titulo</th>
                    <th>Autor</th>
                    <th>Categoria</th>
                </tr>
                </thead>
                <tbody>
                <c:choose>
                    <c:when test="${not empty requestScope.libros}">
                        <c:forEach var="libro" items="${requestScope.libros}">
                            <tr>
                                <td>${libro.idLibro}</td>
                                <td>${libro.titulo}</td>
                                <td>${libro.autor}</td>
                                <td>${libro.categoria}</td>
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

        <div class="d-flex justify-content-between align-items-center mt-3">
            <div class="small text-muted">
                Pagina ${requestScope.paginaActual} de ${requestScope.totalPaginas} - ${requestScope.tamPagina} por pagina
            </div>
            <div class="btn-group">
                <button type="button"
                        class="btn btn-outline-primary btn-sm"
                        onclick="jCookiesJDBC.irPagina(${requestScope.paginaActual - 1})"
                    ${requestScope.paginaActual == 1 ? 'disabled' : ''}>
                    Anterior
                </button>
                <button type="button"
                        class="btn btn-outline-primary btn-sm"
                        onclick="jCookiesJDBC.irPagina(${requestScope.paginaActual + 1})"
                    ${requestScope.paginaActual == requestScope.totalPaginas ? 'disabled' : ''}>
                    Siguiente
                </button>
            </div>
        </div>
    </div>
</div>
