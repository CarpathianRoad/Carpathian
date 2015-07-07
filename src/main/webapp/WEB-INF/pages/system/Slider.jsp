<%-- 
    Document   : Slider
    Created on : Jul 3, 2015, 1:55:51 PM
    Author     : kiwi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:adminpage>
        <div class="container admin-panel-container">
            <div class="row">
                <form name="sliderEdit" method="POST" action="${Constants.URL}system/slideredit.do" id="sliderEdit">
                <div class="row add-row">
                    <div class="col-lg-12 field">
                        <div id="imageUpload" class="form-group">
                            <div class="img-content">
                                <div class="image-upload slide-upload-button">
                                    <div id="dialog">
                                        <iframe id="myIframe" src=""></iframe>
                                    </div>
                                    <button type="button" id="dialogBtn" class="btn btn-primary img-input-box">
                                    Browse image for slide
                                    </button>
                                </div>    
                            </div>
                            <input type="hidden" name="real-img-path" id="real-img-path" />                           
                        </div>
                    </div>
                </div>
                </form>
                <p>
                    <button class="btn btn-primary btn-mini margintop30 marginbottom30" id="sudmitData" type="submit">Save</button>
                </p>
            </div>
		<div class="row">
			<div class="col-lg-5">
                        </div>
		</div> 
        </div>
</t:adminpage>
<script>
    $(document).ready(function () { 
        initDialog();
        
        if("${slides}" !== "" && "${slides}" !== undefined) {
            <c:forEach items="${slides}" var="slide">
                
                 $("#imageUpload .img-content").append("<div class='col-lg-3 slider-block'><a class='returnImage' data-url='"+"${Constants.URL}"+"img/markerImages/" + "${slide.image}" + "'>"
                                + "<img src='"+"${Constants.URL}"+ "${slide.image}" + "' alt='" + "${slide.image}" + "'  /><img src='"+"${Constants.URL}"+"img/remove.png' class='remove-icon'/></a> \n\
                    <input type='text' value='${slide.url}' placeholder='URL' class=' slider slider-url form-control' name='"+"${slide.image}"+"-url'/>\n\
                    <input type='text' value='${slide.text}' placeholder='Text on slide' name='"+"${slide.image}"+"-text' class='slider slider-text form-control'/></div>");
            
                var real = $("#real-img-path").val();        
                $("#real-img-path").val(real + "," + "${slide.image}");             
             </c:forEach>
             }
             initRemove();
        });
function imageInserted(){
    $( "#dialog" ).dialog( "close" );
    initRemove();
    initDialog();
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