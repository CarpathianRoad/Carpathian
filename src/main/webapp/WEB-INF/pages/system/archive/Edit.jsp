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
                <a href="${Constants.URL}system/archive/articles/${article.article_category}"> <i class="fa fa-fw fa-list-alt"></i> Back to category "${cat_name}"</a>
            </li>
        </ol>
	<form action="${Constants.URL}system/archive/do/updatedata.do" name="addArticleForm" id="addForm" method="POST" type="multipart/form-data">
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
                        <button type="button" id="titleHU" class="btn btn-default disabled">In Hungarian</button>
                        <button type="button" id="titleSK" class="btn btn-default disabled">In Slovak</button>
                        <button type="button" id="titleRO" class="btn btn-default disabled">In Romanian</button>
                    </div>
                </div>
                <div class="col-lg-6 margintop10 field">
                    <input type="text" name="titleEN" class="form-control input-title-lang" lang="titleEN" id="tlt" value="${article.article_title_en}" maxlength="55">
                    <input type="text" name="titleUA" class="form-control input-title-lang" lang="titleUA" id="tlt" value="${article.article_title_ua}" maxlength="55">
                    <input type="text" name="titleHU" class="form-control input-title-lang" lang="titleHU" id="tlt"  maxlength="55">
                    <input type="text" name="titleSK" class="form-control input-title-lang" lang="titleSK" id="tlt"  maxlength="55">
                    <input type="text" name="titleRO" class="form-control input-title-lang" lang="titleRO" id="tlt"  maxlength="55">
                    <div class="validation" id="textValidation"></div>
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
                        <div lang="textEN" class="textarea-msg"><textarea name="textEN" id="editorEN" rows="20" cols="80" class="input-block-level">${article.article_text_en}</textarea></div>
                        <div lang="textUA" class="textarea-msg"><textarea name="textUA" id="editorUA" rows="20" cols="80" class="input-block-level">${article.article_text_ua}</textarea></div>
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
            <input type="hidden" name="path" value="archive_content/${article.article_dir}/files" />
            <input type="file" name="file" style="display:none" />
        </form>
        <p>
            <button class="btn btn-success margintop30 marginbottom30" id="sudmitData" type="submit">Save changes</button>
            <a href="${Constants.URL}system/archive/articles/${article.article_category}"><button class="btn btn-danger margintop30 marginbottom30" id="sudmitData" type="submit">Back to category</button></a>
        </p>
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
            url: "${Constants.URL}system/archive/do/uploadfile",
            addRemoveLinks: true
        });
        if('${filesHTML}' !== null && '${filesHTML}' !== ''){
            $(".dz-message").hide();
            $("#my-awesome-dropzone").append('${filesHTML}');
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
    
    $("#sudmitData").click(function(){
        $("div.validation").html('');
        var isValidate = true;

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
                $(temp).parent().remove();
                if (!$("#my-awesome-dropzone").find("div.dz-file-preview").length) { 
                    $(".dz-message").show();
                }
            }
        });
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
</script>
<script src="${Constants.URL}archive/js/plugins/dropzone.js"></script>