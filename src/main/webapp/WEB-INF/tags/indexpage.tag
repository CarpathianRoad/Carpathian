<%--
	Document   : indexpage
	Created on : Jan 11, 2015, 12:06:49 PM
	Author 	: kiwi
--%>

<%@tag description="Index Page Template" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<jsp:useBean id="Constants" class="ua.aits.Carpath.functions.Constants" scope="session"/>

<html>
<head>
	<c:choose>
    	<c:when test="${avatarvar != null}">
        	<meta property="og:image" content="http://www.carpathianroad.com/${avatarvar}"/>
        	<meta property="og:title" content="${titlevar}"/>
        	<meta property="og:description" content="${descrvar}"/>
    	</c:when>
    	<c:otherwise>
        	<!-- for Google -->
    	<meta name="description" content="Carpathian Road" />
    	<meta name="keywords" content="Carpathian Road" />

    	<meta name="author" content="Carpathian Road" />
    	<meta name="copyright" content="Carpathian Road" />
    	<meta name="application-name" content="Carpathian Road" />

    	<!-- for Facebook -->     	 
    	<meta property="og:title" content="Carpathian Road" />
    	<meta property="og:type" content="website" />
    	<meta property="og:image" content="http://www.carpathianroad.com/img/logo1.png" />
    	<meta property="og:image" content="http://www.carpathianroad.com/img/logo1.png" />
    	<meta property="og:url" content="http://www.carpathianroad.com/ua/index" />
    	<meta property="og:description" content="Carpathian Road" />

    	</c:otherwise>
	</c:choose>
	<c:if test="${avatarvar != null}">
	</c:if>
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
	<link href='http://fonts.googleapis.com/css?family=PT+Sans' rel='stylesheet' type='text/css'>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
	<script>
    	(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
    	(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
    	m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
    	})(window,document,'script','//www.google-analytics.com/analytics.js','ga');

    	ga('create', 'UA-60469558-1', 'auto');
    	ga('send', 'pageview');

	</script>
	<style>
    	@font-face {
        	font-family: 'Open Sans';
        	src: url('${Constants.URL}files/OpenSans.eot');
        	src: url('${Constants.URL}files/OpenSans.eot?#iefix') format('embedded-opentype'),
             	url('${Constants.URL}files/OpenSans.woff2') format('woff2'),
             	url('${Constants.URL}files/OpenSans.woff') format('woff'),
             	url('${Constants.URL}files/OpenSans.ttf') format('truetype'),
             	url('${Constants.URL}files/OpenSans.svg#open_sansregular') format('svg');
        	font-weight: normal;
        	font-style: normal;

    	}
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
	<!-- Add fancyBox -->
	<link rel="stylesheet" href="${Constants.URL}js/fancybox/source/jquery.fancybox.css?v=2.1.5" type="text/css" media="screen" />
	<script type="text/javascript" src="${Constants.URL}js/fancybox/source/jquery.fancybox.pack.js?v=2.1.5"></script>
</head>
<body>
	<div class="minHeight">
    <div class="row indexNavbar topMenu">
        	<div class='s-new smallMenuWidth' id="mainMenuWidth">
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
   			 <li class="paddingLang"><a id="lang-switch-ro" class="lang-sw" href="${Constants.URL}hu/index">RO</a></li>
   			 <!--
                                	<li class="paddingLang"><a href="#">PL</a></li>
                                	<li class="paddingLang"><a href="#">RO</a></li>
                            	-->
                        	</ul>
   		 </div>
   		 <div class="s-two">
                        	<div class="headerSocial intendSocial">
                        	<a class="socialHeaderDiv intendSocial not-add-lan"
                                	onmouseover="$(this).find('img').attr('src','${Constants.URL}img/fb_icon_hover.png');"
                                	onmouseout="$(this).find('img').attr('src','${Constants.URL}img/fb_icon.png');"
                                	href="https://www.facebook.com/carpathianroad" target="_blank">
                            	<img class="s-socialLogo" src="${Constants.URL}img/fb_icon.png"
                                	border="0">
                        	</a>
                        	</div>
                        	<div class="headerSocial">
                        	<a class="socialHeaderDiv twitterDivHeader not-add-lan"
                                	onmouseover="$(this).find('img').attr('src','${Constants.URL}img/tw_icon_hover.png');"
                                	onmouseout="$(this).find('img').attr('src','${Constants.URL}img/tw_icon.png');"
                                	href="https://twitter.com/CarpathianRoad" target="_blank">
                            	<img class="s-socialLogo" src="${Constants.URL}img/tw_icon.png"
                                	border="0">
                        	</a>
                        	</div>
   		 </div>
   		 <div class="s-one">
                        	<form class="searchMenu" action="${Constants.URL}search" method="GET" id="searchForm">
   			 <button type="button" id="searchButton" onclick="showButton()">
                                	<div class="socialHeaderDiv"
                                    	onmouseover="$(this).find('img').attr('src','${Constants.URL}img/search_icon_hover.png');
                                        	$('#searchButton').css('top','4px')"
                                    	onmouseout="$(this).find('img').attr('src','${Constants.URL}img/search_icon.png');
                                        	$('#searchButton').css('top','3px')">
                                    	<img src="${Constants.URL}img/search_icon.png"
                                    	>
                                	</div>
   			 </button>
                                      	 
                            	<input type="text" name="find" id="s-textbox">
                            	<button type="button" id="searchButtonActive">
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
            	<div class="showSmallMenu">
                	<div class="smallScreenMenu" onclick="showSmallMenu()">
                    	<img src="${Constants.URL}img/mapRightContainer.png"
                        	onmouseover="if(!smallMenu){$(this).hide();this.src='${Constants.URL}img/mapRightContainerHover.png';$(this).fadeIn(300);}"
                        	onmouseout="if(!smallMenu){$(this).hide();this.src='${Constants.URL}img/mapRightContainer.png';$(this).fadeIn(300);}">
                	</div>
                	<div id="smallSearch" onclick='searchSmallMenu()'
                     	onmouseover="$(this).find('img').hide();$(this).find('img').attr('src','${Constants.URL}img/search_icon_hover.png');$(this).find('img').fadeIn(100);
                     	$('#searchButton').css('top','4px')"
                     	onmouseout="$(this).find('img').hide();$(this).find('img').attr('src','${Constants.URL}img/search_icon.png');$(this).find('img').fadeIn(100);
                     	$('#searchButton').css('top','3px')">
                     	<img src="${Constants.URL}img/search_icon.png">
                	</div>
                	<div id="languageSelectorSmall" onclick='langSelectMenu()'>
                	</div>
            	</div>
            	<div class="s-clear"></div>
                	<div id="langSmallMenu">
                    	<ul class="smallMenuLangSelector">
   			 <li class="paddingLang"><a id="lang-switch-ua" class="lang-sw" href="${Constants.URL}ua/index">UA</a></li>
   			 <li class="paddingLang"><a id="lang-switch-en" class="lang-sw" href="${Constants.URL}en/index">EN</a></li>
   			 <li class="paddingLang"><a id="lang-switch-sk" class="lang-sw" href="${Constants.URL}sk/index">SK</a></li>
   			 <li class="paddingLang"><a id="lang-switch-hu" class="lang-sw" href="${Constants.URL}hu/index">HU</a></li>
   			 <li class="paddingLang"><a id="lang-switch-ro" class="lang-sw" href="${Constants.URL}hu/index">RO</a></li>
   			 <!--
                                	<li class="paddingLang"><a href="#">PL</a></li>
                                	<li class="paddingLang"><a href="#">RO</a></li>
                            	-->
                        	</ul>
                	</div>
                        	<form class="searchMenuSmall" action="${Constants.URL}search" method="GET" id="searchFormSmall">
                            	<input type="text" name="find" id="searchBoxSmall">
                            	<button type="button" id="searchButtonActiveSmall">
                                	<div class=""><img src="${Constants.URL}img/search_icon_active.png"></div>
   			 </button>
                        	</form>
                	<div class="smallMenuBlock">
                               	 
                	</div>
            	<div class="hideMenu" onclick="showHideMenu()">
                	<img id="hideMenuArrow" src="${Constants.URL}img/menuArrowHide.png">
            	</div>
        	</div>
    <div class="s-clear"></div>
    	</div>
    	<div class="mainMenuIntend"></div>
    	<div class="contentIntend"></div>
    	<div class="scrollToTop" onclick="scrollToTop()"><img src="${Constants.URL}img/scrollToTop.png"></div>
    	<jsp:doBody/>
    	<div class="contentIntendBottom"></div>
	</div>
    	<footer class="indexNavBarFooter footerHeight" id="footer">
        	<div class="footerSmallIntend"></div>
        	<div class="s-new s-footer">
            	<div class="footerIntentInside"></div>
            	<div class="footerNew">
                	<div class="footerLeftMain">
                    	<div class="coFinBlock">
                        	<div class="footerCoFin">
                            	<a class="not-add-lan" href="http://eeas.europa.eu/delegations/ukraine/index_uk.htm" target="_blank"><img class="footerEU" src="${Constants.URL}img/euFlag.png">
                                	<div class="rightTopText">The Programme is co-financed by the European Union</div>
                            	</a>
                        	</div>
                    	</div>
                    	<div class="partnershipBlock">
                        	<div class="footerPartnership">
                            	<a class="not-add-lan" href="http://huskroua-cbc.net/" target="_blank">Partnership without borders</a>
                        	</div>
                    	</div>
                    	<div class="huskrouaBlock">
                        	<div class="huskrouaFooter">
                            	<a href="http://huskroua-cbc.net/" class="not-add-lan" target="_blank">
                                	<img src="${Constants.URL}img/star_logo.png">
                                	<div class="countriesStar">Hungary-Slovakia-Romani-Ukraine</div>
                                	<div class="countriesStarSmall">ENPI Cross-border Cooperation Programme</div>
                            	</a>
                        	</div>
                    	</div>
                	</div>
                	<div class="footerRightMain">
                    	<a class="fundedLink not-add-lan"  href="http://www.surdp.eu" target="_blank">
                        	<div class="fundedText">The project is funded by European Union<br>Support to Ukraine's Regional Development Policy Programme www.surdp.eu</div>    
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
                                            	&#169; Communal enterprise "Agency of Regional Development and Cross-Border Co-operation "Transcarpathia" of Zakarpattya Oblast Council"
                                        	</a>
                                    	</div>
                                    	<div class="developpedText aitsText">
                                        	<a style="margin-left:5px" class="not-add-lan" href="http://www.aits.ua" target="_blank">
                                             	Developed by AITS
                                        	</a>
                                    	</div>
                	<div class="siteMap">
                    	<a style="margin-right: 15px;" class="not-add-lan" href="${Constants.URL}login">
                        	Enter
                    	</a>
                    	<a href="${Constants.URL}sitemap">
                        	Site Map
                    	</a>
                	</div>
        	</div>
    	</footer>
</body>
</html>

<script>
    
	var showLang = false;
	var showMenu = false;
	var showSearch = false;
    
	addCssToMenu();
    
	function langSelectMenu(){
    	if(!(showLang)){
        	if(showSearch)searchSmallMenu();
        	if(showMenu)showSmallMenu();
        	$('.topMenu').css('height','100');
        	$('#langSmallMenu').css('display','table');
        	$('.topMenu').removeClass('topMenuSmall');
        	showLang = true;
    	}else{
        	$('.topMenu').css('height','60');
        	$('#langSmallMenu').css('display','none');
        	showLang = false;
    	}
	}
    
	function scrollToTop(){
    	$("html, body").animate({ scrollTop: 0 }, "slow");
	}
    
	function searchSmallMenu(){
    	if(!(showSearch)){
        	if(showLang)langSelectMenu();
        	if(showMenu)showSmallMenu();
        	$('.topMenu').css('height','110');
        	$('.searchMenuSmall').css('display','block');
        	showSearch = true;
    	}else{
        	$('.topMenu').css('height','60');
        	$('.searchMenuSmall').css('display','none');
        	showSearch = false;
    	}
	}
    
	function showSmallMenu(){
    	$('#routesMenu').parent().parent().css('display','none');
    	$('#homeMenu').parent().css('pointer-events','none');
    	if(!(showMenu)){
        	if(showLang)langSelectMenu();
        	if(showSearch)searchSmallMenu();
        	$('.topMenu').css('height','auto');
        	$('.smallMenuBlock').css('display', 'block');
        	showMenu = true;
    	}else{
        	$('.topMenu').css('height','60');
        	$('.smallMenuBlock').css('display', 'none');
        	showMenu = false;
    	}
	}
    
	function buildMenu(lang){
    	console.log(lang);
    	$.ajax({
        	type: "get",
        	url: "${Constants.URL}build/menu",
        	cache: false,    
        	data:'lang='+lang+'',
        	mimeType:"text/html; charset=UTF-8",
        	success: function(response){
         	if(window.innerWidth>780){
            	$("#cssmenu").html(response).css("width","");
         	}else{
            	$(".smallMenuBlock").html(response).css("width","");
         	}
         	/*if(lang === "UA" || lang === "ua") {
             	$("#cssmenu").css("width","106%");
         	}*/
         	addLangToLink(lang.toLowerCase());
         	if(window.innerWidth<780){
                    //$('a[href*="/Carpath/ua/routesList"]').parent().hide();
                }
        	},
        	error: function(response){ 	 
         	buildMenu($(".lang-sw.active").html());
        	}
    	});
    	$('#languageSelectorSmall').html(lang);
	}
    
	function addLangToLink(lang){
	$( "a:not(.lang-sw, .shareLinks, .not-add-lan, .markerPageText a)" ).each(function( index ) {
       	 
        	if($(this).attr("href") !== undefined && $(this).attr("href") !== ""){
        	if($(this).attr("href").toLowerCase().indexOf("/carpath/") !== -1){
            	$(this).attr("href", $(this).attr("href").replace("Carpath","Carpath/"+lang));
        	}
        	else {
            	$(this).attr("href", "/"+lang+$(this).attr("href"));
        	}
        	}
    	});
   	 
        	var currentlan  = $(".lang-sw.active").text();
       	 
        	$("#lang-switch-ua").attr("href",window.location.href.replace("/"+currentlan.toLowerCase(),"/ua"));
        	$("#lang-switch-en").attr("href",window.location.href.replace("/"+currentlan.toLowerCase(),"/en"));
        	$("#lang-switch-sk").attr("href",window.location.href.replace("/"+currentlan.toLowerCase(),"/sk"));
        	$("#lang-switch-hu").attr("href",window.location.href.replace("/"+currentlan.toLowerCase(),"/hu"));
        	$("#lang-switch-ro").attr("href",window.location.href.replace("/"+currentlan.toLowerCase(),"/ro"));
	}
	var countryChooser;
	$( document ).ready(function() {
        	console.log("${avatarvar}");    
        	var str_url = window.location.href.split('/');
        	$("li.paddingLang a").removeClass("active");
        	console.log(str_url[3]);
        	if("${Constants.URL}" === "/Carpath/" || str_url[3] === "Carpath") {
            	$("#lang-switch-"+str_url[4]).addClass("active");
        	} else {
            	$("#lang-switch-"+str_url[3]).addClass("active");
        	}
        	// style="color:rgb(174,214,43)"
       	 
        	buildMenu($(".lang-sw.active").html());
      	 
        	if($("#searchForm").attr("action").toLowerCase().indexOf("/carpath/") !== -1){
            	$("#searchForm").attr("action", $("#searchForm").attr("action").replace("Carpath","Carpath/"+$(".lang-sw.active").html().toLowerCase()));
        	}
        	else {
            	$("#searchForm").attr("action", "/"+$(".lang-sw.active").html().toLowerCase()+$("#searchForm").attr("action"));
        	}
        	if($("#searchFormSmall").attr("action").toLowerCase().indexOf("/carpath/") !== -1){
            	$("#searchFormSmall").attr("action", $("#searchFormSmall").attr("action").replace("Carpath","Carpath/"+$(".lang-sw.active").html().toLowerCase()));
        	}
        	else {
            	$("#searchFormSmall").attr("action", "/"+$(".lang-sw.active").html().toLowerCase()+$("#searchFormSmall").attr("action"));
        	}
       	 
   	 
    	$('.scrollToTop').fadeOut(1);
    	$('#searchButtonActive').hide();
    	$(".markerPageText").find('img').parent().append('<a class="fancybox not-add-lan" id="fancyboxCont"></a>');
    	//$(".markerPageText").find('img').addClass('fancybox');
   	 
    	$(".markerPageText").find('img').each(function() {
        	var elem = $(this);
        	$(this).next().attr('href',$(elem).attr('src'));
        	$(this).appendTo($(this).next());
    	});
	});
    
	function showImg(){
        	$.each($('.fancybox'), function() {
            	setTimeout(function(){
                	//$('.fancybox').css('display', 'inline-block');
            	}, 100);
        	});
	}
    
	$("#searchButtonActive").click(function() {
    	$("#searchForm").submit();
	});
	$("#searchButtonActiveSmall").click(function() {
    	$("#searchFormSmall").submit();
	});
    
	var hidden = true;
	function showHideMenu(){
    	if((hidden)&&(window.outerWidth>760)&&(window.innerWidth>760)){
        	hidden = false;
        	if((window.outerWidth>735)&&(window.innerWidth>735)){
            	$('.s-top').fadeIn("slow");
        	}
        	$('.topMenu').removeClass('topMenuSmall');
        	$('.s-logoIndexSmall').addClass('s-logoIndex');
        	$('.s-logoIndex').removeClass('s-logoIndexSmall');
        	$('.s-rightNavBarSmall').addClass('s-rightNavBar');
        	$('.s-rightNavBar').removeClass('s-rightNavBarSmall');
        	$('.dropDownMenu a').removeClass('scrollSmallerText');
        	$('.menuLineSmall').removeClass('menuLineExtraSmall');
        	$('.carpathNameSmall').addClass('carpathName');
        	$('.carpathName').removeClass('carpathNameSmall');
        	$('#hideMenuArrow').addClass('rotateHideArrow');
    	}
    	else{
        	hidden = true;
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
        	$('#hideMenuArrow').removeClass('rotateHideArrow');
    	}
	}
    
	function addCssToMenu(){
 }
	function mapPageMenu(){
            	//$('#contactsMenu').addClass('menuLine');
           	 
            	$('#mapMenu').addClass('menuLine');
            	$('.projectFunded').addClass('footerDisplayNone');
            	$('.footerRightMain').addClass('footerDisplayNone');
            	$('.footerLeftMain').addClass('footerDisplayNone');
            	$('.developpedText').addClass('developpedSmall');
            	$('.footerHeight').addClass('footerHeightMap');
            	$('.minHeight').removeClass('minHeight');
            	$('#googleMap').height(window.innerHeight-92);
            	$('.siteMap').addClass('siteMapSmall');
            	$('.mainMenuIntend').addClass('mainMenuIntendSmall');
            	$('.contentIntend').css('height','30');
           	 
            	if((window.innerWidth<1024)&&(window.innerWidth>780)){
                	$('#googleMap').height(window.innerHeight-104);
                	$('#mainMenuWidth').css('padding','5px 15px');
            	}else if((window.innerWidth<=780)&&(window.innerWidth>680)){
                	$('#googleMap').height(window.innerHeight-104);
            	}else if((window.innerWidth>340)&&(window.innerWidth<=680)){
                	$('#googleMap').height(window.innerHeight-84);
                	$('.footerNew').css('height','0');
                	$('.footerIntentInside').css('height','0');
                	$('.developpedText').css('width','90%');
                	$('#footer').removeClass('footerHeight');
                	$('#footer').removeClass('footerHeightMap');
                	$('#footer').css('height','90px !important');
            	}else if(window.innerWidth<=340){
                	$('#googleMap').height(window.innerHeight-97);
                	$('.footerNew').css('height','0');
                	$('.footerIntentInside').css('height','0');
                	$('.developpedText').css('width','90%');
                	$('#footer').removeClass('footerHeight');
                	$('#footer').removeClass('footerHeightMap');
                	$('#footer').css('height','90px !important');
            	}else{
                	$('#googleMap').height(window.innerHeight-114);
                	$('.footerNew').css('height','0');
                	$('.footerIntentInside').css('height','0');
                	$('.developpedText').css('width','90%');
                	$('#footer').removeClass('footerHeight');
                	$('#footer').removeClass('footerHeightMap');
                	$('#footer').css('height','90px !important');
            	}
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
   
	function showButton(){
    	$('#searchButtonActive').css('visibility','visible');
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
        	shrinkOn = 200;
    	if ((distanceY > shrinkOn)&&(window.outerWidth>760)&&(window.innerWidth>760)) {
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
        	$('#mainMenuWidth').addClass('paddingSmallMenu');
        	$('.scrollToTop').fadeIn(500);
    	}
    	else {
        	//if(document.URL.substr(document.URL.lastIndexOf('/')+1,document.URL.length)!='map'){
            	if((window.outerWidth>735)&&(window.innerWidth>735)){
                	$('.s-top').fadeIn("slow");
            	}
            	$('.topMenu').removeClass('topMenuSmall');
            	$('.s-logoIndexSmall').addClass('s-logoIndex');
            	$('.s-logoIndex').removeClass('s-logoIndexSmall');
            	$('.s-rightNavBarSmall').addClass('s-rightNavBar');
            	$('.s-rightNavBar').removeClass('s-rightNavBarSmall');
            	$('.dropDownMenu a').removeClass('scrollSmallerText');
            	$('.menuLineSmall').removeClass('menuLineExtraSmall');
            	$('.carpathNameSmall').addClass('carpathName');
            	$('.carpathName').removeClass('carpathNameSmall');
        	$('#mainMenuWidth').removeClass('paddingSmallMenu');
        	$('.scrollToTop').fadeOut(500);
        	//}
    	}
	});
}
window.onload = init();
</script>
</body>
</html>