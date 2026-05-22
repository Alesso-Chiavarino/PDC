<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:useBean id="recipeList" class="com.alesso.gestorrecetascrud.RecipeListBean" scope="session"></jsp:useBean>

${recipeList.deleteRecipe(param.id)}

<jsp:include page="/components/recipeRow.jsp"></jsp:include>