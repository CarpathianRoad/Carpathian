<%-- 
    Document   : UserSettings
    Created on : Jul 31, 2015, 12:32:10 PM
    Author     : kiwi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<t:adminpage>
<c:if test="${sessionScope.user.user_id != user.user_id}">
    <script>window.location.href = "${Constants.URL}system/index";</script>
</c:if>
    <div class="margintop20">
        <h4>Edit user</h4>
        <ol class="breadcrumb">
            <li class="active">
                <a href="${Constants.URL}system/users"> <i class="fa fa-fw fa-list-alt"></i> Back to users</a>
            </li>
        </ol>
	<form action="${Constants.URL}system/user/do/updatedata.do" name="addArticleForm" id="addForm" method="POST" type="multipart/form-data">
            <input type="hidden" class="form-control" id="auth" name="author" value="<c:out value="${sessionScope.user.user_name}"/>">
            <input type="hidden" id="user_id" name="user_id" value="${user.user_id}"/>
            <div class="row add-row">
                <div class="col-lg-4 margintop10 field">
                    <label for="tlt">User name<span class="red-star">*</span></label>
                    <input type="text" name="user_name" class="form-control" value="${user.user_name}">
                </div>
                <div class="col-lg-4 margintop10 field">
                    <label for="tlt">User password<span class="red-star">*</span></label>
                    <input type="text" name="user_password" class="form-control" value="${user.user_password}">
                </div>
            </div>
            <hr>
            <div class="row add-row">
                <div class="col-lg-4 margintop10 field">
                    <label for="tlt">User role<span class="red-star">*</span></label>
                    <select class="form-control" name="user_role" value="${user.user_role}">
                      <option value="0" selected>Simple user</option>
                      <option value="1">Administrator</option>
                    </select>
                </div>
                <div class="col-lg-4 margintop10 field">
                    <label for="tlt">User status<span class="red-star">*</span></label>
                    <select class="form-control" name="user_enabled" value="${user.user_enabled}">
                      <option value="0">Disabled</option>
                      <option value="1" selected>Enabled</option>
                    </select>
                </div>
            </div>
            <hr>
            <div class="row add-row">
                <div class="col-lg-4 margintop10 field">
                    <label for="tlt">User firstname</label>
                    <input type="text" name="user_firstname" class="form-control" value="${user.user_firstname}">
                </div>
                <div class="col-lg-4 margintop10 field">
                    <label for="tlt">User lastname</label>
                    <input type="text" name="user_lastname" class="form-control" value="${user.user_lastname}">
                </div>
            </div>
            <hr>
            <div class="row add-row">
                <div class="col-lg-4 margintop10 field">
                    <label for="tlt">User description</label>
                    <input type="text" name="user_descr" class="form-control" value="${user.user_descr}">
                </div>
                <div class="col-lg-4 margintop10 field">
                    <label for="tlt">User contacts</label>
                    <input type="text" name="user_contacts" class="form-control" value="${user.user_contacts}">
                </div>
            </div>
            <hr>
        </form>
        <p>
            <button class="btn btn-success margintop30 marginbottom30" id="sudmitData" type="submit">Save user</button>
            <a href="${Constants.URL}system/users"><button class="btn btn-danger margintop30 marginbottom30" id="sudmitData" type="submit">Back to users</button></a>
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
            $("#addForm").submit();
        }
    });
</script>
