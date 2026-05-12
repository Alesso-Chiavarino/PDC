<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/js/bootstrap.bundle.min.js" defer></script>
</head>
<body>
<jsp:useBean id="fingerList" class="com.pdc.abmhuellas.FingerListBean" scope="session"></jsp:useBean>
<jsp:useBean id="fingerPrintList" class="com.pdc.abmhuellas.FingerPrintListBean" scope="session"></jsp:useBean>

<c:if test="${!empty param.code}">
    <jsp:useBean id="fingerPrint" class="com.pdc.abmhuellas.FingerPrintBean"/>
    <jsp:setProperty name="fingerPrint" property="*"/>

    ${fingerPrintList.addFingerPrint(fingerPrint)}
    <c:redirect url="index.jsp"/>
</c:if>

<main class="container mx-auto py-5">
    <section>
        <h3>Tipos de huellas especiales</h3>

        <form action=${pageContext.request.contextPath}/index.jsp method="post">
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Código</th>
                    <th scope="col">Descripción</th>
                    <th scope="col">Dedo</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th scope="row">1</th>
                    <td>
                        <label for="codeInput" hidden="hidden" class="form-label">Código</label>
                        <input type="text" maxlength="255" name="code" minlength="10" class="form-control"
                               id="codeInput"
                               aria-describedby="Código">
                    </td>
                    <td>
                        <label for="descriptionInput" hidden="hidden" class="form-label">Descripción</label>
                        <input type="text" class="form-control" name="description" maxlength="255" minlength="10"
                               id="descriptionInput"
                               aria-describedby="Descripción">
                    </td>
                    <td>
                        <label for="fingerInput" hidden="hidden" class="form-label">Dedo</label>
                        <select id="fingerInput" name="finger" class="form-select" aria-label="Dedo">
                            <option value="" selected>Seleccione</option>
                            <c:forEach var="fing" items="${fingerList.fingerList}" varStatus="st">
                                <option value="${fing.type}">${fing.label}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <c:forEach var="fingerPrint" items="${fingerPrintList.fingerPrintList}" varStatus="st">
                    <tr>
                        <th scope="row">${st.index + 1}</th>
                        <td>
                            <label for="codeInput" hidden="hidden" class="form-label">Código</label>
                            <input type="text" required maxlength="10" value="${fingerPrint.code}"
                                   class="form-control" id="codeInput"
                                   aria-describedby="Código">
                        </td>
                        <td>
                            <label for="descriptionInput" hidden="hidden" class="form-label">Descripción</label>
                            <input type="text" required class="form-control" maxlength="255"
                                   value="${fingerPrint.description}}"
                                   id="descriptionInput"
                                   aria-describedby="Descripción">
                        </td>
                        <td>
                            <label for="fingerInput" hidden="hidden" class="form-label">Dedo</label>
                            <select id="fingerInput" class="form-select" aria-label="Dedo">
                                <option value="">Seleccione</option>
                                <c:forEach var="fing" items="${fingerList.fingerList}">
                                    <option value="${fing.type}" ${fing.type eq fingerPrint.finger
                                            ? 'selected' : ''}>
                                            ${fing.label}
                                    </option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

            <div>
                <button type="submit" class="btn btn-success">Guardar</button>
                <button id="cancelBtn" type="button" class="btn btn-warning" onclick="window.location.reload()">
                    Cancelar
                </button>
            </div>
        </form>
    </section>

</main>
</body>
</html>