<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:useBean id="manager" class="com.alesso.parcial2comisiona.PedidoManagerBean" scope="session"/>

<c:set var="noop" value="${manager.quitarProducto(param.pedidoId, param.id)}"/>

<c:forEach var="pedido" items="${manager.pedidos}">
    <c:if test="${pedido.id == param.pedidoId}">
        <c:set var="pedidoActual" value="${pedido}" scope="request"/>
        <jsp:include page="/components/pedidoCard.jsp">
            <jsp:param name="expandido" value="${param.expandido}"/>
        </jsp:include>
    </c:if>
</c:forEach>
