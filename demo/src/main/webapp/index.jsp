<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/js/bootstrap.bundle.min.js" defer></script>
    <script src="${pageContext.request.contextPath}/js/index.js" defer></script>
</head>
<body>

<jsp:useBean id="calendarList" class="com.alesso.demo.CalendarListBean" scope="session"></jsp:useBean>
<section class="container py-4">

    <h1 class="mb-2">Mi agenda</h1>
    <form id="calendarInput" action="${pageContext.request.contextPath}/pages/eventRegistry.jsp" method="post">
        <div class="d-flex gap-2 w-100">
            <div class="mb-3 w-50">
                <label for="dateInput" class="form-label">Fecha</label>
                <input type="date" name="date" class="form-control" id="dateInput" aria-describedby="dateInputHelp">
            </div>
            <div class="mb-3 w-50">
                <label for="prioritySelect" class="form-label">Prioridad</label>
                <select id="prioritySelect" name="priority" class="form-select">
                    <option value="A">Alta</option>
                    <option value="M" selected>Media</option>
                    <option value="B">Baja</option>
                </select>
            </div>
        </div>
        <div class="mb-3 form-check p-0">
            <label for="descriptionText" class="form-label">Descripción</label>
            <textarea class="form-control" name="description" id="descriptionText" rows="3"></textarea>
        </div>

        <div class="d-flex w-100 gap-2">
            <div class="w-50">
                <span class="bold">Notificar</span>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="notificate" id="yesRadio">
                    <label class="form-check-label" for="yesRadio">
                        Si
                    </label>
                </div>
                <div class="form-check w-50">
                    <input class="form-check-input" type="radio" name="notNotificate" id="noRadio">
                    <label class="form-check-label" for="noRadio">
                        No
                    </label>
                </div>
            </div>

            <div class="w-100">
                <label for="emailToAdvise" class="form-label">E-mail a notificar</label>
                <input type="email" class="form-control" name="emailToAdvise" id="emailToAdvise"
                       placeholder="Ingrese E-mail a notificar">
            </div>
        </div>
        <button type="submit" class="btn btn-primary">Agendar</button>
        <button type="submit" class="btn btn-warning">Limpiar</button>
    </form>

    <table class="table table-light mt-5">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">Fecha</th>
            <th scope="col">Descripción</th>
            <th scope="col">Prioridad</th>
            <th scope="col">Notificar a</th>
            <th scope="col">Acción</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="ev" items="${calendarList.calendarList}" varStatus="st">
            <tr>
                <th scope="row">${st.index + 1}</th>
                <td class="${ev.discarted ? 'text-decoration-line-through text-danger' : ''}">${ev.date}</td>
                <td class="${ev.discarted ? 'text-decoration-line-through text-danger' : ''}">${ev.description}</td>
                <td class="${ev.discarted ? 'text-decoration-line-through text-danger' : ''}">${ev.priority}</td>
                <td class="${ev.discarted ? 'text-decoration-line-through text-danger' : ''}">${ev.emailToAdvise}</td>
                <td>
                    <form method="post" action="${pageContext.request.contextPath}/pages/eventRegistry.jsp" class="m-0">
                        <input type="hidden" name="action" value="toggle"/>
                        <input type="hidden" name="index" value="${st.index}"/>
                        <button id="discardBtn" type="submit"
                                class="btn btn-link p-0 ${ev.discarted ? '' : 'text-danger'}">
                                ${ev.discarted ? 'Recuperar' : 'Descartar'}
                        </button>
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>

    </table>
</section>
</body>
</html>