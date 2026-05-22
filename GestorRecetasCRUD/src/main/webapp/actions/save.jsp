<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="recipeList" class="com.alesso.gestorrecetascrud.RecipeListBean" scope="session"></jsp:useBean>

<c:if test="${!empty param.name}">
    <jsp:useBean id="recipe" class="com.alesso.gestorrecetascrud.RecipeBean"/>
    <jsp:setProperty name="recipe" property="*"/>
    ${recipeList.addRecipe(recipe)}
</c:if>

<jsp:include page="/components/recipeRow.jsp">
    <jsp:param name="id" value="${recipe.id}"/>
</jsp:include>