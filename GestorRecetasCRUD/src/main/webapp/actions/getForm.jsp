<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:useBean id="recipeList" class="com.alesso.gestorrecetascrud.RecipeListBean" scope="session"></jsp:useBean>

<c:set var="filteredRecipe" value="${recipeList.getRecipeById(param.id)}"/>


<jsp:include page="/components/form.jsp">
    <jsp:param name="name" value="${filteredRecipe.name}"></jsp:param>
    <jsp:param name="id" value="${filteredRecipe.id}"></jsp:param>
    <jsp:param name="author" value="${filteredRecipe.author}"></jsp:param>
    <jsp:param name="category" value="${filteredRecipe.category}"></jsp:param>
    <jsp:param name="description" value="${filteredRecipe.description}"></jsp:param>
    <jsp:param name="cost" value="${filteredRecipe.cost}"></jsp:param>
    <jsp:param name="difficulty" value="${filteredRecipe.difficulty}"></jsp:param>
    <jsp:param name="gourmet" value="${filteredRecipe.gourmet}"></jsp:param>
    <jsp:param name="healthy" value="${filteredRecipe.healthy}"></jsp:param>
    <jsp:param name="image" value="${filteredRecipe.image}"></jsp:param>
    <jsp:param name="instructions" value="${filteredRecipe.instructions}"></jsp:param>
    <jsp:param name="lactoseFree" value="${filteredRecipe.lactoseFree}"></jsp:param>
    <jsp:param name="suitableCeliacs" value="${filteredRecipe.suitableCeliacs}"></jsp:param>
    <jsp:param name="publicationDate" value="${filteredRecipe.publicationDate}"></jsp:param>
    <jsp:param name="slices" value="${filteredRecipe.slices}"></jsp:param>
    <jsp:param name="time" value="${filteredRecipe.time}"></jsp:param>
    <jsp:param name="vegan" value="${filteredRecipe.vegan}"></jsp:param>
    <jsp:param name="spicy" value="${filteredRecipe.spicy}"></jsp:param>
    <jsp:param name="traditional" value="${filteredRecipe.traditional}"></jsp:param>
</jsp:include>
