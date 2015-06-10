<%-- 
    Document   : Partners
    Created on : Jan 13, 2015, 9:59:12 PM
    Author     : kiwi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<t:indexpage>
    <script>
        $(document).ready(function() {
            $(".fancybox").fancybox({
		openEffect	: 'none',
		closeEffect	: 'none'
            });
        });
    </script> 
    <script>
        if("${article.avatar}"!=""){
            $("meta[property='og\\:image']").attr("content", "http://www.carpathianroad.com/${marker.avatar}");
        }else if("${images[0]}"!=""){
            $("meta[property='og\\:image']").attr("content", "http://www.carpathianroad.com/${images[0]}");
        }else{
            $("meta[property='og\\:image']").attr("content", "http://www.carpathianroad.com/img/content/NEWS/Anons/fest.jpg");
        }
        console.log($("meta[property='og\\:image']").attr("content"));
        $('#fbShare').attr('data-href',document.URL);
    
  window.fbAsyncInit = function() {
    FB.init({
      appId      : '904133936315428',
      xfbml      : true,
      cookie: true,
      version    : 'v2.3'
    });
  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "//connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));
   FB.ui({
  method: 'feed',
  link: 'https://developers.facebook.com/docs/',
  caption: 'An example caption',
}, function(response){});
</script>
    <script src="${Constants.URL}js/social_networks.js"></script>
    <section>
        <div class="s-new markerPageTable">
            <div class="markerLeftDescr">
                <div class="markerPageTitle">${marker.title}</div>
                <div class="markerPageUnderHeading">
                    <div class="markerPageDate">
                        ${marker.date}
                    </div>
                    <a href="${Constants.URL}map/${marker.id}">
                        <div class="markerPageCountry">
                            <img src="${Constants.URL}img/mapControlsImageSelected.png"/>
                            ${marker.country}
                        </div>
                    </a>
                    <div class="downloadRouteFile">&nbsp;</div>
                </div>
                <div class="markerPageText">
                    ${marker.textEN}
                </div>
                <div class="markerPageBottomLine"></div>
                <div class="panorama">
                    <a target="_blank" href="${Constants.URL}panorama/${panorama}">
                        <strong>Panorama <img class="new-tab-icon" src="${Constants.URL}img/newTabIcon.png"/></strong>
                    </a>
                </div>
                <c:if test="${images[0]!=''}">
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
                                                ${marker.title} Gallery
                                        </div>
                                    </div>
                </c:if>
                                    <div class="markerPageBottomLine"></div>
                                    
                                   <div class="social_networks">
                                        <div class="face">
                                            <div id="fb-post" class="fb-share-button" data-href="" data-layout="button" data-width="500"></div>
                                        </div>
                                        <div class="twitter">
                                            <a href="https://twitter.com/share" class="twitter-share-button">Tweet</a>
                                        </div>
                                    </div>
            </div>
            <div class="markerRightDescr">
                <div class="otherNewsHeading">OTHER MARKERS</div>
                <c:forEach items="${articles}" var="item">
                    <div class="s-cellFullArticle slide">
                    <div class="s-block">
                        <div class="newsImage">
                            <a href="${Constants.URL}map/markers/${item.id}">
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
                        <div class="newsName"><a href="${Constants.URL}map/markers/${item.id}">${item.title}</a></div>
                        <a href="${Constants.URL}map/markers/${item.id}"><div class="newsText">${item.textEN}</div></a>
                    </div>
                </div>
                </c:forEach>
            </div>
        </div>
    </section>
    <script>
        $(document).keyup(function(e) {
            if (e.keyCode == 27) { 
                $.each($('.fancybox'), function() {
                    setTimeout(function(){ 
                        $('.fancybox').css('display', 'inline-block');
                    }, 100);
                });
            }
        });
    </script>
</t:indexpage>