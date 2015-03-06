<%-- 
    Document   : genericpage
    Created on : Jan 11, 2015, 12:04:24 PM
    Author     : kiwi
--%>

<%@tag description="Other Pages Description" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="Constants" class="ua.aits.Carpath.functions.Constants" scope="session"/>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Carpathian Tourist Road</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="" />
<meta name="author" content="http://bootstraptaste.com" />
<!-- css -->


<link href="${Constants.URL}img/favicon.ico" rel="shortcut icon" type="image/x-icon" />
<script src="http://google-maps-utility-library-v3.googlecode.com/svn/trunk/markerclusterer/src/markerclusterer.js" type="text/javascript"></script>
    <script src="${Constants.URL}js/jquery.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=true"></script>
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>

<!-- Theme skin -->
<link href="${Constants.URL}skins/default.css" rel="stylesheet" />
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
		<link rel="stylesheet" href="${Constants.URL}css/style1.css">
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
                <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,800,700' rel='stylesheet' type='text/css'>
    <script src="http://code.jquery.com/jquery-latest.min.js"
        type="text/javascript"></script>

<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
</head>
<body>	
    <div class="wrap">
    <div class="row indexNavbar topMenu">
            <div class='s-new'>
		<div class="s-logoIndex">
                    <a href="${Constants.URL}index"><img class="" src="${Constants.URL}img/logo.png"></a>
		</div>
		<div class="s-rightNavBar">
                    <div class="s-top">
			<div class="s-three">
                            <ul>
				<li class="paddingLang"><a style="color:rgb(174,214,43)" href="#">EN</a></li>
                                <li class="paddingLang"><a href="#">UA</a></li>
				<li class="paddingLang"><a href="#">SK</a></li>
				<li class="paddingLang"><a href="#">HU</a></li>
				<li class="paddingLang"><a href="#">PL</a></li>
				<li class="paddingLang"><a href="#">RO</a></li>
                            </ul>
			</div>
			<div class="s-two">
                            <a href="https://uk-ua.facebook.com/people/Ard-Transcarpathia/100008981281491" target="_blank">
                                <img class="s-socialLogo intendSocial" src="${Constants.URL}img/fb_icon.png"
                                    onmouseover="$(this).hide();this.src='${Constants.URL}img/fb_icon_hover.png';$(this).fadeIn(300);" 
                                    onmouseout="$(this).hide();this.src='${Constants.URL}img/fb_icon.png';$(this).fadeIn(300);" 
                                    border="0">
                            </a>
                            <a href="https://twitter.com/CarpathianRoad" target="_blank">
                                <img class="s-socialLogo" src="${Constants.URL}img/tw_icon.png"
                                    onmouseover="$(this).hide();this.src='${Constants.URL}img/tw_icon_hover.png';$(this).fadeIn(300);" 
                                    onmouseout="$(this).hide();this.src='${Constants.URL}img/tw_icon.png';$(this).fadeIn(300);" 
                                    border="0">
                            </a>
			</div>
			<div class="s-one">
                            <form class="searchMenu">
				<button type="button" id="searchButton" onclick="showButton()">
                                    <div class=""><img src="${Constants.URL}img/search_icon.png"
                                        onmouseover="$(this).hide();this.src='${Constants.URL}img/search_icon_hover.png';$(this).fadeIn(300);
                                            $('#searchButton').css('top','4px')"
                                        onmouseout="$(this).hide();this.src='${Constants.URL}img/search_icon.png';$(this).fadeIn(300);
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
                            <li><a href="${Constants.URL}index">HOME<div class="bottom-caret"></div><div class="menuLineHome"></div></a>
                                <ul>
                                    <div class="menuLine"></div>
                                    <li><a href="#">ABOUT CARPATHIAN REGION</a></li>
                                    <li><a href="#">ABOUT "CARPATHIAN TOURIST ROAD"</a></li>
                                    <li><a href="#">ABOUT COUNTRIES AND CITIES</a></li>
				</ul>
                            </li>
                            <li><a href="${Constants.URL}article/category/6">INFO<div class="bottom-caret"></div></a>
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
                            <li><a href="${Constants.URL}article/category/4">LEISURE<div class="bottom-caret"></div></a>
                                <ul>
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
                            <li><a href="${Constants.URL}article/news">NEWS</a>
                                <ul class="s-newsMenu">
                                    <div class="menuLineSmall"></div>
                                    <li></li>
				</ul>
                            </li>
                            <li><a href="${Constants.URL}map">MAP</a>
				<ul class="s-mapMenu">
                                    <div class="menuLineSmall"></div>
                                    <li></li>
				</ul>
                            </li>
                            <li><a href="${Constants.URL}routesList">TOURIST ROADS<div class="bottom-caret"></div></a>
                                <ul>
                                    <div class="menuLine"></div>
                                    <li><a href="#">TRAILS</a></li>
                                    <li><a href="#">THEMATIC ROUTES</a></li>
				</ul>
                            </li>
                            <li><a href="${Constants.URL}contact">ABOUT US<div class="bottom-caret"></div></a>
                                <ul class="s-menu">
                                    <div class="menuLine"></div>
                                    <li class="s-menu"><a href="#">PARTNERS</a></li>
                                    <li class="s-menu"><a href="#">CONTACTS</a></li>
				</ul>
                            </li>
			</ul>
                    </div>
		</div>
            </div>
	<div class="s-clear"></div>
        </div>
        <div class="mainMenuIntend"></div>
	
	
      <jsp:doBody/>
    </div>
	<footer class="indexNavBarFooter footerHeight">
				<div class="s-new s-footer">
					<div class="s-newsImageDiv1">
						<div class="">
							<div class="">
								<img class="footerLogo" src="${Constants.URL}img/logoWhite.png">
							</div>
						</div>
                                                        <div class="enter-icon">
                                        
                                    </div>
						<div class="">
							<div class="footerRights">
                                                            <a href="http://www.aits.ua" target="_blank">&#169; Carpathian tourist road 2015 All right reserved</a>
							</div>
						</div>
					</div>
					<div class="s-newsImageDiv2">
						<div class="s-big">
							<div class="footerRights">
                                                            <a href="http://ec.europa.eu/index_en.htm" target="_blank"><img class="footerEU" src="${Constants.URL}img/euLogo.png"></a>
							</div>
                                                        
						</div>
                                                        <div class="enterBlock">
                                                <c:choose>
                                                    <c:when test="${sessionScope.user == null}">
                                                        <a id="enter-icon-img">LogIn</a>
                                                        </c:when>

                                                        <c:otherwise>
                                                           <a href="${Constants.URL}system/panel">Admin Panel</a>
                                                        </c:otherwise>
                                                  </c:choose>
                                                        </div>
                                    <div class="enter-block">
                                        <div>
                                           <form action="${Constants.URL}system/login.do" method="POST" id="loginForm" name="auth">
                                            
                                        <div class="col-lg-12 margintop10 field">
							<input class="logInInput" type="text" id="login" name="username" placeholder="* Enter login" data-rule="maxlen:4" data-msg="Please enter at least 4 chars" />
							
						</div>
						<div class="col-lg-12 margintop10 marginbot10 field">
							<input class="logInInput" type="password" id="passwd" name="password" placeholder="* Enter password" data-rule="email" data-msg="Please enter a valid email" />
							
						</div>
                                                <div class="validation">
							</div>
                                        </form>
                                           <h4 class="middleButton"><button class="btn btn-primary btn-mini logInButton" onclick="madeAjaxCall();">Log In</button></h4>
                                        </div>
                                    </div>
						
					</div>
					<div class="s-newsImageDiv3">
						<div class="">
                                                    <a href="http://huskroua-cbc.net/" target="_blank"><img class="s-footerRightImage" src="${Constants.URL}img/rightImageFooter.png"></a>
						</div>
						<div class="partnershipWithout">
							Partnership without borders
						</div>
					</div>
					<div class="s-clear"></div>
				</div>
			</div>
		</footer>
<a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>
<!-- javascript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="${Constants.URL}js/jquery.js"></script>
<script src="${Constants.URL}js/jquery.easing.1.3.js"></script>
<script src="${Constants.URL}js/bootstrap.min.js"></script>
<script src="${Constants.URL}js/jquery.fancybox.pack.js"></script>
<script src="${Constants.URL}js/jquery.fancybox-media.js"></script>
<script src="${Constants.URL}js/google-code-prettify/prettify.js"></script>
<script src="${Constants.URL}js/portfolio/jquery.quicksand.js"></script>
<script src="${Constants.URL}js/portfolio/setting.js"></script>
<script src="${Constants.URL}js/jquery.flexslider.js"></script>
<script src="${Constants.URL}js/animate.js"></script>
<script src="${Constants.URL}js/custom.js"></script>

<script>
    
$(document).ready(function() {

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
});
$(document).mouseup(function (e) {
    var container = $(".enter-block");
    if (container.has(e.target).length === 0){
        container.hide("slow");
    }
});
   
$("#enter-icon-img").click(function() {
    var obj2=$('.enter-block'); 
    if(obj2.is(":visible")){obj2.hide("slow");} 
else{obj2.show("slow");}
});
$(window).scroll(function(){
    
                var obj=$('.mini-bar');
            if ( $(this).scrollTop() >= 100 ){
                obj.animate({top:'0'},100);
            } else if($(this).scrollTop() < 100) {
                obj.animate({top:'30'},100);
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
    
    
    function showButton(){
        $('#searchButtonActive').fadeIn("fast"); 
        $("#s-textbox").attr("id", "textBoxWidth");
        $('#searchButton').fadeOut(10); 
    }

    function init() {
        $('#searchButtonActive').hide(); 
        $('#s-textbox').hide(); 
    window.addEventListener('scroll', function(e){
        var distanceY = window.pageYOffset || document.documentElement.scrollTop,
            shrinkOn = 1;
        if (distanceY > shrinkOn) {
            $('.s-top').hide();
            $('.topMenu').addClass('topMenuSmall');
            $('.s-logoIndex').addClass('s-logoIndexSmall');
            $('.s-logoIndexSmall').removeClass('s-logoIndex');
            $('.s-rightNavBar').addClass('s-rightNavBarSmall');
            $('.s-rightNavBarSmall').removeClass('s-rightNavBar');
        } 
        else {
            $('.s-top').show();
            $('.topMenu').removeClass('topMenuSmall');
            $('.s-logoIndexSmall').addClass('s-logoIndex');
            $('.s-logoIndex').removeClass('s-logoIndexSmall');
            $('.s-rightNavBarSmall').addClass('s-rightNavBar');
            $('.s-rightNavBar').removeClass('s-rightNavBarSmall');
        }
    });
}
window.onload = init();
</script>
<script src="${Constants.URL}js/custom.js"></script>
</body>
</html>