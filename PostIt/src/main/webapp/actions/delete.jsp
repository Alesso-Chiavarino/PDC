<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:useBean id="postItList" class="com.alesso.postit.PostItListBean" scope="session"></jsp:useBean>

${postItList.deleteInList(param.id)}

<jsp:include page="/components/postIt.jsp"></jsp:include>