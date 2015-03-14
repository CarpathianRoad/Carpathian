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
            <div class="breadcrumbs">
                <ul class="breadcrumbs_ul">
                    <li><a href="${Constants.URL}index">Main</a><div class="right_arrow"> </div></li>
                    
                    <li><a href="#">News</a></li>
                </ul>
            </div>
            <div class="countriesFilter">
                <a class="selected_country" href="#">All countries</a>
                <a href="#">Poland</a>
                <a href="#">Hungary</a>
                <a href="#">Romania</a>
                <a href="#">Slovakia</a>
                <a href="#">Ukraine</a>
            </div>
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
        <div class="s-clear"></div>
        </div>
    </div>
				<div style="display:none;" id="pagination">
					<span class="all">Page 1 of 3</span>
					<span class="current">1</span>
					<a href="#" class="inactive">2</a>
					<a href="#" class="inactive">3</a>
				</div>
</t:indexpage>
 