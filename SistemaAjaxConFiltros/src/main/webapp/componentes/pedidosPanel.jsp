<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:useBean id="manager" class="com.alesso.sistemaajaxconfiltros.PedidoManagerBean" scope="session"/>
<c:set var="pedidosPaginados"
       value="${empty requestScope.pedidosPaginados ? manager.pedidosPaginados : requestScope.pedidosPaginados}"/>

<div id="pedidos-panel" class="card shadow-sm">
    <div class="card-header bg-white">
        <div class="row g-2 align-items-end">
            <div class="col-12 col-md-6">
                <label for="busqueda-input" class="form-label mb-1">Buscar (cliente, producto o ID exacto)</label>
                <input id="busqueda-input"
                       class="form-control"
                       type="text"
                       value="${manager.textoBusqueda}"
                       oninput="onBusquedaInput(event)"
                       placeholder="Ej: Panaderia o 102">
            </div>
            <div class="col-12 col-md-6 d-flex justify-content-md-end gap-2">
                <button type="button" class="btn btn-outline-secondary" onclick="buscarPedidosDesdeBoton()">Buscar</button>
                <button type="button" class="btn btn-outline-danger" onclick="limpiarBusqueda()">Limpiar</button>
            </div>
        </div>

        <div class="d-flex flex-wrap gap-2 mt-3">
            <button type="button"
                    onclick="cambiarFiltro('TODOS')"
                    class="btn btn-sm ${manager.filtroActivo eq 'TODOS' ? 'btn-primary' : 'btn-outline-secondary'}">Todos
            </button>
            <button type="button"
                    onclick="cambiarFiltro('PENDIENTE')"
                    class="btn btn-sm ${manager.filtroActivo eq 'PENDIENTE' ? 'btn-primary' : 'btn-outline-secondary'}">
                Pendientes
            </button>
            <button type="button"
                    onclick="cambiarFiltro('EN_PREPARACION')"
                    class="btn btn-sm ${manager.filtroActivo eq 'EN_PREPARACION' ? 'btn-primary' : 'btn-outline-secondary'}">
                En preparación
            </button>
            <button type="button"
                    onclick="cambiarFiltro('ENTREGADO')"
                    class="btn btn-sm ${manager.filtroActivo eq 'ENTREGADO' ? 'btn-primary' : 'btn-outline-secondary'}">
                Entregados
            </button>
            <button type="button"
                    onclick="cambiarFiltro('CANCELADO')"
                    class="btn btn-sm ${manager.filtroActivo eq 'CANCELADO' ? 'btn-primary' : 'btn-outline-secondary'}">
                Cancelados
            </button>
        </div>

        <p class="text-muted small mt-3 mb-0">Resultados: ${manager.cantidadFiltrada} pedido(s) - Página ${manager.paginaActual} de ${manager.totalPaginas}</p>
    </div>

    <div class="table-responsive">
        <table class="table table-hover align-middle mb-0">
            <thead class="table-light">
            <tr>
                <th class="ps-3" role="button" onclick="ordenarPedidos('ID')">ID ${manager.ordenCampo eq 'ID' ? (manager.ordenDireccion eq 'ASC' ? '↑' : '↓') : ''}</th>
                <th role="button" onclick="ordenarPedidos('CLIENTE')">Cliente ${manager.ordenCampo eq 'CLIENTE' ? (manager.ordenDireccion eq 'ASC' ? '↑' : '↓') : ''}</th>
                <th role="button" onclick="ordenarPedidos('PRODUCTO')">Producto ${manager.ordenCampo eq 'PRODUCTO' ? (manager.ordenDireccion eq 'ASC' ? '↑' : '↓') : ''}</th>
                <th role="button" onclick="ordenarPedidos('ESTADO')">Estado ${manager.ordenCampo eq 'ESTADO' ? (manager.ordenDireccion eq 'ASC' ? '↑' : '↓') : ''}</th>
                <th role="button" onclick="ordenarPedidos('FECHA')">Entrega ${manager.ordenCampo eq 'FECHA' ? (manager.ordenDireccion eq 'ASC' ? '↑' : '↓') : ''}</th>
                <th role="button" onclick="ordenarPedidos('TOTAL')">Total ${manager.ordenCampo eq 'TOTAL' ? (manager.ordenDireccion eq 'ASC' ? '↑' : '↓') : ''}</th>
                <th class="text-center pe-3">Acción</th>
            </tr>
            </thead>

            <tbody>
            <c:choose>
                <c:when test="${empty pedidosPaginados}">
                    <tr>
                        <td colspan="7" class="text-center py-4 text-muted">No hay pedidos para mostrar con los filtros actuales.</td>
                    </tr>
                </c:when>
                <c:otherwise>
                    <c:forEach var="pedido" items="${pedidosPaginados}">
                        <jsp:include page="/componentes/pedidoRow.jsp">
                            <jsp:param name="id" value="${pedido.id}"/>
                            <jsp:param name="cliente" value="${pedido.cliente}"/>
                            <jsp:param name="producto" value="${pedido.producto}"/>
                            <jsp:param name="estado" value="${pedido.estado}"/>
                            <jsp:param name="fechaEntrega" value="${pedido.fechaEntrega}"/>
                            <jsp:param name="total" value="${pedido.total}"/>
                            <jsp:param name="urgente" value="${pedido.urgente}"/>
                        </jsp:include>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
            </tbody>
        </table>
    </div>

    <div class="card-footer bg-white">
        <jsp:include page="/componentes/paginacion.jsp"/>
    </div>
</div>
