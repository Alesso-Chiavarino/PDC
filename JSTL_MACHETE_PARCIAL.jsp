<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!--
MACHETE JSTL + JSP (nivel parcial)
Uso: copiar bloques en tus JSP según necesidad.
Nota clave: param.* SIEMPRE llega como String.
-->

<!-- ===================================================== -->
<!-- 1) PARAMETROS Y TIPOS -->
<!-- ===================================================== -->

<!-- param.id, param.pedidoId, param.rechazado son String -->
<c:set var="pedidoId" value="${param.pedidoId}" />
<c:set var="rechazado" value="${param.rechazado eq 'true'}" />

<!-- Forzar numero si te hace falta -->
<c:set var="cantidad" value="${param.cantidad + 0}" />


<!-- ===================================================== -->
<!-- 2) SCOPES (page / request / session / application) -->
<!-- ===================================================== -->

<!-- page: solo dentro de este JSP -->
<c:set var="soloLocal" value="ok" scope="page" />

<!-- request: ideal para pasar objetos a un include -->
<c:set var="pedidoActual" value="${pedido}" scope="request" />
<jsp:include page="/components/pedidoCard.jsp" />

<!-- session: persiste entre requests del mismo usuario -->
<c:set var="filtroActual" value="ENTREGA" scope="session" />

<!-- leer explicito -->
${pageScope.soloLocal}
${requestScope.pedidoActual}
${sessionScope.filtroActual}


<!-- ===================================================== -->
<!-- 3) IF / ELSE -->
<!-- ===================================================== -->

<!-- if simple -->
<c:if test="${pedido.completo}">
    <span class="badge bg-success">Completo</span>
</c:if>

<!-- if / else -->
<c:choose>
    <c:when test="${pedido.completo}">
        <span class="badge bg-success">Completo para entrega</span>
    </c:when>
    <c:otherwise>
        <span class="badge bg-warning text-dark">Parcialmente completo para entrega</span>
    </c:otherwise>
</c:choose>


<!-- ===================================================== -->
<!-- 4) FOREACH (listas, indice, limite) -->
<!-- ===================================================== -->

<!-- recorrer lista -->
<c:forEach var="producto" items="${pedido.productos}">
    ${producto.nombre}
</c:forEach>

<!-- recorrer con indice -->
<c:forEach var="producto" items="${pedido.productos}" varStatus="st">
    #${st.index} - ${producto.nombre}
</c:forEach>

<!-- mostrar solo primeros N -->
<c:set var="visible" value="${empty param.visible ? 5 : param.visible}" />
<c:forEach var="producto" items="${pedido.productos}" begin="0" end="${visible - 1}">
    ${producto.nombre}
</c:forEach>

<!-- expandido con length -->
<c:set var="expandido" value="${param.expandido eq 'true'}" />
<c:set var="limite" value="${expandido ? fn:length(pedido.productos) : 5}" />
<c:forEach var="producto" items="${pedido.productos}" begin="0" end="${limite - 1}">
    ${producto.nombre}
</c:forEach>


<!-- ===================================================== -->
<!-- 5) GETTERS EN EL (JavaBean) -->
<!-- ===================================================== -->

<!-- Java: isCompleto() => EL: pedido.completo -->
<!-- Java: getCantidadProductos() => EL: pedido.cantidadProductos -->
${pedido.completo}
${pedido.cantidadProductos}


<!-- ===================================================== -->
<!-- 6) CHECKBOX / RADIO EN FORM -->
<!-- ===================================================== -->

<!-- Checkbox: value fijo + checked condicional -->
<input type="checkbox" name="vegan" value="true"
       ${param.vegan eq 'true' ? 'checked' : ''} />

<!-- Radio: mismo name para grupo -->
<input type="radio" name="tipoCocina" value="TRAD"
       ${param.tipoCocina eq 'TRAD' ? 'checked' : ''} />
<input type="radio" name="tipoCocina" value="HEAL"
       ${param.tipoCocina eq 'HEAL' ? 'checked' : ''} />
<input type="radio" name="tipoCocina" value="GOUR"
       ${param.tipoCocina eq 'GOUR' ? 'checked' : ''} />


<!-- ===================================================== -->
<!-- 7) SELECT CORRECTO -->
<!-- ===================================================== -->

<!-- El selected va en option, NO en select -->
<select name="difficulty" class="form-select">
    <option value="" ${empty param.difficulty ? 'selected' : ''}>Seleccionar</option>
    <option value="F" ${param.difficulty eq 'F' ? 'selected' : ''}>Fácil</option>
    <option value="M" ${param.difficulty eq 'M' ? 'selected' : ''}>Media</option>
    <option value="D" ${param.difficulty eq 'D' ? 'selected' : ''}>Difícil</option>
</select>


<!-- ===================================================== -->
<!-- 8) TEXTAREA CORRECTO -->
<!-- ===================================================== -->

<!-- textarea no usa atributo value -->
<textarea name="descripcion" class="form-control">${param.descripcion}</textarea>


<!-- ===================================================== -->
<!-- 9) EJECUTAR METODOS VOID SIN "ENSUCIAR" HTML -->
<!-- ===================================================== -->

<!-- Evitar: ${manager.quitarProducto(...)} porque puede imprimir basura -->
<c:set var="noop" value="${manager.quitarProducto(param.pedidoId, param.id)}" />


<!-- ===================================================== -->
<!-- 10) PATRON AJAX + JSP FRAGMENT -->
<!-- ===================================================== -->

<!--
1) JS hace fetch a /actions/xxx.jsp
2) action JSP actualiza bean
3) action JSP incluye el fragmento actualizado (pedidoCard/row)
4) JS reemplaza outerHTML del bloque
-->

<!-- action.jsp -->
<c:set var="noop2" value="${manager.marcarEntrega(param.pedidoId, param.listo)}" />
<c:forEach var="pedido" items="${manager.pedidos}">
    <c:if test="${pedido.id == param.pedidoId}">
        <c:set var="pedidoActual" value="${pedido}" scope="request" />
        <jsp:include page="/components/pedidoCard.jsp" />
    </c:if>
</c:forEach>


<!-- ===================================================== -->
<!-- 11) FECHAS -->
<!-- ===================================================== -->

<!-- Si tenes java.util.Date -->
<fmt:formatDate value="${pedido.fechaEntrega}" pattern="dd/MM/yyyy" />

<!-- Si guardas yyyy-MM-dd string para input date -->
<input type="date" name="publicationDate" value="${param.publicationDate}" />


<!-- ===================================================== -->
<!-- 12) ERRORES COMUNES (cheat ultra corto) -->
<!-- ===================================================== -->

<!--
- param.* es String
- jsp:param NO pasa listas/objetos (para eso: request scope)
- c:if no tiene else (usar c:choose)
- getters boolean isXxx() se leen como .xxx en EL
- select usa selected en option
- textarea no tiene value
-->


<!-- ===================================================== -->
<!-- 13) JSTL FN (functions) -->
<!-- ===================================================== -->

<!-- length -->
${fn:length(pedido.productos)}

<!-- contains -->
${fn:contains(param.nombre, 'Tomate')}

<!-- trim -->
${fn:trim(param.busqueda)}

<!-- substring -->
${fn:substring(param.codigo, 0, 3)}


<!-- ===================================================== -->
<!-- 14) VARSTATUS EN FOREACH -->
<!-- ===================================================== -->

<c:forEach var="producto" items="${pedido.productos}" varStatus="st">
    <!-- st.index arranca en 0 -->
    <!-- st.count arranca en 1 -->
    <!-- st.first / st.last boolean -->
    ${st.count}. ${producto.nombre}
</c:forEach>


<!-- ===================================================== -->
<!-- 15) FMT FECHAS Y NUMEROS -->
<!-- ===================================================== -->

<!-- parseDate de String a Date -->
<fmt:parseDate value="${param.fechaEntregaTxt}"
               pattern="yyyy-MM-dd"
               var="fechaEntregaDate" />

<!-- formatDate -->
<fmt:formatDate value="${fechaEntregaDate}" pattern="dd/MM/yyyy" />

<!-- formatNumber -->
<fmt:formatNumber value="${producto.cantidad}" minFractionDigits="0" maxFractionDigits="2" />


<!-- ===================================================== -->
<!-- 16) CATCH (capturar excepcion JSP/EL) -->
<!-- ===================================================== -->

<c:catch var="errorAccion">
    <c:set var="noop3" value="${manager.quitarProducto(param.pedidoId, param.id)}" />
</c:catch>

<c:if test="${not empty errorAccion}">
    <div class="alert alert-danger">No se pudo quitar el producto. Reintentá.</div>
</c:if>


<!-- ===================================================== -->
<!-- 17) C:URL + C:PARAM (armado de URL seguro) -->
<!-- ===================================================== -->

<c:url var="urlVerMas" value="/actions/verMasProductos.jsp">
    <c:param name="pedidoId" value="${pedido.id}" />
    <c:param name="cantidad" value="10" />
</c:url>

<!-- ejemplo de uso -->
<a href="${urlVerMas}">Ver más</a>


<!-- ===================================================== -->
<!-- 18) C:OUT (escape de HTML) -->
<!-- ===================================================== -->

<!-- Seguro para texto que puede venir de usuario -->
<c:out value="${param.observaciones}" />

<!-- Si queres permitir HTML (normalmente NO) -->
<c:out value="${param.htmlRaw}" escapeXml="false" />


<!-- ===================================================== -->
<!-- 19) COMPARACIONES EL (chuleta) -->
<!-- ===================================================== -->

${a eq b}
${a ne b}
${a lt b}
${a gt b}
${a le b}
${a ge b}
${condicion ? 'SI' : 'NO'}

<!-- cuidado: param.edad es String -->
${param.edad + 0 gt 18}


<!-- ===================================================== -->
<!-- 20) REQUEST VS SESSION (cuando usar) -->
<!-- ===================================================== -->

<!-- request: datos solo para este render -->
<c:set var="pedidoActual" value="${pedido}" scope="request" />

<!-- session: persiste entre requests -->
<c:set var="filtro" value="pendientes" scope="session" />

<!-- recomendacion parcial -->
<!-- - estado negocio: session (rechazado/listoEntrega) -->
<!-- - estado vista temporal: request/param (expandido/visible) -->
