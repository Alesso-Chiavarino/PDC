<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:useBean id="randomNumberList" class="com.pdc.juegomayormenor.RandomNumberListBean" scope="session"/>
<jsp:useBean id="randomNumber" class="com.pdc.juegomayormenor.RandomNumberBean"/>
${randomNumber.setGeneratedRandomNumber()}
sis
<c:set var="isCurrentPredictionCorrect"
       value="${randomNumberList.addRandomNumberToList(randomNumber, param.predictionSelection)}"/>

<jsp:include page="/components/numberLi.jsp">
    <jsp:param name="randomNumber" value="${randomNumber.randomNumber}"/>
    <jsp:param name="isCurrentPredictionCorrect" value="${isCurrentPredictionCorrect}"/>
</jsp:include>
