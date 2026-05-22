<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="pedido" value="${requestScope.pedidoActual}"/>
<c:set var="expandido" value="${param.expandido eq 'true' or (not empty param.visible and param.visible > 5)}"/>
<c:set var="visible" value="${expandido ? pedido.cantidadProductos : 5}"/>

<div id="pedido-${pedido.id}"
     class="card mb-4 shadow-sm border-start border-5 ${pedido.completo ? 'border-success' : 'border-warning'}">

    <div class="card-header d-flex justify-content-between align-items-center">

        <div>

            <strong>Pedido #${pedido.id}</strong>

            <span class="badge ${pedido.completo ? 'bg-success' : 'bg-warning'} ms-2">
                ${pedido.completo ? 'Completo para entrega' : 'Parcialmente completo para entrega'}
            </span>

        </div>

        <div class="form-check">

            <input onchange="marcarEstadoPedido(event, ${pedido.id})" class="form-check-input"
                   type="checkbox"${pedido.listoEntrega ? 'checked' : ''}
            >

            <label class="form-check-label">
                Listo para entrega
            </label>

        </div>

    </div>

    <div class="card-body p-0">

        <table class="table table-hover align-middle mb-0">

            <thead class="table-light">

            <tr>
                <th>ID</th>
                <th>Producto</th>
                <th>Cantidad</th>
                <th>Estado</th>
                <th class="text-center">Acción</th>
            </tr>

            </thead>

            <tbody id="productos-table-body-${pedido.id}" expandido="${expandido ? 'true' : 'false'}">
            <c:forEach var="producto" items="${pedido.productos}" begin="0" end="${visible - 1}">
                <jsp:include page="/components/productoRow.jsp">
                    <jsp:param name="id" value="${producto.id}"/>
                    <jsp:param name="nombre" value="${producto.nombre}"/>
                    <jsp:param name="cantidad" value="${producto.cantidad}"/>
                    <jsp:param name="rechazado" value="${producto.rechazado}"/>
                    <jsp:param name="pedidoId" value="${pedido.id}"/>
                </jsp:include>
            </c:forEach>

            </tbody>

        </table>

    </div>

    <div class="card-footer text-end">

        <c:if test="${pedido.cantidadProductos > visible}">
            <button class="btn btn-primary btn-sm" onclick="verMasProductos('${pedido.id}', '${visible}')">Ver más
                productos
            </button>
        </c:if>

    </div>

</div>
