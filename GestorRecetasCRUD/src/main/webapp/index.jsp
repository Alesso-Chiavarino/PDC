<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Gestor Recetas</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/5.3.8/js/bootstrap.bundle.min.js" defer></script>
    <script src="${pageContext.request.contextPath}/js/index.js" defer></script>
</head>
<body class="bg-light">
<jsp:useBean id="recipeList" class="com.alesso.gestorrecetascrud.RecipeListBean" scope="session"></jsp:useBean>

<main class="container py-4 py-md-5">
    <div class="d-flex flex-column flex-md-row justify-content-between align-items-md-center gap-3 mb-4">
        <div>
            <h1 class="h3 mb-1">Gestor de Recetas</h1>
            <p class="text-secondary mb-0">CRUD de recetas con formulario completo y listado editable.</p>
        </div>
        <div class="d-flex gap-2">
            <button type="button" class="btn btn-outline-secondary">Limpiar Formulario</button>
            <button type="button" class="btn btn-primary">Nueva Receta</button>
        </div>
    </div>

    <div class="row g-4">
        <section class="col-12 col-lg-5">
            <div class="card shadow-sm border-0">
                <div class="card-header bg-white border-0 pt-4 pb-0">
                    <h2 class="h5 mb-0">Formulario de Receta</h2>
                </div>
                <jsp:include page="components/form.jsp"/>
            </div>
        </section>

        <section class="col-12 col-lg-7">
            <div class="card shadow-sm border-0">
                <div class="card-header bg-white border-0 pt-4 pb-3">
                    <div class="d-flex flex-column flex-md-row gap-2 justify-content-between">
                        <h2 class="h5 mb-0">Listado de Recetas</h2>
                        <div class="d-flex gap-2">
                            <input type="text" class="form-control form-control-sm" placeholder="Buscar por nombre">
                            <select class="form-select form-select-sm">
                                <option selected>Todas las categorías</option>
                                <option>Entrada</option>
                                <option>Plato principal</option>
                                <option>Postre</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="card-body pt-0">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle">
                            <thead>
                            <tr>
                                <th>Receta</th>
                                <th>Categoría</th>
                                <th>Dificultad</th>
                                <th>Tiempo</th>
                                <th>Estado</th>
                                <th class="text-end">Acciones</th>
                            </tr>
                            </thead>
                            <tbody id="recipeList">
                            <c:forEach var="recipe" items="${recipeList.recipeList}">
                                <jsp:include page="/components/recipeRow.jsp">
                                    <jsp:param name="name" value="${recipe.name}"></jsp:param>
                                    <jsp:param name="id" value="${recipe.id}"></jsp:param>
                                    <jsp:param name="author" value="${recipe.author}"></jsp:param>
                                    <jsp:param name="category" value="${recipe.category}"></jsp:param>
                                    <jsp:param name="description" value="${recipe.description}"></jsp:param>
                                    <jsp:param name="cost" value="${recipe.cost}"></jsp:param>
                                    <jsp:param name="difficulty" value="${recipe.difficulty}"></jsp:param>
                                    <jsp:param name="gourmet" value="${recipe.gourmet}"></jsp:param>
                                    <jsp:param name="healthy" value="${recipe.healthy}"></jsp:param>
                                    <jsp:param name="image" value="${recipe.image}"></jsp:param>
                                    <jsp:param name="instructions" value="${recipe.instructions}"></jsp:param>
                                    <jsp:param name="lactoseFree" value="${recipe.lactoseFree}"></jsp:param>
                                    <jsp:param name="slices" value="${recipe.slices}"></jsp:param>
                                    <jsp:param name="time" value="${recipe.time}"></jsp:param>
                                    <jsp:param name="vegan" value="${recipe.vegan}"></jsp:param>
                                    <jsp:param name="traditional" value="${recipe.traditional}"></jsp:param>
                                    <jsp:param name="publicationDate" value="${recipe.publicationDate}"></jsp:param>
                                </jsp:include>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </section>
    </div>
</main>
</body>
</html>
