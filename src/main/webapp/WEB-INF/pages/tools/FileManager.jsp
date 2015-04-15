<%-- 
    Document   : FileManager
    Created on : Apr 2, 2015, 11:42:12 PM
    Author     : kiwi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="Constants" class="ua.aits.Carpath.functions.Constants" scope="session"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
        <link href="${Constants.URL}css/bootstrap.min.css" rel="stylesheet" />
        <link href="${Constants.URL}css/style.css" rel="stylesheet" />
        <link href="${Constants.URL}css/admin.css" rel="stylesheet" />
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
    </head>
    <body>
         <div class="img-upl">
  <div class="">
    <div class="">
      <div class="">
          <div class="image-upload-modal">
              <span class="arrow-left-img" aria-hidden="true"><img src="${Constants.URL}img/arrow-left-icon.png" /></span>
            <label class="btn" for="file-input">
                <button class="btn btn-primary" disabled="disabled" style="opacity: 100">Upload from computer</button>
            </label>
                <input class="" id="file-input" type="file"  accept="image/*" multiple/>
        <button class="btn btn-primary" id="createfolder" type="button" style="margin-right: 10px;">Create folder</button>       
        <button type="button" id="close-modal" class="btn btn-danger" data-dismiss="modal">Close</button>
       </div>
            <div class="image-upload-folder">
                <hr>
                <input type="text" class="form-control" id="foldernametext" value="New Folder" name="name" />
                <button class="btn btn-primary" id="create-folder" type="button">Create folder</button>  
                <button class="btn btn-danger" id="close-add-folder" type="button">Cancel</button>  
            </div>
          <hr>
          <span class="info-folder">Maximum download size - 3 MB</span>
          <div class="img-content-show-all"></div>
      </div>
    </div>
  </div>
</div>
    </body>
    <script>
        $(document).ready(function () {
            initGalerry();
        });
        
        $("#createfolder").click(function(){
            $(".image-upload-folder").toggle("slow");
        });
        $("#close-modal").click(function(){
            window.parent.imageInserted(); 
        });
        $("#close-add-folder").click(function(){
            $(".image-upload-folder").toggle("slow");
        });
        $('.img-upl').on('change', '#file-input', function() {
        var data = new FormData();
        data.append('upload', jQuery('#file-input')[0].files[0]);
        data.append("path", $(".img-content-show-all").attr("realpath"));
        jQuery.ajax({
                    url: '${Constants.URL}uploadFile',
                    data: data,
                    cache: false,
                    contentType: false,
                    processData: false,
                    type: 'POST',
                    success: function(data){
                        var path = $(data).find("img").attr("realpath");
                        var name = $(data).find("img").attr("alt");
                    if("${ckeditor}" === "" && "${num}" === "") {
                       $(".img-content", window.parent.document).append(data);
            $(".img-input-box", window.parent.document).remove();
            $('.image-upload', window.parent.document).append('<button type="button" id="dialogBtn"  class="btn btn-primary btn-lg img-input-box" data-toggle="modal" data-target="#myModal">Upload image</button>');
            var real = $("#real-img-path", window.parent.document).val();        
            $("#real-img-path", window.parent.document).val(real + "," + path);
            initGalerry();
            $(".img-content-show-all").removeAttr("current");
            $(".img-content-show-all").removeAttr("realpath");
            window.parent.imageInserted(); 
                    }    else {
                    window.opener.CKEDITOR.tools.callFunction("${num}", ""+"${Constants.URL}"+ path +"","");
                    window.close();
                    }
                        
        }
                });
        });
        function initGalerry(){
        
           getFiles("","${path}"); 
        }

        function insertImage(){

        $(".img-content-show-all img:not(.remove-icon)").click(function() {
            var name = $(this).attr("name");
            var path = $(this).attr("realpath");
            console.log(path + name);
            if($(this).attr("type") === "img"){
                if("${ckeditor}" === "" && "${num}" === "") {
                    $(".img-content", window.parent.document).append("<a class='returnImage' data-url='"+"${Constants.URL}"+"img/markerImages/" + name + "'>"
                                + "<img src='"+"${Constants.URL}"+ path + name + "' alt='" + path + name + "'  /><img src='"+"${Constants.URL}"+"img/remove.png' class='remove-icon'/></a>");
            
            $(".img-input-box", window.parent.document).remove();
            $('.image-upload', window.parent.document).append('<button type="button" id="dialogBtn"  class="btn btn-primary btn-lg img-input-box" data-toggle="modal" data-target="#myModal">Upload image</button>');
            var real = $("#real-img-path", window.parent.document).val();        
            $("#real-img-path", window.parent.document).val(real + "," + path + name);
            initGalerry();
            $(".img-content-show-all").removeAttr("current");
            $(".img-content-show-all").removeAttr("realpath");
            window.parent.imageInserted();
            }
                
                else {
                    console.log("ckedit");
                    var ret = "window.parent.CKEDITOR.tools.callFunction('"+"${ckeditor}"+"', \""+"${Constants.URL}"+ path + name +"\",\"\");";
                    window.opener.CKEDITOR.tools.callFunction("${num}", ""+"${Constants.URL}"+ path + name +"","");
                    window.close();
                    //return window.parent.CKEDITOR.tools.callFunction("${ckeditor}", ""+"${Constants.URL}"+ path + name +"","");
                }
                }
            else {
                getFiles($(this).attr("name"), $(this).attr("parent"));
            }
        });
        }
        $(".arrow-left-img").click(function(){
            var path = $(".img-content-show-all").attr("current");
            var real = $(".img-content-show-all").attr("realpath");
            var spl =  path.split("/");
            var back = "";
            var spl2 =  real.split("/");
            var back2 = "";
            $.each(spl.slice(0, -2), function( index, value ) {
                back = back + value + "/";
              });
            $.each(spl2.slice(0, -2), function( index, value ) {
                back2 = back2 + value + "/";
              });
           $(".img-content-show-all").attr("current",back);
           $(".img-content-show-all").attr("realpath",back2);
           getFiles("", back, true);
        });
        $("#create-folder").click(function(){
        var name = $("#foldernametext").val();
        var path = $(".img-content-show-all").attr("current");
                jQuery.ajax({
                    url: '${Constants.URL}addFolder',
                    cache: false,
                    contentType: false,
                    processData: false,
                    type: 'GET',
                    data: 'name='+name+'&path='+path,
                    success: function(data){
                        getFiles("", path, true);
                        console.log("create");
                        $(".image-upload-folder").hide();
                        $(".image-upload-folder input").val("New Folder");
                        }
                });
        });
        function getFiles(temp_fold, parent, isFolder) {
                isFolder = isFolder || false;
                $(".img-content-show-all").html("");
                console.log('name='+temp_fold+'&parent='+parent);
                jQuery.ajax({
                    url: '${Constants.URL}showImages',
                    cache: false,
                    contentType: false,
                    processData: false,
                    type: 'GET',
                    data: 'name='+temp_fold+'&parent='+parent,
                    success: function(data){
                       $(".img-content-show-all").append(data);
                       insertImage();
                       var attr = $(".img-content-show-all").attr("current");
                        if (typeof attr === typeof undefined || attr === false) {
                            $(".img-content-show-all").attr("current",$(".galery-item img:not(.remove-icon)").attr("parent"));
                            $(".img-content-show-all").attr("realpath",$(".galery-item img:not(.remove-icon)").attr("realpath"));
                        }
                        else {

                       if(!isFolder){
                           console.log("not folder");
                            $(".img-content-show-all").attr("current",$(".img-content-show-all").attr("current")+temp_fold+"/");
                            $(".img-content-show-all").attr("realpath",$(".img-content-show-all").attr("realpath")+temp_fold+"/");
                        }
                        }
                        $(".arrow-left-img").show();
                       if($(".img-content-show-all").attr("realpath") === "img/content/"){
                           $(".arrow-left-img").hide();
                       }
                       $(".img-breadcrumps").remove();
                       $("<span class='img-breadcrumps'>"+$(".img-content-show-all").attr("realpath").replace(/\//g," > ")+"</span>").insertBefore(".img-content-show-all");
            initRemoveFile();            
            }
                });
        }
        function initRemoveFile(){
        $(".img-content-show-all img.remove-icon").click(function(){
            var name = $(this).next("img").attr("name");
            var path = $(".img-content-show-all").attr("current");
                jQuery.ajax({
                    url: '${Constants.URL}removeFileOrDir',
                    cache: false,
                    contentType: false,
                    processData: false,
                    type: 'GET',
                    data: 'name='+name+'&path='+path,
                    success: function(data){
                        console.log(data);
                        getFiles("", path, true);
                        }
                });
        });
        }
    </script>  
    
</html>
