<%-- 
    Document   : CategoryArticles
    Created on : Mar 27, 2015, 11:52:35 AM
    Author     : Kiwi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:indexpage>
    <div class="s-new widthClass">
        <div class="">
            <div class="countriesFilter">
                <a class="selected_country" href="#">All countries</a>
                <a href="#">Poland</a>
                <a href="#">Hungary</a>
                <a href="#">Romania</a>
                <a href="#">Slovakia</a>
                <a href="#">Ukraine</a>
            </div>
            <c:forEach items="${contentList}" var="artilcle">	
                    <div class="s-cell">
                        <div class="s-block newsHeight">
                            <div class="newsImage">
                                <a href="${Constants.URL}article/full/${artilcle.id}">
                                    <div class="imageHover">
                                        <div class="imageHoverDate">
                                            ${artilcle.date}
                                        </div>
                                        <div class="imageHoverCountry">
                                            <div class="newsCountryText">${artilcle.country}</div><img src="${Constants.URL}img/newsImageHover.png">
                                        </div>
                                    </div>
                                    <img src="${Constants.URL}${artilcle.image}" />
                                </a>
                            </div>

                            <img class="newsImageUnderline" src="${Constants.URL}img/newsLine.png">
                            <div class="news_text_box">
                                <div class="news_title"><a href="${Constants.URL}article/full/${artilcle.id}">${artilcle.title}</a></div>
                                <a href="${Constants.URL}article/full/${artilcle.id}">
                                <div class="news_text">${artilcle.textEN}</div></a>
                            </div>
                        </div>
                    </div>        
            </c:forEach>
        <div class="s-clear"></div>
        </div>
    </div>
</t:indexpage>
