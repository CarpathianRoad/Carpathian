<%-- 
    Document   : indexpage
    Created on : Jan 11, 2015, 12:06:49 PM
    Author     : kiwi
--%>

<%@tag description="Index Page Template" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<jsp:useBean id="Constants" class="ua.aits.Carpath.functions.Constants" scope="session"/>
<jsp:useBean id="Menu" class="ua.aits.Carpath.functions.BuildMenu" scope="session" />

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
    <script type="text/javascript" src="${Constants.URL}js/jssor.slider.mini.js"></script>
    <script src="${Constants.URL}js/slider/jquery.bxslider.min.js"></script>
    <script src="${Constants.URL}js/filter_by_country.js"></script>
    <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=true"></script>
    <script src="http://google-maps-utility-library-v3.googlecode.com/svn/trunk/markerclusterer/src/markerclusterer.js" type="text/javascript"></script>
    <script src="http://swip.codylindley.com/jquery.popupWindow.js"></script>
    <link href="${Constants.URL}js/slider/jquery.bxslider.css" rel="stylesheet" />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,800,700' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=PT+Sans' rel='stylesheet' type='text/css'>
    <style>
        .lang-sw.active {
            color: rgb(174, 214, 43);
        }
	label.css-label {
            background-image:url(http://csscheckbox.com/checkboxes/u/csscheckbox_cf6353ab7cdbfbd4f8cf2b5189d35a11.png);
            -webkit-touch-callout: none;
            -webkit-user-select: none;
            -khtml-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
	}
        .markerPageArrowRight{
            position: absolute;
            cursor: pointer;
            display: block;
            background: url(${Constants.URL}img/arrow_right.png) no-repeat;
            overflow:hidden;
        }
        .markerPageArrowRight:hover{
            background: url(${Constants.URL}img/arrow_right_hover.png) no-repeat;
        }
        .markerPageArrowLeft{
            position: absolute;
            cursor: pointer;
            display: block;
            background: url(${Constants.URL}img/arrow_left.png) no-repeat;
            overflow:hidden;
        }
        .markerPageArrowLeft:hover{
            background: url(${Constants.URL}img/arrow_left_hover.png) no-repeat;
        }
        #status {
            background-image:url(${Constants.URL}img/status.gif); /* path to your loading animation */
        }
        input[type=checkbox].css-checkbox:checked + label.css-label {
            background-image:url(${Constants.URL}img/checked.png);
        }
        input[type=checkbox].css-checkbox + label.css-label {
            background-image:url(${Constants.URL}img/notChecked.png);
        }
    </style>
    
</head>
<script type="text/javascript">
	//<![CDATA[
		$(window).load(function() { // makes sure the whole site is loaded
			$('#status').fadeOut(); // will first fade out the loading animation
			$('#preloader').delay(350).fadeOut('slow'); // will fade out the white DIV that covers the website.
			$('body').delay(350).css({'overflow':'visible'});
		})
	//]]>
</script>
<body>
    <!-- Preloader -->
<div id="preloader">
    <div id="status">&nbsp;</div>
</div>
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
				<li class="paddingLang"><a id="lang-switch-ua" class="lang-sw" href="${Constants.URL}ua/index">UA</a></li>
				<li class="paddingLang"><a id="lang-switch-en" class="lang-sw" href="${Constants.URL}en/index">EN</a></li>
				<li class="paddingLang"><a id="lang-switch-sk" class="lang-sw" href="${Constants.URL}sk/index">SK</a></li>
				<li class="paddingLang"><a id="lang-switch-hu" class="lang-sw" href="${Constants.URL}hu/index">HU</a></li>
				<!--
                                <li class="paddingLang"><a href="#">PL</a></li>
				<li class="paddingLang"><a href="#">RO</a></li>
    -->
                            </ul>
			</div>
			<div class="s-two">
                            <a class="socialHeaderDiv intendSocial not-add-lan"
                                    onmouseover="$(this).find('img').hide();$(this).find('img').attr('src','${Constants.URL}img/fb_icon_hover.png');$(this).find('img').fadeIn(300);" 
                                    onmouseout="$(this).find('img').fadeOut(1);$(this).find('img').attr('src','${Constants.URL}img/fb_icon.png');$(this).find('img').fadeIn(1);" 
                                    href="https://uk-ua.facebook.com/people/Ard-Transcarpathia/100008981281491" target="_blank">
                                <img class="s-socialLogo" src="${Constants.URL}img/fb_icon.png" 
                                    border="0">
                            </a>
                            <a class="socialHeaderDiv not-add-lan"
                                    onmouseover="$(this).find('img').hide();$(this).find('img').attr('src','${Constants.URL}img/tw_icon_hover.png');$(this).find('img').fadeIn(300);" 
                                    onmouseout="$(this).find('img').fadeOut(1);$(this).find('img').attr('src','${Constants.URL}img/tw_icon.png');$(this).find('img').fadeIn(1);" 
                                    href="https://twitter.com/CarpathianRoad" target="_blank">
                                <img class="s-socialLogo" src="${Constants.URL}img/tw_icon.png"
                                    border="0">
                            </a>
			</div>
			<div class="s-one">
                            <form class="searchMenu">
				<button type="button" id="searchButton" onclick="showButton()">
                                    <div class="socialHeaderDiv"
                                        onmouseover="$(this).find('img').hide();$(this).find('img').attr('src','${Constants.URL}img/search_icon_hover.png');$(this).find('img').fadeIn(100);
                                            $('#searchButton').css('top','4px')"
                                        onmouseout="$(this).find('img').hide();$(this).find('img').attr('src','${Constants.URL}img/search_icon.png');$(this).find('img').fadeIn(100);
                                            $('#searchButton').css('top','3px')">
                                        <img src="${Constants.URL}img/search_icon.png"
                                        >
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
                                <a class="not-add-lan" href="http://huskroua-cbc.net/" target="_blank">Partnership without borders</a>
                            </div>
                            <div class="footerCoFin">
                                <a class="not-add-lan" href="http://ec.europa.eu/index_en.htm" target="_blank"><img class="footerEU" src="${Constants.URL}img/euFlag.png">
                                    <div class="rightTopText">The Programme is con-financed by the European Union</div>
                                </a>
                            </div>
                            <div class="huskrouaFooter">
                                <a href="http://huskroua-cbc.net/" class="not-add-lan" target="_blank">
                                    <img src="${Constants.URL}img/star_logo.png">
                                    <div class="countriesStar">Hungary-Slovakia-Romani-Ukraine</div>
                                    <div class="countriesStarSmall">ENPI Cross-border Cooperation Programme</div>
                                </a>
                            </div>
                    </div>
                    <div class="footerRightMain">
                        <a class="fundedLink not-add-lan"  href="http://www.surdp.eu" target="_blank">
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
                                        <div class="footerContactsText developpedText">
                                            <a class="not-add-lan" href="http://www.arr.com.ua" target="_blank">
                                                &#169; Communal enterprise ”Agency of Regional Development and Cross-Border Co-operation “Transcarpathia” of Zakarpattya Oblast Council”
                                            </a>
                                        </div>
                                        <div class="developpedText">
                                            <a class="not-add-lan" href="http://www.aits.ua" target="_blank">
                                                Developed by AITS
                                            </a>
                                        </div>
            </div>
        </footer>
    </div>
</body>
</html>

<script>
    function buildMenu(lang){
        console.log(lang);
        $.ajax({
            type: "get",
            url: "${Constants.URL}build/menu",
            cache: false,    
            data:'lang='+lang+'',
            mimeType:"text/html; charset=UTF-8",
            success: function(response){
             $("#cssmenu").html(response).css("width","");
             /*if(lang === "UA" || lang === "ua") {
                 $("#cssmenu").css("width","106%");
             }*/
             addLangToLink(lang.toLowerCase());
             addCssToMenu();
            },
            error: function(response){      
             console.log(response);
            }
        });
    }
    function addLangToLink(lang){
    $( "a:not(.lang-sw, .shareLinks, .not-add-lan)" ).each(function( index ) {
            
            if($(this).attr("href") !== undefined && $(this).attr("href") !== ""){ 
            if($(this).attr("href").toLowerCase().indexOf("/carpath/") !== -1){
                $(this).attr("href", $(this).attr("href").replace("Carpath","Carpath/"+lang));
            }
            else {
                $(this).attr("href", "/"+lang+$(this).attr("href"));
            }
            }
        });
    }
    var countryChooser;
    $( document ).ready(function() {
            var str_url = window.location.href.split('/'); 
            $("li.paddingLang a").removeClass("active");
            $("#lang-switch-"+str_url[4]).addClass("active");
            $("#lang-switch-"+str_url[3]).addClass("active");
            // style="color:rgb(174,214,43)"
            
            buildMenu($(".lang-sw.active").html());
        
        
        
        $('#searchButtonActive').hide(); 
        
    });
    function addCssToMenu(){
     countryChooser = document.URL.substr(document.URL.lastIndexOf('/')+1,document.URL.length);
        switch(countryChooser){
            case "index":
                $('#homeMenu').addClass('menuLine');
                break;
            case "2":
                $('#infoMenu').addClass('menuLine');
                break;
            case "3":
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
 }
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
        $('#searchButtonActive').fadeIn(200); 
        $("#s-textbox").addClass("textBoxWidth");
        $('#searchButton').fadeOut(1); 
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
            $('.s-top').slideUp(300);
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
                $('.s-top').fadeIn("slow");
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