<%-- 
    Document   : routes
    Created on : Jan 4, 2015, 11:37:01 PM
    Author     : kiwi
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<t:indexpage>
    <style type="text/css">
            v\:* {
                behavior:url(#default#VML);
            }
            #map {
                margin-top: 30px;
            }
        </style>
        <script type="text/javascript"
            src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js">
        </script>
        <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&libraries=geometry"></script>
        <script type="text/javascript" src="http://www.google.com/jsapi"></script> 
        <script type="text/javascript">
            google.load("visualization", "1", {packages:["columnchart"]});
        </script>
        <script type="text/javascript">
            
            elevationService = new google.maps.ElevationService();
            
            var map;
            var height = [];  
            var length = [];
            var xCoord = [];
            var yCoord = [];
            var points = [];
            var count = 0;
            var route;
            var center;
            
            $(document).ready(function() {
                if (window.XMLHttpRequest){
                    xmlhttp=new XMLHttpRequest();
                }
                else{
                    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
                }
                xmlhttp.open("GET","${Constants.URL}routes/${route.file}",false);
                xmlhttp.send();
                xmlDoc=xmlhttp.responseXML;
                
                $.ajax({
                    type: "GET",
                    url: "${Constants.URL}routes/${route.file}",
                    dataType: "xml",
                    success: parseXml
                }); 
                
            });

            function calcDistance(p1, p2){
                return (google.maps.geometry.spherical.computeDistanceBetween(p1, p2)/1000);
            }
            
            function parseXml(xml){
                $(xml).find("trkpt").each(function(){
                    height.push($(this).find("ele").text());
                });
                $(xml).find("trkpt").each(function(){
                    xCoord.push($(this).attr("lat"));
                });
                $(xml).find("trkpt").each(function(){
                    yCoord.push($(this).attr("lon"));
                });
                var latlng = new google.maps.LatLng(48.71, 22.41);
                var mapOptions = {
                  zoom: 11,
                  center: getCenter(),
                  //center: latlng,
                  mapTypeId: google.maps.MapTypeId.SATELLITE,
                  disableDefaultUI: true
                };
                map = new google.maps.Map(document.getElementById("map"),
                    mapOptions);
                <c:forEach items="${imagesRoute}" var="imgs">
                    if(("${imgs.x}".indexOf(',')!=-1)&&("${imgs.y}".indexOf('.')!=-1)){
                        var temp = "${imgs.x}".split(",");
                        var temp1 = temp[1].split('.');
                        var x = upd(temp[0]+' '+temp1[0]+'.'+temp1[1]);
                        var temp = "${imgs.y}".split(",");
                        var temp1 = temp[1].split('.');
                        var y = upd(temp[0]+' '+temp1[0]+'.'+temp1[1]);
                    }else{
                        var x = '${imgs.x}';
                        var y = '${imgs.y}';
                    }
                    var infowindow =  new google.maps.InfoWindow({
                        content: ""
                    });
                    var pinIcon = new google.maps.MarkerImage(
                       "${Constants.URL}img/markers/trailsign.png",
                        null, 
                        null, 
                        null, 
                        new google.maps.Size(30, 40)
                    ); 
                    var myLatlng = new google.maps.LatLng(x, y);
                    var markerPhoto = new google.maps.Marker({
                        position: myLatlng,
                        map: map,
                        icon: pinIcon,
                        title: "${imgs.name}"
                    });
                    var info = '<div class="markerName" style="width: 100%; text-align:center;"><h3>${imgs.name}</h3></div>'+
                            '<div id="routeImage" style="width: 100%; padding-left:20px; padding-bottom:30px;"><img src="${Constants.URL}${imgs.img}" style="width: 100%;"></div>';
                    bindInfoWindow(markerPhoto, map, infowindow, info);
                    
                </c:forEach>
                
                /*var routeDescription = document.getElementById('desc');
                var div = document.createElement('div');
                routeDescription.appendChild(div);
                map.controls[google.maps.ControlPosition.LEFT_BOTTOM].push(
                    document.getElementById('desc'));*/
                
                  
                //var name = xmlDoc.getElementsByTagName("name")[0].childNodes[0].nodeValue;
                //var desc = xmlDoc.getElementsByTagName("desc")[0].childNodes[0].nodeValue; 
                
                //document.getElementById("routeName").innerHTML = "<br>" + $(xml).find("name").text();
                //document.getElementById("routeDesc").innerHTML = "<br>" + $(xml).find("desc").text();
                getMarkers();
                makeLegend();
            }
            
            function GetDegreeValue(v)
            {
                var vv = "";
                var good = "0123456789.";
                var sign = 1;
                var factor = 1;
                var d = 0;
                var c, oldc;
                // Change non-numbers into spaces.
                oldc = ' ';
                for (i = 0; i < v.length; i ++)
                {
                    var c = v.charAt(i).toUpperCase();
                    if (c == 'W' || c == 'S' || c == '-')
                    {
                        sign = -1;
                    }
                    // convert commas to periods
                    if (c === ',') {
                            c = '.';
                    }
                    if (good.indexOf(c) < 0)
                    {
                        c = ' ';
                    }
                    if (oldc != ' ' || c != ' ')
                    {
                        vv += c;
                        oldc = c;
                    }	
                }
                v = new Array();
                v = vv.split(' ');
                for (i = 0; i < v.length; i ++)
                {
                    d += v[i] * factor;
                    factor /= 60;
                }
                return d * sign;
            }
            
            function DoPrecision(v, p)
            {
                return Math.round(v * Math.pow(10, p)) / Math.pow(10, p);
            }
            
            function upd(v)
            {
                var d, m, sign = '', str;
                v = GetDegreeValue(v);
                if (v < 0)
                {
                    sign = '-';
                    v = - v;
                }
                str = sign + DoPrecision(v, 6);
                return str;
            }
            
            
            
            function bindInfoWindow(marker, map, infowindow, strDescription) {
		google.maps.event.addListener(marker, 'click', function() {
			infowindow.setContent(strDescription);
			infowindow.open(map, marker);
		});
            }
            
            function getMarkers(){
                for (var i = 0; i < (height.length); i++) { 
                    if(i==0){
                        var p1 = new google.maps.LatLng(xCoord[i],yCoord[i]);
                        var p2 = new google.maps.LatLng(xCoord[i+1],yCoord[i+1]);
                        length.push(parseFloat(calcDistance(p1,p2)));
                        length[i] = length[i].toFixed(3);
                        points.push(p1);
                    }
                    else if(i==height.length-1){
                        length.push(length[i-1]);
                    }
                    else{
                        var p1 = new google.maps.LatLng(xCoord[i],yCoord[i]);
                        var p2 = new google.maps.LatLng(xCoord[i+1],yCoord[i+1]);
                        length.push(parseFloat(length[i-1])+parseFloat(calcDistance(p1,p2)));
                        length[i] = length[i].toFixed(3);
                        points.push(p1);
                    }
                }
                buildChart();
                buildRoute();
            }
            
            function buildChart(){
                /*var r = Raphael("holder");
                var lines = r.linechart(20, 100, 440, 200, [length], 
                        [height], { nostroke: false, axis: "10 10 5 5", symbol: "rect"}).hoverColumn(function () {
                    this.tags = r.set();
                for (var i = 0, ii = this.y.length; i < ii; i++) {
                    this.tags.push(r.tag(this.x, this.y[i], this.values[i], 160, 10).insertBefore(this).attr([{ fill: "#fff" }, { fill: this.symbols[i].attr("fill") }]));
                }
                }, function () {
                    this.tags && this.tags.remove();
                });*/
                var data = new google.visualization.DataTable();
                data.addColumn('string', 'Length');
                data.addColumn('number', 'Elevation');
                var obj = [];
                for(var i = 0; i<height.length; i++){
                    //data.addRow(['',height[i]]);
                    obj.push([length[i],parseFloat(height[i])]);
                }
                data.addRows(obj);
                chart = new google.visualization.ColumnChart(document.getElementById('holder'));
                chart.draw(data, {
                    legend: 'none',
                    titleY: 'Elevation (m)',
                    focusBorderColor: '#00ff00',
                    titleX: 'Length (km)'
                  });
                var mousemarker;
                google.visualization.events.addListener(chart, 'onmouseover', function(e) {
                    if (mousemarker == null) {
                        var pinIcon = new google.maps.MarkerImage(
                            "${Constants.URL}img/markers/walking.png",
                            null, 
                            null, 
                            null, 
                            new google.maps.Size(30, 40)
                        ); 
                        mousemarker = new google.maps.Marker({
                            position: new google.maps.LatLng(xCoord[e.row],yCoord[e.row]),
                            map: map, 
                            icon: pinIcon        
                        });
                    } else {
                        mousemarker.setPosition(new google.maps.LatLng(xCoord[e.row],yCoord[e.row]));
                    }
                });
            }
            
            function buildRoute(){
                route = new google.maps.Polyline({
                    path: points,
                    geodesic: true,
                    strokeColor: '#FF9900',
                    strokeOpacity: 1.0,
                    strokeWeight: 5
		});
		route.setMap(map);
            }
            
            function makeLegend(){
                /*google.maps.event.addDomListener(route, 'click', function() {
                    $("#routeDescriptionLegend").animate({width:'toggle'},300);
                    if (count == 0){
                        $("#routeDescHide").html('<img src="${Constants.URL}img/rightArrow.png" style="width: 100%;">');
                        count = 1;
                    }
                    else{
                        $("#routeDescHide").html('<img src="${Constants.URL}img/leftArrow.png" style="width: 100%;">');
                        count = 0;
                    }
		});
                var hideButton = document.getElementById('routeDescHide');
                google.maps.event.addDomListener(hideButton, 'click', function() {
                    $("#routeDescriptionLegend").animate({width: 'toggle'});
                    if (count == 0){
                        $("#routeDescHide").html('<img src="${Constants.URL}img/rightArrow.png" style="width: 100%;">');
                        count = 1;
                    }
                    else{
                        $("#routeDescHide").html('<img src="${Constants.URL}img/leftArrow.png" style="width: 100%;">');
                        count = 0;
                    }
                });*/
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

        <div class="s-new markerPageTable">
        <div class="breadcrumbsMarker">
                <ul class="breadcrumbsUlMarker">
                    <li><a href="${Constants.URL}index">Main</a><div class="right_arrow"> </div></li>
                    <li><a href="${Constants.URL}article/category/6">Routes</a><div class="right_arrow"> </div></li>
                    <li><a href="${Constants.URL}routesList">Trails</a><div class="right_arrow"> </div></li>
                    <li><a>${route.title}</a></li>
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
                <div class="markerPageTitle">${route.title}</div>
                <div class="markerPageText">
                    ${route.textUA}
                </div>
                <div id="map" style="width: 100%; height: 200px;"></div>
                <div id="holder" style="width: 100%;height:200px;margin-top:30px;"></div>
                <c:if test="${(imagesRoute[0])!=''}">
    <script type="text/javascript" src="${Constants.URL}js/article_gallery.js"></script>
                                    <div id="article_slider1_container" style="position: relative; top: 0px; left: 0px; width: 640px; height: 150px; overflow: hidden;">
                                        <div u="slides" style="cursor: move; position: absolute; left: 0px; top: 0px; width: 640px; height: 150px; overflow: hidden;">
                                            <c:forEach items="${imagesRoute}" var="image" varStatus="loop">
                                                <div onclick="set_main_picture('${Constants.URL}${image.img}','${loop.index}')">
                                                    <div class="sliderHover">
                                                        <div class="imageHoverMarkerPage"></div><img u="image" src="${Constants.URL}${image.img}" style="height: 150px"/>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                        <span u="arrowleft" class="markerPageArrowLeft jssora03l" style="width: 50px; height: 95px; top: 28px; left: 20px;">
                                        </span>
                                        <span u="arrowright" class="markerPageArrowRight jssora03r" style="width: 50px; height: 95px; top: 28px; right: 20px">
                                        </span>
                                    </div>
                                    <div class="article_main_image">
                                        <img id="main_image" src="${Constants.URL}<c:out value="${imagesRoute[0].img}" />" />
                                        <div class="mainImageSliderLine">
                                            <div id="imageCount">1</div>/${fn:length(imagesRoute)}
                                            &nbsp;&nbsp;
                                                ${route.title} Gallery
                                        </div>
                                    </div>
                </c:if>
            </div>
            <div class="markerRightDescr">
                <div class="otherNewsHeading">OTHER ROUTES</div>
            </div>
        </div>
    
    
</t:indexpage>