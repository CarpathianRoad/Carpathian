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
            <div class="markerLeftDescr routesLinks">
                <c:forEach items="${routesList}" var="route" varStatus="loop">
                    <div class="routesListCell">
                        <div class="markerPageTitle">
                            <a href="${Constants.URL}routes/${route.id}">
                                ${route.title}
                            </a>
                        </div>
                        <div class="routeListText routesListText">
                            <a href="${Constants.URL}routes/${route.id}">
                                ${route.textUA}...
                            </a>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div class="markerRightDescr">
                <c:forEach items="${routesList}" var="route" varStatus="loop">
                    <script>files.push("${route.file}");</script>
                    <div class="routesListMap" id="map${loop.index}"></div>
                </c:forEach>
            </div>
                        
				<div style="display:none;" id="pagination">
					<span class="all">Page 1 of 3</span>
					<span class="current">1</span>
					<a href="#" class="inactive">2</a>
					<a href="#" class="inactive">3</a>
				</div>
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
                    var mapOptions = {
                      zoom: 10,
                      center: getCenter(),
                      //center: latlng,
                      mapTypeId: google.maps.MapTypeId.SATELLITE,
                      disableDefaultUI: true
                    };
                    map[countRoute] = new google.maps.Map(document.getElementById("map"+countRoute),
                        mapOptions);
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
                    strokeWeight: 5
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