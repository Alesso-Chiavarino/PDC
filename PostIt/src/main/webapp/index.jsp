<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mis notas adhesivas dinámicas</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/js/bootstrap.bundle.min.js" defer></script>
    <script src="${pageContext.request.contextPath}/js/index.js" defer></script>
    <style>
        /* ── Post-it base ─────────────────────────────────────── */
        .postit {
            width: 70px;
            height: 70px;
            flex-shrink: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            font-size: 0.6rem;
            font-weight: 500;
            line-height: 1.2;
            word-break: break-word;
            overflow: hidden;
            padding: 4px;
            border: 1px solid rgba(0, 0, 0, 0.25);
            box-shadow: 4px 4px 8px rgba(0, 0, 0, 0.3);
            cursor: pointer;
            transition: box-shadow 0.15s ease, transform 0.1s ease;
        }

        .postit:hover {
            box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.4);
        }

        .postit:active {
            transform: scale(0.97);
        }

        .postit:focus {
            outline: 3px solid #fd7e14;
            outline-offset: 3px;
        }

        /* ── Colores ──────────────────────────────────────────── */
        .postit-rojo {
            background-color: #dc3545;
            color: #fff;
            border-color: #a71d2a;
        }

        .postit-azul {
            background-color: #0d6efd;
            color: #fff;
            border-color: #0a4fc4;
        }

        .postit-amarillo {
            background-color: #ffc107;
            color: #212529;
            border-color: #b38600;
        }

        .postit-verde {
            background-color: #198754;
            color: #fff;
            border-color: #0f5733;
        }

        .postit-negro {
            background-color: #212529;
            color: #f8f9fa;
            border-color: #555e68;
        }

        /* Blanco: borde reforzado para diferenciarse del fondo */
        .postit-blanco {
            background-color: #ffffff;
            color: #212529;
            border: 2px solid #6c757d;
        }

        /* ── Contenedor responsive ────────────────────────────── */
        #contenedor-postit {
            display: flex;
            flex-wrap: wrap;
            gap: 1rem;
            justify-content: center;
        }

        /* Móvil: una sola columna */
        @media (max-width: 575.98px) {
            #contenedor-postit {
                flex-direction: column;
                align-items: center;
            }
        }
    </style>
</head>
<body class="bg-light">
<jsp:useBean id="postItList" class="com.alesso.postit.PostItListBean" scope="session"></jsp:useBean>


<div class="container py-5">

    <!-- ── Título ──────────────────────────────────────────── -->
    <h1 class="text-center fw-bold mb-4">Mis notas adhesivas dinámicas</h1>

    <!-- ── Formulario ─────────────────────────────────────── -->
    <div class="card shadow-sm mb-4">
        <div class="card-body">
            <jsp:include page="components/form.jsp"/>
        </div>
    </div>

    <!-- ── Instrucciones de accesibilidad ─────────────────── -->
    <p class="text-center text-muted small mb-4" role="note">
        <strong>Clic</strong> sobre una nota vacía para escribir contenido &nbsp;·&nbsp;
        <strong>Doble clic</strong> para eliminarla.
    </p>

    <!-- ── Contenedor de post-its ──────────────────────────── -->
    <section
            id="postItContainer"
            aria-label="Contenedor de notas adhesivas"
            aria-live="polite"
    >
        <c:forEach var="postIt" items="${postItList.postItList}">
            <jsp:include page="/components/postIt.jsp">
                <jsp:param name="id" value="${postIt.id}"></jsp:param>
                <jsp:param name="color" value="${postIt.color}"></jsp:param>
                <jsp:param name="content" value="${postIt.content}"></jsp:param>
            </jsp:include>
        </c:forEach>

    </section>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
