<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="producto" value="${requestScope.productoCarrito}"/>

<tr id="prod-${producto.nroDetalle}" data-nro-detalle="${producto.nroDetalle}"
    data-nro-carrito="${requestScope.nroCarrito}"
    data-precio="${producto.precio}"
    data-nom-producto="${producto.nomProducto}"
    data-cod-barra="${producto.codBarra}">
    <td>
        ${producto.nomProducto}
        <div class="text-muted small">${producto.codBarra}</div>
    </td>
    <td>$${producto.precio}</td>
    <td class="text-center">
        <button type="button" onclick="eliminarProd('${producto.nroDetalle}')"
                class="btn btn-sm btn-outline-danger eliminar-btn">
            <i class="bi bi-trash"></i>
        </button>
    </td>
</tr>
