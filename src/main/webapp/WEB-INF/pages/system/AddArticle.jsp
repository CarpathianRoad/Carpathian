<%-- 
    Document   : Partners
    Created on : Jan 13, 2015, 9:59:12 PM
    Author     : kiwi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<t:adminpage>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
    <script src="${Constants.URL}js/ckeditor/ckeditor.js"></script>
    <div class="container margintop20">
            <h4>Add article</h4>
				<!-- Place inside the <head> of your HTML -->

                                <form action="${Constants.URL}system/insertdata.do" name="addArticleForm" id="addForm" method="POST" type="multipart/form-data">
                                    
            <div class="row add-row"><div class="col-lg-12 margintop30 field">
                                                        <label for="tlt">Title<span class="red-star">*</span></label><br/>
                                            <div class="btn-group lang-switch-title" role="group" aria-label="...">
                                                <button type="button" id="titleEN" class="btn btn-default active">In English</button>
                                                <button type="button" id="titleUA" class="btn btn-default">In Ukrainian</button>
                                                <button type="button" id="titleHU" class="btn btn-default">In Hungarian</button>
                                                <button type="button" id="titleSK" class="btn btn-default">In Slovak</button>
                                                <button type="button" id="titleRO" class="btn btn-default">In Romanian</button>
                                                <button type="button" id="titlePL" class="btn btn-default">In Polish</button>
                                                <button type="button" id="titleGE" class="btn btn-default">In German</button>
                                                <button type="button" id="titleCZ" class="btn btn-default">In Czech</button>
                                                <button type="button" id="titleSRB" class="btn btn-default">In Serbian</button>
                                              </div>
                                        </div>
						<div class="col-lg-6 margintop10 field">
                                                <input type="text" name="titleEN" class="form-control input-title-lang" lang="titleEN" id="tlt"  maxlength="55">
                                                <input type="text" name="titleUA" class="form-control input-title-lang" lang="titleUA" id="tlt"  maxlength="55">
                                                <input type="text" name="titleHU" class="form-control input-title-lang" lang="titleHU" id="tlt"  maxlength="55">
                                                <input type="text" name="titleSK" class="form-control input-title-lang" lang="titleSK" id="tlt"  maxlength="55">
                                                <input type="text" name="titlePL" class="form-control input-title-lang" lang="titlePL" id="tlt"  maxlength="55">
                                                <input type="text" name="titleRO" class="form-control input-title-lang" lang="titleRO" id="tlt"  maxlength="55">
                                                <input type="text" name="titleGE" class="form-control input-title-lang" lang="titleGE" id="tlt"  maxlength="55">
                                                <input type="text" name="titleCZ" class="form-control input-title-lang" lang="titleCZ" id="tlt"  maxlength="55">
                                                <input type="text" name="titleSRB" class="form-control input-title-lang" lang="titleSRB" id="tlt"  maxlength="55">
                                                <div class="validation" id="textValidation"></div>
                                              </div>
                                        </div>
                <hr>
                                    <div class="row add-row">
                                        
						<div class="col-lg-3 field">
                                                    <div class="form-group">
                                                <label for="sel1">Content type<span class="red-star">*</span></label>
                                                <select class="form-control" name="type" id="sel1">
                                                  <option value="option" disabled selected>Select option</option>
                                                  <option value="0">News</option>
                                                  <option value="1">Anons</option>
                                                  <option value="2">Marker</option>
                                                  <option value="3">Simple Article</option>
                                                </select>
                                                <div class="validation">
							</div>
                                              </div>
							
                                                </div>
						<div class="col-lg-3 field">
                                                    <div class="form-group">
                                                <label for="sel3">Publication country<span class="red-star">*</span></label>
                                                <select class="form-control" name="public_country" id="sel2">
                                                  <option value="option" disabled selected>Select option</option>
                                                  <option value="Ukraine">Ukraine</option>
                                                  <option value="Poland">Poland</option>
                                                  <option value="Hungary">Hungary</option>
                                                  <option value="Romania">Romania</option>
                                                  <option value="Slovakia">Slovakia</option>
                                                </select>
                                                <div class="validation">
							</div>
                                              </div>
                                                </div>
                                        
						<div class="col-lg-3 field">
                                                    <div class="form-group">
                                                <label for="sel3">Category (menu)<span class="red-star">*</span></label>
                                                <select class="form-control" name="menuCat" id="sel3">
                                                  <option value="option" disabled selected>Select option</option>
                                                    <c:forEach items="${menuList}" var="item">
                                                        <option value="${item.id}">${item.titleEN}</option>
                                                    </c:forEach>
                                               </select>
                                                <div class="validation">
							</div>
                                              </div>
                                                </div>
                                    </div>
                <hr>
                                    
                                                <input type="hidden" class="form-control" id="auth" name="author" value="<c:out value="${sessionScope.user.username}"/>">
                                    
                                    <div class="row add-row">
						<div class="col-lg-3 field">
                                                    <div class="form-group">
                                                <label for="datepicker">Date<span class="red-star">*</span></label>
                                                <input type="text" class="form-control" name="date" id="datepicker">
                                                    </div>
                                                </div>
						<div class="col-lg-3 field">
                                                    <div class="form-group">
                                                <label for="datepicker-act">Actual date</label>
                                                <input type="text" class="form-control" name="act-date" id="datepicker-act">
                                                    </div>
                                                </div>
                                    </div>
                <hr>
            <div class="row add-row">

                <div class="col-lg-10 field">
                                                    <div class="form-group">

                                                        <label for="img">Images</label>
                                                        <div class="img-content">
                                                            <div class="image-upload">
                                                                <div id="dialog">
    <iframe id="myIframe" src=""></iframe>
</div>
                                                                <button type="button" id="dialogBtn" class="btn btn-primary btn-lg img-input-box">
                    Upload image
                </button>
                                                            </div>                                     
                
                                                           
                                                        </div>
                                                        <input type="hidden" name="real-img-path" id="real-img-path" />
                                                        
                                              </div>
                                                </div>
            </div>
                <hr>
                                    <div class="row add-row">
                                        <div class="col-lg-3 field map-field">
                                                    <div class="form-group">
                                                <label for="x">X</label>
                                                <input type="text" class="form-control coordinate" name="x" id="latitude0">
                                                <div class="validation"></div>
                                                <div class="form-group">
                                                <label for="y">Y</label>
                                                <input type="text" class="form-control coordinate"  name="y" id="longitude0">
                                                <div class="validation"></div>
                                              </div>
                                                <div class="div-addres div-addres-0">
                                                <div class="form-group">
                                                <label for="auth">Search adress</label>
                                                <input type="text" class="form-control"  name="googleaddress_0" id="address0"/>
                                                    </div>
					</div>
                                              </div>
                                                </div>
                                        <div class="col-lg-5 field map-block">
                                              <div id="map_canvas"></div><br/>
				<input type="hidden" id="mass-count-marker" name="mass_count_marker" value="~0~," >
				<input type="hidden" id="address-number" value="0" >
				<!--<div class="main-button">
					<input type="button" onclick="viewMarker(0);" value="?????? 0" class="marker-view marker-view-0" >
				</div>-->
                                        </div>
                                        
                                            </div>
             
            <div class="row add-row">
                                             <div class="col-lg-3 field">
                                                    <div class="form-group">
                                                <label for="cnt">Country</label>
                                                <input type="text" class="form-control disabled-input" name="country" id="cnt">
                                              </div>
                                                </div>
						<div class="col-lg-3 field">
                                                    <div class="form-group">
                                                <label for="rgn">Region</label>
                                                <input type="text" class="form-control disabled-input" name="region" id="rgn">
                                              </div>
						</div>
						<div class="col-lg-3 field">
                                                    <div class="form-group">
                                                <label for="dstr">District</label>
                                                <input type="text" class="form-control disabled-input" name="district" id="dstr">
                                              </div>
						</div>
						<div class="col-lg-3 field">
                                                    <div class="form-group">
                                                <label for="twn">Town</label>
                                                <input type="text" class="form-control disabled-input" name="town" id="twn">
                                              </div>
						</div>
                                            </div> 
                <hr>
            <div class="row add-row list-block markers">
                <div class="col-lg-10 field">
                    <div> <label>Marker type:</label></div>
                    <ul>
                        <c:forEach items="${markers}" var="item">
                            <li>
                                <div class="checkbox">  
                                <label><img src="${Constants.URL}img/markers/${item.shortTitle}.png"/><input type="checkbox" value="${item.shortTitle}">${item.shortTitle}</label>
                              
                              </div>
                            </li>
                        </c:forEach>
                    </ul>
                    <input type="hidden" name="marker-type-all" id="marker-type-all" />
                                                <div class="validation"></div>
                </div>
              
    
            </div> 
                <hr>
            <div class="row add-row list-block filters">
                <div class="col-lg-10 field">
                    <div> <label>Filter type:</label></div>
                    <ul>  
                        <c:forEach items="${filters}" var="item">
                        <li>
                            <div class="checkbox">  
                                <label class="<c:if test="${fn:contains(item.fullTitle, ':')}">double-point-filter</c:if>" >
                                    <input type="checkbox" value="${item.shortTitle}">${item.fullTitle}
                                </label>
                            </div>
                        </li> 
                        </c:forEach>
                    </ul>
                    <input type="hidden" name="filter-type-all" id="filter-type-all" />
                                                <div class="validation"></div>
                </div>
              
    
            </div>
                <hr>
                                    <div class="row add-row">
                                        <div class="col-lg-12 margintop30 field">
                                            <div class="btn-group lang-switch-text" role="group" aria-label="...">
                                                <button type="button" id="textEN" class="btn btn-default active">In English</button>
                                                <button type="button" id="textUA" class="btn btn-default">In Ukrainian</button>
                                                <button type="button" id="textHU" class="btn btn-default">In Hungarian</button>
                                                <button type="button" id="textSK" class="btn btn-default">In Slovak</button>
                                                <button type="button" id="textRO" class="btn btn-default">In Romanian</button>
                                                <button type="button" id="textPL" class="btn btn-default">In Polish</button>
                                                <button type="button" id="textGE" class="btn btn-default">In German</button>
                                                <button type="button" id="textCZ" class="btn btn-default">In Czech</button>
                                                <button type="button" id="textSRB" class="btn btn-default">In Serbian</button>
                                              </div>
                                        </div>
						<div class="col-lg-12 margintop10 field textareas">
                                                    
                                                        <div class="ck-data-box" id="CKdata">
                                                            
                                                        </div>
                                                    <div lang="textEN" class="textarea-msg"><textarea name="textEN" id="editorEN" rows="10" cols="80" class="input-block-level"></textarea></div>
                                                    <div lang="textUA" class="textarea-msg"><textarea name="textUA" id="editorUA" rows="10" cols="80" class="input-block-level"></textarea></div>
                                                    <div lang="textHU" class="textarea-msg"><textarea name="textHU" id="editorHU" rows="10" cols="80" class="input-block-level"></textarea></div>
                                                    <div lang="textSK" class="textarea-msg"><textarea name="textSK" id="editorSK" rows="10" cols="80" class="input-block-level"></textarea></div>
                                                    <div lang="textRO" class="textarea-msg"><textarea name="textRO" id="editorRO" rows="10" cols="80" class="input-block-level"></textarea></div>
                                                    <div lang="textPL" class="textarea-msg"><textarea name="textPL" id="editorPL" rows="10" cols="80" class="input-block-level"></textarea></div>
                                                    <div lang="textGE" class="textarea-msg"><textarea name="textGE" id="editorGE" rows="10" cols="80" class="input-block-level"></textarea></div>
                                                    <div lang="textCZ" class="textarea-msg"><textarea name="textCZ" id="editorCZ" rows="10" cols="80" class="input-block-level"></textarea></div>
                                                    <div lang="textSRB" class="textarea-msg"><textarea name="textSRB" id="editorSRB" rows="10" cols="80" class="input-block-level"></textarea></div>
							<div class="validation">
							</div>
						</div>
					</div>
        </form>
							<p>
								<button class="btn btn-primary btn-mini margintop30 marginbottom30" id="sudmitData" type="submit">Save</button>
							</p>
            <script> 
                CKEDITOR.replace('editorEN', {
                    filebrowserBrowseUrl : '${Constants.URL}tools/fileManager',
                    filebrowserUploadUrl : '${Constants.URL}tools/fileManager',
                    filebrowserImageBrowseUrl : '${Constants.URL}tools/fileManager',
                    filebrowserImageUploadUrl : '${Constants.URL}tools/fileManager',
                    filebrowserWindowWidth  : 800,
                    filebrowserWindowHeight : 500
                });
                CKEDITOR.replace('editorUA', {
                    filebrowserBrowseUrl : '${Constants.URL}tools/fileManager',
                    filebrowserUploadUrl : '${Constants.URL}tools/fileManager',
                    filebrowserImageBrowseUrl : '${Constants.URL}tools/fileManager',
                    filebrowserImageUploadUrl : '${Constants.URL}tools/fileManager',
                    filebrowserWindowWidth  : 800,
                    filebrowserWindowHeight : 500
                });
                CKEDITOR.replace('editorHU', {
                    filebrowserBrowseUrl : '${Constants.URL}tools/fileManager',
                    filebrowserUploadUrl : '${Constants.URL}tools/fileManager',
                    filebrowserImageBrowseUrl : '${Constants.URL}tools/fileManager',
                    filebrowserImageUploadUrl : '${Constants.URL}tools/fileManager',
                    filebrowserWindowWidth  : 800,
                    filebrowserWindowHeight : 500
                });
                CKEDITOR.replace('editorSK', {
                    filebrowserBrowseUrl : '${Constants.URL}tools/fileManager',
                    filebrowserUploadUrl : '${Constants.URL}tools/fileManager',
                    filebrowserImageBrowseUrl : '${Constants.URL}tools/fileManager',
                    filebrowserImageUploadUrl : '${Constants.URL}tools/fileManager',
                    filebrowserWindowWidth  : 800,
                    filebrowserWindowHeight : 500
                });
                CKEDITOR.replace('editorPL', {
                    filebrowserBrowseUrl : '${Constants.URL}tools/fileManager',
                    filebrowserUploadUrl : '${Constants.URL}tools/fileManager',
                    filebrowserImageBrowseUrl : '${Constants.URL}tools/fileManager',
                    filebrowserImageUploadUrl : '${Constants.URL}tools/fileManager',
                    filebrowserWindowWidth  : 800,
                    filebrowserWindowHeight : 500
                });
                CKEDITOR.replace('editorRO', {
                    filebrowserBrowseUrl : '${Constants.URL}tools/fileManager',
                    filebrowserUploadUrl : '${Constants.URL}tools/fileManager',
                    filebrowserImageBrowseUrl : '${Constants.URL}tools/fileManager',
                    filebrowserImageUploadUrl : '${Constants.URL}tools/fileManager',
                    filebrowserWindowWidth  : 800,
                    filebrowserWindowHeight : 500
                });
                CKEDITOR.replace('editorGE', {
                    filebrowserBrowseUrl : '${Constants.URL}tools/fileManager',
                    filebrowserUploadUrl : '${Constants.URL}tools/fileManager',
                    filebrowserImageBrowseUrl : '${Constants.URL}tools/fileManager',
                    filebrowserImageUploadUrl : '${Constants.URL}tools/fileManager',
                    filebrowserWindowWidth  : 800,
                    filebrowserWindowHeight : 500
                });
                CKEDITOR.replace('editorCZ', {
                    filebrowserBrowseUrl : '${Constants.URL}tools/fileManager',
                    filebrowserUploadUrl : '${Constants.URL}tools/fileManager',
                    filebrowserImageBrowseUrl : '${Constants.URL}tools/fileManager',
                    filebrowserImageUploadUrl : '${Constants.URL}tools/fileManager',
                    filebrowserWindowWidth  : 800,
                    filebrowserWindowHeight : 500
                });
                CKEDITOR.replace('editorSRB', {
                    filebrowserBrowseUrl : '${Constants.URL}tools/fileManager',
                    filebrowserUploadUrl : '${Constants.URL}tools/fileManager',
                    filebrowserImageBrowseUrl : '${Constants.URL}tools/fileManager',
                    filebrowserImageUploadUrl : '${Constants.URL}tools/fileManager',
                    filebrowserWindowWidth  : 800,
                    filebrowserWindowHeight : 500
                });
                
                
    $(document).ready(function () { 
        
        initDialog();
        $("#textValidation").html('<span style="color:red">Max length for title - 55 chars</span>');
        var currentLang = $(".lang-switch-text button.active").attr("id");
        $(".textareas .textarea-msg[lang='"+currentLang+"']").show();
        var currentLangT = $(".lang-switch-title button.active").attr("id");
        $(".input-title-lang[lang='"+currentLangT+"']").show();
        var myDate = new Date();
        var currentMonth = (myDate.getMonth()+1);
        var currentDate = myDate.getDate();
        if (currentMonth < 10) { currentMonth = '0' + currentMonth; }
        if (currentDate < 10) { currentDate = '0' + currentDate; }
        var prettyDate = currentDate + '.' +currentMonth + '.' +  myDate.getFullYear();
        $( "#datepicker" ).datepicker();
        $( "#datepicker" ).datepicker("option", "dateFormat", "dd.mm.yy");
        $("#datepicker").val(prettyDate);
        $( "#datepicker-act" ).datepicker();
        $( "#datepicker-act" ).datepicker("option", "dateFormat", "dd.mm.yy");
        $('.selectpicker').selectpicker({
            size: 4
        });
        var obj = $("#cke_120_fileInput").contents().find(".returnImage");
         obj.click("click", function (e) {
            var urlImage = $(this).attr("data-url");
            //This takes the data value and id of the editor and sends the data(i.e.,image url) back to the caller page
            $("#cke_71_textInput").val("s2as1");
        });
});

function imageInserted(){
    $( "#dialog" ).dialog( "close" );
    initRemove();
    initDialog();
}
function initDialog(){
    var current = "";
    if($('.returnImage img:not(.remove-icon)').last().length > 0) {
        var path = $('.returnImage img:not(.remove-icon)').last().attr("alt").split("/").slice(0,-1);
                //var curr = path.value;
        var home = "${Constants.FILE_URL}".replace(/\//g,",");
        path = jQuery.grep(path, function(value) {
            return value !== "content";
        });
        path = jQuery.grep(path, function(value) {
            return value !== "img";
        });
        current = home+path.toString()+",";
    }
    console.log(current);
    $("#dialog").dialog({
            autoOpen: false,
            modal: true,
            height: 600,
            width: 800,
            position: { my: "center top", at: "center top", of: window },
            open: function(ev, ui){
                     $('#myIframe').attr('src','${Constants.URL}tools/fileManager?path='+current);
                  }
        });
        
        $('#dialogBtn').click(function(){
            $('#dialog').dialog('open');
        });
}
function initRemove(){
$(".returnImage img.remove-icon").click(function(){
    $(this).parent("a").remove();
    var newurl = ",";
    $( ".returnImage" ).each(function( index ) {
        newurl = newurl + $(this+" img").attr("alt");
        console.log(newurl);
    });
});
}

$(".lang-switch-text button").click(function(){
    $(".lang-switch-text button").removeClass("active");
    $(this).addClass("active");
    var currentLang = $(this).attr("id");
    $(".textareas .textarea-msg").hide();
    $(".textareas .textarea-msg[lang='"+currentLang+"']").show();
});
$(".lang-switch-title button").click(function(){
    $(".lang-switch-title button").removeClass("active");
    $(this).addClass("active");
    var currentLangT = $(this).attr("id");
    $(".input-title-lang").hide();
    $(".input-title-lang[lang='"+currentLangT+"']").show();
});
$("#sudmitData").click(function(){
    $("div.validation").html('');
    var isValidate = true;
    var check_str_markers = "";
    var check_str_filters = "";
    $(".markers input:checkbox:checked:checked").each(function() {
        check_str_markers = check_str_markers + this.value + ",";
    });
    $("#marker-type-all").attr("value", check_str_markers.slice(0,-1));
    $(".filters input:checkbox:checked:checked").each(function() {
        check_str_filters = check_str_filters + this.value + ",";
    });
    $("#filter-type-all").attr("value", check_str_filters.slice(0,-1));
    
    if($(".input-title-lang[lang='titleEN']").val() === "") {
        $("#textValidation").html('<span style="color:red">Enter the title of the article</span>');
        isValidate = false;
    }
    else {
        $("#textValidation").html("");
    }
    $(".input-title-lang").each(function(){
        if($(this).val() !== ""){
            if($(this).val().length > 55) {
                $("#textValidation").html('<span style="color:red">Max length for title - 55 chars</span>');
                isValidate = false;
            }else {
        $("#textValidation").html("");
    }
        }
    });
    
    if($("#sel1").val() === null) {
        $("#sel1").next("div.validation").html('<span style="color:red">Choose the item</span>');
        isValidate = false;
    }
    if($("#sel2").val() === null) {
        $("#sel2").next("div.validation").html('<span style="color:red">Choose the item</span>');
        isValidate = false;
    }
    if($("#sel3").val() === null) {
        $("#sel3").next("div.validation").html('<span style="color:red">Choose the item</span>');
        isValidate = false;
    }
    if($("#sel1").val() === "2") {
        if($("#latitude0").val() === "") {
            $("#latitude0").next("div.validation").html('<span style="color:red">Enter the x coord</span>');
            isValidate = false;
        }
        else {
            $("#latitude0").next("div.validation").html('');
        }
        if($("#longitude0").val() === "") {
         $("#longitude0").next("div.validation").html('<span style="color:red">Enter the y coord</span>');
            isValidate = false;   
        }
        else {
            $("#longitude0").next("div.validation").html('');
        }
        if(check_str_markers === "") {
            $("#marker-type-all").next("div.validation").html('<span style="color:red">Select at least one marker type.</span>');
            isValidate = false;   
        }
        else {
            $("#marker-type-all").next("div.validation").html('');
        }
        if(check_str_markers === "") {
            $("#filter-type-all").next("div.validation").html('<span style="color:red">Select at least one filter type.</span>');
            isValidate = false;   
        }
        else {
            $("#filter-type-all").next("div.validation").html('');
        }
    }
        
    if(isValidate) {
        var real = $("#real-img-path").val();
        $("#real-img-path").val(real.substring(1, real.lenght));
        $("#addForm").submit();
    }
    });
    
    var geocoder;
    var map;
    var marker = []; 
    var markerOnMap = null;
    function initialize()
            {
                    //??????????? ?????
                    var latlng = new google.maps.LatLng(50.4501,30.523400000000038);
                    var options = {
                            zoom: 5,
                            center: latlng,
                            mapTypeId: google.maps.MapTypeId.ROADMAP
                    };
                     map = new google.maps.Map(document.getElementById("map_canvas"), options);

                    //??????????? ?????????
                    geocoder = new google.maps.Geocoder();
                    google.maps.event.addListener(map, 'click', function(event) {
                        addMarker(event.latLng);
                    });

            }
            
            function addMarker(location) {
                if(markerOnMap==null){
                    markerOnMap = new google.maps.Marker({
                        position: location,
                        draggable: true,
                        map: map
                    });
                }else{
                    markerOnMap.setPosition(location);
                }
                geocodePosition(location)
                google.maps.event.addListener(markerOnMap, 'dragend', function() 
                {
                    geocodePosition(markerOnMap.getPosition());
                });
            }
            function geocodePosition(location) {
                var infowindow = new google.maps.InfoWindow();
                geocoder.geocode({'latLng': location}, function(results, status) {
                    if (status == google.maps.GeocoderStatus.OK) {
                        var address = results[0].address_components;
                        $('#address0').val(results[1].formatted_address);
                        //console.log("GPS = " + location);
                        //console.log("Formatted adrees = " + results[1].formatted_address);
                        for (var p = address.length-1; p >= 0; p--) {
                            if (address[p].types.indexOf("country") != -1) {
                                //console.log("country = " + address[p].long_name);
                                $('#cnt').attr("value",address[p].long_name);
                            }
                            if (address[p].types.indexOf("locality") != -1) {
                                //console.log("town = " + address[p].long_name);
                                $('#twn').attr("value",address[p].long_name);
                            }
                            if (address[p].types.indexOf("route") != -1) {
                                //console.log("route = " + address[p].long_name);
                            }
                            if (address[p].types.indexOf("administrative_area_level_2") != -1) {
                                //console.log("district = " + address[p].long_name);
                                $('#dstr').attr("value",address[p].long_name);
                            }
                            if (address[p].types.indexOf("administrative_area_level_1") != -1) {
                                //console.log("region = " + address[p].long_name);
                                $('#rgn').attr("value",address[p].long_name);
                            }
                            if (address[p].types.indexOf("street_number") != -1) {
                                //console.log("street number = " + address[p].long_name);
                            }
                            if (address[p].types.indexOf("postal_code") != -1) {
                                //console.log("postal code = " + address[p].long_name);
                            }
                        }
                        if (results[1]) {
                        } else {
                            alert('No results found');
                        }
                    } else {
                        alert('Geocoder failed due to: ' + status);
                    }
                });
                map.setCenter(location);
                //dam(location);
                $('#latitude0').val(location.lat());
                $('#longitude0').val(location.lng());
            }
        
            
            function dam(num)
                    {
                            var text = 'marker '+num;
                            marker[num] = new google.maps.Marker({
                            map: map,
                            draggable: true,
                            title: text
                      });

                    $(function() {
                    $("#address"+num).autocomplete({
                      //?????????? ???????? ??? ?????? ??? ??????????????
                      source: function(request, response) {
                            geocoder.geocode( {'address': request.term}, function(results, status) {
                              response($.map(results, function(item) {
                                    return {
                                      label:  item.formatted_address,
                                      value: item.formatted_address,
                                      latitude: item.geometry.location.lat(),
                                      longitude: item.geometry.location.lng()
                                    }
                              }));
                            })
                      },
                      //??????????? ??? ?????? ??????????? ??????
                      select: function(event, ui) {
                            $("#latitude"+num).val(ui.item.latitude);
                            $("#longitude"+num).val(ui.item.longitude);
                            var location = new google.maps.LatLng(ui.item.latitude, ui.item.longitude);
                            marker[num].setPosition(location);
                            map.setCenter(location);
                      }
                    });
              });

              //????????? ????????? ??????? ????????? ?????????????? ??? ??????? ??? ??? ???????????  
              google.maps.event.addListener(marker[num], 'drag', function() {
                    geocoder.geocode({'latLng': marker[num].getPosition()}, function(results, status) {
                      if (status == google.maps.GeocoderStatus.OK) {
                            if (results[0]) {
                              $('#address'+num).val(results[0].formatted_address);
                              $('#latitude'+num).val(marker[num].getPosition().lat());
                              $('#longitude'+num).val(marker[num].getPosition().lng());
                                    jQuery(".marker-view").show();
                                    jQuery(".div-addres").hide();
                                    jQuery(".div-addres-"+num).show();
                            }
                      }
                    });
              });
                    }
            $(document).ready(function(){ 
              initialize();
              dam(0);
              jQuery(".coordinate").keyup(function(){
                    setMarkerPosition(this);
              });
            });
            function addAdress()
                    {
                            var number = jQuery("#address-number").val();
                            /*number++;
                            jQuery(".main-address").append(
                                            '<div class="div-addres div-addres-'+number+'">'+number+'<label>????? ??? ??????: </label>'+
                                            '<input name="googleaddress_'+number+'" id="address'+number+'" style="width:600px;" type="text"/>'+
                                            '<input type="button" value="???????" onclick="deleteMarker('+number+');" ><br/>'+
                                            '<span>?????? (latitude): </span><input name="coordinate_x_'+number+'" class="coordinate" id="latitude'+number+'" type="text"/>'+
                                            '<span>??????? (longitude): </span><input name="coordinate_y_'+number+'" class="coordinate" id="longitude'+number+'" type="text"/></div>'
                                    );
                            jQuery(".main-button").append(
                                            '<input type="button" onclick="viewMarker('+number+');" value="?????? '+number+'" '+
                                            ' class="marker-view marker-view-'+number+'">');*/
                            //initialize(number);
                            dam(number);
                            jQuery(".coordinate").keyup(function(){
                                    setMarkerPosition(this);
                              });
                            //jQuery(".marker-view").show();
                            //jQuery(".div-addres").hide();
                            //jQuery(".div-addres-"+number).show();
                            //jQuery("#address-number").val(number);
                            var massCount = jQuery("#mass-count-marker").val();
                            massCount += "~"+ number + "~,";
                            jQuery("#mass-count-marker").val(massCount);
                    }
            function viewMarker(number)
                    {
                            jQuery(".marker-view").show();
                            jQuery(".div-addres").hide();
                            jQuery(".div-addres-"+number).show();
                    }
            function setMarkerPosition(input)
                    {
                            var id= jQuery(input).attr('id');
                            var numS = id.split('tude');
                            var num = numS[1];
                            console.log(marker[num]);
                            myLatlng = new google.maps.LatLng(jQuery("#latitude"+num).val(),jQuery("#longitude"+num).val());
                            marker[num].setPosition(myLatlng);
                    }
            function deleteMarker(number)
                    {
                            marker[number].setMap(null);
                            jQuery(".div-addres-"+number).remove();
                            jQuery(".marker-view-"+number).remove();
                            var massCount = jQuery("#mass-count-marker").val();
                            var massCountEnd = massCount.replace("~"+number+"~,","");
                            jQuery("#mass-count-marker").val(massCountEnd);
                    } 
             </script>
        </div>
</t:adminpage>
