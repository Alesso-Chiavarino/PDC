<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:useBean id="postItList" class="com.alesso.postit.PostItListBean" scope="session"></jsp:useBean>

<c:set var="updatedPostIt" value="${postItList.updateInList(param.id, param.content)}"/>

<jsp:include page="/components/postIt.jsp">
    <jsp:param name="id" value="${updatedPostIt.id}"></jsp:param>
    <jsp:param name="color" value="${updatedPostIt.color}"></jsp:param>
    <jsp:param name="content" value="${updatedPostIt.content}"></jsp:param>
</jsp:include>