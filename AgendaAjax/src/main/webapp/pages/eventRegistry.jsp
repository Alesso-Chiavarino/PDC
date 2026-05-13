<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>eventRegistry</title>
</head>
<body>

<jsp:useBean id="calendarList" class="com.alesso.demo.CalendarListBean" scope="session"></jsp:useBean>

<c:choose>
    <c:when test="${param.action eq 'toggle' and param.index ne null}">
        ${calendarList.toggleDiscarted(param.index)}
        <c:redirect url="/index.jsp"/>
    </c:when>

    <c:otherwise>
        <jsp:useBean id="calendar" class="com.alesso.demo.CalendarBean"/>
        <jsp:setProperty name="calendar" property="*"/>
        ${calendarList.addCalendar(calendar)}
        <c:redirect url="/index.jsp"/>
    </c:otherwise>
</c:choose>

</body>
</html>
