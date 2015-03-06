<%-- 
    Document   : routesList
    Created on : Jan 17, 2015, 11:50:24 PM
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
                            <c:forEach items="${routesList}" var="route">
                                
				<article>
						<div class="post-image">
							<div class="post-heading">
								<h3><a href="${Constants.URL}routes/${route.id}">${route.title}</a></h3>
							</div>
						</div>
						<p>
						${route.textUA}
                                                </p>
						<div class="bottom-article">
							<ul class="meta-post">
								<li><i class="icon-calendar"></i><a href="#"></a></li>
							</ul>
							<a href="${Constants.URL}routes/${route.id}" class="pull-right">Show route <i class="icon-angle-right"></i></a>
						</div>
				</article>
                            </c:forEach>
                        
				<div style="display:none;" id="pagination">
					<span class="all">Page 1 of 3</span>
					<span class="current">1</span>
					<a href="#" class="inactive">2</a>
					<a href="#" class="inactive">3</a>
				</div>
			</div>
			<div class="col-lg-4">
                            
                            <aside class="right-sidebar" >
                                <div class="widget">
                                    <div id="widget-map" style="height: 250px;">
                                        
                                    </div>
                                        
                                </div>
				</aside>
			</div>
		</div>
	</div>
	</section>
</t:indexpage>
<script>     
var mapProp = {
			center: new google.maps.LatLng(48.626451, 22.288817),
			zoom:9,
			mapTypeId:google.maps.MapTypeId.ROADMAP,
			disableDefaultUI: true
		};
		map=new google.maps.Map(document.getElementById("widget-map"),mapProp); 
</script>