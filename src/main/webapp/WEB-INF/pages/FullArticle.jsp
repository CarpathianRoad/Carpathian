<%-- 
    Document   : FullArticle
    Created on : Jan 11, 2015, 3:06:54 PM
    Author     : kiwi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<t:indexpage>
    <section>
        <div class="s-new markerPageTable">
            <div class="breadcrumbsMarker">
                <ul class="breadcrumbsUlMarker">
                    <li><a href="${Constants.URL}index">Main</a><div class="right_arrow"> </div></li>
                    <li><a href="${Constants.URL}article/news">News</a><div class="right_arrow"> </div></li>
                    <li><a>${article.title}</a></li>
                </ul>
                <div class="countriesFilterMarker">
                    <a class="selected_country" href="#">All countries</a>
                    <a href="#">Poland</a>
                    <a href="#">Hungary</a>
                    <a href="#">Romania</a>
                    <a href="#">Slovakia</a>
                    <a href="#">Ukraine</a>
                </div>
            </div>
            <div class="markerLeftDescr">
                <div class="markerPageTitle">${article.title}</div>
                <div class="markerPageUnderHeading">
                    <div class="markerPageDate">
                        ${article.date}
                    </div>
                    <div class="markerPageCountry">
                        <img src="${Constants.URL}img/mapControlsImageSelected.png"/>
                        ${article.country}
                    </div>
                </div>
                <div class="markerPageText">
                    ${article.textEN}
                </div>
                <c:if test="${fn:length(images[0])!=''}">
    <script type="text/javascript" src="${Constants.URL}js/article_gallery.js"></script>
                                    <div id="article_slider1_container" style="position: relative; top: 0px; left: 0px; width: 640px; height: 150px; overflow: hidden;">
                                        <div u="slides" style="cursor: move; position: absolute; left: 0px; top: 0px; width: 640px; height: 150px; overflow: hidden;">
                                            <c:forEach items="${images}" var="image" varStatus="loop">
                                                <div onclick="set_main_picture('${Constants.URL}${image}','${loop.index}')">
                                                    <div class="sliderHover">
                                                        <div class="imageHoverMarkerPage"></div><img u="image" src="${Constants.URL}${image}" style="height: 150px"/>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                        <span u="arrowleft" class="markerPageArrowLeft jssora03l" style="width: 50px; height: 95px; top: 28px; left: 20px;">
                                        </span>
                                        <span u="arrowright" class="markerPageArrowRight jssora03r" style="width: 50px; height: 95px; top: 28px; right: 20px">
                                        </span>
                                    </div>
                                    <div class="article_main_image">
                                        <img id="main_image" src="${Constants.URL}<c:out value="${images[0]}" />" />
                                        <div class="mainImageSliderLine">
                                            <div id="imageCount">1</div>/${fn:length(images)}
                                            &nbsp;&nbsp;
                                                ${article.title} Gallery
                                        </div>
                                    </div>
                </c:if>
                                    <div class="markerPageBottomLine"></div>
                                    <div class="markerPageSocial">
                                        <a target="_blank" class="shareLinks" id="share" href="http://www.facebook.com/sharer.php?u=http://bit.ly/FBshareArticle">
                                        <div class="fbMarker markerPageSocialHover">
                                            <div class="markerPageSocialIcon">
                                                <img src="${Constants.URL}img/fb_icon_marker.png"/>
                                            </div>
                                            <div class="markerPageSocialNumber">25</div>
                                        </div>
                                        </a>
                                        <a target="_blank" class="shareLinks" href="https://twitter.com/share">
                                        <div class="twMarker markerPageSocialHover">
                                            <div class="markerPageSocialIcon">
                                                <img src="${Constants.URL}img/tw_icon_marker.png">
                                            </div>
                                            <div class="markerPageSocialNumber">117</div>
                                        </div>
                                        </a>
                                    </div>
            </div>
            <div class="markerRightDescr">
                <div class="otherNewsHeading">OTHER NEWS</div>
                <c:forEach items="${articles}" var="item">
                    <div class="s-cellFullArticle slide">
                    <div class="s-block">
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

                        <img class="newsImageUnderline" src="${Constants.URL}img/newsLine.png" alt="image">
                        <div class="newsName"><a href="${Constants.URL}article/full/${item.id}">${item.title}</a></div>
                        <a href="${Constants.URL}article/full/${item.id}"><div class="newsText">${item.textEN}</div></a>
                    </div>
                </div>
                </c:forEach>
            </div>
        </div>
    </section>
</t:indexpage>