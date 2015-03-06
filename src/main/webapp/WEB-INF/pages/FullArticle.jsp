<%-- 
    Document   : FullArticle
    Created on : Jan 11, 2015, 3:06:54 PM
    Author     : kiwi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:indexpage>
	<section style="display: none" id="inner-headline">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<ul class="breadcrumb">
					<li><a href="#"><i class="fa fa-home"></i></a><i class="icon-angle-right"></i></li>
					<li class="active">Blog</li>
				</ul>
			</div>
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
								<h3><a href="#">${article.title}</a></h3>
							</div>
						</div>
						<p>
						${article.textEN}
                                                </p>
						<div class="bottom-article">
							<ul class="meta-post">
								<li><i class="icon-calendar"></i><a href="#">${article.date}</a></li>
                                                                <li>${article.country}</li>
                                                                <li>${article.region}</li>
                                                                <li>${article.district}</li>
                                                                <li>${article.town}</li>
							</ul>
						</div>
				</article>
                                
				
			</div>
			<div class="col-lg-4">
                            <aside class="right-sidebar" >
                                <div class="widget">
                                    <div id="widget-map" style="height: 250px;">
                                        
                                    </div>
                                    <c:if test="not empty ${article.x}">
					<h5>Coordinates</h5>
                                        <div class="coords-block">
                                            <strong>X:</strong> 48.626451 
                                            &nbsp&nbsp&nbsp&nbsp
                                            <strong>Y:</strong> 22.288817
                                        </div>
                                     </c:if>
                                        
                                </div>
				</aside>
			</div>
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