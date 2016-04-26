<%-- 
    Document   : LogIn
    Created on : Mar 11, 2015, 4:58:46 PM
    Author     : kiwi
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<t:indexpage>
    <style>
        .btn-login {
            background: rgb(86,105,143);
            width: 97px;
            height: 40px;
            color: #fff;
            border: none;
        }
        .btn-login.clean-button {
            background: rgb(189, 48, 48);
        }
        .login-block {
            text-align: center;
            width: 15%;
            margin: auto;
            height: 50%;
        }
        .login-block input {
            border-radius: 0px;
        }
        .login-block label {
            font: 11pt 'Open Sans';
            font-weight: 600;
            line-height: 25px;
            padding: 10px 0px 10px 60px;
            float: left;
            text-decoration: none;
            letter-spacing: 1px;
            text-transform: uppercase;
        }
    </style>
    <section id="content">
        <div class="login-block">
            <form role="form" name="login-form" id="login-form" action="<c:url value="/system/login.do"/>" method="POST">
                            <input name="user_id" id="user_id" type="hidden"/>
                                        <div class="row add-row">
						<div class="field">
                                                    <div class="form-group">
                                                        <label for="username">Username</label>
                                                        <input class="form-control" id="user_name" name="user_name" type="text" placeholder="Enter login">
                                                    </div>
						</div>
                                        </div>
                                        <div class="row add-row">
						<div class="field">
                                                    <div class="form-group">
                                                        <label for="passwd">Password</label>
                                                        <input class="form-control" id="user_password" name="user_password" type="password" placeholder="Enter password">
                                                    </div>
						</div>
                                        </div>
              </form>
                <div class="row add-row">
                    <div class="field">
                        <button class="btn-login btn btn-primary submit-button">Log In</button>
                            <button class="btn-login btn btn-danger clean-button">Clean</button>
                            <div class="validation"></div>
                        
                    </div>
                                        
                </div>
        </div>
    </section>
<script>
    $(document).ready(function() {});
    
    $(".clean-button").click(function(){
        $("#user_name").val("");
        $("#user_password").val("");
        $("#user_id").val("");
    });
    $('#user_password').keypress(function (e) {
    var key = e.which;
    if(key == 13)  // the enter key code
    {
       $(".submit-button").click();
    }
    }); 
    $(".submit-button").click(function(){
        $("#user_id").val("");
        $(".validation").html("");
        $.ajax({
            type: "get",
            url: "${Constants.URL}system/archive/ajax/checkUser",
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
</t:indexpage>