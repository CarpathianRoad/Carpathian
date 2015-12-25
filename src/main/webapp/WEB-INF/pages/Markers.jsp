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
	<script src="${Constants.URL}js/lemmon-slider.js"></script> 
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <style>
        #myIframe {
            width: 100%;
            height: 100%;
            border: 0;
        }
        .ui-dialog-titlebar {display:none}
    </style>
    <script>
        $(document).ready(function() {
            $(".fancybox").fancybox({
		openEffect	: 'none',
		closeEffect	: 'none'
            });
        });
    </script> 
    <script>
        //if("${article.avatar}"!=""){
          //  $("meta[property='og\\:image']").attr("content", "http://www.carpathianroad.com/${marker.avatar}");
        //}else if("${images[0]}"!=""){
        //   $("meta[property='og\\:image']").attr("content", "http://www.carpathianroad.com/${images[0]}");
        //}else{
         //   $("meta[property='og\\:image']").attr("content", "http://www.carpathianroad.com/img/content/NEWS/Anons/fest.jpg");
       // }
       // console.log($("meta[property='og\\:image']").attr("content"));
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
                            <a class="show-map-block" href="${Constants.URL}map/${marker.id}">
                        <div>
                            <img src="${Constants.URL}img/show_map.png"/>
                        </div>
                    </a>
                    <div class="downloadRouteFile">&nbsp;</div>
                </div>
                <div class="markerPageText">
                    ${marker.textEN}
                </div>
                <c:if test="${marker.panorama !=''}">
                <div class="markerPageBottomLine" style="display:none"></div>
                <div class="panorama">
                    <a class="panorama-link"
                       onmouseover="$(this).find('img').attr('src','${Constants.URL}img/newTabIcon.png');" 
                       onmouseout="$(this).find('img').attr('src','${Constants.URL}img/new_tab1.png');">
                        <strong>Panorama <img class="new-tab-icon" src="${Constants.URL}img/new_tab1.png"/></strong>
                    </a>
                    <div id="dialog">
                                    <iframe id="myIframe" src=""></iframe>
                                </div>
                </div>
                </c:if>
                <c:if test="${images[0]!=''}">
                    <div class="wrapSlider">
                            <div id="slider1" class="slider">
                                    <ul style="height: 150px;">
                                        <c:forEach items="${images}" var="image" varStatus="loop">
                                            <li style="cursor:pointer">
                                                <div onclick="set_main_picture('${Constants.URL}${image}','${loop.index}')">
                                                    <div class="sliderHover">
                                                    <!--<div class="imageHoverMarkerPage"></div>-->
                                                        <img rel="gallery1" u="image" src="${Constants.URL}${image}" style="height: 150px"/>
                                                    <!--</div>-->
                                                </div>
                                            </li>
                                        </c:forEach>       
                                    </ul>
                            </div>
                            <div class="controls">
                                    <a href="#" class="prev-page"></a>
                                    <div class="prev-slide"></div>
                                    <div style="display:none" class="next-slide"></div>
                                    <div class="next-page"></div>
                            </div>
                    </div>
                                    
                                    <div class="article_main_image">
                                        <a class="fancybox not-add-lan" id="mainPictureFancybox" rel="gallery1" href="${Constants.URL}<c:out value="${images[0]}" />">
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
                                                ${marker.title} Gallery
                                        </div>
                                    </div>
                                    <div class="markerPageBottomLine" style="display:none"></div>
                </c:if>
                                    
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
                        //$('.fancybox').css('display', 'inline-block');
                    }, 100);
                });
            }
        });
        $(document).ready(function () {
            initDialog();
            window.onload = function(){
                $( '#slider1' ).lemmonSlider({center:false});
            }
        });
        function initDialog(){
            
           $("#dialog").dialog({
            autoOpen: false,
            modal: true,
            height: 600,
            width: 800,
            position: { my: "center center", at: "center center", of: $("section") },
            open: function(ev, ui){
                     $('#myIframe').attr('src','${Constants.URL}panorama/${marker.id}');
                  },
                          close: function( event, ui ) {
                              $("#myIframe").contents().find("html body").remove();
                          }
        });  
        
           $(".panorama-link").click(function(){
                    $('#dialog').dialog('open');
           }); 
        }
        function closeDialog(){
            $( "#dialog" ).dialog( "close" );
        }
    </script>
        <style>
        .prev-slide{
            background: url(${Constants.URL}img/arrow_left.png) center center no-repeat;
            width: 48px;
            height: 90px;
            cursor: pointer;
            position: absolute;
            left: 50;
        }
        .next-slide,.next-page{
            background: url(${Constants.URL}img/arrow_right.png) center center no-repeat;
            width: 48px;
            height: 90px;
            cursor: pointer;
            position: absolute;
            right: 50;
        }
        .prev-slide:hover {
            background: url(${Constants.URL}img/arrow_left_hover.png) center center no-repeat;
        }
        .next-slide:hover ,.next-page:hover{
            background: url(${Constants.URL}img/arrow_right_hover.png) center center no-repeat;
        }
        .wrapSlider { width:100%; height: 150 !important; margin-top: 0px;}
	body div.slider    { overflow:hidden; position:relative; width:100%; height:150px !important; }
	body div.slider ul { margin:0; padding:0; height:150px; }
	body div.slider li { float:left; list-style:none; margin:0; }
	body div.slider li { text-align:center; line-height:160px; font-size:25px; }
        .slider img{
            height: 150px;
        }
        .controls{
            position: relative;
            margin-top: -120px;
        }
        </style>
</t:indexpage>