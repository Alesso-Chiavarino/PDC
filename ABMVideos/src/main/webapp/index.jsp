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


<c:if test="${!empty param.title || !empty param.action}">
    <jsp:useBean id="video" class="com.alesso.abmvideos.VideoBean"/>
    <jsp:setProperty name="video" property="*"/>
    <c:choose>
        <c:when test="${param.action eq 'delete'}">
            ${videoList.deleteInList(video.id)}
        </c:when>
        <c:when test="${!empty param.id && param.action eq 'edit'}">
            ${videoList.updateInList(video)}
        </c:when>
        <c:otherwise>
            ${videoList.addToList(video)}
        </c:otherwise>
    </c:choose>
</c:if>

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
            <c:forEach var="vid" items="${videoList.videoListBean}" varStatus="st">
                <tr>
                    <td>
                        <div class="d-flex justify-content-between p-2">
                            <div>
                                <h3 class="text-primary">${vid.title}</h3>
                                <span>${vid.author}</span>
                            </div>
                            <div>
                                <button id="editBtn" type="button" class="btn btn-primary"
                                        onclick="editVideo('${vid.id}', '${vid.title}', '${vid.author}', '${vid.category}', '${vid.url}')">
                                    Editar
                                </button>
                                <button id="deleteBtn" onclick="deleteVideo('${vid.id}')" class="btn btn-success
                                ">Eliminar
                                </button>
                            </div>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </section>
</main>


</body>
</html>