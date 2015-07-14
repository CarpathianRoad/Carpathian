<%-- 
    Document   : NewsPage
    Created on : Jan 10, 2015, 7:57:32 PM
    Author     : kiwi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:indexpage>
    <div class="s-new widthClass">
        <div class="">
            <div class="countriesFilter">
                
            </div>
            <ul class="ch-grid">
                
            <c:forEach items="${contentList}" var="item">
                <li>
                    <a href="${Constants.URL}article/category/${item.id}"><div class="ch-item ch-img-1" style="background-image: url('${Constants.URL}${item.img}')">
                                <div class="ch-info">
                                        <h3>${item.titleEN}</h3>
                                        <p></p>
                                </div>
                        </div>
                        <h4>${item.titleEN}</h4>
                    </a>
                </li>
            </c:forEach>
</ul>
        <div class="s-clear"></div>
        </div>
    </div>
</t:indexpage>
 