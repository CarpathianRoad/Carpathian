<%-- 
    Document   : FullArticle
    Created on : Jan 11, 2015, 3:06:54 PM
    Author     : kiwi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:indexpage>
    <script type="text/javascript" src="${Constants.URL}js/article_gallery.js"></script>
	<section  id="inner-headline">
	<div class="container">
            <div class="breadcrumbs">
                <ul class="breadcrumbs_ul">
                    <li><a href="${Constants.URL}index">Main</a><div class="right_arrow"> </div></li>
                    <li><a href="#">News</a><div class="right_arrow"> </div></li>
                    <li>${article.title}</li>
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
	</div>
	</section>
	<section id="content">
	<div class="container">
		<div class="row">
			<div class="col-lg-8">
				<article>
                                    <div class="post-image">
					<div class="post-heading">
                                            <h3><div class="article_title"><a href="#">${article.title}</a></div></h3>
                                            <div class="article_sub_title">
                                                <div class="article_sub_title_date">${article.date}</div>
                                                <div class="article_sub_title_country">
                                                    <img src="/Carpath/img/mapControlsImageSelected.png"/>
                                                    ${article.public_country}
                                                </div>
                                            </div> 
                                        </div>
                                    </div>
                                    <div class="article_text">
					${article.textEN}
                                    </div>
                                    
                                    <!--image_slider ======================================-->
                                    <!-- Jssor Slider Begin -->
                                    <!-- You can move inline styles to css file or css block. -->
                                    
                                    <div id="article_slider1_container" style="position: relative; top: 0px; left: 0px; width: 809px; height: 150px; overflow: hidden;">

                                        <!-- Loading Screen -->
                                        <div u="loading" style="position: absolute; top: 0px; left: 0px;">
                                            <div style="filter: alpha(opacity=70); opacity:0.7; position: absolute; display: block;
                                                background-color: #000; top: 0px; left: 0px;width: 100%;height:100%;">
                                            </div>
                                            <div style="position: absolute; display: block; background: url(${Constants.URL}img/loading.gif) no-repeat center center;
                                                top: 0px; left: 0px;width: 100%;height:100%;">
                                            </div>
                                        </div>

                                        <!-- Slides Container -->
                                        <div u="slides" style="cursor: move; position: absolute; left: 0px; top: 0px; width: 809px; height: 150px; overflow: hidden;">
                                            <c:forEach items="${images}" var="image">
                                                <div onclick="set_main_picture('${Constants.URL}${image}')"><img u="image" src="${Constants.URL}${image}" /></div>
                                            </c:forEach>
                                        </div>
                                        <div u="navigator" class="jssorb03" style="position: absolute; bottom: 4px; right: 6px;">
                                            <!-- bullet navigator item prototype -->
                                            <div u="prototype" style="position: absolute; width: 21px; height: 21px; text-align:center; line-height:21px; color:white; font-size:12px;"><div u="numbertemplate"></div></div>
                                        </div>
                                        <!-- Bullet Navigator Skin End -->
                                        <!-- Arrow Navigator Skin Begin -->
                                        <!-- Arrow Left -->
                                        <span u="arrowleft" class="jssora03l" style="width: 55px; height: 55px; top: 123px; left: 8px;">
                                        </span>
                                        <!-- Arrow Right -->
                                        <span u="arrowright" class="jssora03r" style="width: 55px; height: 55px; top: 123px; right: 8px">
                                        </span>
                                        <!-- Arrow Navigator Skin End -->
                                    </div>
                                    <!-- Jssor Slider End -->
                                    <!--image_slider_end=======================================-->
                                    <div class="article_main_image">
                                        <img id="main_image" src="${Constants.URL}${main_image}" />
                                    </div>
                        </div>
                    <div class="article_side_news">
                        <c:forEach items="${articles}" var="news">
                            <div class="news_item">
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
                            </div>
                        </c:forEach>
                    </div>
				</article>	
                </div>
                                    <c:if test="not empty ${article.x}">
			<div class="col-lg-4">
                            <aside class="right-sidebar" >
                                <div class="widget">
                                    <div id="widget-map" style="height: 250px;">
                                        
                                    </div>
					<h5>Coordinates</h5>
                                        <div class="coords-block">
                                            <strong>X:</strong> 48.626451 
                                            &nbsp&nbsp&nbsp&nbsp
                                            <strong>Y:</strong> 22.288817
                                        </div>
                                        
                                </div>
				</aside>
						<div class="bottom-articleFull">
							<ul class="meta-post">
								<li><i class="icon-calendar"></i>${article.date}</li>
                                                                <li>${article.country}</li>
                                                                <li>${article.region}</li>
                                                                <li>${article.district}</li>
                                                                <li>${article.town}</li>
							</ul>
						</div>
			</div>
                                     </c:if>
		</div>
	</div>
	</section>
                    
<script>        
<c:choose>
      <c:when test="not empty ${article.x}">
          <c:set var="lanX" scope="session" value="${article.x}"/>
          <c:set var="lanY" scope="session" value="${article.y}"/>
      </c:when>
      <c:otherwise>
          <c:set var="lanX" scope="session" value="48.626451"/>
          <c:set var="lanY" scope="session" value="22.288817"/>
      </c:otherwise>
</c:choose>
var mapProp = {
			center: new google.maps.LatLng(${lanX}, ${lanY}),
			zoom:9,
			mapTypeId:google.maps.MapTypeId.ROADMAP,
			disableDefaultUI: true
		};
		map=new google.maps.Map(document.getElementById("widget-map"),mapProp); 

<c:if test="not empty ${article.x} ">
var marker = new google.maps.Marker({
    position: new google.maps.LatLng(${lanX}, ${lanY}),
    map: map,
    title:${article.title}
});
</c:if>
</script>
</t:indexpage>