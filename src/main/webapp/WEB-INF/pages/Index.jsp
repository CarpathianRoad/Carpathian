<%-- 
    Document   : index
    Created on : Jan 11, 2015, 12:20:44 PM
    Author     : kiwi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:indexpage>

                                <!-- !!!SLIDER!!! -->
               
	<script src="${Constants.URL}js/lemmon-slider.js"></script> 
	<div class="wrapSlider">
		<div id="slider1" class="slider">
			<ul style="height: 250px;">
                            <c:forEach items="${slides}" var="slide">
                                <li> <div class="sliderImage">
                                            <img u="image" src="${Constants.URL}${slide.image}" />
                                            <c:if test="${not empty slide.text}">
                                                <a href="${slide.url}" class="slider-image-link not-add-lan"><span class="slider-image-text">${slide.text}</span></a>
                                            </c:if>
                                 </div></li> 
                            </c:forEach>
                                
			</ul>
		</div>
		<div class="controls">
			<a href="#" style="display:none" class="prev-page"></a>
                        <div class="prev-slide"></div>
                        <div style="display:none" class="next-slide"></div>
			<div class="next-page"></div>
		</div>
	</div>
                    <!-- !!!SLIDER ENDS!!! -->
                    <!-- !!!MAP BLOCK!!! -->
                    
    <div class="s-new indexMapAllContainer">
        <div class="indexMap" id="mainMap">
            <div class="indexMapMenu">
                <ul id="nav">
                    <li id="allMenu">
                        <a href="${Constants.URL}map/allMap"><div class='mapButton' id='allMap'
                                                                  onmouseover="showMapHover('#all')">${titles.countryALL}</div></a>
                    </li>
                    <li id="ukraineMenu" class="mapMenuLeftMArgin">
                        <a href="${Constants.URL}map/Ukraine"><div class='mapButton' id='ukraineMap'
                                                                   onmouseover="showMapHover('#ukraine')">${titles.countryUA}</div></a>
                    </li>
                    <li id="slovakiaMenu" class="mapMenuLeftMArgin">
                        <a href="${Constants.URL}map/Slovakia"><div class='mapButton' id='slovakiaMap'
                                                                    onmouseover="showMapHover('#slovakia')">${titles.countrySK}</div></a>
                    </li>
                    <li id="hungaryMenu" class="mapMenuLeftMArgin">
                        <a href="${Constants.URL}map/Hungary"><div class='mapButton' id='hungaryMap'
                                                                   onmouseover="showMapHover('#hungary')">${titles.countryHU}</div></a>
                    </li>
                    <li id="romaniaMenu" class="mapMenuLeftMArgin">
                        <a href="${Constants.URL}map/Romania"><div class='mapButton' id='romaniaMap'
                                                                   onmouseover="showMapHover('#romania')">${titles.countryRO}</div></a>
                    </li>
                    <li id="polandMenu" class="mapMenuLeftMArgin">
                        <a href="${Constants.URL}map/Poland"><div class='mapButton' id='polandMap'
                                                                  onmouseover="showMapHover('#poland')">${titles.countryPL}</div></a>
                    </li>
                </ul>
            </div>
            <div class="indexMapContainer">
                <img src="${Constants.URL}img/main_map.png">
                <img id="allBorder" src="${Constants.URL}img/map_all.png">
                <img id="hungaryBorder" src="${Constants.URL}img/map_hungary.png">
                <img id="polandBorder" src="${Constants.URL}img/map_poland.png">
                <img id="romaniaBorder" src="${Constants.URL}img/map_romania.png">
                <img id="slovakiaBorder" src="${Constants.URL}img/map_slovakia.png">
                <img id="ukraineBorder" src="${Constants.URL}img/map_ukraine.png">
                <img src="${Constants.URL}img/mapHoverImage.png" usemap="#mainMap">
            </div>
        </div>
    </div>

    <map name="mainMap">
        <area href="${Constants.URL}${lan}/map/Hungary" shape="poly" onmouseover="showMapHover('#hungary')"
              coords="456,127,468,136,488,138,503,151,525,147,550,166,521,181,504,207,497,231,485,255,469,282,426,295,392,290,368,308,329,318,304,317,283,294,259,272,238,248,253,210,277,181,300,191,326,196,351,195,374,183,370,173,404,163,422,165,438,156"/>
        <area href="${Constants.URL}${lan}/map/Romania" shape="poly"  onmouseover="showMapHover('#romania')"
              coords="577,170,558,184,531,200,512,231,498,261,488,290,479,306,447,312,459,330,471,351,494,363,512,406,846,408,852,378,813,357,814,299,820,282,817,259,806,248,808,232,789,218,778,199,776,185,761,153,744,149,733,162,722,173,690,178,682,188,664,190,650,187,637,183,624,177"/>
        <area href="${Constants.URL}${lan}/map/Ukraine" shape="poly"  onmouseover="showMapHover('#ukraine')"
              coords="546,95,537,132,561,152,580,150,598,159,614,163,633,158,658,164,682,159,717,151,738,129,747,118,796,111,840,129,869,145,881,169,883,194,906,214,909,239,929,266,979,262,979,3,597,1,559,42,560,70,574,86,566,99"/>
        <area href="${Constants.URL}${lan}/map/Slovakia" shape="poly"  onmouseover="showMapHover('#slovakia')"
              coords="533,89,527,108,515,118,512,132,498,123,484,119,468,119,443,118,436,122,426,137,400,143,388,144,378,150,360,156,350,161,348,174,306,177,285,153,271,139,273,117,276,108,313,105,333,79,350,61,370,71,389,66,408,84,439,77,469,80,479,69,506,73,513,87"/>
        <area href="${Constants.URL}${lan}/map/Poland" shape="poly"  onmouseover="showMapHover('#poland')"
              coords="580,0,321,0,310,12,332,14,353,21,364,39,371,53,388,38,405,41,413,60,453,54,481,50,508,56,526,70,551,86,543,70,538,56,542,40"/>
    </map>
            
                    <!-- !!!MAP ENDS!!! -->
                    <!-- !!!NEWS BLOCK!!! -->
                    
    <div class="s-new widthClass">
        <div class="s-newsText">
            <a href="${Constants.URL}map">MARKERS</a>
        </div>
        <div class="s-clear"></div>
        <div class="slider1">
            <c:forEach items="${points}" var="markers">
                <div class="s-cell slide">
                    <div class="s-block">
                        <div class="newsImage" onmouseover="" onmouseout="">
                            <a href="${Constants.URL}map/markers/${markers.id}">
                                <div class="imageHover">
                                    <div class="imageHoverDate">
                                        ${markers.date}
                                    </div>
                                    <div class="imageHoverCountry">
                                        <div class="newsCountryText">${markers.country}</div><img src="${Constants.URL}img/newsImageHover.png">
                                    </div>
                                </div>
                                <img src="${Constants.URL}${markers.image}" alt="image"/>
                            </a>
                        </div>

                        <img class="newsImageUnderline" src="${Constants.URL}img/newsLine.png">
                        <div class="newsName"><a href="${Constants.URL}map/markers/${markers.id}">${markers.title}</a></div>
                        <a href="${Constants.URL}map/markers/${markers.id}"><div class="newsText">${markers.textEN}</div></a>
                    </div>
                </div>
            </c:forEach>
        </div>

        <div class="s-clear"></div>
        <div class="s-newsText">
            <a href="${Constants.URL}article/news">NEWS</a>
        </div>
        <div class="slider2">
            <c:forEach items="${content}" var="item">
                <div class="s-cell slide">
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
        <div class="s-clear"></div>
    </div>
        
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
        </style>
        
        
    <script>
        
        setInterval(function () {$( '#slider1' ).trigger( 'nextSlide' );}, 5000);
        
        var counter = 0;
        var mapSlider;
        var countries = ['all','poland','hungary','romania','slovakia','ukraine'];
        jQuery(document).ready(function ($) {
            $('#hungaryBorder').hide();
            $('#polandBorder').hide();
            $('#romaniaBorder').hide();
            $('#slovakiaBorder').hide();
            $('#ukraineBorder').hide();
            $("#allMap").addClass( "buttonBorderClass" );
            
        
            window.onload = function(){

		// slider 1
		$( '#slider1' ).lemmonSlider({
			infinite: true
		});

            }
            
                if((window.outerWidth>1040)&(window.innerWidth>1040)){
                    $('.slider1').bxSlider({
                        auto: false,
                        slideWidth: 300,
                        minSlides: 1,
                        maxSlides: 3,
                        slideMargin: 40
                    });
                    $('.slider2').bxSlider({
                        auto: false,
                        slideWidth: 300,
                        minSlides: 1,
                        maxSlides: 3,
                        slideMargin: 40
                    });
                }else if((window.outerWidth<=1040)&&(window.outerWidth>680)&(window.innerWidth>680)&(window.innerWidth<1040)){
                    $('.slider1').bxSlider({
                        auto: false,
                        slideWidth: 300,
                        minSlides: 2,
                        maxSlides: 2,
                        slideMargin: 40
                    });
                    $('.slider2').bxSlider({
                        auto: false,
                        slideWidth: 300,
                        minSlides: 2,
                        maxSlides: 2,
                        slideMargin: 40
                    });
                }else{
                    $('.slider1').bxSlider({
                        auto: false,
                        slideWidth: 300,
                        minSlides: 1,
                        maxSlides: 1,
                        slideMargin: 40
                    });
                    $('.slider2').bxSlider({
                        auto: false,
                        slideWidth: 300,
                        minSlides: 1,
                        maxSlides: 1,
                        slideMargin: 40
                    });
                }
            
            
        });
    </script>
</t:indexpage>