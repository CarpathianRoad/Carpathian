<%-- 
    Document   : ShowContent
    Created on : Jan 25, 2015, 3:09:34 PM
    Author     : kiwi
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:adminpage>
    <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Users
                        </h1>
                    </div>
                </div>
	<div class="row">
                    <div class="col-lg-10">
                        <div class="table-responsive">
                            <div class="add-button-panel"><button class="btn btn-success btn-mini" id="sudmitData" type="submit"><a href="<c:url value="/system/users/add/"/>${category}">+ Add user</a></button></div>
                            <table class="article-table table table-bordered table-hover table-striped">
  <thead>
    <tr>
        <th class="text-center">#</th>
      <th class="text-center">Avatar</th>
      <th class="text-center">Username</th>
      <th class="text-center">First name</th>
      <th class="text-center">Last name</th>
      <th class="text-center">Last contacts</th>
      <th class="text-center">Status</th>
      <th class="text-center">Description</th>
      <th class="text-center" colspan="2" style="width:3%;"></th>
      <th class="text-center" style="width:3%; display: none;"></th>
    </tr>
  </thead>
  <tbody>
      <c:forEach items="${users}" var="user">
    <c:set var="count" value="${count + 1}" scope="page"/>
    
    <tr>
      <td class="text-center">${count}</td>
      <td class="text-center"><img class="user-avatar" style="height: 20px;width: 20px;text-align: center;margin-left: 10px;" src="${Constants.URL}${user.user_avatar}"/></td>
      <td class="text-center">${user.user_name}</td>
      <td class="text-center">${user.user_firstname}</td>
      <td class="text-center">${user.user_lastname}</td>
      <td class="text-center">${user.user_contacts}</td>
      <td class="text-center">
            <c:choose>
                <c:when test="${user.user_enabled == 0}">
                    Disabled
                </c:when>    
                <c:otherwise>
                    Enabled
                </c:otherwise>
            </c:choose>
      </td>
      <td class="text-center">${user.user_descr}</td>
      <td class="text-center"><a href="<c:url value="/system/users/edit/${user.user_id}"/>"><img class="edit-delete" src="${Constants.URL}img/edit.png" /></a></td>
      <td class="text-center"><a href="<c:url value="/system/users/delete/${user.user_id}"/>"><img class="edit-delete" src="${Constants.URL}img/delete.png" /></a></td>
    </tr>
    </c:forEach>
  </tbody>
</table>                            
      
                           
			</div>
		</div> 
        </div>
</t:adminpage>
    
    
        
 