<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World 2</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/js/bootstrap.bundle.min.js" defer></script>
    <script src="${pageContext.request.contextPath}/js/index.js" defer></script>
</head>
<body>

<jsp:useBean id="categoryList" class="com.alesso.abmvideos.CategoryListBean" scope="session"></jsp:useBean>
<jsp:useBean id="videoList" class="com.alesso.abmvideos.VideoListBean" scope="session"></jsp:useBean>

<main class="container mx-auto my-5">
    <h1>
        Video
    </h1>
    <section class="d-flex flex-row gap-5">
        <form class="w-50" id="videoForm" action="${pageContext.request.contextPath}/index.jsp"
              method="post">
            <div class="mb-3">
                <label for="categorySelect" class="form-label">Categoría</label>
                <select required class="form-select" id="categorySelect" name="category" aria-label="categorySelect">
                    <option value="" selected>Selecciona una categoria</option>
                    <c:forEach var="ev" items="${categoryList.categoryListBean}" varStatus="st">
                        <option value="${ev.position}">${ev.name}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="mb-3">
                <label for="titleInput" class="form-label">Titulo</label>
                <input required type="text" name="title" class="form-control" id="titleInput">
            </div>
            <div class="mb-3">
                <label for="authorInput" class="form-label">Autor</label>
                <input required type="text" name="author" class="form-control" id="authorInput">
            </div>
            <div class="mb-3">
                <label for="urlInput" class="form-label">URL</label>
                <input required type="text" name="url" class="form-control" id="urlInput">
            </div>
            <div>
                <input type="hidden" id="inputIdSetter" name="id" value="">
                <input type="hidden" id="inputActionHandler" name="action" value="">
                <button id="acceptBtn" type="submit" class="btn btn-primary">Aceptar</button>
                <button id="cancelBtn" type="submit" class="btn btn-warning">Cancelar</button>
            </div>
        </form>
        <table class="table w-50 table-striped table-light">
            <thead>
            <tr>
                <th scope="col">Video</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="vid" items="${videoList.videoListBean}">
                <jsp:include page="/components/row.jsp">
                    <jsp:param name="url" value="${vid.url}"></jsp:param>
                    <jsp:param name="title" value="${vid.title}"></jsp:param>
                    <jsp:param name="category" value="${vid.category}"></jsp:param>
                    <jsp:param name="author" value="${vid.author}"></jsp:param>
                    <jsp:param name="id" value="${vid.id}"></jsp:param>
                </jsp:include>
            </c:forEach>
            <tr id="videoListRow">

            </tr>

            </tbody>
        </table>
    </section>
</main>


<!-- Button trigger modal -->


<!-- Modal -->
<div id="videoDetailModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-bs-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <div class="modal-body">
                <iframe id="iframe"
                        src=""
                        title="YouTube video player" frameborder="0"
                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                        referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
            </div>
        </div>
    </div>
</div>
</body>
</html>