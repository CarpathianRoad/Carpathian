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
                margin-top: -30px;
                margin-bottom: 10px;
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
            var mapStyles = [{"featureType":"landscape","elementType":"labels","stylers":[{"visibility":"off"}]},
                {"featureType":"transit","elementType":"labels","stylers":[{"visibility":"off"}]},
                {"featureType":"poi","elementType":"labels","stylers":[{"visibility":"off"}]},
                {"featureType":"water","elementType":"labels","stylers":[{"visibility":"off"}]},
                {"featureType":"road","elementType":"labels.icon","stylers":[{"visibility":"off"}]},{"stylers":[{"hue":"#00aaff"},{"saturation":-100},{"gamma":2.15},{"lightness":12}]},
                {"featureType":"road","elementType":"labels.text.fill","stylers":[{"visibility":"on"},{"lightness":24}]},
                {"featureType":"road","elementType":"geometry","stylers":[{"lightness":57}]}];
            var standartStyle = [];
            var styleTrigger = false;
            
            $(document).ready(function() {
                $('.developpedText').addClass('developpedSmall');
                $('.footerHeight').addClass('footerHeightMap');
                $('.minHeight').removeClass('minHeight');
                $('.arrowRouteHide').css('margin-top',((window.innerHeight-152)/2)-24);
                $('#map').height(window.innerHeight-92); 
                $('.mainMenuIntend').addClass('mainMenuIntendSmall');
                
                if(window.innerWidth<800){
                    hideDescrRoute();
                }
                
                $('.projectFunded').addClass('footerDisplayNone');
                $('.footerRightMain').addClass('footerDisplayNone');
                $('.footerLeftMain').addClass('footerDisplayNone');
                $('.developpedText').addClass('developpedSmall');
                $('.footerHeight').addClass('footerHeightMap');
                $('.minHeight').removeClass('minHeight');
                $('#map').height(window.innerHeight-92);
                $('.siteMap').addClass('siteMapSmall');
                $('.mainMenuIntend').addClass('mainMenuIntendSmall');
                
                console.log(window.innerWidth);
                console.log(window.outerWidth);
                
                if((window.innerWidth<1024)&&(window.innerWidth>780)){
                    $('#map').height(window.innerHeight-157);
                    $('#mainMenuWidth').css('padding','5px 15px');
                }else if((window.innerWidth<=780)&&(window.innerWidth>680)){
                    $('.siteMap').css('display','none');
                    $('#googleMap').height(window.innerHeight-104);
                }else if((window.innerWidth>340)&&(window.innerWidth<=680)){
                    $('#map').height(window.innerHeight-84);
                    $('.footerNew').css('height','0');
                    $('.footerIntentInside').css('height','0');
                    $('.developpedText').css('width','90%');
                    $('#footer').removeClass('footerHeight');
                    $('#footer').removeClass('footerHeightMap');
                    $('#footer').css('height','90px !important');
                    $('.siteMap').css('display','none');
                }else if(window.innerWidth<=340){
                    $('#map').height(window.innerHeight-97);
                    $('.footerNew').css('height','0');
                    $('.footerIntentInside').css('height','0');
                    $('.developpedText').css('width','90%');
                    $('#footer').removeClass('footerHeight');
                    $('#footer').removeClass('footerHeightMap');
                    $('#footer').css('height','90px !important');
                    $('.siteMap').css('display','none');
                }else{
                    $('#map').height(window.innerHeight-114);
                    $('.footerNew').css('height','0');
                    $('.footerIntentInside').css('height','0');
                    $('.developpedText').css('width','90%');
                    $('#footer').removeClass('footerHeight');
                    $('#footer').removeClass('footerHeightMap');
                    $('#footer').css('height','90px !important');
                }
                $('.routeDescription').height($('#map').height());
                if(window.innerWidth<736){
                    $('.s-bot').css('margin-top','11px');
                } 
                if(window.innerWidth>780){
                    $('.hideMenu').css('visibility','visible');
                    $('.s-top').hide();
                    $('.topMenu').addClass('topMenuSmall');
                    $('.s-logoIndex').addClass('s-logoIndexSmall');
                    $('.s-logoIndexSmall').removeClass('s-logoIndex');
                    $('.s-rightNavBar').addClass('s-rightNavBarSmall');
                    $('.s-rightNavBarSmall').removeClass('s-rightNavBar');
                    $('.menuLineSmall').addClass('menuLineExtraSmall');
                    $('.carpathName').addClass('carpathNameSmall');
                    $('.carpathNameSmall').removeClass('carpathName');
                }else{
                    $('.hideMenu').css('display','none');
                }
            
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
                    var styledMap = new google.maps.StyledMapType(mapStyles,
                        {name: "Styled Map"});
                var latlng = new google.maps.LatLng(48.71, 22.41);
                var mapOptions = {
                  zoom: 11,
                  center: getCenter(),
                  //center: latlng,
                  mapTypeId: google.maps.MapTypeId.TERRAIN,
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
                       "${Constants.URL}img/markers/visual.png",
                        null, 
                        null, 
                        null, 
                        new google.maps.Size(30, 40)
                    ); 
                    var myLatlng = new google.maps.LatLng(x, y);
                    var markerPhoto = new google.maps.Marker({
                        position: myLatlng,
                        //map: map,
                        icon: pinIcon,
                        title: "${imgs.name}"
                    });
                    var info = '<div class="markerName" style="width: 100%; text-align:center;"><h3>${imgs.name}</h3></div>'+
                            '<div id="routeImage" style="width: 100%; padding-left:20px; padding-bottom:30px;"><img src="${Constants.URL}${imgs.img}" style="width: 100%;"></div>';
                    bindInfoWindow(markerPhoto, map, infowindow, info);
                    
                </c:forEach>
                
            map.controls[google.maps.ControlPosition.LEFT_TOP].push(
                document.getElementById('sliderDiv'));
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
                buildChart();
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
                    if(height.length>1000) 
                        i+=3
                }
                data.addRows(obj);
                chart = new google.visualization.ColumnChart(document.getElementById('holder'));
                chart.draw(data, {
                    legend: 'none',
                    titleY: 'Elevation (m)',
                    focusBorderColor: 'rgb(177,216,66)',
                    borderColor: 'rgb(84, 182, 157)',
                    hAxis: 'showTextEvery: 77777'
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
                            position: new google.maps.LatLng(xCoord[e.row*4],yCoord[e.row*4]),
                            map: map, 
                            icon: pinIcon        
                        });
                    } else {
                        mousemarker.setPosition(new google.maps.LatLng(xCoord[e.row*4],yCoord[e.row*4]));
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
            
        var styleCounter = 0;
        function changeStyle(){
            styleCounter++;
            if(styleCounter==2){
                if(styleTrigger){
                    styleTrigger = false;
                    map.setMapTypeId(google.maps.MapTypeId.TERRAIN);
                }
                else{
                    map.setMapTypeId(google.maps.MapTypeId.SATELLITE);
                    styleTrigger = true;
                }
                styleCounter=0;
            }
        }
        
        var descrHidden = false;
        function hideDescrRoute(){
            if(!descrHidden){
                $('.routeDescription').addClass('routeDescriptionSmall');
                $('.routeDescrOverflow').fadeOut('fast');
                $('#hideRouteImage').attr('src','${Constants.URL}img/arrow_left_hover.png');
                descrHidden = true;
            }
            else{
                $('.routeDescription').removeClass('routeDescriptionSmall');
                $('.routeDescrOverflow').fadeIn('slow');
                $('#hideRouteImage').attr('src','${Constants.URL}img/arrow_right_hover.png');
                descrHidden = false;
            }
        }
        console.log('${route.images}');
    
        </script>
    <div id="sliderDiv" class="sliderDivRoute">
        <label id="sliderLabel" onclick="changeStyle()">
            <input type="checkbox" />
            <span id="slider"></span>
        </label>
    </div>
        ${route.images}
        <div class="markerPageTable routeWidth">
        <div id="map" style="width: 100%;float: left;"></div>
            <div class="routesLinks routeDescription">
                <div class="arrowRouteHide" onclick="hideDescrRoute()"><img id="hideRouteImage" src="${Constants.URL}img/arrow_right_hover.png"></div>
                <div class="routeDescrOverflow">
                    <div class="markerPageTitle">${route.title}</div>
                    <div class="markerPageUnderHeading">
                        <div class="markerPageDate">
                            ${route.date}
                        </div>
                        <div class="markerPageCountry">
                            <img src="${Constants.URL}img/mapControlsImageSelected.png"/>
                            ${route.public_country}
                        </div>
                        <div class="markerPageCountry downloadRouteFile">
                            <a href="${Constants.URL}routes/${route.file}" download>Download track file</a>
                        </div>
                    </div>
                    <div id="holder" style="width: 100%;height:200px;margin-top:30px;"></div>
                    <div class="markerPageText">
                        ${route.textUA}
                    </div>
                            <script type="text/javascript" src="${Constants.URL}js/article_gallery.js"></script>
                                        <div id="article_slider1_container" style="position: relative; top: 0px; left: 0px; width: 640px; height: 150px; overflow: hidden;">
                                            <div id="imageHolder" u="slides" style="cursor: move; position: absolute; left: 0px; top: 0px; width: 640px; height: 150px; overflow: hidden;">
                                                
                                            </div>
                                            <span u="arrowleft" class="markerPageArrowLeft jssora03l" style="width: 50px; height: 95px; top: 28px; left: 20px;">
                                            </span>
                                            <span u="arrowright" class="markerPageArrowRight jssora03r" style="width: 50px; height: 95px; top: 28px; right: 20px">
                                            </span>
                                        </div>
                                        <div class="article_main_image">
                                            <div id="mainImageBlock"></div>
                                            <div class="mainImageSliderLine">
                                                <div id="imageCount">1</div><div id="maxImages"></div>
                                                &nbsp;&nbsp;
                                                    ${route.title} Gallery
                                            </div>
                                        </div>
                </div>
            </div>
        </div>
        <script>
            var images = '${route.images}'.split(",");
            var imagesBlock = '';
            $('#maxImages').html("/"+images.length);
            $('#mainImageBlock').html('<img id="main_image" src="${Constants.URL}'+images[0]+'"/>');
            if(images[0]==""){
                $('#article_slider1_container').css('display','none');
                $('#mainImageBlock').css('display','none');
                $('.mainImageSliderLine').css('display','none');
                $('.contentIntend').css('height','30'); 
            }else{
                $('.contentIntend').css('height','10');
            }
            
            for(var i = 0; i < images.length; i++){
                
                imagesBlock += '<div onclick="set_main_picture(\'${Constants.URL}'+images[i]+'\',\''+i+'\')">'+
                        '<div class="sliderHover">'+
                        '<div class="imageHoverMarkerPage"></div><img u="image" src="${Constants.URL}'+images[i]+'" style="height: 150px"/>'+
                        '</div>'+
                        '</div>';
            }
            $('#imageHolder').html(imagesBlock);
        </script>
    
</t:indexpage>