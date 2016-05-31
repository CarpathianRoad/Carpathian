<%-- 
    Document   : ShowContent
    Created on : Jan 25, 2015, 3:09:34 PM
    Author     : kiwi
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<t:adminpage>
        <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Articles
                        </h1>
                    </div>
                </div>
	<div class="row">
                    <div class="col-lg-12">
                        <div class="table-responsive">
                            <div class="add-button-panel"><button class="btn btn-success btn-mini" id="sudmitData" type="submit"><a href="<c:url value="/system/articles/add/"/>${category}">+ Add article</a></button></div>
                               <div class="admin-panel-filters marginbottom30">
                                   <div class="row add-row">
                                       
                                	<div class="col-lg-2 field">
                                                    <div class="form-group">
                                                
                                                ${menuList}
                                              </div>
                                                </div>
                                	<div class="col-lg-2 field">
                                    	<div class="form-group">
                                                <label for="sel1">Country</label>
                                                <select class="filter-select form-control" name="type" id="public_country">
                                                  <option value="all">All</option>
                                                  <option value="Ukraine">Ukraine</option>
                                                  <option value="Romania">Romania</option>
                                                  <option value="Hungary">Hungary</option>
                                                  <option value="Slovakia">Slovakia</option>
                                                  <option value="Poland">Poland</option>
                                                </select></div>
                                	</div>
                                	<div class="col-lg-2 field">
                                    	<div class="form-group">
                                            
                                                <label for="sel1">Type</label>
                                                <select class="filter-select form-control" name="type" id="type">
                                                  <option value="all">All</option>
                                                  <option value="0">News</option>
                                                  <option value="1">Anons</option>
                                                  <option value="2">Marker</option>
                                                  <option value="3">Simple Article</option>
                                                </select>
                                        </div>
                                	</div>
                                	<div class="col-lg-2 field">
                                    	<div class="form-group">
                                                <label for="sel1">Author</label>
                                                <select class="filter-select form-control"  name="type" id="author">
                                                  <option value="all">All</option>
                                                  <c:forEach items="${users}" var="user">
                                                	<option value="${user.user_name}">${user.user_name}</option>  
                                            	</c:forEach>
                                                </select>
                                        </div>
                                	</div>
                                	<div class="col-lg-2 field">
                                    	<div class="form-group">
                                            
                                                <label for="sel1">Publish</label>
                                                <select class="filter-select form-control"  name="type" id="publish">
                                                  <option value="all">All</option>
                                                  <option value="1">Publish</option>
                                                  <option value="0">Unpublish</option>
                                                </select>
                                        </div>
                                	</div>
                                   </div>
                        </div>
                            
  
    <div class="loader-block"><img src="${Constants.URL}img/loader.gif"/></div>                                  
<table class="article-table table table-bordered table-hover table-striped">
  <thead>
    <tr>
      <th style="width:3%">#</th>
      <th class="admin-panel-th date-cell" style="width:3%">Date</th>
      <th class="admin-table-cell-title" style="width:35%">Title</th>
      <th class="admin-panel-th" style="width:10%">Country</th>
      <th class="admin-panel-th" style="width:10%">Type</th>
      <th class="admin-panel-th" style="width:13%">Menu</th>
      <th class="admin-panel-th" style="width:5%">Author</th>
      <th class="admin-panel-th cell-publish is-publish-only" colspan="3" style="width:3%;"></th>
      <th class="is-publish-only" style="width:3%; display: none;"></th>
      <th class="is-publish-only" style="width:3%; display: none;"></th>
    </tr>
  </thead>
  <tbody>
      
  </tbody>
</table>                            
 <select class="page_number" name="page_number" id="page_number">
    <option value="20">20</option>
    <option value="50">50</option>
    <option value="100">100</option>
 </select>              
      
                           
			</div>
		</div> 
        </div>
</t:adminpage>
    
    
        
    <script>
        
$(document).ready(function () {
    $("#menuCat").addClass("filter-select form-control");
    $("#menuCat").addClass("form-control");
    var url = window.location.href; 
        $.cookie("sessionid", 'jsessionid=<c:out value="${pageContext.session.id}"/>');   
    
    loadContent("${sessionScope.user.user_name}", "default", "default", $("#page_number").val(), 1);
    
    $(".filter-select" ).change(function() {
        var val = $(this).val();
        $(this).val(val);
        if(val === "all") {
            $(this).removeClass("active-filter");
        }
        else {
            $(this).addClass("active-filter");
        }
        var filters = "";
        var values = "";
        $( ".active-filter" ).each(function( index ) {
                filters = filters+","+$(this).attr("id");
                values = values+","+$(this).val();
        });
        
        loadContent("${sessionScope.user.user_name}", filters, values, $("#page_number").val(), 1);
      });
    $("#page_number" ).change(function() {
        if($(".active-filter").length){
                var filters = "";
                var values = "";
                $( ".active-filter" ).each(function( index ) {
                        filters = filters+","+$(this).attr("id");
                        values = values+","+$(this).val();
                });
            }
            else {
                var filters = "default";
                var values = "default";
            }
            console.log(filters + "/" + values);
        loadContent("${sessionScope.user.user_name}",  filters, values, $("#page_number").val(), 1);
    });
    function loadContent(username, filterType, filterValue, count, page) {
        $(".loader-block").show();
        filterType = typeof filterType !== 'undefined' ? filterType : "default";
        filterValue = typeof filterValue !== 'undefined' ? filterValue : 'default';
        filterType = filterType !== "" ? filterType : "default";
        filterValue = filterValue !== "" ? filterValue : 'default';
        $.ajax({
            type: "get",
            url: "<c:url value="/system/contentByType" />",
            cache: false,    
            data:'username='+username+'&type='+filterType+'&value='+filterValue+'&count='+count+'&page='+page,
            mimeType:"text/html; charset=UTF-8",
            success: function(response){
             $("tbody").html(response);
             cutDate();
             $(".publish-checkbox").bootstrapSwitch();
             initChecks();
             //addSession();
             initPage();
             if(${sessionScope.user.user_role} === 0) {
                 $( "td.publish" ).hide();
                 $("td.article-publish").hide();
                 $(".cell-publish").hide();
                 $( "td.article-publish.publish").each(function( index ) {
                     $(".is-publish-only").hide();
                     $(".article-publish.publish").css("text-align","center");
                     $(this).html("");
                     $(this).html("<img src='${Constants.URL}img/clip.png' style='width: 20px;'/>");
                     $(this).show();
                 });
             }
             $(".loader-block").hide();
            },
            error: function(response){      
             console.log(response);
            }
        });
    }
      function initPage(){
        $(".pagination a").click(function() {
            var currPage = $(this).html();
            if($(".active-filter").length){
                var filters = "";
                var values = "";
                $( ".active-filter" ).each(function( index ) {
                        filters = filters+","+$(this).attr("id");
                        values = values+","+$(this).val();
                });
            }
            else {
                var filters = "default";
                var values = "default";
            }
            loadContent("${sessionScope.user.user_name}",  filters, values, $("#page_number").val(), currPage);
        });  
      }
        function cutDate(){
            $( ".date-cell" ).each(function( index ) {
                $(this).html($(this).html().substr(0,10));
            });
        }
        
    $( ".article-type" ).each(function( index ) {
        var type = $(this).html();
        var texttype = "News";
        if (type === "1") {
            texttype = "Anons";
        }
        else if (type === "2") {
            texttype = "Marker";
        }
        else if (type === "3") {
            texttype = "Simple Article";
        }
        $(this).html(texttype);
    });
    function addSession() {
        $( ".edit-button" ).each(function( index ) {
            var current = $(this).attr("href") + ";" + $.cookie("sessionid");
            $(this).attr("href", current);
        });
        $( ".admin-table-cell-title a" ).each(function( index ) {
            var current = $(this).attr("href") + ";" + $.cookie("sessionid");
            $(this).attr("href", current);
        });
    }
    function initChecks(){
       $('.publish-checkbox').on('switchChange.bootstrapSwitch', function(event, state) {
        var id = $(this).attr("data-id");
                //console.log(state); // true | false
        $.ajax({
            type: "get",
            url: "<c:url value="/system/changePublish" />",
            cache: false,    
            data:'id='+id+'&status='+state,
            success: function(response){
            },
            error: function(response){      
             console.log(response);
            }
        });
      }); 
    }
    
    
});   
    </script> 
 