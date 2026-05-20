<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="postItList" class="com.alesso.postit.PostItListBean" scope="session"></jsp:useBean>

<c:if test="${!empty param.color}">
    <jsp:useBean id="postIt" class="com.alesso.postit.PostItBean"/>
    <jsp:setProperty name="postIt" property="*"/>
    ${postItList.addToList(postIt)}
</c:if>

<jsp:include page="/components/postIt.jsp">
    <jsp:param name="id" value="${postIt.id}"/>
</jsp:include>