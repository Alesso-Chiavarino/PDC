<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:useBean id="lotteryNumberList" class="com.alesso.quini.LotteryNumberListBean" scope="session"/>

<c:set var="drawn" value="${lotteryNumberList.drawNextNumber()}"/>

<c:if test="${drawn ne null}">
    <jsp:include page="/components/numberLi.jsp">
        <jsp:param name="lotteryNumber" value="${drawn.lotteryNumber}"/>
    </jsp:include>
</c:if>
