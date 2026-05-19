<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:useBean id="videoList" class="com.alesso.abmvideos.VideoListBean" scope="session"></jsp:useBean>

<jsp:useBean id="video" class="com.alesso.abmvideos.VideoBean"/>
<jsp:setProperty name="video" property="*"/>
${videoList.deleteInList(video.id)}

<jsp:include page="/components/row.jsp"></jsp:include>