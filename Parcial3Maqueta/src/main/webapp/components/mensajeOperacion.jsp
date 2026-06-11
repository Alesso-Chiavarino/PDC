<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="alert alert-${requestScope.tipoMensaje}" role="alert">
    <h6 class="alert-heading mb-1">${requestScope.tituloMensaje}</h6>
    <div>${requestScope.mensaje}</div>
    <div class="small mt-2">${requestScope.detalleMensaje}</div>
</div>
