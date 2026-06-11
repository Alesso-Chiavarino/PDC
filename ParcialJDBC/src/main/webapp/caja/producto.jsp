<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<tr data-cod-barra="${producto.codBarra}"
    data-nom-producto="${producto.nomProducto}"
    data-precio="${producto.precio}">
  <td>
    ${producto.nomProducto}
    <div class="text-muted small">${producto.codBarra}</div>
  </td>
  <td>$ ${producto.precio}</td>
  <td class="text-center">
    <button class="btn btn-sm btn-outline-danger" onclick="eliminarElementoCarrito()">
      <i class="bi bi-trash"></i>
    </button>
  </td>
</tr>