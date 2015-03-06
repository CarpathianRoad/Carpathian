<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<strong>${msg}</strong>
<c:choose>
    <c:when test="${not valid}">
       <form action="/Carpath/test/setsession.do" method="POST" name="auth">
    <input type="text" name="login" />
    <input type="password" name="passwd">
    <input type="submit" />
</form>
    </c:when>
    <c:otherwise>
        <a href="/Carpath/test/logout">Logout</a>
    </c:otherwise>
</c:choose>
