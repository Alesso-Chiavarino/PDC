<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="lotteryNumberList" class="com.alesso.quini.LotteryNumberListBean" scope="session"/>
${lotteryNumberList.resetSorteo()}
