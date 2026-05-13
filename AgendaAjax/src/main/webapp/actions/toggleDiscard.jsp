<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:useBean id="calendarList" class="com.alesso.demo.CalendarListBean" scope="session"></jsp:useBean>

${calendarList.toggleDiscarted(param.id)}

<c:set var="calendar" value="${calendarList.getCalendarById(param.id)}"/>
<c:set var="calendarIndex" value="${calendarList.getCalendarIndexById(param.id)}"/>

<jsp:include page="/components/row.jsp">
    <jsp:param name="description" value="${calendar.description}"></jsp:param>
    <jsp:param name="discarted" value="${calendar.discarted}"></jsp:param>
    <jsp:param name="date" value="${calendar.date}"></jsp:param>
    <jsp:param name="emailToAdvise" value="${calendar.emailToAdvise}"></jsp:param>
    <jsp:param name="notificate" value="${calendar.notificate}"></jsp:param>
    <jsp:param name="notNotificate" value="${calendar.notNotificate}"></jsp:param>
    <jsp:param name="priority" value="${calendar.priority}"></jsp:param>
    <jsp:param name="id" value="${calendar.id}"></jsp:param>
    <jsp:param name="index" value="${calendarIndex}"></jsp:param>
</jsp:include>
