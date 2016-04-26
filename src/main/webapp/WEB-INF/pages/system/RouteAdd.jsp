<%-- 
    Document   : AddRoute
    Created on : Mar 15, 2015, 11:02:47 PM
    Author     : kiwi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:adminpage>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
    <script src="${Constants.URL}js/ckeditor/ckeditor.js"></script>
    <div class=" margintop20">
            <h4>Route edit</h4>
        <ol class="breadcrumb">
            <li class="active">
                <a href="<c:url value="/system/routes" />"> <i class="fa fa-fw fa-list-alt"></i> Back to routes</a>
            </li>
        </ol>

                                <form action="<c:url value="/system/routes/insertdata.do" />" name="addRouteForm" id="addForm" method="POST" type="multipart/form-data">
                                    
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
                                                <input type="text" name="titleEN" class="form-control input-title-lang" lang="titleEN" id="tlt">
                                                <input type="text" name="titleUA" class="form-control input-title-lang" lang="titleUA" id="tlt">
                                                <input type="text" name="titleHU" class="form-control input-title-lang" lang="titleHU" id="tlt">
                                                <input type="text" name="titleSK" class="form-control input-title-lang" lang="titleSK" id="tlt">
                                                <input type="text" name="titlePL" class="form-control input-title-lang" lang="titlePL" id="tlt">
                                                <input type="text" name="titleRO" class="form-control input-title-lang" lang="titleRO" id="tlt">
                                                <input type="text" name="titleGE" class="form-control input-title-lang" lang="titleGE" id="tlt">
                                                <input type="text" name="titleCZ" class="form-control input-title-lang" lang="titleCZ" id="tlt">
                                                <input type="text" name="titleSRB" class="form-control input-title-lang" lang="titleSRB" id="tlt">
                                                <div class="validation"></div>
                                              </div>
                                        </div>
                              <hr>
                                    <div class="row add-row route-file">
                                        
						<div class="col-lg-10 field">
                                                    <div class="form-group">
                                                        <label for="img">Route file</label>
                                                    
                                                        <div id="route-upload-block">
                                                            <span class="btn btn-primary btn-file">
                                                                Browse rouse file<input class="" id="route-input" type="file" multiple/>
                                                            </span>
                                                        </div>
                                                    </div>
                                                    <input type="hidden" id="fullname-route" name="filename-route"/>
                                                    <div class="load-route"><img src="${Constants.URL}img/loader.gif"/></div>
                                                </div>
                                    </div>
                <hr>
                <div class="row add-row">
                <div class="col-lg-10 field">
                    <div id="imageUpload" class="form-group">
                        <label for="img">Images</label>
                        <div class="img-content">
                            <div class="image-upload">
                                <div id="dialog">
                                    <iframe id="myIframe" src=""></iframe>
                                </div>
                                <div id="dialog-archive">
                                    <iframe id="myIframeArchive" src=""></iframe>
                                </div>
                                <button type="button" id="dialogBtn" class="btn btn-primary img-input-box">
                                Browse image
                                </button>
                                <button type="button" id="dialogBtnArchive" class="btn btn-primary img-input-box">
                                Browse archive
                                </button>
                            </div>    
                        </div>
                        <input type="hidden" name="real-img-path" id="real-img-path" />                           
                    </div>
                </div>
            </div>
                <hr>
                <div class="row add-row">
                                        
						<div class="col-lg-3 field">
                                                    <div class="form-group">
                                                <label for="sel1">Duration<span class="red-star">*</span></label>
                                                <input type="text" name="duration" class="form-control" id="duration">
                                                <div class="validation">
							</div>
                                              </div>
							
                                                </div>
						<div class="col-lg-3 field">
                                                    <div class="form-group">
                                                <label for="sel3">Length<span class="red-star">*</span></label>
                                                <input type="text" name="length" class="form-control" id="length">
                                                <div class="validation">
							</div>
                                              </div>
                                                </div>
                                    </div>
                <hr>
                                    <div class="row add-row">
                                        
						<div class="col-lg-3 field">
                                                    <div class="form-group">
                                                <label for="sel1">Type<span class="red-star">*</span></label>
                                                <select class="form-control" name="type" id="sel1">
                                                  <option value="option" disabled selected>Select option</option>
                                                  <option value="1">Foot</option>
                                                  <option value="2">Bike</option>
                                                  <option value="3">Ski</option>
                                                  <option value="4">Horse</option>
                                                  <option value="5">Water</option>
                                                </select>
                                                <div class="validation">
							</div>
                                              </div>
							
                                                </div>
						<div class="col-lg-3 field">
                                                    <div class="form-group">
                                                <label for="sel3">Country<span class="red-star">*</span></label>
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
                                                <label for="sel3">Difficulty<span class="red-star">*</span></label>
                                                <select class="form-control" name="difficulty" id="sel2">
                                                  <option value="option" disabled selected>Select option</option>
                                                  <option value="1">Very easy</option>
                                                  <option value="2">Easy</option>
                                                  <option value="3">Hard</option>
                                                  <option value="4">Very hard</option>
                                                </select>
                                                <div class="validation">
							</div>
                                              </div>
                                                </div>
                                    </div>
                <hr>
            <div class="row add-row">
						<div class="col-lg-3 field">
                                                    <div class="form-group">
                                                <label for="datepicker">Date<span class="red-star">*</span></label>
                                                <input type="text" class="form-control" name="date" id="datepicker">
                                                    </div>
                                                </div>
                                    </div>
                <hr>
            <div class="row add-row list-block route-filters">
                <div class="col-lg-10 field">
                    <div> <label>Filter type:</label></div>
                    <ul>  
                        <li>
                            <div class="checkbox">  
                                <label><input type="checkbox" value="1">Міжнародний туристичний шлях. (E  або R)</label>
                            </div>
                        </li> 
                        <li>
                            <div class="checkbox">  
                                <label><input type="checkbox" value="2">Національний туристичний шлях.</label>
                            </div>
                        </li> 
                        <li>
                            <div class="checkbox">  
                                <label><input type="checkbox" value="3">Регіональний туристичний шлях.</label>
                            </div>
                        </li> 
                        <li>
                            <div class="checkbox">  
                                <label><input type="checkbox" value="4">Обласний туристичний шлях.</label>
                            </div>
                        </li> 
                        <li>
                            <div class="checkbox">  
                                <label><input type="checkbox" value="5">Місцевий (екскурсійний)  туристичний шлях.</label>
                            </div>
                        </li> 
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
            <button class="btn btn-success margintop30 marginbottom30" id="sudmitData" type="submit">Add route</button>
            <a href="<c:url value="/system/routes" />"><button class="btn btn-danger margintop30 marginbottom30" id="sudmitData" type="submit">Back to routes</button></a>
        </p>
        </div>
</t:adminpage>
            <script> 
                function initCKE() {
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
                }
                
    $(document).ready(function () { 
        initCKE();
        initDialog();
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
        $('.selectpicker').selectpicker({
            size: 4
        });
});

$('.route-file').on('change', '#route-input', function() {
        $(".load-route").show();
        var data = new FormData();
        data.append('upload', jQuery('#route-input')[0].files[0]);
        
        jQuery.ajax({
                    url: '${Constants.URL}system/uploadRoute',
                    data: data,
                    cache: false,
                    contentType: false,
                    processData: false,
                    type: 'POST',
                    success: function(data){
                        $(".load-route").hide();
                        $("#fullname-route").val(data);
                        $("<span class='upload-success'><img src='"+"${Constants.URL}"+"img/symbol_check.png'/> Uploaded! <span class='route-name'>("+data+")</span> </span> <span class='remove-route'>Remove</span>").appendTo("#route-upload-block");
                        $("#route-upload-block .btn-file").hide();
                        $(".remove-route").attr("route-name", data);
                        removeRouteInit();
                    }
                    });
});
function removeRouteInit(){
    $(".remove-route").click(function(){
        $(".load-route").show();
        var filename = $(this).attr("route-name");
        $.ajax({
            type: "get",
            url: "${Constants.URL}system/deleteRouteFile",
            cache: false,    
            data:'name='+filename,
            success: function(response){
                        $(".load-route").hide();
                        $("#fullname-route").val("");
                        $(".remove-route").remove();
                        $(".upload-success").remove();
                        $("#route-upload-block .btn-file").show();
            },
            error: function(response){      
                console.log(response);
            }
        });
    });
    initCKE();
}
function imageInserted(){
    $( "#dialog" ).dialog( "close" );
    initRemove();
    initDialog();
}
function imageInserted(){
    $( "#dialog" ).dialog( "close" );
    $( "#dialog-archive" ).dialog( "close" );
    initRemove();
    initDialog();
}
function initDialog(){
    var current = "";
    var currentArchive ="";
    var currentAva = "";
    var currentArchiveAvatar ="";
    var home = "img/content/".replace(/\//g,",");
    $("#imageUpload .returnImage img:not(.remove-icon)").each(function( index ) {
        if($(this).attr("alt").indexOf("archive_content") < 0){
            var path = $(this).attr("alt").split("/").slice(0,-1);
        
        path = jQuery.grep(path, function(value) {
            return value !== "content";
        });
        path = jQuery.grep(path, function(value) {
            return value !== "img";
        });
        current = home+path.toString()+",";
        }
        else {
            var path = $(this).attr("alt").split("/").slice(0,-1);
            currentArchive = path.toString()+",";
        }
        
    });
    if(current === "") {
        current = "img,content,";
    }
    if(currentArchive === "") {
        currentArchive = "archive_content,";
    }
    $("#dialog").dialog({
            autoOpen: false,
            modal: true,
            height: 600,
            width: 800,
            position: { my: "center top", at: "center top", of: window },
            open: function(ev, ui){
                     $('#myIframe').attr('src','${Constants.URL}tools/fileManager?path_main='+current);
                  }
        });
    $("#dialog-archive").dialog({
            autoOpen: false,
            modal: true,
            height: 600,
            width: 800,
            position: { my: "center top", at: "center top", of: window },
            open: function(ev, ui){
                     $('#myIframeArchive').attr('src','${Constants.URL}tools/fileManager?path_main='+currentArchive);
                  }
        });
        $('#dialogBtn').click(function(){
            $('#dialog').dialog('open');
        });
        $('#dialogBtnArchive').click(function(){
            $('#dialog-archive').dialog('open');
        });
}
function initRemove(){
$("#imageUpload .returnImage img.remove-icon").click(function(){
    $(this).parent("a").remove();
    var newurl = "";
    $( "#imageUpload .returnImage" ).each(function( index ) {
        newurl = newurl + "," + $(this).find("img").first().attr("alt");
    });
    $("#real-img-path").val(newurl);
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
    var check_str_filters = "";
    $(".route-filters input:checkbox:checked:checked").each(function() {
        check_str_filters = check_str_filters + this.value + ",";
    });
    $("#filter-type-all").attr("value", check_str_filters.slice(0,-1));
    $("div.validation").html('');
    var isValidate = true;
    
    if($("#duration").val() === "") {
        $("#duration").next("div.validation").html('<span style="color:red">Enter duration of route</span>');
        isValidate = false;
    }
    else {
        $("#duration").next("div.validation").html("");
    }
    if($("#length").val() === "") {
        $("#length").next("div.validation").html('<span style="color:red">Enter length of route</span>');
        isValidate = false;
    }
    else {
        $("#length").next("div.validation").html("");
    }
    if(isValidate) {
        var real = $("#real-img-path").val();
        $("#real-img-path").val(real.substring(1, real.lenght));
        $("#addForm").submit();
    }
    });
    
             </script>
