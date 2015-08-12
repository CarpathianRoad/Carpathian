<%-- 
    Document   : Slider
    Created on : Jul 3, 2015, 1:55:51 PM
    Author     : kiwi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:adminpage>
    <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Users
                        </h1>
                    </div>
                </div>
	<div class="row">
                    <div class="col-lg-10 slider-page">
	<form name="sliderEdit" method="POST" action="${Constants.URL}system/slideredit.do" id="sliderEdit">
            <div class="col-lg-12 field">
                        <div id="imageUpload" class="form-group">
                            <div class="img-content">
                                <div class="image-upload slide-upload-button">
                                    <div id="dialog">
                                        <iframe id="myIframe" src=""></iframe>
                                    </div>
                                    <button type="button" id="dialogBtn" class="btn btn-primary img-input-box marginbottom30">
                                    Browse image for slide
                                    </button>
                                </div>  
                            <input type="hidden" name="real-img-path" id="real-img-path" />                           
                        </div>
                    </div>
                </div>
        </form>
        <p>
            <button class="btn btn-success margintop30 marginbottom30" id="sudmitData" type="submit">Save changes</button>
        </p>
    </div>
        </div>
</t:adminpage>
<script>
    $(document).ready(function () { 
        initDialog();
        
        if("${slides}" !== "" && "${slides}" !== undefined) {
            <c:forEach items="${slides}" var="slide">
                
                 $("#imageUpload .img-content").append("<div class='col-lg-4 slider-block'><a class='returnImage' data-url='"+"${Constants.URL}"+ "${slide.image}" + "'>"
                                + "<img src='"+"${Constants.URL}"+ "${slide.image}" + "' alt='" + "${slide.image}" + "'  /><img src='"+"${Constants.URL}"+"img/remove.png' class='remove-icon'/></a>"
                    +"<div class='col-lg-12 margintop30 field'>"
                                            +"<div class='btn-group lang-switch-title' role='group'>"
                                                +"<button type='button' id='titleEN' class='btn btn-default active'>EN</button>"
                                               +" <button type='button' id='titleUA' class='btn btn-default'>UA</button>"
                                               +" <button type='button' id='titleHU' class='btn btn-default'>HU</button>"
                                               +" <button type='button' id='titleSK' class='btn btn-default'>SK</button>"
                                               +" <button type='button' id='titleRO' class='btn btn-default'>RO</button>"
                                              +"</div></div>"
						+"<div class='col-lg-12 margintop10 field'>"
                                                +"<input type='text' value='"+"${slide.urlEN}"+"' name='"+"${slide.image}"+"-urlEN' placeholder='URL EN' class='form-control input-title-lang' lang='titleEN'>"
                                                +"<input type='text' value='"+"${slide.urlUA}"+"' name='"+"${slide.image}"+"-urlUA' placeholder='URL UA' class='form-control input-title-lang' lang='titleUA'>"
                                                +"<input type='text' value='"+"${slide.urlHU}"+"' name='"+"${slide.image}"+"-urlHU' placeholder='URL HU' class='form-control input-title-lang' lang='titleHU'>"
                                                +"<input type='text' value='"+"${slide.urlSK}"+"' name='"+"${slide.image}"+"-urlSK' placeholder='URL SK' class='form-control input-title-lang' lang='titleSK'>"
                                                +"<input type='text' value='"+"${slide.urlRO}"+"' name='"+"${slide.image}"+"-urlRO' placeholder='URL RO' class='form-control input-title-lang' lang='titleRO'>"
                                                +"<br/>"
                                                +"<input type='text' value='"+"${slide.textEN}"+"' name='"+"${slide.image}"+"-textEN' placeholder='Text on slide EN' class='form-control input-title-lang' lang='titleEN'>"
                                                +"<input type='text' value='"+"${slide.textUA}"+"' name='"+"${slide.image}"+"-textUA' placeholder='Text on slide UA' class='form-control input-title-lang' lang='titleUA'>"
                                                +"<input type='text' value='"+"${slide.textHU}"+"' name='"+"${slide.image}"+"-textHU' placeholder='Text on slide HU' class='form-control input-title-lang' lang='titleHU'>"
                                                +"<input type='text' value='"+"${slide.textSK}"+"' name='"+"${slide.image}"+"-textSK' placeholder='Text on slide SK' class='form-control input-title-lang' lang='titleSK'>"
                                                +"<input type='text' value='"+"${slide.textRO}"+"' name='"+"${slide.image}"+"-textRO' placeholder='Text on slide RO' class='form-control input-title-lang' lang='titleRO'>"
                                                
                                              +"</div></div>");
            
                var real = $("#real-img-path").val();        
                $("#real-img-path").val(real + "," + "${slide.image}");             
             </c:forEach>
             }
             initRemove();
            initInputButtons();
        });
function initInputButtons(){
        var currentLangT = $(".lang-switch-title button.active").attr("id");
        $(".input-title-lang[lang='"+currentLangT+"']").show();
        $(".lang-switch-title button").click(function(){
            var par = $(this).closest(".slider-block");
            $(par).find(".lang-switch-title button").removeClass("active");
            $(this).addClass("active");
            var currentLangT = $(this).attr("id");
            $(par).find(".input-title-lang").hide();
            $(par).find(".input-title-lang[lang='"+currentLangT+"']").show();
        });
}
function imageInserted(){
    $( "#dialog" ).dialog( "close" );
    initRemove();
    initDialog();
    initInputButtons();
}
function initDialog(){
    var current = "";
    var currentAva = "";
    var home = "${Constants.FILE_URL}".replace(/\//g,",");
    if($('#imageUpload .returnImage img:not(.remove-icon)').last().length > 0) {
        var path = $('#imageUpload .returnImage img:not(.remove-icon)').last().attr("alt").split("/").slice(0,-1);
        
        path = jQuery.grep(path, function(value) {
            return value !== "content";
        });
        path = jQuery.grep(path, function(value) {
            return value !== "img";
        });
        current = home+path.toString()+",";
    }
    $("#dialog").dialog({
            autoOpen: false,
            modal: true,
            height: 600,
            width: 800,
            position: { my: "center top", at: "center top", of: window },
            open: function(ev, ui){
                     $('#myIframe').attr('src','${Constants.URL}tools/fileManager?path='+current+'&type=slider');
                  }
    });
    $('#dialogBtn').click(function(){
        $('#dialog').dialog('open');
    });
}
function initRemove(){
    $("#imageUpload .returnImage img.remove-icon").click(function(){
        $(this).parent().closest('div').remove();
        var newurl = "";
        $( "#imageUpload .returnImage" ).each(function( index ) {
            newurl = newurl + "," + $(this).find("img").first().attr("alt");
        });
        $("#real-img-path").val(newurl);
    });
}
$("#sudmitData").click(function(){
    var real = $("#real-img-path").val();
    $("#real-img-path").val(real.substring(1, real.lenght));
    $("#sliderEdit").submit();
});
</script>