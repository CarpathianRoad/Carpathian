<%-- 
    Document   : UserAdd
    Created on : Jul 30, 2015, 7:22:46 PM
    Author     : kiwi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<t:adminpage>
    <script src="${Constants.URL}js/ckeditor/ckeditor.js"></script>
    <div class="margintop20">
        <h4>Add user</h4>
        <ol class="breadcrumb">
            <li class="active">
                <a href="<c:url value="/system/users" />"> <i class="fa fa-fw fa-list-alt"></i> Back to users</a>
            </li>
        </ol>
	<form action="<c:url value="/system/user/do/insertdata.do" />" name="addArticleForm" id="addForm" method="POST"  enctype="multipart/form-data" type="multipart/form-data">
            <input type="hidden" class="form-control" id="auth" name="author" value="<c:out value="${sessionScope.user.user_name}"/>">
            <div class="row add-row">
                <div class="col-lg-4 margintop10 field">
                    <label for="tlt">User avatar</label>
                    <input type="file" name="user_avatar" class="form-control" id="user_avatar" />
                </div>
            </div>
            <hr>
            <div class="row add-row">
                <div class="col-lg-4 margintop10 field">
                    <label for="tlt">User name<span class="red-star">*</span></label>
                    <input type="text" id="user_name" name="user_name" class="form-control">
                    <div class="validation"></div>
                </div>
                <div class="col-lg-4 margintop10 field">
                    <label for="tlt">User password<span class="red-star">*</span></label>
                    <input type="text" name="user_password" class="form-control">
                </div>
            </div>
            <hr>
            <div class="row add-row">
                <div class="col-lg-4 margintop10 field">
                    <label for="tlt">User role<span class="red-star">*</span></label>
                    <select class="form-control" name="user_role">
                      <option value="0" selected>Simple user</option>
                      <option value="1">Administrator</option>
                    </select>
                </div>
                <div class="col-lg-4 margintop10 field">
                    <label for="tlt">User status<span class="red-star">*</span></label>
                    <select class="form-control" name="user_enabled">
                      <option value="0">Disabled</option>
                      <option value="1" selected>Enabled</option>
                    </select>
                </div>
            </div>
            <hr>
            <div class="row add-row">
                <div class="col-lg-4 margintop10 field">
                    <label for="tlt">User firstname</label>
                    <input type="text" name="user_firstname" class="form-control">
                </div>
                <div class="col-lg-4 margintop10 field">
                    <label for="tlt">User lastname</label>
                    <input type="text" name="user_lastname" class="form-control">
                </div>
            </div>
            <hr>
            <div class="row add-row">
                <div class="col-lg-4 margintop10 field">
                    <label for="tlt">User description</label>
                    <input type="text" name="user_descr" class="form-control">
                </div>
                <div class="col-lg-4 margintop10 field">
                    <label for="tlt">User contacts</label>
                    <input type="text" name="user_contacts" class="form-control">
                </div>
            </div>
            <hr>
        </form>
        <p>
            <button class="btn btn-success margintop30 marginbottom30" id="sudmitData" type="submit">Add user</button>
            <a href="<c:url value="/system/users" />"><button class="btn btn-danger margintop30 marginbottom30" id="sudmitData" type="submit">Back to users</button></a>
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
    $("#user_name").change(function() {
        console.log($(this).val());
        $.ajax({
            type: "get",
            url: "/Carpath/system/users/ajax/checkUserName",
            cache: false,    
            data:'user_name='+ $(this).val()+';jsessionid=<c:out value="${pageContext.session.id}"/>',
            success: function(response){
                console.log(response);
                if(response === "" || response === null){
                    $(".validation").html("");
                   $("#sudmitData").removeClass("disabled");
                }
                else {
                      $(".validation").html("<span style='color:red'>Username is already exist</span>");
                      $("#sudmitData").addClass("disabled");
                }
            }, 
            error: function(response){      
                console.log(response);
            }
        });
    });
</script>
