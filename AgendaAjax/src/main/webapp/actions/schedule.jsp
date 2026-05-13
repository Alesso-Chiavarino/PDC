<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:useBean id="calendarList" class="com.alesso.demo.CalendarListBean" scope="session"></jsp:useBean>

<jsp:useBean id="calendar" class="com.alesso.demo.CalendarBean"/>
<jsp:setProperty name="calendar" property="*"/>
${calendarList.addCalendar(calendar)}

<c:set var="lastCalendar" value="${calendarList.lastCalendar}"/>
<c:set var="lastCalendarIndex" value="${calendarList.lastCalendarIndex}"/>

<jsp:include page="/components/row.jsp">
    <jsp:param name="description" value="${lastCalendar.description}"></jsp:param>
    <jsp:param name="discarted" value="${lastCalendar.discarted}"></jsp:param>
    <jsp:param name="date" value="${lastCalendar.date}"></jsp:param>
    <jsp:param name="emailToAdvise" value="${lastCalendar.emailToAdvise}"></jsp:param>
    <jsp:param name="notificate" value="${lastCalendar.notificate}"></jsp:param>
    <jsp:param name="notNotificate" value="${lastCalendar.notNotificate}"></jsp:param>
    <jsp:param name="priority" value="${lastCalendar.priority}"></jsp:param>
    <jsp:param name="id" value="${lastCalendar.id}"></jsp:param>
    <jsp:param name="index" value="${lastCalendarIndex}"></jsp:param>
</jsp:include>
