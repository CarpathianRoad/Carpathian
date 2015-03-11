<%-- 
    Document   : Partners
    Created on : Jan 13, 2015, 9:59:12 PM
    Author     : kiwi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:adminpage>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
    <script src="${Constants.URL}js/ckeditor/ckeditor.js"></script>
    <div class="container margintop20">
            <h4>Add article</h4>
				<!-- Place inside the <head> of your HTML -->

                                <form action="${Constants.URL}system/insertdata.do" name="addArticleForm" id="addForm" method="POST" type="multipart/form-data">
                                    
            <div class="row add-row">
						<div class="col-lg-6 field">
                                                    <div class="form-group">
                                                        <label for="tlt">Title<span class="red-star">*</span></label>
                                                <input type="text" name="title" class="form-control" id="tlt">
                                                <div class="validation"></div>
                                              </div>
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
                                    </div>
                <hr>
                                    <div class="row add-row">
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
                                    </div>
                <hr>
                                    <div class="row add-row">
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

                <div class="col-lg-10 field img-upl">
                                                    <div class="form-group">
                                                        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-body">
          <div class="image-upload-modal">
              <span class="arrow-left-img" aria-hidden="true"><img src="${Constants.URL}img/arrow-left-icon.png" /></span>
            <label class="btn" for="file-input">
                <button class="btn btn-primary" disabled="disabled" style="opacity: 100">Upload from computer</button>
            </label>
                <input class="" id="file-input" type="file"/>
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
          <div class="img-content-show-all"></div>
      </div>
    </div>
  </div>
</div>  
                                                        <label for="img">Images</label>
                                                        <div class="img-content">
                                                            <div class="image-upload">
                                                                <button type="button" class="btn btn-primary btn-lg img-input-box" data-toggle="modal" data-target="#myModal">
                    <img src="${Constants.URL}img/add-image.png"/>
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
                                                <input type="text" class="form-control disabled-input" name="country" id="cnt" disabled>
                                              </div>
                                                </div>
						<div class="col-lg-3 field">
                                                    <div class="form-group">
                                                <label for="rgn">Region</label>
                                                <input type="text" class="form-control disabled-input" name="region" id="rgn" disabled>
                                              </div>
						</div>
						<div class="col-lg-3 field">
                                                    <div class="form-group">
                                                <label for="dstr">District</label>
                                                <input type="text" class="form-control disabled-input" name="district" id="dstr" disabled>
                                              </div>
						</div>
						<div class="col-lg-3 field">
                                                    <div class="form-group">
                                                <label for="twn">Town</label>
                                                <input type="text" class="form-control disabled-input" name="town" id="twn" disabled>
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
                                <label><img src="${Constants.URL}img/markers/${item.shortTitle}.png"/><input type="checkbox" value="${item.shortTitle}">${item.fullTitle}</label>
                              
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
                                <label><input type="checkbox" value="${item.shortTitle}">${item.fullTitle}</label>
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
                                        <div class="col-lg-12 margintop10 field">
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
								<button class="btn btn-primary btn-mini margintop10 marginbottom30" id="sudmitData" type="submit">Save</button>
							</p>
            <script> 
                CKEDITOR.replace('editorEN', {
                    filebrowserBrowseUrl : '/browser/browse/type/all',
                    filebrowserUploadUrl : '/browser/upload/type/all',
                    filebrowserImageBrowseUrl : '${Constants.URL}uploadFile',
                    filebrowserImageUploadUrl : '${Constants.URL}uploadFile',
                    filebrowserWindowWidth  : 800,
                    filebrowserWindowHeight : 500
                });
                CKEDITOR.replace('editorUA', {
                    filebrowserBrowseUrl : '/browser/browse/type/all',
                    filebrowserUploadUrl : '/browser/upload/type/all',
                    filebrowserImageBrowseUrl : '${Constants.URL}uploadFile',
                    filebrowserImageUploadUrl : '${Constants.URL}uploadFile',
                    filebrowserWindowWidth  : 800,
                    filebrowserWindowHeight : 500
                });
                CKEDITOR.replace('editorHU', {
                    filebrowserBrowseUrl : '/browser/browse/type/all',
                    filebrowserUploadUrl : '/browser/upload/type/all',
                    filebrowserImageBrowseUrl : '${Constants.URL}uploadFile',
                    filebrowserImageUploadUrl : '${Constants.URL}uploadFile',
                    filebrowserWindowWidth  : 800,
                    filebrowserWindowHeight : 500
                });
                CKEDITOR.replace('editorSK', {
                    filebrowserBrowseUrl : '/browser/browse/type/all',
                    filebrowserUploadUrl : '/browser/upload/type/all',
                    filebrowserImageBrowseUrl : '${Constants.URL}uploadFile',
                    filebrowserImageUploadUrl : '${Constants.URL}uploadFile',
                    filebrowserWindowWidth  : 800,
                    filebrowserWindowHeight : 500
                });
                CKEDITOR.replace('editorPL', {
                    filebrowserBrowseUrl : '/browser/browse/type/all',
                    filebrowserUploadUrl : '/browser/upload/type/all',
                    filebrowserImageBrowseUrl : '${Constants.URL}uploadFile',
                    filebrowserImageUploadUrl : '${Constants.URL}uploadFile',
                    filebrowserWindowWidth  : 800,
                    filebrowserWindowHeight : 500
                });
                CKEDITOR.replace('editorRO', {
                    filebrowserBrowseUrl : '/browser/browse/type/all',
                    filebrowserUploadUrl : '/browser/upload/type/all',
                    filebrowserImageBrowseUrl : '${Constants.URL}uploadFile',
                    filebrowserImageUploadUrl : '${Constants.URL}uploadFile',
                    filebrowserWindowWidth  : 800,
                    filebrowserWindowHeight : 500
                });
                CKEDITOR.replace('editorGE', {
                    filebrowserBrowseUrl : '/browser/browse/type/all',
                    filebrowserUploadUrl : '/browser/upload/type/all',
                    filebrowserImageBrowseUrl : '${Constants.URL}uploadFile',
                    filebrowserImageUploadUrl : '${Constants.URL}uploadFile',
                    filebrowserWindowWidth  : 800,
                    filebrowserWindowHeight : 500
                });
                CKEDITOR.replace('editorCZ', {
                    filebrowserBrowseUrl : '/browser/browse/type/all',
                    filebrowserUploadUrl : '/browser/upload/type/all',
                    filebrowserImageBrowseUrl : '${Constants.URL}uploadFile',
                    filebrowserImageUploadUrl : '${Constants.URL}uploadFile',
                    filebrowserWindowWidth  : 800,
                    filebrowserWindowHeight : 500
                });
                CKEDITOR.replace('editorSRB', {
                    filebrowserBrowseUrl : '/browser/browse/type/all',
                    filebrowserUploadUrl : '/browser/upload/type/all',
                    filebrowserImageBrowseUrl : '${Constants.URL}uploadFile',
                    filebrowserImageUploadUrl : '${Constants.URL}uploadFile',
                    filebrowserWindowWidth  : 800,
                    filebrowserWindowHeight : 500
                });
                
                
    $(document).ready(function () { 
        var currentLang = $(".lang-switch-text button.active").attr("id");
        $(".textareas .textarea-msg[lang='"+currentLang+"']").show();
        initGalerry();
        var myDate = new Date();
        var currentMonth = (myDate.getMonth()+1);
        var currentDate = myDate.getDate();
        if (currentMonth < 10) { currentMonth = '0' + currentMonth; }
        if (currentDate < 10) { currentDate = '0' + currentDate; }
var prettyDate = currentMonth + '/' + currentDate + '/' +
        myDate.getFullYear();
        $("#datepicker").val(prettyDate);
       $( "#datepicker" ).datepicker();
       $( "#datepicker-act" ).datepicker();
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

$("#createfolder").click(function(){
    $(".image-upload-folder").toggle("slow");
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
                $(".img-content").append(data);
                var tmp = $(data).find("img").attr("alt");
                var real = $("#real-img-path").val();
                $("#real-img-path").val(real + "," + "img/content/"+tmp);
                $(".img-input-box").remove();
                $('.image-upload').append('<button type="button" class="btn btn-primary btn-lg img-input-box" data-toggle="modal" data-target="#myModal"><img src="${Constants.URL}img/add-image.png"/></button>');
                initRemove();
                initGalerry();
                $("#close-modal").trigger("click");
}
        });
});
function initGalerry(){
$(".btn-lg").click(function(){
    getFiles("","");
});
}

function insertImage(){

$(".img-content-show-all img").click(function() {
    var name = $(this).attr("name");
    var path = $(this).attr("realpath");
    if($(this).attr("type") === "img"){
    $(".img-content").append("<a class='returnImage' data-url='"+"${Constants.URL}"+"img/markerImages/" + name + "'>"
                        + "<img src='"+"${Constants.URL}"+ path + name + "' alt='" + name + "'  /><img src='"+"${Constants.URL}"+"img/remove.png' class='remove-icon'/></a>");
    var real = $("#real-img-path").val();
    $("#real-img-path").val(real + "," + path +name);
    $(".img-input-box").remove();
    $('.image-upload').append('<button type="button" class="btn btn-primary btn-lg img-input-box" data-toggle="modal" data-target="#myModal"><img src="${Constants.URL}img/add-image.png"/></button>');
    initRemove();
    initGalerry();
    $(".img-content-show-all").removeAttr("current");
    $(".img-content-show-all").removeAttr("realpath");
    $("#close-modal").trigger("click");
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
                    $(".img-content-show-all").attr("current",$(".galery-item img").attr("parent"));
                    $(".img-content-show-all").attr("realpath",$(".galery-item img").attr("realpath"));
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
                }
        });
}
function initRemove(){

$(".remove-icon").click(function(){
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
    
    if($("#tlt").val() === "") {
        $("#tlt").next("div.validation").html('<span style="color:red">Enter the title of the article</span>');
        isValidate = false;
    }
    else {
        $("#tlt").next("div.validation").html("");
    }
    
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
                                $('#cnt').val(address[p].long_name);
                            }
                            if (address[p].types.indexOf("locality") != -1) {
                                //console.log("town = " + address[p].long_name);
                                $('#twn').val(address[p].long_name);
                            }
                            if (address[p].types.indexOf("route") != -1) {
                                //console.log("route = " + address[p].long_name);
                            }
                            if (address[p].types.indexOf("administrative_area_level_2") != -1) {
                                //console.log("district = " + address[p].long_name);
                                $('#dstr').val(address[p].long_name);
                            }
                            if (address[p].types.indexOf("administrative_area_level_1") != -1) {
                                //console.log("region = " + address[p].long_name);
                                $('#rgn').val(address[p].long_name);
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
