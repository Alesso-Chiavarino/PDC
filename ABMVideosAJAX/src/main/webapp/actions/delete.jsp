<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:useBean id="videoList" class="com.alesso.abmvideos.VideoListBean" scope="session"></jsp:useBean>

${videoList.deleteInList(param.id)}

<jsp:include page="/components/row.jsp"></jsp:include>