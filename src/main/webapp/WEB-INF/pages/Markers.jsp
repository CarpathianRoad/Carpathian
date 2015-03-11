<%-- 
    Document   : Partners
    Created on : Jan 13, 2015, 9:59:12 PM
    Author     : kiwi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:indexpage>
    <style>
        .paddingContent{
            
        }
        #GPStext{
            color: #353535;
            font-size: 18px;
            font-weight: 900;
        }
        #markerImage{
            float: left;
            width:  25%;
            height: 25%;
            overflow: hidden;
            padding: 25px;
        }
        #markerGallery{
            margin-left: 3%;
        }
        #thumbs ul {
            margin: 0;
    padding: 4px;
        }
        #thumbs li {
            display: inline-block;
            width: 200px;
            margin-right: 20px;
        }
        .locationDiv{
            height: 80px;
            border-style: solid;
            border-width: 1px;
            border-color: #C8CCD0;
            background-color: #F2F2F2;
            border-bottom-color: #68A4C4;
            border-bottom-width: 4px;
            padding: 12px;
        }
        .locationImage{
            float:right;
            width: 13%;
            margin-top: -50px;
        }
        .locationImage img{
            width: 100%;
        }
        #GPS{
            width: 180px;
        }
        .locationText{
            width: 75%;
            float: left;
        }
        .showOnMap{
            margin-top:12px; 
        }
        .showOnMapImage{
            width: 20px;
            float: left;
            padding-top: 7px;
        }
        .showOnMapImage img{
            width: 100%;
        }
        .showOnMapText{
            margin-left: 30px;
            padding-top: 1px;
        }
        #descrImage{
            float: right;
            width: 300px;
            padding-left: 10px;
            padding-bottom: 5px;
            padding-top: 5px;
        }
        .descrText{
            text-align: justify;
        }
        .contactsDiv{
            background-color: #F2F2F2;
            padding-left: 15px;
            padding-bottom: 12px;
        }
        .contactsTitle{
            font-size: 24px;
            font-weight: bold;
        }
        .contactsSubTitle{
            padding-top: 10px;
            font-size: 20px;
            font-weight: bold;
        }
        .contactsText{
            padding-top: 5px;
            padding-right: 10px;
            text-align: justify;
        }
        .panorama{
            padding-top: 10px;
        }
        .galleryImage{
            display: inline-block;
        }
        .galleryBlock{
            height: 130px;
            overflow-y: hidden;
            overflow-x: auto;
            width: 100%;
            white-space: nowrap;
        }
        .fancybox-opened .fancybox-title {
/* visibility: visible; */
display: none !important;
}
    </style>
    <script type="text/javascript" src="${Constants.URL}js/fancybox/lib/jquery.mousewheel-3.0.6.pack.js"></script>

    <!-- Add fancyBox -->
    <link rel="stylesheet" href="${Constants.URL}js/fancybox/source/jquery.fancybox.css?v=2.1.5" type="text/css" media="screen" />
    <script type="text/javascript" src="${Constants.URL}js/fancybox/source/jquery.fancybox.pack.js?v=2.1.5"></script>

    <!-- Optionally add helpers - button, thumbnail and/or media -->
    <link rel="stylesheet" href="${Constants.URL}js/fancybox/source/helpers/jquery.fancybox-buttons.css?v=1.0.5" type="text/css" media="screen" />
    <script type="text/javascript" src="${Constants.URL}js/fancybox/source/helpers/jquery.fancybox-buttons.js?v=1.0.5"></script>
    <script type="text/javascript" src="${Constants.URL}js/fancybox/source/helpers/jquery.fancybox-media.js?v=1.0.6"></script>

    <link rel="stylesheet" href="${Constants.URL}js/fancybox/source/helpers/jquery.fancybox-thumbs.css?v=1.0.7" type="text/css" media="screen" />
    <script type="text/javascript" src="${Constants.URL}js/fancybox/source/helpers/jquery.fancybox-thumbs.js?v=1.0.7"></script>
    <script type="text/javascript">
            $(document).ready(function() {
                    $(".fancybox").fancybox();
            });
    </script>
    <script>
	$( document ).ready(function() {
            var mapProp = {
                center:new google.maps.LatLng(${marker.x},${marker.y}),
                zoom:11,
                mapTypeId:google.maps.MapTypeId.ROADMAP,
                disableDefaultUI: true
            };
            var  map=new google.maps.Map(document.getElementById("googleMap"),mapProp);
            var pinIcon = new google.maps.MarkerImage(
                "${Constants.URL}img/markers/${marker.markerIcon}.png",
                null, 
                null, 
                null, 
                new google.maps.Size(30, 40)
            ); 
            var marker = new google.maps.Marker({
                position: new google.maps.LatLng(${marker.x},${marker.y}),
                map: map,
                icon: pinIcon,
                title: "${marker.title}"
            });	
            var x = "${marker.x}".substring(1, 7);
            var y = "${marker.y}".substring(1, 7);
            $("#GPStext").html('GPS: X: '+x+', Y: '+y);
            var photos = "${marker.image}".split(",");
            var images = "";
            for(var n = 0; n < photos.length; n++){
                images = images + '<li class="design" data-id="id-0" data-type="web"><div class="item-thumbs"><a class="hover-wrap fancybox" data-fancybox-group="gallery" href="${Constants.URL}'+photos[n]+'"><span class="overlay-img"></span><span class="overlay-img-thumb font-icon-plus"></span></a><img src="${Constants.URL}'+photos[n]+'"></div></li>';
            };
            $("#thumbs").html(images);
            info = "${marker.title}";
            var infowindow =  new google.maps.InfoWindow({
		content: ""
            });
            var x = "${marker.x}".substring(0, 7);
            var y = "${marker.y}".substring(0, 7);
            bindInfoWindow(marker, map, infowindow, info);
            var gpsText = "GPS: "+x+", "+y;
            $("#GPS").html(gpsText);
            var photos = "${marker.image}".split(",");
            var image = '<div class="markerImage"><img src="${Constants.URL}'+photos[0]+'" style="width: 100%;"></div>';
            $("#descrImage").html(image);
        });
        
	function bindInfoWindow(marker, map, infowindow, strDescription) {
            google.maps.event.addListener(marker, 'click', function() {
		infowindow.setContent(strDescription);
		infowindow.open(map, marker);
            });
	}
        
    </script>
        
        <section id="content" class="paddingContent">
	<div class="container">
		<div class="row">
			<div class="col-lg-8">
                            
				<article>
						<div class="post-image">
							<div class="post-heading">
								<h1>${marker.title}</h1>
							</div>
                                                        <div class="locationDiv">
                                                            <h5>
                                                                <div class="locationText">
                                                                    Location: ${marker.country}, ${marker.district} district, ${marker.region} region, ${marker.town}
                                                                </div>
                                                                <div id="GPS"></div>
                                                                <div class="locationImage">
                                                                    <img src="${Constants.URL}img/zak.png">
                                                                </div>
                                                            </h5>
                                                            
                                                        </div>
                                                                <div class="showOnMap">
                                                                    <div class="showOnMapImage">
                                                                        <img src="${Constants.URL}img/markers/${marker.markerIcon}.png">
                                                                    </div>
                                                                    <div class="showOnMapText">
                                                                        <h5><a href="#">Display on map</a></h5>
                                                                    </div>
                                                                </div>
						</div>
                                                <div class="descr">
                                                    <div id="descrImage">
                                                        <img src="${Constants.URL}img/markers/${marker.markerIcon}.png">
                                                    </div>
                                                    <div class="descrText">
                                                        <p>
                                                            ${marker.textEN}
                                                        </p>
                                                    </div>
                                                </div>
                                                
						<div class="bottom-article">
							<ul class="meta-post">
                                                            <li><i class="icon-calendar"></i><h2>Photogallery</h2></li>
							</ul>
						</div>
                                                <div class="galleryBlock">
                                                    <c:forEach items="${images}" var="img">
                                                        <a class="galleryImage fancybox" rel="group" href="${Constants.URL}${img}"><img src="${Constants.URL}${img}" alt="" style="height: 100px"/></a>
                                                    </c:forEach>
                                                </div>
                               
			<div class="bottom-article">
                            <ul class="meta-post">
                                <li><i class="icon-calendar"></i><h2>Panoramas</h2></li>
                            </ul>
			</div>
				</article>
                                
				
			</div>
			<div class="col-lg-4">
                            <aside class="right-sidebar" >
                                <div class="widget">
                                    <div class="mapDiv">
                                        <h1>Map</h1>
                                        <div id="googleMap" style="height: 250px;">

                                        </div>
                                    </div>
                                        
                                </div>
                                
                            
                            <div class="contactsDiv">
                                                    <div class="bottom-article">
                                                            <ul class="meta-post">
                                                                <li><i class="icon-calendar"></i><div class="contactsTitle">Contacts</div></li>
                                                            </ul>
                                                    </div>
                                                    <div class="contactsSubTitle">
                                                        Location:
                                                    </div>
                                                    <div class="contactsText">
                                                        ${marker.country}, ${marker.district} district, ${marker.region} region, ${marker.town} town
                                                    </div>
                                                    <div class="contactsSubTitle">
                                                        Telephone:
                                                    </div>
                                                    <div class="contactsText">
                                                        Random phone number
                                                    </div>
                                                    <div class="contactsSubTitle">
                                                        Email:
                                                    </div>
                                                    <div class="contactsText">
                                                        hereToWriteEmail@email.com
                                                    </div>
                                                    <div class="contactsSubTitle">
                                                        Web:
                                                    </div>
                                                    <div class="contactsText">
                                                        <a href="#">www.superAquaRioPark.com</a>
                                                    </div>
                                                </div>
                                                <div class="contactsDiv">
                                                    <div class="bottom-article">
                                                            <ul class="meta-post">
                                                                <li><i class="icon-calendar"></i><div class="contactsTitle">Links</div></li>
                                                            </ul>
                                                    </div>
                                                    <div class="contactsText">
                                                        <a href="#">www.someInterestingLink.com</a>
                                                    </div>        
                                                </div>
				</aside>
			</div>
		</div>
	</div>
	</section>
</t:indexpage>