<%-- 
    Document   : FilterDelete
    Created on : Jul 30, 2015, 8:58:04 PM
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
        <h4>Delete filter</h4>
        <ol class="breadcrumb">
            <li class="active">
                <a href="<c:url value="/system/filters" />"> <i class="fa fa-fw fa-list-alt"></i> Back to filters</a>
            </li>
        </ol>
	<div class="row add-row">
                <div class="col-lg-12 margintop30">
                    <div class="delete-row">Delete filter <strong>"${filter.fullTitle}"</strong> ?</div>
                    <p>
                        <button class="btn btn-success margintop30 marginbottom30" id="sudmitDelete" type="submit">Delete filter</button>
                        <a href="<c:url value="/system/filters" />"><button class="btn btn-danger margintop30 marginbottom30" id="sudmitData" type="submit">Back to filters</button></a>
                    </p>
                </div>
        </div>
                    <form action="<c:url value="/system/filters/do/deletedata.do" />" name="addArticleForm" id="addForm" method="POST" type="multipart/form-data">
                        <input type="hidden" id="filter_id" name="id" value="${filter.id}"/>
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
