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
<main class="container mx-auto py-5">
    <h1>
        Prode
    </h1>

    <table class="table table-bordered w-auto">
        <thead class="table-primary">
        <tr>
            <th class="px-5" scope="col">Equipo</th>
            <th scope="col">L</th>
            <th scope="col">E</th>
            <th scope="col">V</th>
            <th class="px-5" scope="col">Equipo</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td class="px-5">EQUIPO A</td>
            <td>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="localCheckbox">
                    <label hidden="hidden" class="form-check-label" for="localCheckbox">
                        localCheckbox
                    </label>
                </div>
            </td>
            <td>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="drawCheckbox">
                    <label hidden="hidden" class="form-check-label" for="drawCheckbox">
                        drawCheckbox
                    </label>
                </div>
            </td>
            <td>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="visitorCheckbox">
                    <label hidden="hidden" class="form-check-label" for="visitorCheckbox">
                        visitorCheckbox
                    </label>
                </div>
            </td>
            <td class="px-5">EQUIPO B</td>
        </tr>
        </tbody>
    </table>
    <div>
        <button class="btn btn-primary">Resultado</button>
    </div>
</main>

<br/>
</body>
</html>