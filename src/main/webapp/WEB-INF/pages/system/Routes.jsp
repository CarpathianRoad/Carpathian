<%-- 
    Document   : ShowContent
    Created on : Jan 25, 2015, 3:09:34 PM
    Author     : kiwi
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:adminpage>
    <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Routes
                        </h1>
                    </div>
                </div>
	<div class="row">
                    <div class="col-lg-10">
                        <div class="table-responsive">
                            <div class="add-button-panel"><button class="btn btn-success btn-mini" id="sudmitData" type="submit"><a href="<c:url value="/system/routes/add/"/>">+ Add route</a></button></div>
                            <div class="admin-panel-filters" style="display: none">
                        <div class="field">
                                                    <div class="form-group">
                                                <label for="sel1">Country</label>
                                                <select class="filter-select" name="type" id="public_country">
                                                  <option value="all">All</option>
                                                  <option value="Ukraine">Ukraine</option>
                                                  <option value="Romania">Romania</option>
                                                  <option value="Hungary">Hungary</option>
                                                  <option value="Slovakia">Slovakia</option>
                                                  <option value="Poland">Poland</option>
                                                </select>
                                              </div>
                                                </div>
                            <div class="field">
                                                    <div class="form-group">
                                                <label for="sel1">Type</label>
                                                <select class="filter-select"  name="type" id="type">
                                                  <option value="all">All</option>
                                                  <option value="1">Foot</option>
                                                  <option value="2">Bike</option>
                                                  <option value="3">Ski</option>
                                                  <option value="4">Horse</option>
                                                  <option value="5">Water</option>
                                                </select>
                                              </div>
                                                </div>
                            <div class="field">
                                                    <div class="form-group">
                                                <label for="sel1">Publish</label>
                                                <select class="filter-select"  name="type" id="publish">
                                                  <option value="all">All</option>
                                                  <option value="1">Publish</option>
                                                  <option value="0">Unpublish</option>
                                                </select>
                                              </div>
                                                </div>
                        </div>
                            
  
    <div class="loader-block"><img src="${Constants.URL}img/loader.gif"/></div>                                  
<table class="table table-bordered table-hover table-striped">
  <thead>
    <tr>
      <th class="admin-table-count">#</th>
      <th class="admin-table-cell-title">Title</th>
      <th class="admin-panel-th">Country</th>
      <th class="admin-panel-th">Type</th>
      <th class="admin-panel-th cell-publish is-publish-only" style="width:5%;"></th>
      <th class="text-center" colspan="2" style="width:3%;"></th>
      <th class="text-center" style="width:3%; display: none;"></th>
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
    loadContent("default", "default", $("#page_number").val(), 1);
    
    $(".filter-select" ).change(function() {
        var val = $(this).val();
        $( ".filter-select" ).each(function( index ) {
                $(this).removeClass("active-filter");
            });
        $(".filter-select").val($(".filter-select option:first").val());
        $(this).val(val);
        $(this).addClass("active-filter");
        loadContent($(this).attr("id"), $(this).val(), $("#page_number").val(), 1);
      });
    $("#page_number" ).change(function() {
        if($(".active-filter").length){
                var filterType = $(".active-filter").attr("id");
                var filterValue = $(".active-filter").val();
            }
            else {
                var filterType = "default";
                var filterValue = "default";
            }
        loadContent( filterType, filterValue, $("#page_number").val(), 1);
    });
    function loadContent(filterType, filterValue, count, page) {
        $(".loader-block").show();
        filterType = typeof filterType !== 'undefined' ? filterType : "default";
        filterValue = typeof filterValue !== 'undefined' ? filterValue : 'default';
        $.ajax({
            type: "get",
            url: "/Carpath/system/routesByType",
            cache: false,    
            data:'type='+filterType+'&value='+filterValue+'&count='+count+'&page='+page+';jsessionid=<c:out value="${pageContext.session.id}"/>',
            mimeType:"text/html; charset=UTF-8",
            success: function(response){
             $("tbody").html(response);
             $(".publish-checkbox").bootstrapSwitch();
             initChecks();
             addSession();
             initPage();
             if(${sessionScope.user.user_role} === 0 && "${sessionScope.user.user_name}" !== "matsko") {
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
                var filterType = $(".active-filter").attr("id");
                var filterValue = $(".active-filter").val();
            }
            else {
                var filterType = "default";
                var filterValue = "default";
            }
            loadContent(filterType, filterValue, $("#page_number").val(), currPage);
        });  
      }
        
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
            url: "/Carpath/system/changePublishRoute",
            cache: false,    
            data:'id='+id+'&status='+state+';jsessionid=<c:out value="${pageContext.session.id}"/>',
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
    
        
 