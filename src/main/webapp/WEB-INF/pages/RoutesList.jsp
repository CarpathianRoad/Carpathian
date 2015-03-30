<%-- 
    Document   : routesList
    Created on : Jan 17, 2015, 11:50:24 PM
    Author     : kiwi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<t:indexpage>
    <script>var files = [];</script>
    <div class="s-new widthClass">
        <div class="s-new markerPageTable">
        <div class="breadcrumbsMarker">
                <ul class="breadcrumbsUlMarker">
                    <li><a href="${Constants.URL}index">Main</a><div class="right_arrow"> </div></li>
                    <li><a href="${Constants.URL}article/category/6">Routes</a><div class="right_arrow"> </div></li>
                    <li><a>Trails</a></li>
                </ul>
                <div class="countriesFilterMarker">
                    <a class="selected_country" href="#">All countries</a>
                    <a href="#">Poland</a>
                    <a href="#">Hungary</a>
                    <a href="#">Romania</a>
                    <a href="#">Slovakia</a>
                    <a href="#">Ukraine</a>
                </div>
            </div>
        </div>
                <c:forEach items="${routesList}" var="route" varStatus="loop">
                    <div class="s-cell">
                        <div class="s-block newsHeight">
                            <div class="newsImage">
                                <a href="${Constants.URL}routes/${route.id}">
                                    <div class="imageHover">
                                    </div>
                                    <div class="routesListMap" id="map${loop.index}"></div>
                                </a>
                            </div>
                            <img class="newsImageUnderline" src="${Constants.URL}img/newsLine.png">
                            <div class="news_text_box">
                                <div class="news_title"><a href="${Constants.URL}routes/${route.id}">${route.title}</a></div>
                                <a href="${Constants.URL}routes/${route.id}">
                                    <div class="news_text">${route.textUA}</div>
                                </a>
                            </div>
                        </div>
                    </div>   
                    <script>files.push("${route.file}");</script>
                </c:forEach>
    </div>
                        
				<div style="display:none;" id="pagination">
					<span class="all">Page 1 of 3</span>
					<span class="current">1</span>
					<a href="#" class="inactive">2</a>
					<a href="#" class="inactive">3</a>
				</div>
        <script>
            
            var countRoute = 0;
            var map = [];
            var height = [];  
            var length = [];
            var xCoord = [];
            var yCoord = [];
            var points = [];
            var route;
            var center;
            var mapStyles = [{"featureType":"landscape","elementType":"labels","stylers":[{"visibility":"off"}]},
            {"featureType":"transit","elementType":"labels","stylers":[{"visibility":"off"}]},
            {"featureType":"poi","elementType":"labels","stylers":[{"visibility":"off"}]},
            {"featureType":"water","elementType":"labels","stylers":[{"visibility":"off"}]},
            {"featureType":"road","elementType":"labels.icon","stylers":[{"visibility":"off"}]},{"stylers":[{"hue":"#00aaff"},{"saturation":-100},{"gamma":2.15},{"lightness":12}]},
            {"featureType":"road","elementType":"labels.text.fill","stylers":[{"visibility":"on"},{"lightness":24}]},
            {"featureType":"road","elementType":"geometry","stylers":[{"lightness":57}]}];
        
            
            for(var count = 0; count < '${fn:length(routesList)}'; count++){
                    if (window.XMLHttpRequest){
                        xmlhttp=new XMLHttpRequest();
                    }
                    else{
                        xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
                    }
                    xmlhttp.open("GET","${Constants.URL}routes/"+files[count],false);
                    xmlhttp.send();
                    xmlDoc=xmlhttp.responseXML;
                    $.ajax({
                        type: "GET",
                        url: "${Constants.URL}routes/"+files[count],
                        dataType: "xml",
                        success: parseXml
                    });
            }   
            
                function parseXml(xml){
                        height = [];  
                        length = [];
                        xCoord = [];
                        yCoord = [];
                        points = [];
                        route = null;
                        center = null;
                    $(xml).find("trkpt").each(function(){
                        height.push($(this).find("ele").text());
                    });
                    $(xml).find("trkpt").each(function(){
                        xCoord.push($(this).attr("lat"));
                    });
                    $(xml).find("trkpt").each(function(){
                        yCoord.push($(this).attr("lon"));
                    });
                    var styledMap = new google.maps.StyledMapType(mapStyles,
                        {name: "Styled Map"});
                    var mapOptions = {
                      zoom: 10,
                      center: getCenter(),
                      //center: latlng,
                      mapTypeId: google.maps.MapTypeId.SATELLITE,
                      disableDefaultUI: true,
                      mapTypeControlOptions: {
                        mapTypeIds: [google.maps.MapTypeId.ROADMAP, 'map_style']
                      }
                    };
                    map[countRoute] = new google.maps.Map(document.getElementById("map"+countRoute),
                        mapOptions);
                    map[countRoute].mapTypes.set('map_style', styledMap);
                    map[countRoute].setMapTypeId('map_style');
                for (var i = 0; i < (height.length); i++) { 
                    if(i==0){
                        var p1 = new google.maps.LatLng(xCoord[i],yCoord[i]);
                        var p2 = new google.maps.LatLng(xCoord[i+1],yCoord[i+1]);
                        points.push(p1);
                    }
                    else if(i==height.length-1){
                        length.push(length[i-1]);
                    }
                    else{
                        var p1 = new google.maps.LatLng(xCoord[i],yCoord[i]);
                        var p2 = new google.maps.LatLng(xCoord[i+1],yCoord[i+1]);
                        points.push(p1);
                    }
                }
                route = new google.maps.Polyline({
                    path: points,
                    geodesic: true,
                    strokeColor: '#FF9900',
                    strokeOpacity: 1.0,
                    strokeWeight: 2
		});
		route.setMap(map[countRoute]);
                countRoute ++;
                }
            
            function getCenter(){
                var minLat = 0;
                var maxLat = 0;
                var minLon = 0;
                var maxLon = 0;
                for (var j = 0; j < xCoord.length; j++){
                    if (j == 0){
                        minLat = xCoord[j];
                        maxLat = xCoord[j];
                        minLon = yCoord[j];
                        maxLon = yCoord[j];
                    }
                    else{
                        if (minLat <= xCoord[j]){
                            minLat = xCoord[j];
                        }
                        if (maxLat >= xCoord[j]){
                            maxLat = xCoord[j];
                        }
                        if (minLon <= yCoord[j]){
                            minLon = yCoord[j];
                        }
                        if (maxLon >= yCoord[j]){
                            maxLon = yCoord[j];
                        }
                    }
                }
                
                return (new google.maps.LatLng((parseFloat(minLat)+parseFloat(maxLat))/2, (parseFloat(minLon)+parseFloat(maxLon))/2));
            }
        </script>
</t:indexpage>