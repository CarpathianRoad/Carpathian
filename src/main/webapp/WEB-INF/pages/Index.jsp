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
                
    <div style="min-height: 50px;margin-top: -30px">
        <div id="slider1_container" style="display: none; position: relative; margin: 0 auto;
            top: 0px; left: 0px; width: 1300px; height: 500px; overflow: hidden;">
            <div u="loading" style="position: absolute; top: 0px; left: 0px;">
                <div style="filter: alpha(opacity=70); opacity: 0.7; position: absolute; display: block;
                    top: 0px; left: 0px; width: 100%; height: 100%;">
                </div>
                <div style="position: absolute; display: block; background: url(${Constants.URL}img/loading.gif) no-repeat center center;
                    top: 0px; left: 0px; width: 100%; height: 100%;">
                </div>
            </div>
            <div u="slides" style="cursor: move; position: absolute; left: 0px; top: 0px; width: 1300px; height: 500px; overflow: hidden;">
                <div>
                    <img u="image" src2="${Constants.URL}img/slides/slider.png" />
                </div>
                <div>
                    <img u="image" src2="${Constants.URL}img/slides/slider1.png" />
                </div>
                <div>
                    <img u="image" src2="${Constants.URL}img/slides/slider2.png" />
                </div>
                <div>
                    <img u="image" src2="${Constants.URL}img/slides/slider3.png" />
                </div>
            </div>
            <div u="navigator" class="jssorb21" style="position: absolute; bottom: 26px; left: 6px;">
                <div u="prototype" style="POSITION: absolute; WIDTH: 19px; HEIGHT: 19px; text-align:center; line-height:19px; color:White; font-size:12px;"></div>
            </div>
            <style>
                .jssora21l, .jssora21ldn, .jssora21rdn {
                    position: absolute;
                    cursor: pointer;
                    display: block;
                    background: url(${Constants.URL}img/arrow_left.png) center center no-repeat;
                    overflow: hidden;
                    width: 48px;
                    height: 90px;
                }
                .jssora21r{
                    position: absolute;
                    cursor: pointer;
                    display: block;
                    background: url(${Constants.URL}img/arrow_right.png) center center no-repeat;
                    overflow: hidden;
                    width: 48px;
                    height: 90px;
                }
                .jssora21l:hover {
                    background: url(${Constants.URL}img/arrow_left_hover.png) center center no-repeat;
                }
                .jssora21r:hover {
                    background: url(${Constants.URL}img/arrow_right_hover.png) center center no-repeat;
                }
                .jssorb21 div, .jssorb21 div:hover, .jssorb21 .av {
                    background: url(${Constants.URL}img/b21.png) no-repeat;
                    overflow: hidden;
                    cursor: pointer;
                }
                .jssorb21 div {
                    background-position: -5px -5px;
                }
                .jssorb21 div:hover, .jssorb21 .av:hover {
                    background-position: -35px -5px;
                }
                .jssorb21 .av {
                    background-position: -65px -5px;
                }
                .jssorb21 .dn, .jssorb21 .dn:hover {
                    background-position: -95px -5px;
                }
                .jssora21rdn{
                    background: url(${Constants.URL}img/arrow_right.png) center center no-repeat;
                }
            </style>
            <div class="sliderArrows">
                <div u="arrowleft" class="jssora21l" style="width: 48px; height: 90px; top: 123px;">
                </div>
                <div u="arrowright" class="jssora21r" style="width: 48px; height: 90px; top: 123px; margin-left: 932px;;">
                </div>
            </div>
            <a style="display: none" href="http://www.jssor.com">jQuery Slider</a>
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
                                                                  onmouseover="showMapHover('#all')">ALL COUNTRIES</div></a>
                    </li>
                    <li id="ukraineMenu" class="mapMenuLeftMArgin">
                        <a href="${Constants.URL}map/Ukraine"><div class='mapButton' id='ukraineMap'
                                                                   onmouseover="showMapHover('#ukraine')">UKRAINE</div></a>
                    </li>
                    <li id="slovakiaMenu" class="mapMenuLeftMArgin">
                        <a href="${Constants.URL}map/Slovakia"><div class='mapButton' id='slovakiaMap'
                                                                    onmouseover="showMapHover('#slovakia')">SLOVAKIA</div></a>
                    </li>
                    <li id="hungaryMenu" class="mapMenuLeftMArgin">
                        <a href="${Constants.URL}map/Hungary"><div class='mapButton' id='hungaryMap'
                                                                   onmouseover="showMapHover('#hungary')">HUNGARY</div></a>
                    </li>
                    <li id="romaniaMenu" class="mapMenuLeftMArgin">
                        <a href="${Constants.URL}map/Romania"><div class='mapButton' id='romaniaMap'
                                                                   onmouseover="showMapHover('#romania')">ROMANIA</div></a>
                    </li>
                    <li id="polandMenu" class="mapMenuLeftMArgin">
                        <a href="${Constants.URL}map/Poland"><div class='mapButton' id='polandMap'
                                                                  onmouseover="showMapHover('#poland')">POLAND</div></a>
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
                                        <div class="newsCountryText">${markers.public_country}</div><img src="${Constants.URL}img/newsImageHover.png">
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
                                        <div class="newsCountryText">${item.public_country}</div><img src="${Constants.URL}img/newsImageHover.png">
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
        
    <script>
        jQuery(document).ready(function ($) {

            var options = {
                $FillMode: 2,                                       //[Optional] The way to fill image in slide, 0 stretch, 1 contain (keep aspect ratio and put all inside slide), 2 cover (keep aspect ratio and cover whole slide), 4 actual size, 5 contain for large image, actual size for small image, default value is 0
                $AutoPlay: true,                                    //[Optional] Whether to auto play, to enable slideshow, this option must be set to true, default value is false
                $AutoPlayInterval: 4000,                            //[Optional] Interval (in milliseconds) to go for next slide since the previous stopped if the slider is auto playing, default value is 3000
                $PauseOnHover: 1,                                   //[Optional] Whether to pause when mouse over if a slider is auto playing, 0 no pause, 1 pause for desktop, 2 pause for touch device, 3 pause for desktop and touch device, 4 freeze for desktop, 8 freeze for touch device, 12 freeze for desktop and touch device, default value is 1

                $ArrowKeyNavigation: true,   			            //[Optional] Allows keyboard (arrow key) navigation or not, default value is false
                $SlideEasing: $JssorEasing$.$EaseOutQuint,          //[Optional] Specifies easing for right to left animation, default value is $JssorEasing$.$EaseOutQuad
                $SlideDuration: 800,                               //[Optional] Specifies default duration (swipe) for slide in milliseconds, default value is 500
                $MinDragOffsetToSlide: 20,                             //[Optional] Height of every slide in pixels, default value is height of 'slides' container
                $SlideSpacing: 0, 					                //[Optional] Space between each slide in pixels, default value is 0
                $DisplayPieces: 1,                                  //[Optional] Number of pieces to display (the slideshow would be disabled if the value is set to greater than 1), the default value is 1
                $ParkingPosition: 0,                                //[Optional] The offset position to park slide (this options applys only when slideshow disabled), default value is 0.
                $UISearchMode: 1,                                   //[Optional] The way (0 parellel, 1 recursive, default value is 1) to search UI components (slides container, loading screen, navigator container, arrow navigator container, thumbnail navigator container etc).
                $PlayOrientation: 1,                                //[Optional] Orientation to play slide (for auto play, navigation), 1 horizental, 2 vertical, 5 horizental reverse, 6 vertical reverse, default value is 1
                $DragOrientation: 1,                                //[Optional] Orientation to drag slide, 0 no drag, 1 horizental, 2 vertical, 3 either, default value is 1 (Note that the $DragOrientation should be the same as $PlayOrientation when $DisplayPieces is greater than 1, or parking position is not 0)
              
                $BulletNavigatorOptions: {                          //[Optional] Options to specify and enable navigator or not
                    $Class: $JssorBulletNavigator$,                 //[Required] Class to create navigator instance
                    $ChanceToShow: 2,                               //[Required] 0 Never, 1 Mouse Over, 2 Always
                    $AutoCenter: 1,                                 //[Optional] Auto center navigator in parent container, 0 None, 1 Horizontal, 2 Vertical, 3 Both, default value is 0
                    $Steps: 1,                                      //[Optional] Steps to go for each navigation request, default value is 1
                    $Lanes: 1,                                      //[Optional] Specify lanes to arrange items, default value is 1
                    $SpacingX: 8,                                   //[Optional] Horizontal space between each item in pixel, default value is 0
                    $SpacingY: 8,                                   //[Optional] Vertical space between each item in pixel, default value is 0
                    $Orientation: 1,                                //[Optional] The orientation of the navigator, 1 horizontal, 2 vertical, default value is 1
                    $Scale: false                                   //Scales bullets navigator or not while slider scale
                },

                $ArrowNavigatorOptions: {                           //[Optional] Options to specify and enable arrow navigator or not
                    $Class: $JssorArrowNavigator$,                  //[Requried] Class to create arrow navigator instance
                    $ChanceToShow: 1,                               //[Required] 0 Never, 1 Mouse Over, 2 Always
                    $AutoCenter: 2,                                 //[Optional] Auto center arrows in parent container, 0 No, 1 Horizontal, 2 Vertical, 3 Both, default value is 0
                    $Steps: 1                                       //[Optional] Steps to go for each navigation request, default value is 1
                }
            };

            $("#slider1_container").css("display", "block");
            var jssor_slider1 = new $JssorSlider$("slider1_container", options);
            function ScaleSlider() {
                var bodyWidth = document.body.clientWidth;
                if (bodyWidth)
                    jssor_slider1.$ScaleWidth(Math.min(bodyWidth, 1920));
                else
                    window.setTimeout(ScaleSlider, 30);
            }
            ScaleSlider();

            $(window).bind("load", ScaleSlider);
            $(window).bind("resize", ScaleSlider);
            $(window).bind("orientationchange", ScaleSlider);
        });
        
    
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
            /*
                mapSlider = setInterval(function(){
                    for(var i = 0; i < countries.length; i++)
                    {
                        $('#'+countries[i]+'Border').fadeOut(800);
                        $('#'+countries[i]+'Map').removeClass( "buttonBorderClass" );
                    }
                    if(counter == 5){
                        frame.animate(
                        {
                            left : $('li#'+countries[0]+'Menu').position().left,
                            width : $('li#'+countries[0]+'Menu').width()
                        },
                        {
                            duration : 500,
                            queue : false
                        });
                        
                        $('#'+countries[0]+'Border').fadeIn(700);
                        $('#'+countries[0]+'Map').addClass( "buttonBorderClass" );
                        counter = 0;
                    }
                    else{
                        
                        frame.animate(
                        {
                            left : $('li#'+countries[counter+1]+'Menu').position().left,
                            width : $('li#'+countries[counter+1]+'Menu').width()
                        },
                        {
                            duration : 500,
                            queue : false
                        });
                        $('#'+countries[counter+1]+'Border').fadeIn(700);
                        $('#'+countries[counter+1]+'Map').addClass( "buttonBorderClass" );
                        counter++;
                    }
                }, 5000);
                */
            
                if(window.outerWidth>980){
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
                }else{
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
                }
            
            
        });
    </script>
</t:indexpage>