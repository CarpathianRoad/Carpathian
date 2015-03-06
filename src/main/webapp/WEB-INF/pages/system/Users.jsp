<%-- 
    Document   : ShowContent
    Created on : Jan 25, 2015, 3:09:34 PM
    Author     : kiwi
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:adminpage>
    
	<div class="container admin-panel-container">
            <div class="row">
            <form name="userAdd" method="POST" action="${Constants.URL}system/adduser.do" id="addUser">
                
               
						<div class="col-lg-2 field">
                                                    <div class="form-group">
                                                <label for="tlt">Username:</label>
                                                <input type="text" name="username" class="form-control" id="username">
                                                <div class="validation"></div>
                                              </div>
						</div>
                                                <div class="col-lg-2 field">
                                                    <div class="form-group">
                                                <label for="tlt">Password:</label>
                                                <input type="password" name="password" class="form-control" id="password">
                                                <div class="validation"></div>
                                              </div>
						</div>
                                                <div class="col-lg-2 field">
                                                    <div class="form-group">
                                                <label for="tlt">Description:</label>
                                                <input type="text" name="descr" class="form-control" id="descr">
                                                <div class="validation"></div>
                                              </div>
						</div>
                    <div class="col-lg-2">
                        <input class="btn btn-primary btn-mini margintop-button" id="sudmitData" value="Add user" type="submit">
                                        </div>
            </form>
            
	</div>
		<div class="row">
			<div class="col-lg-4">
                            
                                    
<table class="table table-bordered">
  <thead>
    <tr>
        <th>#</th>
      <th>Username</th>
      <th>Password</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
      <c:forEach items="${users}" var="user">
    <c:set var="count" value="${count + 1}" scope="page"/>
    
    <tr>
        <td>${count}</td>
      <td>${user.username}</td>
      <td>${user.password}</td>
      <td>${user.descr}</td>
      <td><a href="<c:url value="#"/>"><img class="edit-delete" src="${Constants.URL}img/edit.png" /></a></td>
      <td><a href="<c:url value="/system/users/delete/${user.username}"/>"><img class="edit-delete" src="${Constants.URL}img/delete.png" /></a></td>
    </tr>
    </c:forEach>
  </tbody>
</table>                            
      
                           
			</div>
		</div> 
        </div>
</t:adminpage>
    
    
        
 