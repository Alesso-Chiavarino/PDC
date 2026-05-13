<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="videoList" class="com.alesso.abmvideos.VideoListBean" scope="session"></jsp:useBean>

<c:if test="${!empty param.title}">
    <jsp:useBean id="video" class="com.alesso.abmvideos.VideoBean"/>
    <jsp:setProperty name="video" property="*"/>
    ${videoList.addToList(video)}
</c:if>

<jsp:include page="/components/row.jsp">
    <jsp:param name="id" value="${video.id}"/>
</jsp:include>