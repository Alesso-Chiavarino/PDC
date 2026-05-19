<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:useBean id="categoryList" class="com.alesso.abmvideos.CategoryListBean" scope="session"></jsp:useBean>
<jsp:useBean id="videoList" class="com.alesso.abmvideos.VideoListBean" scope="session"></jsp:useBean>

<form class="w-50" id="videoForm" action="javascript:void(0)"
      method="post">
    <div class="mb-3">
        <label for="categorySelect" class="form-label">Categoría</label>
        <select required class="form-select" name="category" aria-label="categorySelect">
            <option value="" selected>Selecciona una categoria</option>
            <c:forEach var="ev" items="${categoryList.categoryListBean}" varStatus="st">
                <option ${param.category == ev.position ? 'selected' : ''} value="${ev.position}">${ev.name}</option>
            </c:forEach>
        </select>
    </div>
    <div class="mb-3">
        <label for="titleInput" class="form-label">Titulo</label>
        <input required value="${param.title}" type="text" name="title" class="form-control">
    </div>
    <div class="mb-3">
        <label for="authorInput" class="form-label">Autor</label>
        <input required value="${param.author}" type="text" name="author" class="form-control">
    </div>
    <div class="mb-3">
        <label for="urlInput" class="form-label">URL</label>
        <input required value="${param.url}" type="text" name="url" class="form-control">
    </div>
    <div>
        <button id="acceptBtn" type="submit" class="btn btn-primary">Aceptar</button>
        <button id="cancelBtn" type="submit" class="btn btn-warning">Cancelar</button>
    </div>
</form>
