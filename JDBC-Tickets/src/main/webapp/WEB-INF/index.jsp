<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="JDBC Tickets">
    <meta name="author" content="Alessandro Chiavarino">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Tickets</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/js/bootstrap.bundle.min.js" defer></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/utils.js" defer></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/index.js" defer></script>
</head>
<body class="bg-light">
<main class="container py-4">
    <div class="row justify-content-center">
        <div class="col-12 col-lg-10">
            <div class="card shadow-sm">
                <div class="card-body">
                    <div id="iError" class="d-none"></div>
                    <form id="ticketForm" action="javascript:void(0)">
                        <div class="row g-3 align-items-end">
                            <div class="col-12 col-md-5">
                                <label for="textoBusquedaInput" class="form-label mb-1">Solicitante | Asunto | Texto</label>
                                <input id="textoBusquedaInput" name="textoBusqueda" type="text" class="form-control">
                            </div>
                            <div class="col-12 col-md-5">
                                <fieldset class="border rounded p-3 h-100">
                                    <legend class="float-none w-auto px-2 fs-6 mb-2">Ordenar Por</legend>
                                    <div class="d-flex flex-column flex-sm-row gap-3">
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="orden" id="orderSolicitante" value="S">
                                            <label class="form-check-label" for="orderSolicitante">Solicitante</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="orden" id="orderFecha" value="F" checked>
                                            <label class="form-check-label" for="orderFecha">Fecha</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="orden" id="orderNumero" value="T">
                                            <label class="form-check-label" for="orderNumero">Nro. de Ticket</label>
                                        </div>
                                    </div>
                                </fieldset>
                            </div>
                            <div class="col-12 col-md-2">
                                <button type="submit" class="btn btn-outline-secondary w-100">Buscar</button>
                            </div>
                        </div>
                    </form>

                    <div id="ticketsError" class="mt-3 d-none"></div>

                    <section id="ticketsResults" class="mt-4">
                        <div class="table-responsive" id="tableWrapper">
                            <jsp:include page="/components/ticketsTabla.jsp"/>
                        </div>
                    </section>

                    <jsp:include page="/components/ticketForm.jsp"/>
                </div>
            </div>
        </div>
    </div>
</main>
</body>
</html>
