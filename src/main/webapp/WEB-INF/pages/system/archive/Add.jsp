<%-- 
    Document   : Add
    Created on : Jul 22, 2015, 7:59:44 PM
    Author     : kiwi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<t:adminpage>
    <link rel="stylesheet" href="${Constants.URL}css/ckeditor.css" type="text/css" />  
        
    <script src="${Constants.URL}js/ckeditor/ckeditor.js"></script>
    <div class="margintop20">
        <h4>Add article to category "${cat_name}"</h4>
        <ol class="breadcrumb">
            <li class="active">
                <a href="#" data-toggle="modal" data-target="#shureModal"> <i class="fa fa-fw fa-list-alt"></i> Back to category "${cat_name}"</a>
            </li>
        </ol>
	<form action="${Constants.URL}system/archive/do/insertdata.do" name="addArticleForm" id="addForm" method="POST" type="multipart/form-data">
            <input type="hidden" class="form-control" id="auth" name="author" value="<c:out value="${sessionScope.user.user_name}"/>">
            <input type="hidden" class="form-control" name="category" value="${category}">
            <input type="hidden" name="dir" id="dir-name" value="${folder}" />
            <div class="row add-row">
                <div class="col-lg-12 margintop30 field">
                    <label for="tlt">Article title <span class="red-star">*</span></label>
                    <br/>
                    <div class="btn-group lang-switch-title" role="group" aria-label="...">
                        <button type="button" id="titleEN" class="btn btn-default active">In English</button>
                        <button type="button" id="titleUA" class="btn btn-default">In Ukrainian</button>
                        <button type="button" id="titleHU" class="btn btn-default disabled">In Hungarian</button>
                        <button type="button" id="titleSK" class="btn btn-default disabled">In Slovak</button>
                        <button type="button" id="titleRO" class="btn btn-default disabled">In Romanian</button>
                    </div>
                </div>
                <div class="col-lg-6 margintop10 field titles">
                    <input type="text" name="titleEN" class="form-control input-title-lang" lang="titleEN" id="tltEN"  maxlength="55">
                    <input type="text" name="titleUA" class="form-control input-title-lang" lang="titleUA" id="tltUA"  maxlength="55">
                    <input type="text" name="titleHU" class="form-control input-title-lang" lang="titleHU" id="tlt"  maxlength="55">
                    <input type="text" name="titleSK" class="form-control input-title-lang" lang="titleSK" id="tlt"  maxlength="55">
                    <input type="text" name="titleRO" class="form-control input-title-lang" lang="titleRO" id="tlt"  maxlength="55">
                    <div class="validation"></div>
                </div>
            </div>
            <hr>
            <div class="row add-row">
                <div class="col-lg-3 field map-field">
                    <div class="form-group marginbottom30">
                        <button type="button" id="reset-map" class="btn btn-primary btn-mini">Reset map</button>
                    </div>
                    <div class="form-group">
                        <div class="form-group">
                        <label for="x">X</label>
                        <input type="text" class="form-control coordinate" name="x" id="latitude0">
                        <div class="validation"></div>
                        </div>
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
            <hr>
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
            <div class="row add-row">
                <div class="col-lg-12 margintop30 field">
                    <label for="tlt">Article text <span class="red-star">*</span></label><br/>
                    <div class="btn-group lang-switch-text" role="group" aria-label="...">
                        <button type="button" id="textEN" class="btn btn-default active">In English</button>
                        <button type="button" id="textUA" class="btn btn-default">In Ukrainian</button>
                        <button type="button" id="textHU" class="btn btn-default disabled">In Hungarian</button>
                        <button type="button" id="textSK" class="btn btn-default disabled">In Slovak</button>
                        <button type="button" id="textRO" class="btn btn-default disabled">In Romanian</button>
                    </div>
                </div>
                <div class="col-lg-12 margintop10 field textareas">
                    <div class="ck-data-box" id="CKdata"></div>
                        <div lang="textEN" class="textarea-msg"><textarea name="textEN" id="editorEN" rows="20" cols="80" class="input-block-level"></textarea></div>
                        <div lang="textUA" class="textarea-msg"><textarea name="textUA" id="editorUA" rows="20" cols="80" class="input-block-level"></textarea></div>
                        <div lang="textHU" class="textarea-msg"><textarea name="textHU" id="editorHU" rows="20" cols="80" class="input-block-level"></textarea></div>
                        <div lang="textSK" class="textarea-msg"><textarea name="textSK" id="editorSK" rows="20" cols="80" class="input-block-level"></textarea></div>
                        <div lang="textRO" class="textarea-msg"><textarea name="textRO" id="editorRO" rows="20" cols="80" class="input-block-level"></textarea></div>
                        <div class="validation"></div>
                </div>
            </div>
            <hr>
        </form>
        <div class="row add-row">
            <div class="col-lg-12 margintop30 field">
                <label for="tlt">Article files</label><br/>
            </div>
        </div>
        <form action="${Constants.URL}archive/do/uploadfile" class="dropzone"  id="my-awesome-dropzone">
            <input type="hidden" name="path" value="${folder}/files" />
            <input type="file" name="file" style="display:none" />
        </form>
        <p>
            <button class="btn btn-success margintop30 marginbottom30 sudmitData" type="submit">Add article</button>
            <button type="button" class="btn btn-danger btn-mini" data-toggle="modal" data-target="#shureModal">Back to category</button>
        </p>
    </div>
    <div id="shureModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Back to category window</h4>
                </div>
                <div class="modal-body">
                    <p>Save changes?</p>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-success btn-mini sudmitData" type="submit" data-dismiss="modal">Save changes</button>
                    <button class="btn btn-warning btn-mini modal-btn-warning" type="submit" data-dismiss="modal">Cancel</button>
                    <a href="${Constants.URL}system/archive/articles/${category}"><button type="button" class="btn btn-danger btn-mini">Back to category</button></a>
                </div>
          </div>
        </div>
    </div>
</t:adminpage>
    
<script src="${Constants.URL}js/jquery.webkitresize.js"></script>
<script src="${Constants.URL}js/jquery.mb.browser.min.js"></script>
<script> 
    $(document).ready(function () { 
        $("#my-awesome-dropzone").dropzone({ 
            url: "${Constants.URL}system/archive/do/uploadfile",
            addRemoveLinks: true
        });
        var currentLang = $(".lang-switch-text button.active").attr("id");
        $(".textareas .textarea-msg[lang='"+currentLang+"']").show();
        var currentLangT = $(".lang-switch-title button.active").attr("id");
        $(".input-title-lang[lang='"+currentLangT+"']").show();
        initCKE();
    });
    
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
    $("#reset-map").click(function(){
        $("#latitude0").val("");
        $("#longitude0").val("");
        $("#address0").val("");
        $("#cnt").val("");
        $("#rgn").val("");
        $("#dstr").val("");
        $("#twn").val("");
    });
    $(".sudmitData").click(function(e){
        $("div.validation").html('');
        $("div.validation").attr("id","");
        var isValidate = true;
        if($("#tltEN").val() === "" && $("#tltUA").val() === "") {
            isValidate = false;
            $(".titles div.validation").attr("id","active-validation");
            $(".titles div.validation").html("<span style='color:red'>Title can't be empty!</span>");
            e.preventDefault(); 
            goToByScroll("active-validation");
        }
        if(isValidate) {
            $("#addForm").submit();
        }
    });
    
    function deleteFile(temp){
        var path = $("#dir-name").val() + "/files/" + $(temp).parent().find(".dz-details .dz-filename span").text();
        console.log(path);
        jQuery.ajax({
            url: '${Constants.URL}system/archive/do/removefile',
            cache: false,
            contentType: false,
            processData: false,
            type: 'GET',
            data: 'path='+path,
            success: function(data){
                console.log(data);
            }
        });
    }
    function goToByScroll(id){
        id = id.replace("link", "");
        $('html,body').animate({
            scrollTop: $("#"+id).offset().top-150},
            'slow');
    }
    function imageInserted(){ 
    $("label.cke_dialog_ui_labeled_label:contains('HSpace')").next().find(".cke_dialog_ui_input_text").val("15");
    $(".cke_editor_editorEN_dialog .cke_dialog_body").removeClass("image-dialog");
    $(".cke_editor_editorUA_dialog .cke_dialog_body").removeClass("image-dialog");
    $(".cke_dialog_ui_button_ok span").click();
    }
       
    function initCKE() {
        CKEDITOR.replace('editorEN', {
            filebrowserBrowseUrl : '${Constants.URL}tools/imageupload/${folder_str}/',
            filebrowserUploadUrl : '${Constants.URL}tools/imageupload/${folder_str}/',
            filebrowserImageBrowseUrl : '${Constants.URL}tools/imageupload/${folder_str}/',
            filebrowserImageUploadUrl : '${Constants.URL}tools/imageupload/${folder_str}/',
            filebrowserWindowWidth  : 800,
            filebrowserWindowHeight : 500
        });
        CKEDITOR.replace('editorUA', {
            filebrowserBrowseUrl : '${Constants.URL}tools/imageupload/${folder_str}/',
            filebrowserUploadUrl : '${Constants.URL}tools/imageupload/${folder_str}/',
            filebrowserImageBrowseUrl : '${Constants.URL}tools/imageupload/${folder_str}/',
            filebrowserImageUploadUrl : '${Constants.URL}tools/imageupload/${folder_str}/',
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
        CKEDITOR.replace('editorRO', {
            filebrowserBrowseUrl : '${Constants.URL}tools/fileManager',
            filebrowserUploadUrl : '${Constants.URL}tools/fileManager',
            filebrowserImageBrowseUrl : '${Constants.URL}tools/fileManager',
            filebrowserImageUploadUrl : '${Constants.URL}tools/fileManager',
            filebrowserWindowWidth  : 800,
            filebrowserWindowHeight : 500
        });
        CKEDITOR.on('instanceReady', function() { 
        $("#cke_editorEN iframe").webkitimageresize().webkittableresize().webkittdresize();
        $("#cke_editorUA iframe").webkitimageresize().webkittableresize().webkittdresize();
        
    $(".cke_button.cke_button__image.cke_button_off").click(function(){
        $(".cke_dialog_body").hide();
        setTimeout(function() {   //calls click event after a certain time
   
    $(".cke_editor_editorEN_dialog .cke_dialog_body").addClass("image-dialog");
    $(".cke_editor_editorUA_dialog .cke_dialog_body").addClass("image-dialog");
    if($(".cke_editor_editorUA_dialog .cke_dialog_body").hasClass("image-dialog")) {
    $(".cke_dialog_body").show();
    }if($(".cke_editor_editorEN_dialog .cke_dialog_body").hasClass("image-dialog")) {
    $(".cke_dialog_body").show();
    }
}, 500);
    } );    
    });
        var obj = $("#cke_120_fileInput").contents().find(".returnImage");
         obj.click("click", function (e) {
            $("#cke_71_textInput").val("s2as1");
        });
        
    
    }
     var geocoder;
    var map;
    var marker = []; 
    var markerOnMap = null;
    function initialize()
            {
                    var options = {
                            zoom: 5,
                            center: new google.maps.LatLng(50.4501,30.523400000000038),
                            mapTypeId: google.maps.MapTypeId.ROADMAP
                    };
                    map = new google.maps.Map(document.getElementById("map_canvas"), options);
                    geocoder = new google.maps.Geocoder();
                    google.maps.event.addListener(map, 'click', function(event) {
                        addMarker(event.latLng);
                    });
                    marker[0] = new google.maps.Marker({
                        draggable: true,
                        map: map
                    });
            }
            
            function addMarker(location) {
                marker[0].setPosition(location);
                geocodePosition(location);
                google.maps.event.addListener(marker[0],'dragend',function(event) {
                    geocodePosition(marker[0].getPosition());
                });
            }
             
            function geocodePosition(location) {
                $('#latitude0').val(location.lat());
                $('#longitude0').val(location.lng());
                var infowindow = new google.maps.InfoWindow();
                geocoder.geocode({'latLng': location}, function(results, status) {
                    if (status == google.maps.GeocoderStatus.OK) {
                        var address = results[0].address_components;
                        $('#address0').val(results[1].formatted_address);
                        for (var p = address.length-1; p >= 0; p--) {
                            if (address[p].types.indexOf("country") != -1) {
                                $('#cnt').attr("value",address[p].long_name);
                                //console.log(address[p].long_name+'ok');
                            }
                            if (address[p].types.indexOf("locality") != -1) {
                                $('#twn').attr("value",address[p].long_name);
                                //console.log(address[p].long_name+'ok');
                            }
                            if (address[p].types.indexOf("administrative_area_level_2") != -1) {
                                $('#dstr').attr("value",address[p].long_name);
                                //console.log(address[p].long_name+'ok');
                            }
                            if (address[p].types.indexOf("administrative_area_level_1") != -1) {
                                $('#rgn').attr("value",address[p].long_name);
                                //console.log(address[p].long_name+'ok');
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
            }
            
            $(document).ready(function(){ 
              initialize();
              jQuery(".coordinate").keyup(function(){
                    setMarkerPosition(this);
              });
            });
            
            function setMarkerPosition(input)
                    {
                        var x = $("#latitude0").val();
                        var y = $("#longitude0").val();
                        var xArr = x.split('.');
                        var yArr = y.split('.');
                        if((!(xArr.length>2))&&(!(yArr.length>2))){
                            if((x.indexOf(',')!=-1)||(y.indexOf(','))!=-1){
                                x = x.replace(',','.');
                                y = y.replace(',','.');
                            }
                            
                            var id= jQuery(input).attr('id');
                            var numS = id.split('tude');
                            var num = numS[1];
                            
                            myLatlng = new google.maps.LatLng(x,y);
                            if((x.slice(-1)!='.')&&(y.slice(-1)!='.')){
                                geocodePosition(myLatlng);
                                marker[num].setPosition(myLatlng);
                            }
                        }
                    }
</script>
<script src="${Constants.URL}archive/js/plugins/dropzone.js"></script>