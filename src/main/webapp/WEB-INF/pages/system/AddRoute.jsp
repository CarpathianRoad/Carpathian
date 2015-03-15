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
    <div class="container margintop20">
            <h4>Add route</h4>

                                <form action="${Constants.URL}system/routes/insertdata.do" name="addRouteForm" id="addForm" method="POST" type="multipart/form-data">
                                    
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
                                    <div class="row add-row">
                                        
						<div class="col-lg-3 field">
                                                    <div class="form-group">
                                                <label for="sel1">Route file<span class="red-star">*</span></label>
                                                <input type="file" name="file" id="route-file" />
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
                                    </div>
                <hr>
            <div class="row add-row list-block route-filter">
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
								<button class="btn btn-primary btn-mini margintop30 marginbottom30" id="sudmitData" type="submit">Save</button>
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
        var currentLangT = $(".lang-switch-title button.active").attr("id");
        $(".input-title-lang[lang='"+currentLangT+"']").show();
        
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
    var check_str_markers = "";
    var check_str_filters = "";
    
    if($("#tlt").val() === "") {
        $("#tlt").next("div.validation").html('<span style="color:red">Enter the title of the article</span>');
        isValidate = false;
    }
    else {
        $("#tlt").next("div.validation").html("");
    }
    if(isValidate) {
        $("#addForm").submit();
    }
    });
    
             </script>
        </div>
</t:adminpage>
