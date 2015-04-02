<%-- 
    Document   : CategoryArticles
    Created on : Mar 27, 2015, 11:52:35 AM
    Author     : Kiwi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:indexpage>
    <script src="${Constants.URL}js/load_by_scroll.js"></script>
    <div class="s-new widthClass">
        <input type="hidden" id="page_type" value="category" />
        <input type="hidden" id="menu_id" value="${menu_id}" />
        <input type="hidden" id="last_item" value="9" />
        <input type="hidden" id="contstants" value="${Constants.URL}" />
        <input type="hidden" id="lan" value="${lan}" />
        <input type="hidden" id="count" value="${count}" />
        <div class="s-new">
            <div class="countriesFilter countriesFilterRoute">
                <input type="hidden" id="selected_country" value="all"/>
                <a id="all" onclick="change_country('all');" class="selected_country" >All countries</a>
                <a id="ukraine" onclick="change_country('ukraine');" >Ukraine</a>
                <a id="poland" onclick="change_country('poland');" >Poland</a>
                <a id="hungary" onclick="change_country('hungary');" >Hungary</a>
                <a id="romania" onclick="change_country('romania');" >Romania</a>
                <a id="slovakia" onclick="change_country('slovakia');" >Slovakia</a>
            </div>
        </div>
        <div class="all_news">
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
        </div>
        <div class="s-clear"></div>
        <div class="loading_block">
            <img src="${Constants.URL}img/status.gif" />
        </div>
    </div>
</t:indexpage>
