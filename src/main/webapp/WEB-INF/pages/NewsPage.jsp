<%-- 
    Document   : NewsPage
    Created on : Jan 10, 2015, 7:57:32 PM
    Author     : kiwi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:indexpage>
    <script src="${Constants.URL}js/load_by_scroll.js"></script>
    <div class="s-new widthClass">
        <input type="hidden" id="page_type" value="news" />
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
            <c:forEach items="${newsList}" var="news">	
                    <div class="s-cell">
                        <div class="s-block newsHeight">
                            <div class="newsImage">
                                <a href="${Constants.URL}article/full/${news.id}">
                                    <div class="imageHover">
                                        <div class="imageHoverDate">
                                            ${news.date}
                                        </div>
                                        <div class="imageHoverCountry">
                                            <div class="newsCountryText">${news.country}</div><img src="${Constants.URL}img/newsImageHover.png">
                                        </div>
                                    </div>
                                    <img src="${Constants.URL}${news.image}" />
                                </a>
                            </div>

                            <img class="newsImageUnderline" src="${Constants.URL}img/newsLine.png">
                            <div class="news_text_box">
                                <div class="news_title"><a href="${Constants.URL}article/full/${news.id}">${news.title}</a></div>
                                <a href="${Constants.URL}article/full/${news.id}">
                                <div class="news_text">${news.textEN}</div></a>
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
    <div style="display:none;" id="pagination">
	<span class="all">Page 1 of 3</span>
	<span class="current">1</span>
	<a href="#" class="inactive">2</a>
	<a href="#" class="inactive">3</a>
    </div>
</t:indexpage>
 