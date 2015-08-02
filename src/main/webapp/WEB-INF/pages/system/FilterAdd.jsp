<%-- 
    Document   : FilterAdd
    Created on : Jul 30, 2015, 9:13:36 PM
    Author     : kiwi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<t:adminpage>
    <div class="margintop20">
        <h4>Add filter</h4>
        <ol class="breadcrumb">
            <li class="active">
                <a href="${Constants.URL}system/filters"> <i class="fa fa-fw fa-list-alt"></i> Back to filters</a>
            </li>
        </ol>
	<form name="filterAdd" method="POST" action="${Constants.URL}system/addfilter.do" id="addFilter" enctype="multipart/form-data" type="multipart/form-data">
            <input type="hidden" class="form-control" id="auth" name="author" value="<c:out value="${sessionScope.user.user_name}"/>">
            <div class="row add-row">
                <div class="col-lg-4 margintop10 field">
                    <label for="tlt">Filter icon:</label>
                    <input type="file" name="filter_icon" class="form-control" id="filterIcon" />
                </div>
            </div>
            <hr>
            <div class="row add-row">
                <div class="col-lg-4 margintop10 field">
                    <label for="tlt">Short title:</label>
                    <input type="text" name="short_title" class="form-control" id="shortTitle">
                    <div class="validation"></div>
                </div>
                <div class="col-lg-4 margintop10 field">
                    <label for="tlt">Full title:</label>
                    <input type="text" name="full_title" class="form-control" id="fullTitle">
                </div>
            </div>
            <hr>
            <div class="row add-row">
                <div class="col-lg-4 margintop10 field">
                                                <label for="tlt">Group ID:</label>
                                                <input type="text" name="group_id" class="form-control" id="groupID">
                </div>
                <div class="col-lg-4 margintop10 field">
                                                <label for="tlt">Sort Number:</label>
                                                <input type="text" name="sort_number" class="form-control" id="sort_number">
                </div>
            </div>
            <hr>
        </form>
        <p>
            <button class="btn btn-success margintop30 marginbottom30" id="sudmitData" type="submit">Add filter</button>
            <a href="${Constants.URL}system/filters"><button class="btn btn-danger margintop30 marginbottom30" id="sudmitData" type="submit">Back to filters</button></a>
        </p>
    </div>
</t:adminpage>
<script> 
    $(document).ready(function () { 
    });
    $("#sudmitData").click(function(){
        $("div.validation").html('');
        var isValidate = true;

        if(isValidate) {
            $("#addFilter").submit();
        }
    });
    
    $("#shortTitle").change(function() {
        var check =  /^[a-z0-9_]+$/i.test($(this).val());
        console.log(check);
                if(check){
                    $(".validation").html("");
                   $("#sudmitData").removeClass("disabled");
                }
                else {
                      $(".validation").html("<span style='color:red'>No white spaces in short title</span>");
                      $("#sudmitData").addClass("disabled");
                }
    });
</script>
