<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:useBean id="recipeList" class="com.alesso.gestorrecetascrud.RecipeListBean" scope="session"></jsp:useBean>

<jsp:useBean id="recipe" class="com.alesso.gestorrecetascrud.RecipeBean"/>
<jsp:setProperty name="recipe" property="*"/>
<c:set var="updatedRecipe" value="${recipeList.updateRecipe(param.id, recipe)}"/>

<jsp:include page="/components/recipeRow.jsp">
    <jsp:param name="id" value="${updatedRecipe.id}"/>
</jsp:include>