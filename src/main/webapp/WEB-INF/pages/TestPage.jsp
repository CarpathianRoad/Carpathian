<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:indexpage>
	<div class="wrap">
		<div id="slider1" class="slider">
			<ul style="height: 250px;">
                               <li> <div class="sliderImage">
                    <img u="image" src="${Constants.URL}img/slides/borzhava.jpg" />
                </div></li>
               <li> <div class="sliderImage">
                    <img u="image" src="${Constants.URL}img/slides/europe_center.jpg" />
                </div></li>
               <li> <div class="sliderImage">
                    <img u="image" src="${Constants.URL}img/slides/narcis.jpg" />
                </div></li>
               <li> <div class="sliderImage">
                    <img u="image" src="${Constants.URL}img/slides/pylypets.jpg" />
                </div></li>
                <li><div class="sliderImage">
                    <img u="image" src="${Constants.URL}img/slides/sheeps.jpg" />
                </div></li>
                <li><div class="sliderImage">
                    <img u="image" src="${Constants.URL}img/content/NEWS/Anons/StandUP_uzh/StandUp.jpg" />
                </div></li>
                                
			</ul>
		</div>
		<div class="controls">
			<a href="#" style="display:none" class="prev-page">Prev Page</a>
                        <div class="prev-slide"></div>
                        <div class="next-slide"></div>
			<a href="#" style="display:none" class="next-page">Next Page</a>
		</div>
	</div>

</t:indexpage>


	<script src="${Constants.URL}js/lemmon-slider.js"></script>
	<script>
	window.onload = function(){

		// slider 1
		$( '#slider1' ).lemmonSlider({
			infinite: true
		});

	}
	</script>
	<style type="text/css" media="screen">
	.wrap { width:100%; height: 250px; }
	body div.slider    { overflow:hidden; position:relative; width:100%; height:250px !important; }
	body div.slider ul { margin:0; padding:0; height:250px; }
	body div.slider li { float:left; list-style:none; margin:0; }
	body div.slider li { text-align:center; line-height:160px; font-size:25px; }
        .s-new {
            display: none;
        }
        #preloader {
            display: none;
        }
        li{
        }
        img{
            height: 250px;
        }
        .sliderImage{
            height: 250px;
        }
        .controls{
            position: relative;
            margin-top: -160px;
        }
        .prev-slide{
            background: url(${Constants.URL}img/arrow_left.png) center center no-repeat;
            width: 48px;
            height: 90px;
            cursor: pointer;
            position: absolute;
            left: 50;
        }
        .next-slide{
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
        .next-slide:hover {
            background: url(${Constants.URL}img/arrow_right_hover.png) center center no-repeat;
        }
	</style>