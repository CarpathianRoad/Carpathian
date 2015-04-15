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
    <c:if test="${article.type == 3}">
        <style>
            .markerLeftDescr {
                width: 980px;
            }
            .markerPageCountry {
                display: none;
            }
            .markerPageDate {
                width: 100%;
                margin-bottom: 15px;
            }
            .markerRightDescr {
                display: none;
            }
            .twitter {
                left:8%;
            }
        </style>
    </c:if>
    <meta name="title" content="${article.title}">
    <script>
        $(document).ready(function() {
            $(".fancybox").fancybox({
		openEffect	: 'none',
		closeEffect	: 'none'
            });
        });
    </script>    
    <script src="${Constants.URL}js/social_networks.js"></script>
    <section>
        <div class="s-new markerPageTable">
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
                <c:if test="${images[0]!=''}">
    <script type="text/javascript" src="${Constants.URL}js/article_gallery.js"></script>
                                    <div id="article_slider1_container" style="position: relative; top: 0px; left: 0px; width: 640px; height: 150px; overflow: hidden;">
                                        <div u="slides" style="cursor: move; position: absolute; left: 0px; top: 0px; width: 640px; height: 150px; overflow: hidden;">
                                            <c:forEach items="${images}" var="image" varStatus="loop">
                                                <div onclick="set_main_picture('${Constants.URL}${image}','${loop.index}')">
                                                    <div class="sliderHover">
                                                        <div class="imageHoverMarkerPage"></div>
                                                        <img rel="gallery1" u="image" src="${Constants.URL}${image}" style="height: 150px"/>
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
                                        <a class="fancybox not-add-lan" rel="gallery1" href="${Constants.URL}<c:out value="${images[0]}" />">
                                            <img id="main_image" src="${Constants.URL}<c:out value="${images[0]}" />" />
                                        </a>
                                        <div style="display:none" >
                                            <c:forEach items="${images}" var="image" varStatus="loop">
                                                <c:if test="${image != images[0]}">
                                                     <a class="fancybox not-add-lan" rel="gallery1" href="${Constants.URL}${image}" />">
                                                    <img id="main_image" src="${Constants.URL}${image}" />" />
                                                </a>
                                                </c:if>
                                            </c:forEach>
                                        </div>
                                        <div class="mainImageSliderLine">
                                            <div id="imageCount">1</div>/${fn:length(images)}
                                            &nbsp;&nbsp;
                                                ${article.title} Gallery
                                        </div>
                                    </div>
                </c:if>
                                    
                                   <div class="social_networks">
                                        <div class="face">
                                            <a name="fb_share" type="button"></a> 
                                            <script src="https://www.facebook.com/connect.php/js/FB.Share" type="text/javascript"></script>
                                        </div>
                                        <div class="twitter">
                                            <a href="https://twitter.com/share" class="twitter-share-button">Tweet</a>
                                        </div>
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