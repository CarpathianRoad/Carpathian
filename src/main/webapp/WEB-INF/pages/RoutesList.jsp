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
    <link rel="stylesheet" href="${Constants.URL}css/jquery.dataTables.min.css">
    <script src="${Constants.URL}js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="${Constants.URL}js/date-de.js"></script>
    <script>
        var files = [];
        var types = [];
        var categories = [];
        var countries = [];
    </script>
    <style>
        @media (max-device-width: 780px){
            .newsImage{
                display: none;
            }
            .newsImageUnderline{
                display: none;
            }
        }
        @media (max-width: 360px){
            .newsImage{
                display: none;
            }
            .newsImageUnderline{
                display: none;
            }
        }
        .dataTables_length, .dataTables_filter{
            display: none;
        }
        thead, tfoot{
            font: 12pt 'Open Sans';
            font-weight: 100;
            color: rgb(86,105,143);
        }
        tbody{
            font: 10pt 'Open Sans';
            font-weight: 100;
            color: rgb(86,105,143);
        }
        table a{
            font: 10pt 'Open Sans';
            font-weight: 100;
            color: rgb(86,105,143);
        }
        th{
            font: 10pt 'Open Sans';
            font-weight: 100;
            color: rgb(86,105,143);
            text-align: justify;
        }
        .dataTables_info, .dataTables_paginate,.dataTables_wrapper .dataTables_paginate .paginate_button.disabled, .dataTables_wrapper .dataTables_paginate .paginate_button.disabled:hover, .dataTables_wrapper .dataTables_paginate .paginate_button.disabled:active{
            color: rgb(86,105,143) !important;
        }
        table.dataTable tfoot th, table.dataTable tfoot td{
            border-top: none;
        }
        .all_news{
            width: 980px;
            margin: 0 auto;
        }
        tfoot {
            display: none;
        }
        tfoot input{
            margin: 0 -15px;
            width: 100px;
        }
        #table-pagination_info{
            display: none;
        }
        .difficultyBlock a{
            width: 100%;
            display: block;
            color: rgba(0,0,0,0);
        }
        .difficultyBlock a:hover{
            color: rgba(0,0,0,0) !important;
        }
        .difficultyBlock a:focus{
            color: rgba(0,0,0,0) !important;
        }
        .difficultyBlock a:visited{
            color: rgba(0,0,0,0) !important;
        }
        .routeTypeSplit{
            color: rgba(0,0,0,0) !important;
        }
        .routeTypeSplit:hover{
            color: rgba(0,0,0,0) !important;
        }
        .routeTypeSplit:focus{
            color: rgba(0,0,0,0) !important;
        }
        .routeTypeSplit:visited{
            color: rgba(0,0,0,0) !important;
        }
        .routeTypeSplit:visited:hover{
            color: rgba(0,0,0,0) !important;
        }
        .dataTables_wrapper .dataTables_paginate .paginate_button:hover{
            border: 1px solid rgb(84, 182, 157);
            background-color: none;
            background: none;
            color: rgb(84, 182, 157) !important;
        }
        table.dataTable thead th{
            padding: 10px 15px 10px 5px !important;
            text-align: center;
        }
        table.dataTable tbody th, table.dataTable tbody td{
            padding: 8px 5px;
            vertical-align: middle;
            display: table-cell;
        }
        table.dataTable thead th, table.dataTable thead td {
            border-bottom: none;
        }
        .paginate_button.previous img, .paginate_button.next img {
            width: 10px;
        }
        .dataTables_wrapper .dataTables_paginate .paginate_button {
            padding: 0;
        }
        .dataTables_wrapper .dataTables_paginate .paginate_button.current, .dataTables_wrapper .dataTables_paginate .paginate_button.current:hover {
            background: none;    
            color: #FFF !important;
    border: 1px solid #56698F;
    /* color: #fff; */
    background-color: #56698F;
    border-radius: 3px;
        }
        .paging_simple_numbers {
           margin-top: 15px; 
        }
        strong span{
            display: none;
        }
        .routeTypeSplit span{
            display: none;
        }
        .difficultyLink span{
            display: none;
        }
        .difficultyLink{
            display: table;
        }
        #table-pagination{
            visibility: hidden;
        }
    </style>
    <div class="s-new widthClass">
        <input type="hidden" id="page_type" value="routes" />
        <input type="hidden" id="last_item" value="9" />
        <input type="hidden" id="contstants" value="${Constants.URL}" />
        <input type="hidden" id="lan" value="${lan}" />
        <input type="hidden" id="count" value="${count}" />
        <div class="s-new markerPageTable">
            <div class="breadcrumbsMarker">
                <div class="countriesFilter countriesFilterRoute">
                    <input type="hidden" id="selected_country" value="all"/>
                    <div class="filterRoutesFin"><a id="all" onclick="countryFilter('');" class="selected_country" >${titles.countryALL}</a></div>
                    <div class="filterRoutesFin"><a id="UACountryFilter" onclick="countryFilter('UA');" >${titles.countryUA}</a></div>
                    <div class="filterRoutesFin"><a id="PLCountryFilter" onclick="countryFilter('PL');" >${titles.countryPL}</a></div>
                    <div class="filterRoutesFin"><a id="HUCountryFilter" onclick="countryFilter('HU');" >${titles.countryHU}</a></div>
                    <div class="filterRoutesFin"><a id="ROCountryFilter" onclick="countryFilter('RO');" >${titles.countryRO}</a></div>
                    <div class="filterRoutesFin"><a id="SKCountryFilter" onclick="countryFilter('SK');" >${titles.countrySK}</a></div>
                </div>
                <div class="tripMethod">
                    <input type="hidden" id="selected_type" onclick="typeFilter('');"/>
                    <div id="canoe" class="tripFilterText"><a onclick="typeFilter('canoe');">${titles.routeWAT}</a></div>
                    <div id="horse" class="tripFilterText"><a onclick="typeFilter('horse');">${titles.routeHOR}</a></div>
                    <div id="ski" class="tripFilterText"><a onclick="typeFilter('ski');">${titles.routeSKI}</a></div>
                    <div id="bike" class="tripFilterText"><a onclick="typeFilter('bike');">${titles.routeBIC}</a></div>
                    <div id="walk" class="tripFilterText"><a onclick="typeFilter('walk');">${titles.routeWAL}</a></div>
                    <div id="all_type" class="tripFilterText selectedCountryTrip"><a onclick="typeFilter('');">${titles.routeALL}</a></div>
                </div>
            </div>
        </div>
            <div class="all_news" id="routesList">        
                <table class="table table-bordered" id="table-pagination" data-height="400" data-pagination="true">
                    <thead>
                        <tr>
                            <th class="centred">${titles.country}</th>
                            <th>${titles.type}</th>
                            <th class="route-title">${titles.title}</th>
                            <th>${titles.difficulty}</th>
                            <th>${titles.duration}</th>
                            <th>${titles.length}</th>
                            <th>${titles.description}</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>${titles.country}</th>
                            <th>${titles.type}</th>
                            <th class="route-title">${titles.title}</th>
                            <th>${titles.difficulty}</th>
                            <th>${titles.duration}</th>
                            <th>${titles.length}</th>
                            <th>${titles.description}</th>
                        </tr>
                    </tfoot>
                    <tbody>
                <c:forEach items="${routesList}" var="route" varStatus="loop">
                    <!--
                    <div class="s-cell" id="routeBlock${loop.index}">
                        <div class="s-block newsHeight">
                            <div class="newsImage">
                                <a href="${Constants.URL}routes/${route.id}">
                                    <div class="imageHover">
                                        <div class="imageHoverDate">
                                            ${route.date}
                                ${route.file}
                                        </div>
                                        <div class="imageHoverCountry">
                                            <div class="newsCountryText">${route.public_country}</div><img src="${Constants.URL}img/newsImageHover.png">
                                        </div>
                                        <div class="routeType" id="type${loop.index}"></div>
                                        <div class="routeType" id="category${loop.index}"></div>
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
                    </div> -->  
                        <tr title="Read more" style="cursor: pointer" id="routeBlock${loop.index}">
                            <th style="text-align: center;vertical-align: middle;"><a style="font-size: 18px;" href="${Constants.URL}${lan}routes/${route.id}"><strong>${route.public_country}<span>CountryFilter</span></strong></a></th>
                            <th style="text-align: center"><a class="routeTypeSplit" href="${Constants.URL}${lan}routes/${route.id}">${route.type}</a></th>
                            <th style="text-align: center; vertical-align: middle;"><a href="${Constants.URL}${lan}routes/${route.id}">${route.title}</a></th>
                            <th style="text-align: center"><div class="difficultyBlock"><a class="difficultyLink" href="${Constants.URL}${lan}routes/${route.id}">${route.difficulty}</a></div></th>
                            <th style="text-align: center"><a href="${Constants.URL}${lan}routes/${route.id}">${route.duration}</a></th>
                            <th style="text-align: center"><a href="${Constants.URL}${lan}routes/${route.id}">${route.length}</a></th>
                            <th><a href="${Constants.URL}${lan}routes/${route.id}">${route.textUA}</a></th>
                        </tr>
                        <script>console.log("${Constants.URL}${lan}routes/${route.id}");</script>
                </c:forEach>
                    </tbody>
                </table>
            </div>
                 <div class="loading_block">
                    <img src="${Constants.URL}img/status.gif" />
                </div>
    </div>
                        
				<div style="display:none;" id="pagination">
					<span class="all">Page 1 of 3</span>
					<span class="current">1</span>
					<a href="#" class="inactive">2</a>
					<a href="#" class="inactive">3</a>
				</div>
        <script>
            var table;
            var countrySelected = "";
            var typeSelected = "";
            $(document).ready(function() {
    
    $(".routeTypeSplit").each(function(){
        var temp = $(this).text().split(',');
        for(var i = 0; i < temp.length; i++){
            $(this).text("");
            switch(temp[i]){
                    case "1":
                        $(this).html('<img style="width: 40px;" src="${Constants.URL}img/walk.png"><span>walk.png</span>');
                        break;
                    case "2":
                        $(this).html('<img style="width: 40px;" src="${Constants.URL}img/bike.png"><span>bike.png</span>');
                        break;
                    case "3":
                        $(this).html('<img style="width: 40px;" src="${Constants.URL}img/ski.png"><span>ski.png</span>');
                        break;
                    case "4":
                        $(this).html('<img style="width: 40px;" src="${Constants.URL}img/horse.png"><span>horse.png</span>');
                        break;
                    case "5":
                        $(this).html('<img style="width: 40px;" src="${Constants.URL}img/canoe.png"><span>canoe.png</span>');
                        break;
                }
        }
    });
    $(".difficultyLink").each(function(){
        switch($(this).text()){
            case "1":
                $(this).html("<img style='width: 55px;' src='${Constants.URL}img/sq_green.png' /><span>1</span>");
                break;
            case "2":
                $(this).html("<img style='width: 55px;' src='${Constants.URL}img/sq_blue.png' /><span>2</span>");
                break;
            case "3":
                $(this).html("<img style='width: 55px;' src='${Constants.URL}img/sq_yellow.png' /><span>3</span>");
                break;
            case "4":
                $(this).html("<img style='width: 55px;' src='${Constants.URL}img/sq_red.png' /><span>4</span>");
                break;
        }
        
    });
    $(".routeCategorySplit").each(function(){
        var temp = $(this).text().split(',');
        for(var i = 0; i < temp.length; i++){
            $(this).text("");
                switch(temp[i]){
                    case "4":
                        $(this).text($(this).text()+'International tourist road (E or R)');
                        break;
                    case "1":
                        $(this).text($(this).text()+'National tourist road');
                        break;
                    case "2":
                        $(this).text($(this).text()+'Regional tourist road');
                        break;
                    case "3":
                        $(this).text($(this).text()+'District tourist road');
                        break;
                    case "0":
                        $(this).text($(this).text()+'Local (excursion) tourist road');
                        break;
                }
        }
    });
 
    // DataTable
    setTimeout(function(){
    table = $('#table-pagination').DataTable({
                        columnDefs: [
                            { type: 'date-eu', targets: 3,orderable: false, targets: -1  }
                        ],
                        "dom": 'Zlfrtip'
                    });
    $('#table-pagination tfoot th').each( function () {
        var title = $(this).text();
        $(this).html( '<input id="'+title+'Search" type="text" placeholder="Search '+title+'" />' );
    } );
    table.columns().every( function () {
        var that = this;
 
        $( 'input', this.footer() ).on( 'keyup change', function () {
            if ( that.search() !== this.value ) {
                that
                    .search( this.value )
                    .draw();
            }
        } );
    } );
    $('#table-pagination').css('visibility', 'visible');
    }, 500);
    $(".route-title").css("width","140px");
} );

    function countryFilter(filter){
        countrySelected = filter;
        $('#UACountryFilter').removeClass('selected_country');
        $('#all').removeClass('selected_country');
        $('#PLCountryFilter').removeClass('selected_country');
        $('#ROCountryFilter').removeClass('selected_country');
        $('#SKCountryFilter').removeClass('selected_country');
        $('#HUCountryFilter').removeClass('selected_country');
        $('#'+filter+'CountryFilter').addClass('selected_country');
        if(filter == '')
            $('#all').addClass('selected_country');
        table.search(typeSelected + " " + countrySelected+"CountryFilter").draw();
    }
    
    function typeFilter(filter){
        typeSelected = filter+'.png';
        $('#canoe').removeClass('selectedCountryTrip');
        $('#walk').removeClass('selectedCountryTrip');
        $('#bike').removeClass('selectedCountryTrip');
        $('#horse').removeClass('selectedCountryTrip');
        $('#ski').removeClass('selectedCountryTrip');
        $('#all_type').removeClass('selectedCountryTrip');
        $('#'+filter).addClass('selectedCountryTrip');
        console.log(filter);
        if(filter == '')
            $('#all_type').addClass('selectedCountryTrip');
        table.search(typeSelected + " " + countrySelected+"CountryFilter").draw();
    }
    /*
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
        
            for(var n = 0; n < types.length; n++){
                switch(types[n]){
                    case "1":
                        $('#type'+n).html('Walking route');
                        break;
                    case "2":
                        $('#type'+n).html('Bicycle route');
                        break;
                    case "3":
                        $('#type'+n).html('Ski route');
                        break;
                    case "4":
                        $('#type'+n).html('Horses route');
                        break;
                    case "5":
                        $('#type'+n).html('Water route');
                        break;
                }
                switch(categories[n]){
                    case "4":
                        $('#category'+n).html('International tourist road (E or R)');
                        break;
                    case "1":
                        $('#category'+n).html('National tourist road');
                        break;
                    case "2":
                        $('#category'+n).html('Regional tourist road');
                        break;
                    case "3":
                        $('#category'+n).html('District tourist roade');
                        break;
                    case "0":
                        $('#category'+n).html('Local (excursion) tourist road');
                        break;
                }
            }
            build_route(files);
            function build_route(files_array)
                {
                    countRoute = 0;           
                    for(var count = 0; count < '${fn:length(routesList)}'; count++){
                            if (window.XMLHttpRequest){
                                xmlhttp=new XMLHttpRequest();
                            }
                            else{
                                xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
                            }
                            xmlhttp.open("GET","${Constants.URL}routes/"+files_array[count],false);
                            xmlhttp.send();
                            xmlDoc=xmlhttp.responseXML;
                            $.ajax({
                                type: "GET",
                                url: "${Constants.URL}routes/"+files_array[count],
                                dataType: "xml",
                                success: parseXml
                            });
                    }   
                console.log(files);
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
                      zoom: 11,
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
            files = [];
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
            
            function countryFilter(country){
                for(var n = 0; n < types.length; n++){
                    var selected_country = jQuery("#selected_country").val();
                    jQuery( "#"+selected_country).removeClass( "selected_country" );
                    jQuery( "#"+country ).addClass( "selected_country" );
                    jQuery("#selected_country").val(country);
                    jQuery("#last_item").val("9");
                    if(countries[n]!=country){
                        $('#routeBlock'+n).css('display','none');
                    }else{
                        $('#routeBlock'+n).css('display','block');
                    }
                    if(country=='all')
                        $('#routeBlock'+n).css('display','block');
                }
            }*/
        </script> 
</t:indexpage>