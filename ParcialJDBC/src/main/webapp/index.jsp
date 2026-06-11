<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Parcial JDBC - Menú de ejercicios</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/js/bootstrap.bundle.min.js" defer></script>
</head>
<body class="py-5">
<div class="container" style="max-width: 900px;">
    <h2 class="fw-bold mb-1">Parcial JDBC — Ejercicios unificados</h2>
    <p class="text-muted mb-4">Cada módulo demuestra una variante distinta de JDBC (Statement / PreparedStatement / CallableStatement).</p>

    <div class="list-group mb-4">
        <a href="tickets/index.jsp" class="list-group-item list-group-item-action">
            <strong>Tickets</strong> — PreparedStatement consulta con parámetros (executeQuery + while) y
            CallableStatement insert (executeUpdate + transacción)
        </a>
        <a href="reclamos/index.jsp" class="list-group-item list-group-item-action">
            <strong>Reclamos</strong> — PreparedStatement INSERT (executeUpdate + transacción) y
            CallableStatement con parámetro OUTPUT (execute + variable al JS)
        </a>
        <a href="caja/index.jsp" class="list-group-item list-group-item-action">
            <strong>Caja registradora</strong> — CallableStatement insert con transacción + lectura del registro insertado (if)
        </a>
        <a href="clientes/index.jsp" class="list-group-item list-group-item-action">
            <strong>Tipos de clientes</strong> — Statement consulta simple sin parámetros (executeQuery + while)
            y CallableStatement que devuelve ResultSet (executeQuery + while)
        </a>
        <a href="aerolinea/index.jsp" class="list-group-item list-group-item-action">
            <strong>Aerolínea</strong> — CallableStatement que devuelve UN registro (executeQuery + if) y
            PreparedStatement INSERT con transacción
        </a>
    </div>

    <div class="alert alert-secondary small">
        En el paquete <code>com.munoz.parcialjdbc.referencia</code> hay servlets extra de referencia:
        UPDATE y DELETE con PreparedStatement + transacción, y SELECT de un solo registro con PreparedStatement (if).
        Ver también <code>README.md</code> en la raíz del proyecto con la tabla de variantes.
    </div>
</div>
</body>
</html>
