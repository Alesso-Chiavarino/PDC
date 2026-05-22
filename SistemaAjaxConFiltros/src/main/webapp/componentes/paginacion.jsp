<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:useBean id="manager" class="com.alesso.sistemaajaxconfiltros.PedidoManagerBean" scope="session"/>

<div class="d-flex flex-wrap justify-content-center gap-2">
    <button type="button"
            class="btn btn-sm btn-outline-secondary ${manager.paginaActual == 1 ? 'disabled' : ''}"
            onclick="cambiarPagina('${manager.paginaActual - 1}')">
        Anterior
    </button>

    <c:forEach var="pagina" begin="1" end="${manager.totalPaginas}">
        <button type="button"
                onclick="cambiarPagina('${pagina}')"
                class="btn btn-sm ${manager.paginaActual == pagina ? 'btn-primary' : 'btn-outline-secondary'}">
                ${pagina}
        </button>
    </c:forEach>

    <button type="button"
            class="btn btn-sm btn-outline-secondary ${manager.paginaActual == manager.totalPaginas ? 'disabled' : ''}"
            onclick="cambiarPagina('${manager.paginaActual + 1}')">
        Siguiente
    </button>
</div>
