<%-- 
    Document   : indexpage
    Created on : Jan 11, 2015, 12:06:49 PM
    Author     : kiwi
--%>

<%@tag description="Index Page Template" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<jsp:useBean id="Constants" class="ua.aits.Carpath.functions.Constants" scope="session"/>

<html>
<head>
    <link href="${Constants.URL}img/favicon2.ico" rel="shortcut icon" type="image/x-icon" />
    <title>Carpathian Tourist Road</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"
        type="text/javascript"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="${Constants.URL}css/style1.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${Constants.URL}js/spasticNav.js"></script>
    <script type="text/javascript" src="${Constants.URL}js/jssor.slider.mini.js"></script>
    <script src="${Constants.URL}js/slider/jquery.bxslider.min.js"></script>
    <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=true"></script>
    <script src="http://google-maps-utility-library-v3.googlecode.com/svn/trunk/markerclusterer/src/markerclusterer.js" type="text/javascript"></script>
    <link href="${Constants.URL}js/slider/jquery.bxslider.css" rel="stylesheet" />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,800,700' rel='stylesheet' type='text/css'>
    <style>
	label.css-label {
            background-image:url(http://csscheckbox.com/checkboxes/u/csscheckbox_cf6353ab7cdbfbd4f8cf2b5189d35a11.png);
            -webkit-touch-callout: none;
            -webkit-user-select: none;
            -khtml-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
	}
    </style>
</head>
<body>
    <div class="">
	<div class="row indexNavbar topMenu">
            <div class='s-new' id="mainMenuWidth">
		<div class="s-logoIndex">
                    <a href="${Constants.URL}index">
                        <img src="${Constants.URL}img/logo_4.png">
                    </a>
		</div>
		<div class="s-rightNavBar">
                    <div class="s-top">
			<div class="s-three">
                            <ul>
				<li class="paddingLang"><a style="color:rgb(174,214,43)" href="#">EN</a></li>
                                <li class="paddingLang"><a href="#">UA</a></li>
				<li class="paddingLang"><a href="#">SK</a></li>
				<li class="paddingLang"><a href="#">HU</a></li>
				<!--
                                <li class="paddingLang"><a href="#">PL</a></li>
				<li class="paddingLang"><a href="#">RO</a></li>
    -->
                            </ul>
			</div>
			<div class="s-two">
                            <a href="https://uk-ua.facebook.com/people/Ard-Transcarpathia/100008981281491" target="_blank">
                                <img class="s-socialLogo intendSocial" src="${Constants.URL}img/fb_icon.png"
                                    onmouseover="$(this).hide();this.src='${Constants.URL}img/fb_icon_hover.png';$(this).fadeIn(100);" 
                                    onmouseout="$(this).hide();this.src='${Constants.URL}img/fb_icon.png';$(this).fadeIn(100);" 
                                    border="0">
                            </a>
                            <a href="https://twitter.com/CarpathianRoad" target="_blank">
                                <img class="s-socialLogo" src="${Constants.URL}img/tw_icon.png"
                                    onmouseover="$(this).hide();this.src='${Constants.URL}img/tw_icon_hover.png';$(this).fadeIn(100);" 
                                    onmouseout="$(this).hide();this.src='${Constants.URL}img/tw_icon.png';$(this).fadeIn(100);" 
                                    border="0">
                            </a>
			</div>
			<div class="s-one">
                            <form class="searchMenu">
				<button type="button" id="searchButton" onclick="showButton()">
                                    <div class=""><img src="${Constants.URL}img/search_icon.png"
                                        onmouseover="$(this).hide();this.src='${Constants.URL}img/search_icon_hover.png';$(this).fadeIn(100);
                                            $('#searchButton').css('top','4px')"
                                        onmouseout="$(this).hide();this.src='${Constants.URL}img/search_icon.png';$(this).fadeIn(100);
                                            $('#searchButton').css('top','3px')">
                                    </div>
				</button>
                                <input type="text" id="s-textbox">
				</input>
                                <button id="searchButtonActive">
                                    <div class=""><img src="${Constants.URL}img/search_icon_active.png">
                                    </div>
				</button>
                            </form>
			</div>
                    </div>
                    <div class="s-clear"></div>
                    <div class="s-bot" id='cssmenu'>
                        <ul class="dropDownMenu">
                            <li><a href="${Constants.URL}index">HOME<div class="bottom-caret"></div><div id="homeMenu"></div></a>
                                <ul>
                                    <div class="menuLine"></div>
                                    <li class="homeSub"><a href="#">ABOUT CARPATHIAN REGION</a></li>
                                    <li class="homeSub"><a href="#">ABOUT "CARPATHIAN TOURIST ROAD"</a></li>
                                    <li class="homeSub"><a href="#">ABOUT COUNTRIES AND CITIES</a></li>
				</ul>
                            </li>
                            <li><a href="${Constants.URL}article/category/6">INFO<div class="bottom-caret"></div><div id="infoMenu"></div></a>
                                <ul>
                                    <div class="menuLine"></div>
                                    <li><a href="#">ACCOMODATION<span class="right-caret"></span></a>
                                        <ul>
                                            <li><a href="#">APARTMENTS</a></li>
                                            <li><a href="#">CAMPINGS</a></li>
                                            <li><a href="#">QUEST HOUSES</a></li>
                                            <li><a href="#">HOSTELS</a></li>
                                            <li><a href="#">HOTELS</a></li>
                                            <li><a href="#">MOTELS</a></li>
					</ul>
                                    </li>
                                    <li><a href="#">SHOPPING AND TOURIST SUPPLY<span class="right-caret"></span></a>
                                        <ul>
                                            <li><a href="#">24/7</a></li>
                                            <li><a href="#">BIKE POINTS</a></li>
                                            <li><a href="#">INTERNET CLUBS</a></li>
                                            <li><a href="#">MARKETS</a></li>
                                            <li><a href="#">EMERGENCY AND PHARMACY</a></li>
                                            <li><a href="#">PETROL STATIONS</a></li>
                                            <li><a href="#">SHOPS</a></li>
                                            <li><a href="#">SOUVENIRS</a></li>
                                            <li><a href="#">SUPERMARKETS</a></li>
					</ul>
                                    </li>
                                    <li><a href="#">TOURIST EQUIPMENT RENTAL</a></li>
                                    <li><a href="#">RESCUE TEAM</a></li>
                                    <li><a href="#">CAR RENTAL</a></li>
                                    <li><a href="#">INFORMATION ABOUT VISUM</a></li>
                                    <li><a href="#">TRANSPORT CONNECTION</a></li>
                                    <li><a href="#">TOURIST INFORMATION CENTERS</a></li>
				</ul>
                            </li>
                            <li><a href="${Constants.URL}article/category/4">LEISURE<div class="bottom-caret"></div><div id="leisureMenu"></div></a>
                                <ul class="leisureMenu">
                                    <div class="menuLine"></div>
                                    <li><a href="#">ACTIVE REST<span class="right-caret"></span></a>
                                        <ul>
                                            <li><a href="#">SKI AND FREERIDE</a></li>
                                            <li><a href="#">HORSES RIDE</a></li>
                                            <li><a href="#">BOULDERING STANDS</a></li>
                                            <li><a href="#">CARTING</a></li>
                                            <li><a href="#">DIVING</a></li>
                                            <li><a href="#">EXTREME BIKE TRACKS</a></li>
                                            <li><a href="#">PARAGLIDING</a></li>
                                            <li><a href="#">RAFTING</a></li>
                                            <li><a href="#">RALLY TRACKS(FOR RALLY CARS, AUTO, ETC)</a></li>
                                            <li><a href="#">ROCK CLIMBING</a></li>
                                            <li><a href="#">ROPE JUMPING</a></li>
                                            <li><a href="#">ZIP LINES</a></li>
					</ul>
                                    </li>
                                    <li><a href="#">GASTRONOMY<span class="right-caret"></span></a>
                                        <ul>
                                            <li><a href="#">CHEES</a></li>
                                            <li><a href="#">VINE</a></li>
                                            <li><a href="#">HONEY</a></li>
                                            <li><a href="#">TRADITIONAL FOOD FESTIVAL</a></li>
					</ul>
                                    </li>
                                    <li><a href="#">RELIGION</a></li>
                                    <li><a href="#">NATURE<span class="right-caret"></span></a>
                                        <ul>
                                            <li><a href="#">CAVES</a></li>
                                            <li><a href="#">LAKES</a></li>
                                            <li><a href="#">MONTAINS</a></li>
                                            <li><a href="#">NATIONAL PARKS</a></li>
                                            <li><a href="#">WATERFALLS</a></li>
                                            <li><a href="#">ZOO AND ANIMAL PARKS</a></li>
                                            <li><a href="#">SPECIFIC NATURAL WONDERS</a></li>
					</ul>
                                    </li>
                                    <li><a href="#">ARCHITECTURE AND MONUMENTS<span class="right-caret"></span></a>
					<ul>
                                            <li><a href="#">ADMINISTRATIVE BUILDINGS</a></li>
                                            <li><a href="#">CASTLES</a></li>
                                            <li><a href="#">CHURCHES AND MONASTERIES</a></li>
                                            <li><a href="#">PALACES</a></li>
                                            <li><a href="#">RESIDENCES</a></li>
                                            <li><a href="#">RUINS</a></li>
                                            <li><a href="#">UNESCO</a></li>
					</ul>
                                    </li>
                                    <li><a href="#">SPA AND RECREATIONS<span class="right-caret"></span></a>
					<ul>
                                            <li><a href="#">BEAUTY AND BARBERS</a></li>
                                            <li><a href="#">SANATORIUM</a></li>
                                            <li><a href="#">SAUNA</a></li>
                                            <li><a href="#">SPA</a></li>
                                            <li><a href="#">SWIMMING POOLS AND AQUA PARKS</a></li>
                                            <li><a href="#">THERMAL WATERS</a></li>
                                            <li><a href="#">MINERAL SPRINGS</a></li>
					</ul>
                                    </li>
                                    <li><a href="#">EVENT TOURISM</a></li>
                                    <li><a href="#">DOMESTIC AND CULTURE TOURISM<span class="right-caret"></span></a>
					<ul>
                                            <li><a href="#">FEEDS AND TRADITIONS</a></li>
                                            <li><a href="#">FOLKLORE</a></li>
                                            <li><a href="#">MUSIC TRADITIONS</a></li>
                                            <li><a href="#">RELIGIONS</a></li>
                                            <li><a href="#">CALENDAR EVENT TRADITIONS</a></li>
					</ul>
                                    </li>
                                    <li><a href="#">BUISENESS TOURISM</a></li>
                                </ul>
                            </li>
                            <li><a href="${Constants.URL}article/news">NEWS<div id="homeMenu"></div><div id="newsMenu"></div></a>
                                <ul class="s-newsMenu">
                                    <div class="menuLineSmall"></div>
                                    <li></li>
				</ul>
                            </li>
                            <li><a href="${Constants.URL}map">MAP<div id="homeMenu"></div><div id="mapMenu"></div></a>
				<ul class="s-mapMenu">
                                    <div class="menuLineSmallMap"></div>
                                    <li></li>
				</ul>
                            </li>
                            <li><a href="">TOURIST ROADS<div class="bottom-caret"></div><div id="routesMenu"></div></a>
                                <ul class="routesMenu">
                                    <div class="menuLine"></div>
                                    <li><a href="${Constants.URL}routesList">TRAILS</a></li>
                                    <li><a href="">THEMATIC ROUTES</a></li>
				</ul>
                            </li>
                            <li><a href="${Constants.URL}contact">CONTACTS<div class="bottom-caret"></div><div id="contactsMenu"></div></a>
                                <ul class="s-menu">
                                    <div class="menuLine"></div>
                                    <li class="s-menu"><a href="#">PARTNERS</a></li>
                                    <li class="s-menu"><a href="#">ABOUT US</a></li>
				</ul>
                            </li>
			</ul>
                    </div>
		</div>
            </div>
	<div class="s-clear"></div>
        </div>
        <div class="mainMenuIntend"></div>
        <div class="contentIntend"></div>
        <jsp:doBody/> 
        <div class="contentIntendBottom"></div>
        <footer class="indexNavBarFooter footerHeight">
            <div class="footerSmallIntend"></div>
            <div class="s-new s-footer">
                <div class="footerIntentInside"></div>
                <div class="footerNew">
                    <div class="footerLeftMain">
                            <div class="footerPartnership">
                                <a href="http://huskroua-cbc.net/" target="_blank">Partnership without borders</a>
                            </div>
                            <div class="footerCoFin">
                                <a href="http://ec.europa.eu/index_en.htm" target="_blank"><img class="footerEU" src="${Constants.URL}img/euFlag.png">
                                    <div class="rightTopText">The Programme is con-financed by the European Union</div>
                                </a>
                            </div>
                            <div class="huskrouaFooter">
                                <a href="http://huskroua-cbc.net/" target="_blank">
                                    <img src="${Constants.URL}img/star_logo.png">
                                    <div class="countriesStar">Hungary-Slovakia-Romani-Ukraine</div>
                                    <div class="countriesStarSmall">ENPI Cross-border Cooperation Programme</div>
                                </a>
                            </div>
                    </div>
                    <div class="footerRightMain">
                        <a class="fundedLink" href="http://www.surdp.eu" target="_blank">
                            <img src="${Constants.URL}img/euFlag.png">
                            <div class="fundedText">The project is funded by European Union Support to Ukraine's Regional Development Policy Programme www.surdp.eu</div>    
                        </a>
                    </div>
                </div>
                <!--
                <div class="footerLeftTop">
                </div>
                <div class="footerMiddleTop">
                </div>
                <div class="footerRightTop rightHelp">
                    
                </div>
                <!--
                <div class="footerLeft logos">
                    <div class="footerLogo"><img src="${Constants.URL}img/logo1.png"></div>               
                    <div class="footerLogo"><img src="${Constants.URL}img/logo2.png"></div>
                </div>
                -->
                <!--<div class="footerLeft partnershipWidth">
                    <div class="partnershipWithout">
                        <!--<img src="${Constants.URL}img/partnership.png">--><!--
                        <a href="http://huskroua-cbc.net/" target="_blank">Partnership without borders</a>
                    </div>
                </div>
                -->
                <div class="s-clear"></div>
                <div class="projectFunded">
                    The project is funded by the European Union. This website has been developed with the assistance of the European Union. The content of this website can in no way be taken to reflect the views of the European Union.
                </div>       
                <div class="footerRights">
                            <!--<div class="enter-icon"><img src="${Constants.URL}img/enter-icon.png"></div>-->
                            <div id="copyright">&#169; Carpathian tourist road 2015 All right reserved</div>
                        <div class="enter-block">
                                <form action="${Constants.URL}system/login.do" method="POST" id="loginForm" name="auth">
                                        <input id="loginInput" type="text" id="login" name="username" placeholder="* Enter login" data-rule="maxlen:4" data-msg="Please enter at least 4 chars" />
                                        <input id="loginInputPass" type="password" id="passwd" name="password" placeholder="* Enter password" data-rule="email" data-msg="Please enter a valid email" />
                                        <button id="logInButton" class="btn btn-mini logInButton" onclick="madeAjaxCall();">Log In</button>
                                        <button id="cancelButton" class="btn btn-mini cancelButton" type="button">Cancel</button>
                                    <div class="validation"></div>
                                </form>
                        </div>
                </div>
                                        <div class="developpedText">
                                            <a href="http://www.aits.ua" target="_blank">
                                                Developped by AITS
                                            </a>
                                        </div>
            </div>
        </footer>
    </div>
</body>
</html>

<script>
    var countryChooser;
    $( document ).ready(function() {
        $('#searchButtonActive').hide(); 
        countryChooser = document.URL.substr(document.URL.lastIndexOf('/')+1,document.URL.length);
        switch(countryChooser){
            case "index":
                $('#homeMenu').addClass('menuLine');
                break;
            case "6":
                $('#infoMenu').addClass('menuLine');
                break;
            case "4":
                $('#leisureMenu').addClass('menuLine');
                break;
            case "news":
                $('#newsMenu').addClass('menuLine');
                break;
            case "map":
                mapPageMenu();
                center = new google.maps.LatLng(47.15236927446393,20.1654052734375);
                $('#mapControlsImage').attr('src','${Constants.URL}img/markerallMap.png');
                countryChooser = "allMap";
                zoomMap = 7;
                break;
            case "map#":
                mapPageMenu();
                center = new google.maps.LatLng(47.15236927446393,20.1654052734375);
                $('#mapControlsImage').attr('src','${Constants.URL}img/markerallMap.png');
                countryChooser = "allMap";
                break;
            case "allMap":
                mapPageMenu();
                zoomMap = 7;
                center = new google.maps.LatLng(47.15236927446393,20.1654052734375);
                $('#mapControlsImage').attr('src','${Constants.URL}img/markerallMap.png');
                break;
            case "Romania":
                mapPageMenu();
                zoomMap = 8;
                center = new google.maps.LatLng(46.07323062540838,24.708251953125);
                $('#mapControlsImage').attr('src','${Constants.URL}img/markerRomania.png');
                break;
            case "Poland":
                mapPageMenu();
                zoomMap = 8;
                center = new google.maps.LatLng(50.00067775723633,21.4068603515625);
                $('#mapControlsImage').attr('src','${Constants.URL}img/markerPoland.png');
                break;
            case "Ukraine":
                mapPageMenu();
                zoomMap = 9;
                center = new google.maps.LatLng(48.705462895790596,23.895263671875);
                $('#mapControlsImage').attr('src','${Constants.URL}img/markerUkraine.png');
                break;
            case "Slovakia":
                mapPageMenu();
                zoomMap = 8;
                center = new google.maps.LatLng(48.828565527993234,19.9346923828125);
                $('#mapControlsImage').attr('src','${Constants.URL}img/markerSlovakia.png');
                break;
            case "Hungary":
                mapPageMenu();
                zoomMap = 8;
                center = new google.maps.LatLng(47.21210577562242,19.5611572265625);
                $('#mapControlsImage').attr('src','${Constants.URL}img/markerHungary.png');
                break;
            case "routesList":
                $('#routesMenu').addClass('menuLine');
                break;
            case "contact":
                $('#contactsMenu').addClass('menuLine');
                break;
        }
    });
    
    function mapPageMenu(){
                //$('#contactsMenu').addClass('menuLine');
                $('#mapMenu').addClass('menuLine');
                /*$('.s-top').hide();
                $('.topMenu').addClass('topMenuSmall');
                $('.topMenu').addClass('mapMenuSmall');
                $('.s-logoIndex').addClass('s-logoIndexSmall');
                $('.s-logoIndex').addClass('mapLogoSmall');
                $('.s-logoIndexSmall').removeClass('s-logoIndex');
                $('.s-rightNavBar').addClass('s-rightNavBarSmall');
                $('.s-rightNavBar').addClass('menuMapCenterSmall');
                $('.s-rightNavBarSmall').removeClass('s-rightNavBar');
                $('.dropDownMenu a').addClass('scrollSmallerText');
                $('.menuLineSmall').addClass('menuLineExtraSmall');
                $('#mainMenuWidth').addClass('s-newMap');
                $('.mainMenuIntend').addClass('mainMenuIntendMap');
                $('.contentIntend').addClass('contentIntendMap');
                $('.contentIntendMap').removeClass('contentIntend');
                $('.mainMenuIntend').removeClass('mainMenuIntend');
                $('.carpathName').addClass('carpathNameSmall');
                $('.carpathNameSmall').removeClass('carpathName');*/
    }
    
    function borderButton(button){
        $('#allBorder').hide();
        $('#hungaryBorder').hide();
        $('#polandBorder').hide();
        $('#romaniaBorder').hide();
        $('#slovakiaBorder').hide();
        $('#ukraineBorder').hide();
        $(button+"Border").show("fast");
    }
    
    function showMapHover(button){
        $('#allMap').removeClass( "buttonBorderClass" );
        $('#polandMap').removeClass( "buttonBorderClass" );
        $('#hungaryMap').removeClass( "buttonBorderClass" );
        $('#romaniaMap').removeClass( "buttonBorderClass" );
        $('#slovakiaMap').removeClass( "buttonBorderClass" );
        $('#ukraineMap').removeClass( "buttonBorderClass" );
        $('#allBorder').fadeOut(800);
        $('#hungaryBorder').fadeOut(800);
        $('#polandBorder').fadeOut(800);
        $('#romaniaBorder').fadeOut(800);
        $('#slovakiaBorder').fadeOut(800);
        $('#ukraineBorder').fadeOut(800);
        $(button+"Border").fadeIn(700);
        $(button+"Map").addClass( "buttonBorderClass" );
    }
    
    /*
    function stopIntervalFunc(){
        clearInterval(mapSlider);
    }
    
    function startIntervalFunc(){
        mapSlider = setInterval(function(){
            for(var i = 0; i < countries.length; i++)
            {
                $('#'+countries[i]+'Border').fadeOut(800);
                $('#'+countries[i]+'Map').removeClass( "buttonBorderClass" );
            }
            if(counter == 5){
                frame.animate(
                    {
                        left : $('li#'+countries[0]+'Menu').position().left,
                        width : $('li#'+countries[0]+'Menu').width()
                    },
                    {
                        duration : 500,
                        queue : false
                    }
                );
                        
                $('#'+countries[0]+'Border').fadeIn(700);
                $('#'+countries[0]+'Map').addClass( "buttonBorderClass" );
                counter = 0;
            }
            else{
                        
                frame.animate(
                {
                    left : $('li#'+countries[counter+1]+'Menu').position().left,
                    width : $('li#'+countries[counter+1]+'Menu').width()
                },
                {
                    duration : 500,
                    queue : false
                });
                $('#'+countries[counter+1]+'Border').fadeIn(700);
                $('#'+countries[counter+1]+'Map').addClass( "buttonBorderClass" );
                counter++;
            }
        }, 5000);
    }
    */
   
    function showButton(){
        $('#searchButtonActive').fadeIn("fast"); 
        $("#s-textbox").attr("id", "textBoxWidth");
        $('#searchButton').fadeOut(10); 
    }


    var str_url = window.location.href; 
    var spl = str_url.split('/');

    $('.navbar-nav li').removeClass("active");
    $('.footer-links li').removeClass("active");
    if(spl[3].indexOf('.') + 1) {
        var st = spl[3].split('.');
        var current = "."+st[0];
    }
    
    else {
        var current = "."+spl[3];
    }
    
    $(current).addClass("active");
    $(document).mouseup(function (e) {
        var container = $(".enter-block");
        if (container.has(e.target).length === 0){
        }
    });
    function madeAjaxCall(){
         $(".validation").html("");
     $.ajax({
      type: "get",
      url: "${Constants.URL}system/checkLoginPass/",
      cache: false,    
      data:'login='+ $("#login").val() +'&password='+$("#passwd").val(),
      success: function(response){
       if(response === "false"){
           $(".validation").html("<span style='color:red'>Bad login or password</span>");
       }
       else {
           $("#loginForm").submit();
       }
      },
      error: function(response){      
       console.log(response);
      }
     });
    }
    $(".enter-icon").click(function() {
        $('.enter-block').addClass('enterBlockWidth');
        $('#loginInput').addClass('enter-blockInput');
        $('#loginInputPass').addClass('enter-blockInput');
        $('.loginButton').addClass('buttonWidth');
        $('#cancelButton').addClass('buttonWidth');
        $('.enter-icon').css("diplay","none");
        $('#copyright').hide("slow");
    });
    $("#cancelButton").click(function(){
        $('.enter-block').removeClass('enterBlockWidth');
        $('#loginInput').removeClass('enter-blockInput');
        $('#loginInputPass').removeClass('enter-blockInput');
        $('.loginButton').removeClass('buttonWidth');
        $('#cancelButton').removeClass('buttonWidth');
        $('#copyright').show(3000);
    });
    
    $('input').on("keypress", function(e) {
        if (e.keyCode == 13) {
            var inputs = $(this).parents("form").eq(0).find(":input");
            var idx = inputs.index(this);
            if (idx == inputs.length - 1) {
                inputs[0].select()
            } else {
                inputs[idx + 1].focus();
                inputs[idx + 1].select();
            }
            return false;
        }
    });
    
    
    function init() {
    window.addEventListener('scroll', function(e){
        var urlMap = document.URL.substr(document.URL.lastIndexOf('/')+1,document.URL.length);
        var distanceY = window.pageYOffset || document.documentElement.scrollTop,
            shrinkOn = 1;
        if (distanceY > shrinkOn) {
            $('.s-top').hide();
            $('.topMenu').addClass('topMenuSmall');
            $('.s-logoIndex').addClass('s-logoIndexSmall');
            $('.s-logoIndexSmall').removeClass('s-logoIndex');
            $('.s-rightNavBar').addClass('s-rightNavBarSmall');
            $('.s-rightNavBarSmall').removeClass('s-rightNavBar');
            $('.dropDownMenu a').addClass('scrollSmallerText');
            $('.menuLineSmall').addClass('menuLineExtraSmall');
            $('.carpathName').addClass('carpathNameSmall');
            $('.carpathNameSmall').removeClass('carpathName');
        } 
        else {
            //if(document.URL.substr(document.URL.lastIndexOf('/')+1,document.URL.length)!='map'){
                $('.s-top').show();
                $('.topMenu').removeClass('topMenuSmall');
                $('.s-logoIndexSmall').addClass('s-logoIndex');
                $('.s-logoIndex').removeClass('s-logoIndexSmall');
                $('.s-rightNavBarSmall').addClass('s-rightNavBar');
                $('.s-rightNavBar').removeClass('s-rightNavBarSmall');
                $('.dropDownMenu a').removeClass('scrollSmallerText');
                $('.menuLineSmall').removeClass('menuLineExtraSmall');
                $('.carpathNameSmall').addClass('carpathName');
                $('.carpathName').removeClass('carpathNameSmall');
            //}
        }
    });
}
window.onload = init();
</script>
</body>
</html>