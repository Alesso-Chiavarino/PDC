<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<span>  <c:choose>
            <c:when test="${existe == 'S'}">
                OK
            </c:when>
            <c:otherwise>
                NO
            </c:otherwise>
        </c:choose>
</span>