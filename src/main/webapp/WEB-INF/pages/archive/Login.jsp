<%-- 
    Document   : Login
    Created on : Jun 26, 2015, 8:49:01 PM
    Author     : kiwi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <t:archive_page>
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">
                Log In Page
            </h1>
        </div>
    </div>
    <div class="row">
                    <div class="col-lg-4">

                        <form role="form" name="login-form" id="login-form" action="${Constants.URL}archive/do/login.do" method="POST">
                            <input name="user_id" id="user_id" type="hidden"/>
                            <div class="form-group">
                                <label>Your login:</label>
                                <input class="form-control" id="user_name" name="user_name" type="text" placeholder="Enter login">
                            </div>
                            <div class="form-group">
                                <label>Your password:</label>
                                <input class="form-control" id="user_password" name="user_password" type="password" placeholder="Enter password">
                            </div>
                        </form>

                            <button class="btn btn-primary submit-button">Log In</button>
                            <button class="btn btn-danger clean-button">Clean</button>
                            <div class="validation"></div>
                    </div>
                </div>
</t:archive_page>
<script>
    $(document).ready(function() {});
    
    $(".clean-button").click(function(){
        $("#user_name").val("");
        $("#user_password").val("");
        $("#user_id").val("");
    });
    
    $(".submit-button").click(function(){
        $("#user_id").val("");
        $(".validation").html("");
        $.ajax({
            type: "get",
            url: "${Constants.URL}archive/ajax/checkUser",
            cache: false,    
            data:'user_name='+ $("#user_name").val() +'&user_password='+$("#user_password").val(),
            success: function(response){
                console.log(response);
                if(response === "" || response === null){
                      $(".validation").html("<span style='color:red'>Bad login or password</span>");
                }
                else {
                    $("#user_id").val(response);
                    $("#login-form").submit();
                }
            }, 
            error: function(response){      
                console.log(response);
            }
        });
    });  
</script>