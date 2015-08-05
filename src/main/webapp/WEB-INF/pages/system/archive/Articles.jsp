<%--
	Document   : Articles
	Created on : Jul 16, 2015, 1:37:34 PM
	Author 	: kiwi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:adminpage>
	<div class="row">
                	<div class="col-lg-12">
                    	<h1 class="page-header">
                        	Articles in category "${cat_name}"
                    	</h1>
                    	<ol class="breadcrumb">
                        	<li class="active">
                            	<a href="${Constants.URL}system/archive/index"> <i class="fa fa-fw fa-list-alt"></i> Back to categories</a>
                        	</li>
                    	</ol>
                	</div>
            	</div>

            	<div class="row">
                	<div class="col-lg-12">
                    	<div class="table-responsive">
                        	<div class="add-button-panel"><button class="btn btn-success btn-mini" id="sudmitData" type="submit"><a href="<c:url value="/system/archive/add/"/>${category}">+ Add article</a></button></div>
                        	<div class="article-filters">
                            	<a class="disabled filter-button">Show/hide filters</a>
                        	</div>
                        	<div class="article-filters-block col-lg-11">
                            	<div class="row add-row">
                                	<div class="col-lg-3 field">
                                    	<div class="form-group">
                                        	<label for="datepicker-act">From add date</label>
                                        	<input type="text" class="form-control selectpicker" placeholder="Choose the date" name="act-date" id="from-add-date-filter">
                                    	</div>
                                	</div>
                                	<div class="col-lg-3 field">
                                    	<div class="form-group">
                                        	<label for="datepicker-act">To add date</label>
                                        	<input type="text" class="form-control selectpicker" placeholder="Choose the date" name="act-date" id="to-add-date-filter">
                                    	</div>
                                	</div>
                                	<div class="col-lg-3 field">
                                    	<div class="form-group">
                                        	<label for="datepicker-act">From edit date</label>
                                        	<input type="text" class="form-control selectpicker" placeholder="Choose the date" name="act-date"  id="from-edit-date-filter">
                                    	</div>
                                	</div>
                                	<div class="col-lg-3 field">
                                    	<div class="form-group">
                                        	<label for="datepicker-act">To edit date</label>
                                        	<input type="text" class="form-control selectpicker" placeholder="Choose the date" name="act-date"  id="to-edit-date-filter">
                                    	</div>
                                	</div>
                            	</div>
                            	<div class="row add-row">
                                	<div class="col-lg-3 field">
                                    	<div class="form-group">
                                        	<label for="sel">Author</label>
                                        	<select class="form-control" name="public_country" id="author-filter">
                                            	<option value="all" selected>All</option>
                                            	<c:forEach items="${users}" var="user">
                                                	<option value="${user.user_name}">${user.user_name}</option>  
                                            	</c:forEach>
                                        	</select>
                                    	</div>
                                	</div>
                                	<div class="col-lg-3 field">
                                    	<div class="form-group">
                                        	<label for="sel3">Editor</label>
                                        	<select class="form-control" name="public_country" id="editor-filter">
                                            	<option value="all" selected>All</option>
                                            	<c:forEach items="${users}" var="user">
                                                	<option value="${user.user_name}">${user.user_name}</option>  
                                            	</c:forEach>
                                        	</select>
                                    	</div>
                                	</div>
                                	<div class="col-lg-3 field">
                                    	<div class="form-group">
                                        	<label for="sel3">Publish</label>
                                        	<select class="form-control" name="public_country" id="publish-filter">
                                            	<option value="all" selected>All</option>
                                            	<option value="1">Publish</option>
                                            	<option value="0">Unpublish</option>
                                        	</select>
                                    	</div>
                                	</div>
                                	<div class="col-lg-3 field filter-apply-button">
                                    	<div class="form-group">
                                        	<button class="btn btn-success btn-mini"><a>Apply filter</a></button>
                                        	<button class="btn btn-danger btn-mini" id="clear-filter"><a>Clear filter</a></button>
                                    	</div>
                                	</div>
                            	</div>
                        	</div>
                        	<table class="article-table table table-bordered table-hover table-striped">
                            	<thead>
                                	<tr>
                                    	<th class="text-center" style="width:3%">#</th>
                                    	<th style="width:45%">Title</th>
                                    	<th class="text-center" style="width:10%">Lang</th>
                                    	<th class="text-center" style="width:7%">Images</th>
                                    	<th class="text-center" style="width:7%">Files</th>
                                    	<th class="text-center" style="width:17%">Add date</th>
                                    	<th class="text-center" style="width:17%">Edit date</th>
                                    	<th class="text-center" style="width:5%">Author</th>
                                    	<th class="text-center" style="width:5%">Editor</th>
                                    	<th class="text-center" style="width:5%">Publish</th>
                                    	<th colspan="3" style="width:3%;"></th>
                                    	<th style="width:3%; display: none;"></th>
                                    	<th style="width:5%; display: none;"></th>
                                	</tr>
                            	</thead>
                            	<tbody>
                                	<c:if test="${empty articles}">
                                    	<tr>
                                        	<td colspan="9">No articles in this category...</td>
                                    	</tr>
                                	</c:if>
                                	<c:set var="count" value="1" scope="page" />
                                	<c:forEach items="${articles}" var="item">
                                    	<c:choose>
                                        	<c:when test="${sessionScope.user.user_role == 0}">
                                            	<c:if test="${item.article_is_delete == 0}">
                                                	<tr class="table-item" author="${item.article_author}" editor="${item.article_editor}" publish="${item.article_is_publish}" add-date="${item.article_add_date}" edit-date="${item.article_edit_date}">
                                                    	<td class="text-center counter">${count}</td>
                                                    	<td <c:if test="${item.article_author != item.article_editor}">style="color:#576A90"</c:if>>
                                                        	${item.article_title_en}
                                                    	</td>
                                                    	<td class="text-center">${item.article_lang}</td>
                                                    	<td class="text-center">${item.article_image_size}</td>
                                                    	<td class="text-center">${item.article_file_size}</td>
                                                    	<td class="text-center">${item.article_add_date}</td>
                                                    	<td class="text-center">${item.article_edit_date}</td>
                                                    	<td class="text-center">${item.article_author}</td>
                                                    	<td class="text-center">${item.article_editor}</td>
                                                    	<td class="text-center">
                                                        	<c:if test="${item.article_is_publish == 1}">
                                                            	<i class="fa fa-fw fa-check-circle"></i>
                                                        	</c:if>
                                                    	</td>
                                                    	<td class="text-center"><a href="<c:url value="/system/archive/edit/${item.article_id}"/>"><img class="article-buttons" src="${Constants.URL}img/edit.png" /></a></td>
                                                    	<td class="text-center"><a href="<c:url value="/system/archive/delete/${item.article_id}"/>"><img class="article-buttons" src="${Constants.URL}img/delete.png" /></a></td>
                                                   	 
                                                	</tr>
                                            	</c:if>
                                        	</c:when>    
                                        	<c:otherwise>
                                                	<tr class="table-item" author="${item.article_author}" editor="${item.article_editor}" publish="${item.article_is_publish}" add-date="${item.article_add_date}" edit-date="${item.article_edit_date}">
                                                    	<td class="text-center counter">${count}</td>
                                                    	<c:choose>
                                                        	<c:when test="${item.article_is_delete == 1}">
                                                            	<td style="color:#A39595">${item.article_title_en}</td>
                                                        	</c:when>
                                                        	<c:otherwise>
                                                        	<td <c:if test="${item.article_author != item.article_editor}">style="color:#576A90"</c:if>>
                                                            	${item.article_title_en}
                                                        	</td>
                                                        	</c:otherwise>
                                                    	</c:choose>
                                                    	<td class="text-center">${item.article_lang}</td>
                                                    	<td class="text-center">${item.article_image_size}</td>
                                                    	<td class="text-center">${item.article_file_size}</td>
                                                    	<td class="text-center">${item.article_add_date}</td>
                                                    	<td class="text-center">${item.article_edit_date}</td>
                                                    	<td class="text-center">${item.article_author}</td>
                                                    	<td class="text-center">${item.article_editor}</td>
                                                    	<td class="text-center">
                                                        	<c:if test="${item.article_is_publish == 1}">
                                                            	<i class="fa fa-fw fa-check-circle"></i>
                                                        	</c:if>
                                                    	</td>
                                                    	<td class="text-center"><a href="<c:url value="/system/archive/edit/${item.article_id}"/>"><img class="article-buttons" src="${Constants.URL}img/edit.png" /></a></td>
                                                    	<c:choose>
                                                        	<c:when test="${item.article_is_delete == 1}">
                                                       	 
                                                    	<td class="text-center"><a href="<c:url value="/system/archive/do/undeletearticle/${item.article_id}"/>"><img class="article-buttons" src="${Constants.URL}img/undelete.png" /></a></td>
                                                        	</c:when>
                                                        	<c:otherwise>
                                                       	 
                                                    	<td class="text-center"><a href="<c:url value="/system/archive/delete/${item.article_id}"/>"><img class="article-buttons" src="${Constants.URL}img/delete.png" /></a></td>
                                                        	</c:otherwise>
                                                    	</c:choose>
                                                    	<c:if test="${sessionScope.user.user_role == 1}">

                                                    	<td class="text-center"><button class="btn btn-success btn-xs" id="publishData" type="submit"><a href="<c:url value="/system/archive/publish/${item.article_id}"/>">Publish</a></button></td>
                                                    	</c:if>
                                                	</tr>
                                        	</c:otherwise>
                                    	</c:choose>
                                    	<c:set var="count" value="${count + 1}" scope="page"/>
                                	</c:forEach>
                            	</tbody>
                        	</table>
                    	</div>
                	</div>
            	</div>
</t:adminpage>
<script>
	$(document).ready(function() {
    	$(".selectpicker").datepicker();
    	$(".selectpicker").datepicker("option", "dateFormat", "dd.mm.yy");
    	$('.selectpicker').selectpicker({
        	size: 4
    	});
	});
	$(".article-filters").click(function(){
    	$(".article-filters-block").toggle("slow");
	});
	$(".filter-apply-button button").click(function(){
    	if($(this).attr("id") === "clear-filter"){
        	$(".table-item").show();
        	$("#author-filter").val("all");
        	$("#editor-filter").val("all");
        	$("#publish-filter").val("all");
        	$("#from-add-date-filter").val("");
        	$("#to-add-date-filter").val("");
        	$("#from-edit-date-filter").val("");
        	$("#to-edit-date-filter").val("");
    	}
    	else {
    	$(".table-item").hide();
        	var author = $("#author-filter").val();
        	var editor = $("#editor-filter").val();
        	var publish = $("#publish-filter").val();
        	var from_add_date = $("#from-add-date-filter").val();
        	var to_add_date = $("#to-add-date-filter").val();
        	var from_edit_date = $("#from-edit-date-filter").val();
        	var to_edit_date = $("#to-edit-date-filter").val();
        	$(".table-item").each(function( index ) {
            	var filter_str = "";  
            	if(author !== null && author !== "all") {
                	filter_str += "[author='"+author+"']";
            	}
            	if(editor !== null && editor !== "all") {
                	filter_str += "[editor='"+editor+"']";
            	}
            	if(publish !== null && publish !== "all") {
                	filter_str += "[publish='"+publish+"']";
            	}
            	if(from_add_date === "") {
                	from_add_date = "0";
            	}
            	if(to_add_date === "") {
                	to_add_date = "0";
            	}
            	if(from_edit_date === "") {
                	from_edit_date = "0";
            	}
            	if(to_edit_date === "") {
                	to_edit_date = "0";
            	}
            	filter_str += checkDate(from_add_date, to_add_date, $(this).attr("add-date"), "add-date");
            	filter_str += checkDate(from_edit_date, to_edit_date, $(this).attr("edit-date"), "edit-date");
            	$(".table-item"+filter_str).show();
        	});
    	}
	});
	function checkDate(from_date, to_date, check_date, date_str) {
    	var d1 = from_date.split(".");
    	var d2 = to_date.split(".");
    	var c = check_date.split(" ")[0].split(".");
    	var from = new Date(d1[2], d1[1]-1, d1[0]);  
    	var to   = new Date(d2[2], d2[1]-1, d2[0]);
    	var check = new Date(c[2], c[1]-1, c[0]);
    	var return_str = "";
    	var inDate = false;
    	if(to_date !== "0" && from_date !== "0") {
        	if(check >= from && check <= to){
            	inDate = true;
            	return_str += "["+date_str+"='"+check_date+"']";
        	}
    	}
    	else if(to_date !== "0" && from_date === "0"){
        	if(check <= to){
            	inDate = true;
            	return_str += "["+date_str+"='"+check_date+"']";
        	}
    	}
    	else if(to_date === "0" && from_date !== "0"){
        	if(check >= from){
            	inDate = true;
            	return_str += "["+date_str+"='"+check_date+"']";
        	}
    	}
    	else if(to_date === "0" && from_date === "0"){
            	inDate = true;
        	return "";
    	}
    	if(!inDate) {
        	return_str +="["+date_str+"='false']";
    	}
    	return return_str;
	}
</script>