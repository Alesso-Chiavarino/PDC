<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:useBean id="videoList" class="com.alesso.abmvideos.VideoListBean" scope="session"></jsp:useBean>

<c:set var="filteredVideo" value="${videoList.getVideoById(param.id)}"/>


<jsp:include page="/components/form.jsp">
    <jsp:param name="url" value="${filteredVideo.url}"></jsp:param>
    <jsp:param name="title" value="${filteredVideo.title}"></jsp:param>
    <jsp:param name="category" value="${filteredVideo.category}"></jsp:param>
    <jsp:param name="author" value="${filteredVideo.author}"></jsp:param>
    <jsp:param name="id" value="${filteredVideo.id}"></jsp:param>
</jsp:include>