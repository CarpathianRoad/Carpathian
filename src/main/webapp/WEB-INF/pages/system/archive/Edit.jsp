<%-- 
    Document   : Edit
    Created on : Jul 22, 2015, 7:59:53 PM
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
        <h4>Edit article in category "${cat_name}"</h4>
        <ol class="breadcrumb">
            <li class="active">
                <a href="#" data-toggle="modal" data-target="#shureModal"> <i class="fa fa-fw fa-list-alt"></i> Back to category "${cat_name}"</a>
            </li>
        </ol>
	<form action="<c:url value="/system/archive/do/updatedata.do" />" name="addArticleForm" id="addForm" method="POST" type="multipart/form-data">
            <input type="hidden" class="form-control" id="auth" name="author" value="<c:out value="${sessionScope.user.user_name}"/>">
            <input type="hidden" class="form-control" name="category" value="${article.article_category}">
            <input type="hidden" class="form-control" name="id" value="${article.article_id}">
            <input type="hidden" name="dir" id="dir-name" value="archive_content/${article.article_dir}" />
            <div class="row add-row">
                <div class="col-lg-12 margintop30 field">
                    <label for="tlt">Article title <span class="red-star">*</span></label>
                    <br/>
                    <div class="btn-group lang-switch-title" role="group" aria-label="...">
                        <button type="button" id="titleEN" class="btn btn-default active">In English</button>
                        <button type="button" id="titleUA" class="btn btn-default">In Ukrainian</button>
                        <button type="button" id="titleHU" class="btn btn-default">In Hungarian</button>
                        <button type="button" id="titleSK" class="btn btn-default">In Slovak</button>
                        <button type="button" id="titleRO" class="btn btn-default">In Romanian</button>
                    </div>
                </div>
                <div class="col-lg-6 margintop10 field titles">
                    <input type="text" name="titleEN" class="form-control input-title-lang" lang="titleEN" id="tltEN" value="${article.article_title_en}" maxlength="55">
                    <input type="text" name="titleUA" class="form-control input-title-lang" lang="titleUA" id="tltUA" value="${article.article_title_ua}" maxlength="55">
                    <input type="text" name="titleHU" class="form-control input-title-lang" lang="titleHU" id="tltHU" value="${article.article_title_hu}"  maxlength="55">
                    <input type="text" name="titleSK" class="form-control input-title-lang" lang="titleSK" id="tltSK" value="${article.article_title_sk}"  maxlength="55">
                    <input type="text" name="titleRO" class="form-control input-title-lang" lang="titleRO" id="tltRO" value="${article.article_title_ro}"  maxlength="55">
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
                        <input type="text" class="form-control coordinate" value="${article.article_x}" name="x" id="latitude0">
                        <div class="validation"></div>
                        </div>
                        <div class="form-group">
                        <label for="y">Y</label>
                        <input type="text" class="form-control coordinate" value="${article.article_y}"  name="y" id="longitude0">
                        <div class="validation"></div>
                        </div>
                        <div class="div-addres div-addres-0">
                            <div class="form-group">
                                <label for="auth">Search adress</label>
                                <input type="text" class="form-control"  name="googleaddress_0"value="${article.article_country}, ${article.article_region}, ${article.article_district}, ${article.article_town}" id="address0"/>
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
                        <input type="text" class="form-control disabled-input" name="country" id="cnt" value="${article.article_country}">
                    </div>
                    </div>
                    <div class="col-lg-3 field">
                        <div class="form-group">
                            <label for="rgn">Region</label>
                            <input type="text" class="form-control disabled-input" name="region" id="rgn" value="${article.article_region}">
                        </div>
                    </div>
                    <div class="col-lg-3 field">
                         <div class="form-group">
                             <label for="dstr">District</label>
                             <input type="text" class="form-control disabled-input" name="district" id="dstr" value="${article.article_district}">
                         </div>
                    </div>
                    <div class="col-lg-3 field">
                        <div class="form-group">
                            <label for="twn">Town</label>
                            <input type="text" class="form-control disabled-input" name="town" id="twn" value="${article.article_town}">
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
                        <button type="button" id="textHU" class="btn btn-default">In Hungarian</button>
                        <button type="button" id="textSK" class="btn btn-default">In Slovak</button>
                        <button type="button" id="textRO" class="btn btn-default">In Romanian</button>
                    </div>
                </div>
                <div class="col-lg-12 margintop10 field textareas">
                    <div class="ck-data-box" id="CKdata"></div>
                        <div lang="textEN" class="textarea-msg"><textarea name="textEN" id="editorEN" rows="20" cols="80" class="input-block-level">${article.article_text_en}</textarea></div>
                        <div lang="textUA" class="textarea-msg"><textarea name="textUA" id="editorUA" rows="20" cols="80" class="input-block-level">${article.article_text_ua}</textarea></div>
                        <div lang="textHU" class="textarea-msg"><textarea name="textHU" id="editorHU" rows="20" cols="80" class="input-block-level">${article.article_text_hu}</textarea></div>
                        <div lang="textSK" class="textarea-msg"><textarea name="textSK" id="editorSK" rows="20" cols="80" class="input-block-level">${article.article_text_sk}</textarea></div>
                        <div lang="textRO" class="textarea-msg"><textarea name="textRO" id="editorRO" rows="20" cols="80" class="input-block-level">${article.article_text_ro}</textarea></div>
                        <div class="validation"></div>
                </div>
            </div>
            <hr>
        </form>
        <div class="row add-row">
            <div class="col-lg-12 margintop30 field">
                <label for="tlt">Images for galery</label><br/>
            </div>
        </div>
        <form action="<c:url value="/system/archive/do/uploadfile" />" class="dropzone"  id="my-awesome-dropzone-gal">
            <input type="hidden" name="path" value="archive_content/${article.article_dir}/galery" />
            <input type="file" name="file" style="display:none" />
        </form>
        <div class="row add-row">
            <div class="col-lg-12 margintop30 field">
                <label for="tlt">Article files</label><br/>
            </div>
        </div>
        <form action="<c:url value="/system/archive/do/uploadfile" />" class="dropzone"  id="my-awesome-dropzone">
            <input type="hidden" name="path" value="archive_content/${article.article_dir}/files" />
            <input type="file" name="file" style="display:none" />
        </form>
        <p>
            <button class="btn btn-success margintop30 marginbottom30 sudmitData" type="submit">Save changes</button>
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
                    <button class="btn btn-success btn-mini sudmitData" data-dismiss="modal" type="submit">Save changes</button>
                    <button class="btn btn-warning btn-mini modal-btn-warning" type="submit" data-dismiss="modal">Cancel</button>
                    <a href="<c:url value="/system/archive/articles/${article.article_category}" />"><button type="button" class="btn btn-danger btn-mini">Back to category</button></a>
                </div>
          </div>
        </div>
    </div>
</t:adminpage>
    <script src="${Constants.URL}js/jquery.webkitresize.js"></script>
<script src="${Constants.URL}js/jquery.mb.browser.min.js"></script>
<script> 
    $(document).ready(function () { 
        var currentLang = $(".lang-switch-text button.active").attr("id");
        $(".textareas .textarea-msg[lang='"+currentLang+"']").show();
        var currentLangT = $(".lang-switch-title button.active").attr("id");
        $(".input-title-lang[lang='"+currentLangT+"']").show();
        $("#my-awesome-dropzone").dropzone({ 
            url: '<c:url value="/system/archive/do/uploadfile" />',
            addRemoveLinks: true
        });
        $("#my-awesome-dropzone-gal").dropzone({ 
            url: '<c:url value="/system/archive/do/uploadfile" />',
            addRemoveLinks: true
        });
        if('${filesHTML}' !== null && '${filesHTML}' !== ''){
            $("#my-awesome-dropzone .dz-message").hide();
            $("#my-awesome-dropzone").append('${filesHTML}');
        }    
        if('${galeryHTML}' !== null && '${galeryHTML}' !== ''){
            $("#my-awesome-dropzone-gal .dz-message").hide();
            $("#my-awesome-dropzone-gal").append('${galeryHTML}');
        }    
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
        if($(temp).parent().parent().attr("id") === "my-awesome-dropzone-gal") {
            var path = $("#dir-name").val() + "/galery/" + $(temp).parent().find(".dz-details .dz-filename span").text();
        }
        else {
            var path = $("#dir-name").val() + "/files/" + $(temp).parent().find(".dz-details .dz-filename span").text();
        }
        
        jQuery.ajax({
            url: '${Constants.URL}system/archive/do/removefile',
            cache: false,
            contentType: false,
            processData: false,
            type: 'GET',
            data: 'path='+path,
            success: function(data){
                $(temp).parent().remove();
                if (!$("#my-awesome-dropzone").find("div.dz-file-preview").length) { 
                    $(".dz-message").show();
                }
                if (!$("#my-awesome-dropzone-gal").find("div.dz-file-preview").length) { 
                    $(".dz-message").show();
                }
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
    $("label.cke_dialog_ui_labeled_label:contains('HSpace')").next().find(".cke_dialog_ui_input_text").val("10");
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
            filebrowserBrowseUrl : '${Constants.URL}tools/imageupload/${folder_str}/',
            filebrowserUploadUrl : '${Constants.URL}tools/imageupload/${folder_str}/',
            filebrowserImageBrowseUrl : '${Constants.URL}tools/imageupload/${folder_str}/',
            filebrowserImageUploadUrl : '${Constants.URL}tools/imageupload/${folder_str}/',
            filebrowserWindowWidth  : 800,
            filebrowserWindowHeight : 500
        });
        CKEDITOR.replace('editorSK', {
            filebrowserBrowseUrl : '${Constants.URL}tools/imageupload/${folder_str}/',
            filebrowserUploadUrl : '${Constants.URL}tools/imageupload/${folder_str}/',
            filebrowserImageBrowseUrl : '${Constants.URL}tools/imageupload/${folder_str}/',
            filebrowserImageUploadUrl : '${Constants.URL}tools/imageupload/${folder_str}/',
            filebrowserWindowWidth  : 800,
            filebrowserWindowHeight : 500
        });
        CKEDITOR.replace('editorRO', {
            filebrowserBrowseUrl : '${Constants.URL}tools/imageupload/${folder_str}/',
            filebrowserUploadUrl : '${Constants.URL}tools/imageupload/${folder_str}/',
            filebrowserImageBrowseUrl : '${Constants.URL}tools/imageupload/${folder_str}/',
            filebrowserImageUploadUrl : '${Constants.URL}tools/imageupload/${folder_str}/',
            filebrowserWindowWidth  : 800,
            filebrowserWindowHeight : 500
        });
        CKEDITOR.on('instanceReady', function() { 
            $("#cke_editorEN iframe").webkitimageresize().webkittableresize().webkittdresize();
            $("#cke_editorUA iframe").webkitimageresize().webkittableresize().webkittdresize();
            $("#cke_editorHU iframe").webkitimageresize().webkittableresize().webkittdresize();
            $("#cke_editorSK iframe").webkitimageresize().webkittableresize().webkittdresize();
            $("#cke_editorRO iframe").webkitimageresize().webkittableresize().webkittdresize();
        
                $(".cke_button.cke_button__image.cke_button_off").click(function(){
                    $(".cke_dialog_body").hide();
                    setTimeout(function() {   //calls click event after a certain time

                $(".cke_editor_editorEN_dialog .cke_dialog_body").addClass("image-dialog");
                $(".cke_editor_editorUA_dialog .cke_dialog_body").addClass("image-dialog");
                $(".cke_editor_editorHU_dialog .cke_dialog_body").addClass("image-dialog");
                $(".cke_editor_editorSK_dialog .cke_dialog_body").addClass("image-dialog");
                $(".cke_editor_editorRO_dialog .cke_dialog_body").addClass("image-dialog");

                if($(".cke_editor_editorUA_dialog .cke_dialog_body").hasClass("image-dialog")) {
                    $(".cke_dialog_body").show();
                }
                if($(".cke_editor_editorEN_dialog .cke_dialog_body").hasClass("image-dialog")) {
                    $(".cke_dialog_body").show();
                }
                if($(".cke_editor_editorHU_dialog .cke_dialog_body").hasClass("image-dialog")) {
                    $(".cke_dialog_body").show();
                }
                if($(".cke_editor_editorSK_dialog .cke_dialog_body").hasClass("image-dialog")) {
                    $(".cke_dialog_body").show();
                }
                if($(".cke_editor_editorRO_dialog .cke_dialog_body").hasClass("image-dialog")) {
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
    function initialize()
            {
                    //Определение карты
                    var latlng = new google.maps.LatLng(50.4501,30.523400000000038);
                    var options = {
                            zoom: 5,
                            center: latlng,
                            mapTypeId: google.maps.MapTypeId.ROADMAP
                    };
                    var myLatlng = new google.maps.LatLng($("#latitude0").val(),$("#longitude0").val());
                     map = new google.maps.Map(document.getElementById("map_canvas"), options);
                        var marker = new google.maps.Marker({
                            position: myLatlng,
                            draggable: true,
                            map: map
                        });
                    google.maps.event.addListener(marker, 'dragend', function() 
                    {
                        geocodePosition(marker.getPosition());
                    });
                    //Определение геокодера
                    geocoder = new google.maps.Geocoder();
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
                      //Определяем значение для адреса при геокодировании
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
                      //Выполняется при выборе конкретного адреса
                      select: function(event, ui) {
                            $("#latitude"+num).val(ui.item.latitude);
                            $("#longitude"+num).val(ui.item.longitude);
                            var location = new google.maps.LatLng(ui.item.latitude, ui.item.longitude);
                            marker[num].setPosition(location);
                            map.setCenter(location);
                      }
                    });
              });
              //Добавляем слушателя события обратного геокодирования для маркера при его перемещении  
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
                                            '<div class="div-addres div-addres-'+number+'">'+number+'<label>Адрес для поиска: </label>'+
                                            '<input name="googleaddress_'+number+'" id="address'+number+'" style="width:600px;" type="text"/>'+
                                            '<input type="button" value="удалить" onclick="deleteMarker('+number+');" ><br/>'+
                                            '<span>Широта (latitude): </span><input name="coordinate_x_'+number+'" class="coordinate" id="latitude'+number+'" type="text"/>'+
                                            '<span>Длогота (longitude): </span><input name="coordinate_y_'+number+'" class="coordinate" id="longitude'+number+'" type="text"/></div>'
                                    );
                            jQuery(".main-button").append(
                                            '<input type="button" onclick="viewMarker('+number+');" value="Маркер '+number+'" '+
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
<script src="${Constants.URL}archive/js/plugins/dropzone.js"></script>