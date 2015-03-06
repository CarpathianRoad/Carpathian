<%-- 
    Document   : map
    Created on : Jan 4, 2015, 11:36:28 PM
    Author     : kiwi
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:indexpage>
    
	<style>
		.markerName{
                    padding: 10px 10px 0px 8px;
                    font-size:30px;
                    font-weight: bold;
                    color: #353535;
                    line-height:120%;
                    width: 90%;
                    float: left;
		}
                #descriptionHideButton{
                    width: 10%;
                    margin-top: 20px;
                    float: right;
                    height: 100%;
                }
		.markerDescr{
                    padding: 5px 10px 12px 10px;
                    text-align: justify;
                    font-size:15px;
                    color: grey;
		}
		.coords{
                    padding: 0px 10px 12px 10px;
                    text-align: justify;
                    font-size:15px;
                    color: grey;
		}
		.markerImage{
                    padding: 10px 0px 0px 10px;
                    margin-right: 15px;
                    margin-bottom: 5px;
                    width: 50%;
                    float: left;
                    box-shadow: 10px 10px 5px #888888;
		}
		.infoBlock{
                    width: 100%;
                    height: 100%;
		}
		#legend {
                    background: white;
                    padding: 10px;
                    color: #754719;
                    font-size:15px;
                    opacity: 0.9;
                }
		#filterDiv {
                    background: white;
                    padding: 10px;
                    color: #754719;
                    font-size:15px;
                    opacity: 0.9;
                    height: 85%;
                    overflow-y: scroll;
                }
		html body div#markerDescription {
                    background: white;
                    padding: 10px;
                    color: #754719;
                    font-size:15px;
                    opacity: 0.9;
                    margin-bottom: 80px;
                    overflow: visible;
                    width:500px;
                    height: 500px;
		}
                #filterHide {
                    background: white;
                    color: #754719;
                    font-size:15px;
                    opacity: 0.9;
                }
                #descHide {
                    background: white;
                    color: #754719;
                    font-size:15px;
                    opacity: 0.9;
                    float: left;
                    margin-left: 10px;
                    margin-top: -15%;
                }
                li{
                    line-height: 0.6em;
                }
	</style>
    <script>
        var markers = [];
        var map;
        var markerCluster;
	var count = 1;
        
	function initialize() {
            var mapProp = {
                center:new google.maps.LatLng(48.6,22.5),
                zoom:9,
                mapTypeId:google.maps.MapTypeId.ROADMAP,
                disableDefaultUI: true
            };
            map=new google.maps.Map(document.getElementById("googleMap"),mapProp);
		
            var infowindow =  new google.maps.InfoWindow({
		content: ""
            });
            var filterNames = [];
            <c:forEach items="${markers}" var="marker">
                var markerIcons = "${marker.markerIcon}".split(",");
                var pinIcon = new google.maps.MarkerImage(
                    "${Constants.URL}img/brownmarkers/"+markerIcons[0]+".png",
                    null, 
                    null, 
                    null, 
                    new google.maps.Size(30, 40)
                ); 
                var photos = "${marker.image}".split(",");
                var images = "";
                for(var n = 0; n < photos.length; n++){
                    images = images + '<div class="markerImage"><img src="${Constants.URL}'+photos[n]+'" style="width: 100%;"></div>';
                    if(n==0){break;}
                };
                var x = "${marker.x}".substring(0, 7);
                var y = "${marker.y}".substring(0, 7);
                var info = '<div class="markerName">${marker.title}</div>' +
                    '<div id="descriptionHideButton"><img src="${Constants.URL}img/leftArrow.png" style="width: 50%; float: right; margin-right:15px;margin-top:-5px;"></div>' +
                    images +
                    '<div class="infoBlock"><div class="markerDescr">${marker.textEN}</div>'+
                    '<div class="coords">GPS('+x+','+y+')</div>'+
                    '<div class="coords"><h4><a class="btn btn-theme detailsButton" href="${Constants.URL}map/markers/${marker.id}">Details</a></h4></div></div>';
			
		var myLatlng = new google.maps.LatLng(${marker.x}, ${marker.y});
		var marker = new google.maps.Marker({
                    position: myLatlng,
                    map: map,
                    icon: pinIcon,
                    props: markerIcons,
                    country: "${marker.country}",
                    title: "${marker.title}"
		});
		markers.push(marker);
                filterNames.push(markerIcons[0]);
                bindDescription(marker,map, info);
                //bindInfoWindow(marker, map, infowindow, info);
            </c:forEach>
            
            filterNames = filterNames.unique();
            var filterHtml = "";
            for(var i = 0; i< filterNames.length; i++){
                filterHtml = filterHtml+'<div id="filter"><label><input type="checkbox" name="'+filterNames[i]+'" id="'+filterNames[i]+'" onclick="Markers(\''+filterNames[i]+'\')" checked="checked" />'+filterNames[i]+'</div>' ;
            }
            //var filterDiv = document.getElementById('filterDiv');
            //var div = document.createElement('div');
            //div.innerHTML = filterHtml;
            //div.innerHTML = '<div id="filter" style="margin-top:35px;">'+<c:forEach items="${filters}" var="filter">'<label><input type="checkbox" name="${filter}" id="${filter}" onclick="Markers(\'${filter}\')" checked="checked" />${filter}<br />' +</c:forEach> '</div>' 
            //filterDiv.appendChild(div);
            //$("#legend").html(filterHtml);
          
            var markerDescription = document.getElementById('markerDescription');
            var div = document.createElement('div');
            markerDescription.appendChild(div);
            map.controls[google.maps.ControlPosition.LEFT_BOTTOM].push(
		document.getElementById('markerDescription'));
		
            markerCluster = new MarkerClusterer(map, markers);
            map.controls[google.maps.ControlPosition.RIGHT_TOP].push(
                document.getElementById('filterDiv'));
            
                var hideButton = document.getElementById('filterHide');
                google.maps.event.addDomListener(hideButton, 'click', function() {
                    $("#legend").animate({width: 'toggle'});
                    $("#filter").animate({width: 'toggle'});
                    if (count == 0){
                        $("#filterHide").html('<img src="${Constants.URL}img/rightArrow.png" style="width: 100%;">');
                        count = 1;
                        getElementById('#googleMap').setAttribute("style","width:0%");
                        googleMap.style.width = "0%";
                        $('#filterDiv').css('height', 0);
                    }
                    else{
                        $("#filterHide").html('<img src="${Constants.URL}img/leftArrow.png" style="width: 100%;">');
                        count = 0;
                    }
                });
            
            if('${country}'!=''){
                console.log(markers.length);
                for (var i=0;i<markers.length;i++) {
                    console.log('${country}');
                    if((markers[i].country!='${country}')&&('${country}'!='allMap')){
                        markers[i].setMap(null);
                        markerCluster.removeMarker(markers[i]);
                    }
                }
            }
	}
	google.maps.event.addDomListener(window, 'load', initialize);
        
	$( document ).ready(function() {
            $("#markerDescription").animate({width: 'hide'});
            var descriptionDiv = document.getElementById('markerDescription');
            google.maps.event.addDomListener(descriptionDiv, 'click', function() {
                $("#markerDescription").animate({width: 'hide'});
            });
        });
        
	function bindInfoWindow(marker, map, infowindow, strDescription) {
		google.maps.event.addListener(marker, 'click', function() {
			infowindow.setContent(strDescription);
			infowindow.open(map, marker);
		});
	}
        
        function bindDescription(marker, map, info) {
		google.maps.event.addListener(marker, 'click', function() {
                    $("#markerDescription").animate({width: 'hide'});
                    setTimeout(function(){ 
                        document.getElementById("markerDescription").innerHTML = info; }, 250);
                    $("#markerDescription").animate({width: 'show'});
		});
	}
        
        function hideFilterSection(id){
            $( "#"+id ).slideToggle( "slow", function() {
            });
            if ($( "#"+id.substring(0,id.length-6)+"Hide").attr('src')=='${Constants.URL}img/hideMinus.png') {
                $( "#"+id.substring(0,id.length-6)+"Hide").attr('src', '${Constants.URL}img/showPlus.png');
            } else {
                $( "#"+id.substring(0,id.length-6)+"Hide").attr('src', '${Constants.URL}img/hideMinus.png');
            }
        }
        
	function Markers(type){
            if(type.length == 1){
		if (document.getElementById(type[0]).checked==false) {
                    for (var i=0;i<markers.length;i++) {
                        if(markers[i].props.indexOf(type[0])!=-1){
                            var show = false;
                            for(var j = 0; j<markers[i].props.length; j++){
                                if(document.getElementById(markers[i].props[j]).checked==true){
                                    show = true;
                                    var pinIcon = new google.maps.MarkerImage(
                                        "${Constants.URL}img/brownmarkers/"+markers[i].props[j]+".png",
                                        null, 
                                        null, 
                                        null, 
                                        new google.maps.Size(30, 40)
                                    ); 
                                    markers[i].icon=pinIcon;
                                    markers[i].setMap(null);
                                    markers[i].setMap(map);
                                    break;
                                }
                            }
                            if(!show){
                                markers[i].setMap(null);
                                markerCluster.removeMarker(markers[i]);
                            }
                        }
                    }
		} else {
                    for (var i=0;i<markers.length;i++) {
                        if((markers[i].props.indexOf(type[0])!=-1)&&(markers[i].map==null)){
                            markers[i].setMap(map);
                            markerCluster.addMarker(markers[i]);
                            var pinIcon = new google.maps.MarkerImage(
                                "${Constants.URL}img/brownmarkers/"+type[0]+".png",
                                null, 
                                null, 
                                null, 
                                new google.maps.Size(30, 40)
                            ); 
                            markers[i].icon=pinIcon;
                        }
                    }
		}
            } else {
                for(var k=1;k<type.length;k++){
                    if(document.getElementById(type[0]).checked == true){
                        document.getElementById(type[k]).checked = true;
                    }else{
                        document.getElementById(type[k]).checked = false;
                    }
                }
                for(var k=1;k<type.length;k++){
                    Markers([type[k]]);
                }
            }
	}
        
        Array.prototype.contains = function(v) {
            for(var i = 0; i < this.length; i++) {
                if(this[i] === v) return true;
            }
            return false;
        };

        Array.prototype.unique = function() {
            var arr = [];
            for(var i = 0; i < this.length; i++) {
                if(!arr.contains(this[i])) {
                    arr.push(this[i]);
                }
            }
            return arr; 
        }
    function borderButton(button){
        for (var i=0;i<markers.length;i++) {
            if((markers[i].country==button.substr(1,button.length))||(button=="#allMap")){
                markers[i].setMap(null);
                markerCluster.removeMarker(markers[i]);
                markers[i].setMap(map);
                markerCluster.addMarker(markers[i]);
            }
            else{
                markers[i].setMap(null);
                markerCluster.removeMarker(markers[i]);
            }
        }
        $('#allMap').removeClass( "buttonBorderClassMapPage" );
        $('#Poland').removeClass( "buttonBorderClassMapPage" );
        $('#Hungary').removeClass( "buttonBorderClassMapPage" );
        $('#Romania').removeClass( "buttonBorderClassMapPage" );
        $('#Slovakia').removeClass( "buttonBorderClassMapPage" );
        $('#Ukraine').removeClass( "buttonBorderClassMapPage" );
        $(button).addClass( "buttonBorderClassMapPage" );
    }
</script>
<div style="width:100%;height:700px; margin-top: -50px; margin-bottom: 50px;">
    <div class="mapCountries">
        <div class="indexMapMenu">
            <div class="countriesMapWidth">
                <ul>
                    <li><div class='mapButtonMapPage' id='allMap' onclick="borderButton('#allMap')">ALL COUNTRIES</div></li>
                    <li><div class='mapButtonMapPage' id='Poland' onclick="borderButton('#Poland')">POLAND</div></li>
                    <li><div class='mapButtonMapPage' id='Hungary' onclick="borderButton('#Hungary')">HUNGARY</div></li>
                    <li><div class='mapButtonMapPage' id='Romania' onclick="borderButton('#Romania')">ROMANIA</div></li>
                    <li><div class='mapButtonMapPage' id='Slovakia' onclick="borderButton('#Slovakia')">SLOVAKIA</div></li>
                    <li><div class='mapButtonMapPage' id='Ukraine' onclick="borderButton('#Ukraine')">UKRAINE</div></li>
                </ul>
            </div>
        </div>
        </div>
    <div id="filterDiv" style="padding-top: 0px;float:right;">
        <div id="filterHide" style="width:30px;height:30px;"><img src="${Constants.URL}img/rightArrow.png" style="width: 100%;"></div>
        <div id="legend" style="">
            <h3 style="margin-bottom: 0px;margin-left: -10px;">
                Filter
            </h3>
            <label><input type="checkbox" id="MonAndArch" 
                          onclick="Markers(['MonAndArch','ruins','museums','castle','palace','residense','village_tourism','skansens','techMon','warMon','church','unesco','arch'])" 
                          checked="checked" />Monuments and Architecture: </label>
            <img id="MonAndArchHide" src="${Constants.URL}img/hideMinus.png" onclick="hideFilterSection('MonAndArchFilter')" style="width: 15px;"><br><br>
            <ul id="MonAndArchFilter">
                <li style="list-style-type:none">
                    <label><input type="checkbox" id="museums" name="museums" onclick="Markers(['museums'])" checked="checked" />Museums</label><br>
                </li>
                <li style="list-style-type:none">
                    <label><input type="checkbox" id="castle" name="castle" onclick="Markers[(['castle'])" checked="checked" />Castle</label><br>
                </li>
                <li style="list-style-type:none">
                    <label><input type="checkbox" id="palace" name="palace" onclick="Markers(['palace'])" checked="checked" />Palace</label><br>
                </li>
                <li style="list-style-type:none">
                    <label><input type="checkbox" id="residense" name="residense" onclick="Markers(['residense'])" checked="checked" />Residense</label><br>
                </li>
                <li style="list-style-type:none">
                    <label><input type="checkbox" id="ruins" name="ruins" onclick="Markers(['ruins'])" checked="checked" />Ruins</label><br>
                </li>
                <li style="list-style-type:none">
                    <label><input type="checkbox" id="skansens"  onclick="Markers('')" checked="checked" />Skansens</label><br>
                </li>
                <li style="list-style-type:none">
                    <label><input type="checkbox" id="village_tourism" name="village_tourism" onclick="Markers(['village_tourism'])" checked="checked" />Administrative builds</label><br>
                </li>
                <li style="list-style-type:none">
                    <label><input type="checkbox" id="techMon" onclick="Markers('')" checked="checked" />Technical Monuments</label><br>
                </li>
                <li style="list-style-type:none">
                    <label><input type="checkbox" id="warMon" onclick="Markers('')" checked="checked" />War Monuments</label><br>
                </li>
                <li style="list-style-type:none">
                    <label><input type="checkbox" id="church" onclick="Markers('')" checked="checked" />Churches and monasteries</label><br>
                </li>
                <li style="list-style-type:none">
                    <label><input type="checkbox" id="unesco" onclick="Markers('')" checked="checked" />UNESCO monuments</label><br>
                </li>
                <li style="list-style-type:none">
                    <label><input type="checkbox" id="arch" onclick="Markers('')" checked="checked" />Architectural Interest</label><br>
                </li>
            </ul>
            <label><input type="checkbox" id="nature" onclick="Markers(['nature','forest_food','gardens','visual'])" checked="checked" />Nature: </label><img onclick="hideFilterSection('natureFilter')" id="natureHide" src="${Constants.URL}img/hideMinus.png" style="width: 15px;"><br>
            <ul id="natureFilter">
                <li style="list-style-type:none">
                    <label><input type="checkbox" id="forest_food" name="forest_food" onclick="Markers(['forest_food'])" checked="checked" />National Parks</label><br>
                </li>
                <li style="list-style-type:none">
                    <label><input type="checkbox"  onclick="Markers('')" checked="checked" />Lakes and Water Areas</label><br>
                </li>
                <li style="list-style-type:none">
                    <label><input type="checkbox"  onclick="Markers('')" checked="checked" />Waterfalls</label><br>
                </li>
                <li style="list-style-type:none">
                    <label><input type="checkbox"  onclick="Markers('')" checked="checked" />Ornithology</label><br>
                </li>
                <li style="list-style-type:none">
                    <label><input type="checkbox"  onclick="Markers('')" checked="checked" />Caves</label><br>
                </li>
                <li style="list-style-type:none">
                    <label><input type="checkbox"  onclick="Markers('')" checked="checked" />Geoparks</label><br>
                </li>
                <li style="list-style-type:none">
                    <label><input type="checkbox"  onclick="Markers('')" checked="checked" />Mountains</label><br>
                </li>
                <li style="list-style-type:none">
                    <label><input type="checkbox" id="gardens" name="gardens" onclick="Markers(['gardens'])" checked="checked" />National parks</label><br>
                </li>
                <li style="list-style-type:none">
                    <label><input type="checkbox"  onclick="Markers('')" checked="checked" />Zoo and animal parks</label><br>
                </li>
                <li style="list-style-type:none">
                    <label><input type="checkbox" id="visual" name="visual" onclick="Markers(['visual'])" checked="checked" />Specific natural wonders</label><br>
                </li>
            </ul>
            <label><input type="checkbox" onclick="Markers('')" checked="checked" />Culture and Traditions: </label><img onclick="hideFilterSection('cultureFilter')" id="cultureHide" src="${Constants.URL}img/hideMinus.png" style="width: 15px;"><br>
            <ul id="cultureFilter">
                <li style="list-style-type:none">
                    <label><input type="checkbox"  onclick="Markers('')" checked="checked" />Theaters</label><br>
                </li>
                <li style="list-style-type:none">
                    <label><input type="checkbox"  onclick="Markers('')" checked="checked" />Music</label><br>
                </li>
                <li style="list-style-type:none">
                    <label><input type="checkbox"  onclick="Markers('')" checked="checked" />Visual arts</label><br>
                </li>
                <li style="list-style-type:none">
                    <label><input type="checkbox"  onclick="Markers('')" checked="checked" />Movies</label><br>
                </li>
                <li style="list-style-type:none">
                    <label><input type="checkbox"  onclick="Markers('')" checked="checked" />Traditional Handicraft points</label><br>
                </li>
            </ul>
            <label><input type="checkbox" id="spa" onclick="Markers(['spa','wellness'])" checked="checked" />SPA: </label><img onclick="hideFilterSection('spaFilter')" id="spaHide" src="${Constants.URL}img/hideMinus.png" style="width: 15px;"><br>
            <ul id="spaFilter">
                <li style="list-style-type:none">
                    <label><input type="checkbox"  onclick="Markers('')" checked="checked" />Sauna</label><br>
                </li>
                <li style="list-style-type:none">
                    <label><input type="checkbox"  onclick="Markers('')" checked="checked" />SPA</label><br>
                </li>
                <li style="list-style-type:none">
                    <label><input type="checkbox" id="wellness" name="wellness" onclick="Markers(['wellness'])" checked="checked" />Sanatorium</label><br>
                </li>
                <li style="list-style-type:none">
                    <label><input type="checkbox"  onclick="Markers('')" checked="checked" />Swimming-pools and  Aqua-parks</label><br>
                </li>
                <li style="list-style-type:none">
                    <label><input type="checkbox"  onclick="Markers('')" checked="checked" />Thermal waters</label><br>
                </li>
                <li style="list-style-type:none">
                    <label><input type="checkbox"  onclick="Markers('')" checked="checked" />Beauty and barbers</label><br>
                </li>
                <li style="list-style-type:none">
                    <label><input type="checkbox"  onclick="Markers('')" checked="checked" />Mineral springs</label><br>
                </li>
            </ul>
            <label><input type="checkbox" id="gastronomy" onclick="Markers(['gastronomy','vine_bunker','tasting_hall'])" checked="checked" />Gastronomy: </label><img onclick="hideFilterSection('gastronomyFilter')" id="gastronomyHide" src="${Constants.URL}img/hideMinus.png" style="width: 15px;"><br>
            <ul id="gastronomyFilter">
                <li style="list-style-type:none">
                    <label><input type="checkbox"  onclick="Markers('')" checked="checked" />Restaurant</label><br>
                </li>
                <li style="list-style-type:none">
                    <label><input type="checkbox"  onclick="Markers('')" checked="checked" />Specialized Restaurant</label><br>
                </li>
                <li style="list-style-type:none">
                    <label><input type="checkbox"  onclick="Markers('')" checked="checked" />Cafe</label><br>
                </li>
                <li style="list-style-type:none">
                    <label><input type="checkbox"  onclick="Markers('')" checked="checked" />Bar</label><br>
                </li>
                <li style="list-style-type:none">
                    <label><input type="checkbox"  onclick="Markers('')" checked="checked" />Night Bar / Night Club</label><br>
                </li>
                <li style="list-style-type:none">
                    <label><input type="checkbox"  onclick="Markers('')" checked="checked" />Winery</label><br>
                </li>
                <li style="list-style-type:none">
                    <label><input type="checkbox" id="vine_bunker" name="vine_bunker" onclick="Markers(['vine_bunker'])" checked="checked" />Wine Cellar</label><br>
                </li>
                <li style="list-style-type:none">
                    <label><input type="checkbox" id="tasting_hall" name="tasting_hall" onclick="Markers(['tasting_hall'])" checked="checked" />Tasting room</label><br>
                </li>
            </ul>
            <label><input type="checkbox" onclick="Markers('')" checked="checked" />Accommodation: </label><img onclick="hideFilterSection('accFilter')" id="accHide" src="${Constants.URL}img/hideMinus.png" style="width: 15px;"><br>
            <ul id="accFilter">
                <li style="list-style-type:none">
                    <label><input type="checkbox"  onclick="Markers('')" checked="checked" />Hotels</label><br>
                </li>
                <li style="list-style-type:none">
                    <label><input type="checkbox"  onclick="Markers('')" checked="checked" />Apartments</label><br>
                </li>
                <li style="list-style-type:none">
                    <label><input type="checkbox"  onclick="Markers('')" checked="checked" />Camping’s</label><br>
                </li>
                <li style="list-style-type:none">
                    <label><input type="checkbox"  onclick="Markers('')" checked="checked" />Quest houses</label><br>
                </li>
                <li style="list-style-type:none">
                    <label><input type="checkbox"  onclick="Markers('')" checked="checked" />Motels</label><br>
                </li>
                <li style="list-style-type:none">
                    <label><input type="checkbox"  onclick="Markers('')" checked="checked" />Cottages</label><br>
                </li>
            </ul>
            <label><input type="checkbox" onclick="Markers('')" checked="checked" />Active rest: </label><img onclick="hideFilterSection('actFilter')" id="actHide" src="${Constants.URL}img/hideMinus.png" style="width: 15px;"><br>
            <ul id="actFilter">
                <li style="list-style-type:none">
                    <label><input type="checkbox"  onclick="Markers('')" checked="checked" />Ski and freeride</label><br>
                </li>
                <li style="list-style-type:none">
                    <label><input type="checkbox"  onclick="Markers('')" checked="checked" />Horses ride</label><br>
                </li>
                <li style="list-style-type:none">
                    <label><input type="checkbox"  onclick="Markers('')" checked="checked" />Bouldering stands</label><br>
                </li>
                <li style="list-style-type:none">
                    <label><input type="checkbox"  onclick="Markers('')" checked="checked" />Carting</label><br>
                </li>
                <li style="list-style-type:none">
                    <label><input type="checkbox"  onclick="Markers('')" checked="checked" />Diving</label><br>
                </li>
                <li style="list-style-type:none">
                    <label><input type="checkbox"  onclick="Markers('')" checked="checked" />Extreme bike tracks</label><br>
                </li>
                <li style="list-style-type:none">
                    <label><input type="checkbox"  onclick="Markers('')" checked="checked" />Paragliding</label><br>
                </li>
                <li style="list-style-type:none">
                    <label><input type="checkbox"  onclick="Markers('')" checked="checked" />Rafting</label><br>
                </li>
                <li style="list-style-type:none">
                    <label><input type="checkbox"  onclick="Markers('')" checked="checked" />Rally tracks (for rally cars, auto, etc.)</label><br>
                </li>
                <li style="list-style-type:none">
                    <label><input type="checkbox"  onclick="Markers('')" checked="checked" />Rock climbing</label><br>
                </li>
                <li style="list-style-type:none">
                    <label><input type="checkbox"  onclick="Markers('')" checked="checked" />Rope jumping</label><br>
                </li>
                <li style="list-style-type:none">
                    <label><input type="checkbox"  onclick="Markers('')" checked="checked" />Rope parks</label><br>
                </li>
                <li style="list-style-type:none">
                    <label><input type="checkbox"  onclick="Markers('')" checked="checked" />Zip-lines</label><br>
                </li>
            </ul>
            <label><input type="checkbox" onclick="Markers('')" checked="checked" />Shopping and tourist supplies: 
            </label><img onclick="hideFilterSection('shopFilter')" id="shopHide" src="${Constants.URL}img/hideMinus.png" style="width: 15px;"><br>
            <ul id="shopFilter">
                <li style="list-style-type:none">
                    <label><input type="checkbox"  onclick="Markers('')" checked="checked" />24/7</label><br>
                </li>
                <li style="list-style-type:none">
                    <label><input type="checkbox"  onclick="Markers('')" checked="checked" />Bike points</label><br>
                </li>
                <li style="list-style-type:none">
                    <label><input type="checkbox"  onclick="Markers('')" checked="checked" />Internet clubs</label><br>
                </li>
                <li style="list-style-type:none">
                    <label><input type="checkbox"  onclick="Markers('')" checked="checked" />Markets</label><br>
                </li>
                <li style="list-style-type:none">
                    <label><input type="checkbox"  onclick="Markers('')" checked="checked" />Emergency and pharmacy</label><br>
                </li>
                <li style="list-style-type:none">
                    <label><input type="checkbox"  onclick="Markers('')" checked="checked" />Petrol stations</label><br>
                </li>
                <li style="list-style-type:none">
                    <label><input type="checkbox"  onclick="Markers('')" checked="checked" />Shops</label><br>
                </li>
                <li style="list-style-type:none">
                    <label><input type="checkbox"  onclick="Markers('')" checked="checked" />Souvenirs</label><br>
                </li>
                <li style="list-style-type:none">
                    <label><input type="checkbox"  onclick="Markers('')" checked="checked" />Supermarkets</label><br>
                </li>
            </ul>
            <label><input type="checkbox" onclick="Markers('')" checked="checked" />Tourist equipment rental</label><br>
            <label><input type="checkbox" onclick="Markers('')" checked="checked" />Rescue team</label><br>
            <label><input type="checkbox" onclick="Markers('')" checked="checked" />Car rental</label><br>
            <label><input type="checkbox" onclick="Markers('')" checked="checked" />Transport connection
            </label> <img onclick="hideFilterSection('transportFilter')" id="transportHide" src="${Constants.URL}img/hideMinus.png" style="width: 15px;"><br>
            <ul id="transportFilter">
                <li style="list-style-type:none">
                    <label><input type="checkbox"  onclick="Markers('')" checked="checked" />Rail stations</label><br>
                </li>
                <li style="list-style-type:none">
                    <label><input type="checkbox"  onclick="Markers('')" checked="checked" />Bus stations</label><br>
                </li>
                <li style="list-style-type:none">
                    <label><input type="checkbox"  onclick="Markers('')" checked="checked" />Airports</label><br>
                </li>
                <li style="list-style-type:none">
                    <label><input type="checkbox"  onclick="Markers('')" checked="checked" />Metro</label><br>
                </li>
            </ul>
            <label><input type="checkbox" onclick="Markers('')" checked="checked" />Tourist information centers</label><br>
            
        </div>
    </div>
    <div id="googleMap" style="overflow: visible;width: 100%;height:700px;padding-top: 75px;"></div>
    
    <div style="overflow: visible;" id="markerDescription">
    </div>
</div>    
    
 </t:indexpage>