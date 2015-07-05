<%-- 
    Document   : Filters
    Created on : Feb 25, 2015, 10:27:11 PM
    Author     : kiwi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:adminpage>
        <div class="container admin-panel-container">
            <div class="row">
            <form name="filterAdd" method="POST" action="${Constants.URL}system/addfilter.do" id="addFilter">
                
               
						<div class="col-lg-2 field">
                                                    <div class="form-group">
                                                <label for="tlt">Short title:</label>
                                                <input type="text" name="short_title" class="form-control" id="shortTitle">
                                                <div class="validation"></div>
                                              </div>
						</div>
                                            <div class="col-lg-2 field">
                                                    <div class="form-group">
                                                <label for="tlt">Full title:</label>
                                                <input type="text" name="full_title" class="form-control" id="fullTitle">
                                                <div class="validation"></div>
                                              </div>
						</div>
                                            <div class="col-lg-2 field">
                                                    <div class="form-group">
                                                <label for="tlt">Group ID:</label>
                                                <input type="text" name="group_id" class="form-control" id="groupID">
                                                <div class="validation"></div>
                                              </div>
						</div>
                    <div class="col-lg-2">
                        <input class="btn btn-primary btn-mini margintop-button" id="sudmitData" value="Add filter" type="submit">
                                        </div>
            </form>
            
	</div>
		<div class="row">
			<div class="col-lg-5">
                            
                                    
<table class="table table-bordered">
  <thead>
    <tr>
        <th>#</th>
        <th>ID</th>
      <th>Short title</th>
      <th>Full title</th>
      <th>Group ID</th>
      <th></th>
      <th></th>
    </tr>
  </thead>
  <tbody>
      <c:forEach items="${filters}" var="title">
    <c:set var="count" value="${count + 1}" scope="page"/>
    
    <tr>
        <td>${count}</td>
        <td>${title.id}</td>
      <td>${title.shortTitle}</td>
      <td>${title.fullTitle}</td>
      <td>${title.groupID}</td>
      <td><a href="<c:url value="#"/>"><img class="edit-delete" src="${Constants.URL}img/edit.png" /></a></td>
      <td><a href="<c:url value="/system/filters/delete/${title.id}"/>"><img class="edit-delete" src="${Constants.URL}img/delete.png" /></a></td>
    </tr>
    </c:forEach>
  </tbody>
</table>                            
      
                           
			</div>
		</div> 
        </div>
</t:adminpage>