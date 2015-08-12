<%-- 
    Document   : EditFilter
    Created on : Jul 20, 2015, 3:42:51 PM
    Author     : kiwi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:adminpage>                       
    <div class="margintop20">
        <h4>Edit filter</h4>
        <ol class="breadcrumb">
            <li class="active">
                <a href="${Constants.URL}system/filters"> <i class="fa fa-fw fa-list-alt"></i> Back to filters</a>
            </li>
        </ol>
	 <form name="filterAdd" method="POST" action="${Constants.URL}system/editfilter.do" id="editFilter" enctype="multipart/form-data" type="multipart/form-data">
            <input type="hidden" name="id" value="${filter.id}"/>
             <input type="hidden" class="form-control" id="auth" name="author" value="<c:out value="${sessionScope.user.user_name}"/>">
            <div class="row add-row">
                <div class="col-lg-4 margintop10 field">
                    <img style="width: 100px;" src="${Constants.URL}img/markers/${filter.shortTitle}.png" />
                </div>
                <div class="col-lg-4 margintop10 field">
                    <label for="tlt">Filter icon:</label>
                    <input type="file" name="filter_icon" class="form-control" id="filterIcon" />
                </div>
            </div>
            <hr>
            <div class="row add-row">
                <div class="col-lg-4 margintop10 field">
                    <label for="tlt">Short title:</label>
                    <input type="text" name="short_title" value="${filter.shortTitle}" class="form-control" id="shortTitle">
                </div>
                <div class="col-lg-4 margintop10 field">
                    <label for="tlt">Full title:</label>
                    <input type="text" name="full_title" value="${filter.fullTitle}" class="form-control" id="fullTitle">
                </div>
            </div>
            <hr>
            <div class="row add-row">
                <div class="col-lg-4 margintop10 field">
                                                <label for="tlt">Group ID:</label>
                                                <input type="text" name="group_id" value="${filter.groupID}" class="form-control" id="groupID">
                </div>
                <div class="col-lg-4 margintop10 field">
                                                <label for="tlt">Sort Number:</label>
                                                <input type="text" name="sort_number" value="${filter.sortNumber}" class="form-control" id="sort_number">
                </div>
            </div>
            <hr>
        </form>
        <p>
            <button class="btn btn-success margintop30 marginbottom30" id="sudmitData" type="submit">Save changes</button>
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
</script>