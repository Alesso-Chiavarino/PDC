<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>eventRegistry</title>
</head>
<body>

<jsp:useBean id="calendarList" class="com.alesso.demo.CalendarListBean" scope="session"></jsp:useBean>

<c:if test="${!empty param}">
    <jsp:useBean id="calendar" class="com.alesso.demo.CalendarBean">
        <jsp:setProperty name="calendar" property="*"></jsp:setProperty>
    </jsp:useBean>
    ${calendarList.addCalendar(calendar)}

    <jsp:forward page="/index.jsp" />
</c:if>

</body>
</html>
