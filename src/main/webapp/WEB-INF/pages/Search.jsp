<%-- 
    Document   : Search
    Created on : Apr 20, 2015, 6:43:47 PM
    Author     : kiwi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:indexpage>
    <div class="s-new widthClass">
        
            <div class="all_news">
            <c:forEach items="${resultList}" var="item">	
                    <div class="s-cell">
                        <div class="s-block newsHeight">
                            <div class="newsImage">
                                <a href="${Constants.URL}article/full/${item.id}">
                                    <div class="imageHover">
                                        <div class="imageHoverDate">
                                            ${item.date}
                                        </div>
                                        <div class="imageHoverCountry">
                                            <div class="newsCountryText">${item.country}</div><img src="${Constants.URL}img/newsImageHover.png">
                                        </div>
                                    </div>
                                    <img src="${Constants.URL}${item.image}" />
                                </a>
                            </div>

                            <img class="newsImageUnderline" src="${Constants.URL}img/newsLine.png">
                            <div class="news_text_box">
                                <div class="news_title"><a href="${Constants.URL}article/full/${item.id}">${item.title}</a></div>
                                <a href="${Constants.URL}article/full/${item.id}">
                                <div class="news_text">${item.textEN}</div></a>
                            </div>
                        </div>
                    </div>        
            </c:forEach>
            </div>        
        <div class="s-clear"></div>
    </div>
</t:indexpage>
 
