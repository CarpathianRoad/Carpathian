<%-- 
    Document   : UserDelete
    Created on : Jul 30, 2015, 8:06:25 PM
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
        <h4>Delete user</h4>
        <ol class="breadcrumb">
            <li class="active">
                <a href="${Constants.URL}system/users"> <i class="fa fa-fw fa-list-alt"></i> Back to users</a>
            </li>
        </ol>
	<div class="row add-row">
                <div class="col-lg-12 margintop30">
                    <div class="delete-row">Delete user <strong>"${user.user_name}"</strong> ?</div>
                    <p>
                        <button class="btn btn-success margintop30 marginbottom30 <c:if test="${user.user_id == 1}">disabled</c:if>" id="sudmitDelete" type="submit">Delete user</button>
                        <a href="${Constants.URL}system/users"><button class="btn btn-danger margintop30 marginbottom30" id="sudmitData" type="submit">Back to users</button></a>
                    </p>
                </div>
        </div>
                    <form action="${Constants.URL}system/user/do/deletedata.do" name="addArticleForm" id="addForm" method="POST" type="multipart/form-data">
                        <input type="hidden" id="user_id" name="user_id" value="${user.user_id}"/>
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