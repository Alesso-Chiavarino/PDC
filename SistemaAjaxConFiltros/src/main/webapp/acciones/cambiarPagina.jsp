<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:useBean id="manager" class="com.alesso.sistemaajaxconfiltros.PedidoManagerBean" scope="session"/>

<c:set var="noop" value="${manager.cambiarPagina(param.paginaNueva)}"/>
<c:set var="pedidosPaginados" value="${manager.pedidosPaginados}" scope="request"/>

<jsp:include page="/componentes/pedidosPanel.jsp"/>
