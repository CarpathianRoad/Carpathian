<%-- 
    Document   : NewsPage
    Created on : Jan 10, 2015, 7:57:32 PM
    Author     : kiwi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:indexpage>
    <div class="s-new widthClass">
        <div class="s-new">
            <div class="countriesFilter countriesFilterRoute">
                <input type="hidden" id="type" value="0"/>
                <input type="hidden" id="lan" value="${lan}"/>
                <input type="hidden" id="menu" value="0"/>
                <a id="all" class="selected_country country-filter" >${titles.countryALL}</a>
                <a id="Ukraine" class="country-filter" >${titles.countryUA}</a>
                <a id="Poland" class="country-filter" >${titles.countryPL}</a>
                <a id="Hungary" class="country-filter" >${titles.countryHU}</a>
                <a id="Romania" class="country-filter" >${titles.countryRO}</a>
                <a id="Slovakia" class="country-filter" >${titles.countrySK}</a>
            </div>
         </div>
            <div class="all_news">
            </div>        
        <div class="s-clear"></div>
         <div class="loading_block">
            <img src="${Constants.URL}img/status.gif" />
        </div>
    </div>
</t:indexpage>
<script>
$(document).ready(function () {
   loadContent("all", "0");
   $.ajaxPrefilter(function( options, originalOptions, jqXHR ) {
    options.async = true;
});
});

    $(".country-filter").click(function(){
        $(".all_news").html("");
        $(".countriesFilter a").removeClass("selected_country");
        loadContent($(this).attr("id"), "0");
        $(this).addClass("selected_country");
    });
function loadButtonInit() {
    $(".load-more-content .btn").click(function(){
        loadContent($(".selected_country").attr("id"), $(this).attr("count"));
    });
}
function loadContent(country, count){
    var type = $("#type").val();
    var lan = $("#lan").val();
    var menuCat = $("#menu").val();
    $(".loader-block").show();
    $.ajax({
            type: "get",
            url: "${Constants.URL}articles/loadсontent",
            cache: false,    
            data:'lan='+lan+'&count='+count+'&country='+country+'&type='+type+'&menuCat='+menuCat,
            mimeType:"text/html; charset=UTF-8",
            success: function(response){
             $(".load-more-content").remove();
             $(response).hide().appendTo(".all_news").fadeIn(1000);
             $(".doNotShow").hide();
             $(".loader-block").hide();
             loadButtonInit();
            },
            error: function(response){      
             console.log(response);
            }
        });
}
</script>
 