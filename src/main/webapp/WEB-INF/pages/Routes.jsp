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
                    var pointCounter;
                    if(height.length>1000) 
                        pointCounter = 4;
                    else
                        pointCounter = 1;
                    if (mousemarker == null) {
                        var pinIcon = new google.maps.MarkerImage(
                            "${Constants.URL}img/markers/walking.png",
                            null, 
                            null, 
                            null, 
                            new google.maps.Size(30, 40)
                        ); 
                        mousemarker = new google.maps.Marker({
                            position: new google.maps.LatLng(xCoord[e.row*pointCounter],yCoord[e.row*pointCounter]),
                            map: map, 
                            icon: pinIcon        
                        });
                    } else {
                        mousemarker.setPosition(new google.maps.LatLng(xCoord[e.row*pointCounter],yCoord[e.row*pointCounter]));
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
                //if(window.innerWidth>1400)
                    return (new google.maps.LatLng((parseFloat(minLat)+parseFloat(maxLat))/2, (parseFloat(minLon)+parseFloat(maxLon))/2+0.25));
                //else
                //    return (new google.maps.LatLng((parseFloat(minLat)+parseFloat(maxLat))/2, (parseFloat(minLon)+parseFloat(maxLon))/2));
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
                $('#hideRouteImage').attr('src','${Constants.URL}img/arrowRoutesHide.png');
                descrHidden = true;
            }
            else{
                $('.routeDescription').removeClass('routeDescriptionSmall');
                $('.routeDescrOverflow').fadeIn('slow');
                $('#hideRouteImage').attr('src','${Constants.URL}img/arrowRoutesShow.png');
                descrHidden = false;
            }
        }
        console.log('${route.images}');
    
        </script>
	<script src="${Constants.URL}js/lemmon-slider.js"></script> 
    <div id="sliderDiv" class="sliderDivRoute">
        <label id="sliderLabel" onclick="changeStyle()">
            <input type="checkbox" />
            <span id="slider"></span>
        </label>
    </div>
        <div class="markerPageTable routeWidth">
        <div id="map" style="width: 100%;float: left;"></div>
            <div class="routesLinks routeDescription">
                <div class="arrowRouteHide" onclick="hideDescrRoute()"><img id="hideRouteImage" src="${Constants.URL}img/arrowRoutesShow.png"></div>
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
                            <a class="not-add-lan" href="${Constants.URL}routes/${route.file}" download>Download track file</a>
                        </div>
                    </div>
                    <div id="holder" style="width: 100%;height:200px;margin-top:30px;"></div>
                    <div class="markerPageText">
                        ${route.textUA}
                    </div>
                    <div class="wrapSlider">
                            <div id="slider1" class="slider">
                                    <ul id="iamgesBlock" style="height: 150px;">     
                                    </ul>
                            </div>
                            <div class="controls">
                                    <a href="#" class="prev-page"></a>
                                    <div class="prev-slide"></div>
                                    <div style="display:none" class="next-slide"></div>
                                    <div class="next-page"></div>
                            </div>
                    </div>
                                    <div class="article_main_image">
                                    </div>
                </div>
            </div>
        </div>
    <link rel="stylesheet" href="${Constants.URL}js/fancybox/source/jquery.fancybox.css?v=2.1.5" type="text/css" media="screen" />
    <script type="text/javascript" src="${Constants.URL}js/fancybox/source/jquery.fancybox.pack.js?v=2.1.5"></script>
        <script>
            
            $(document).ready(function() {
                $(".fancybox").fancybox({
                    openEffect	: 'none',
                    closeEffect	: 'none'
                });
            var images = '${route.images}'.split(",");
            var imagesBlock = '';
            var imagesSlider = '';
            for(var i = 1; i < images.length; i++){
                imagesSlider+='<a class="fancybox not-add-lan" rel="gallery1" href="${Constants.URL}'+images[i]+'" />">'+
                                                    '<img id="main_image" src="${Constants.URL}'+images[i]+'" />" />'
            }
            $('.article_main_image').html('<a class="fancybox not-add-lan" rel="gallery1" href="${Constants.URL}'+images[0]+'">'+
                                                        '<img id="main_image" src="${Constants.URL}'+images[0]+'">'+
                                                    '</a>'+
                                        '<div style="display:none" >'+
                                        imagesSlider+
                                        '</div>'+
                                        '<div class="mainImageSliderLine">'+
                                            '<div id="imageCount">1</div>/'+images.length+
                                            '&nbsp;&nbsp;'+
                                                '${route.title} Gallery'+
                                        '</div>');
            
            $('#maxImages').html("/"+images.length);
            if(images[0]==""){
                $('#article_slider1_container').css('display','none');
                $('#mainImageBlock').css('display','none');
                $('.mainImageSliderLine').css('display','none');
                $('.contentIntend').css('height','30'); 
            }else{
                $('.contentIntend').css('height','10');
            }
            
            for(var i = 0; i < images.length; i++){
                
                imagesBlock += '<li style="cursor:pointer">'+
                                                '<div onclick="set_main_picture(\'${Constants.URL}'+images[i]+'\','+i+');tellFancyBox(\'${Constants.URL}'+images[i]+'\')">'+
                                                    '<div class="sliderHover">'+
                                                        '<img rel="gallery1" u="image" src="${Constants.URL}'+images[i]+'" style="height: 150px"/>'+
                                                '</div>'+
                                            '</li>';
            }
            $('#iamgesBlock').html(imagesBlock);
            
            });
            function tellFancyBox(image){
                $('#main_image').parent().attr('href',image);
            }
        jQuery(document).ready(function ($) {
            window.onload = function(){
                $( '#slider1' ).lemmonSlider({center:false}); 
            }
        });
        </script>
    
        
        <style>
            
        .prev-slide{
            background: url(${Constants.URL}img/arrow_left.png) center center no-repeat;
            width: 48px;
            height: 90px;
            cursor: pointer;
            position: absolute;
            left: 50;
        }
        .next-slide,.next-page{
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
        .next-slide:hover ,.next-page:hover{
            background: url(${Constants.URL}img/arrow_right_hover.png) center center no-repeat;
        }
        .wrapSlider { width:100%; height: 150 !important; margin-top: 0px;}
	body div.slider    { overflow:hidden; position:relative; width:100%; height:150px !important; }
	body div.slider ul { margin:0; padding:0; height:150px; }
	body div.slider li { float:left; list-style:none; margin:0; }
	body div.slider li { text-align:center; line-height:160px; font-size:25px; }
        .slider img{
            height: 150px;
        }
        .controls{
            position: relative;
            margin-top: -120px;
        }
        </style>
</t:indexpage>