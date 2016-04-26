<%-- 
    Document   : RouteDelete
    Created on : Jul 30, 2015, 8:57:43 PM
    Author     : kiwi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<t:adminpage>
    <style>
        .disabled {
            pointer-events: none;
        }
    </style>
    <div class="margintop20">
        <h4>Delete route</h4>
        <ol class="breadcrumb">
            <li class="active">
                <a href="<c:url value="/system/routes" />"> <i class="fa fa-fw fa-list-alt"></i> Back to routes</a>
            </li>
        </ol>
	<div class="row add-row">
                <div class="col-lg-12 margintop30">
                    <div class="delete-row">Delete route <strong>"${route.titleEN}"</strong> ?</div>
                    <p>
                        <button class="btn btn-success margintop30 marginbottom30" id="sudmitDelete" type="submit">Delete route</button>
                        <a href="<c:url value="/system/routes" />"><button class="btn btn-danger margintop30 marginbottom30" id="sudmitData" type="submit">Back to articles</button></a>
                    </p>
                </div>
        </div>
                    <form action="<c:url value="/system/route/do/deletedata.do" />" name="addArticleForm" id="addForm" method="POST" type="multipart/form-data">
                        <input type="hidden" id="route_id" name="route_id" value="${route.id}"/>
                    </form>
    </div>
</t:adminpage>
<script> 
    $("#sudmitDelete").click(function(){
        $("div.validation").html('');
        var isValidate = true;

        if(isValidate) {
            $("#addForm").submit();
        }
    });
</script>
