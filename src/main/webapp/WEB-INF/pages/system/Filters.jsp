<%-- 
    Document   : Filters
    Created on : Feb 25, 2015, 10:27:11 PM
    Author     : kiwi
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:adminpage>
    <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Filters
                        </h1>
                    </div>
                </div>
	<div class="row">
                    <div class="col-lg-10">
                        <div class="table-responsive">
                            <div class="add-button-panel"><button class="btn btn-success btn-mini" id="sudmitData" type="submit"><a href="<c:url value="/system/filters/add/"/>${category}">+ Add filter</a></button></div>
                            <table class="article-table filters-table table table-bordered table-hover table-striped">
  <thead>
    <tr>
        <th>#</th>
        <th>ID</th>
        <th>Icon</th>
      <th>Short title</th>
      <th>Full title</th>
      <th>Group ID</th>
      <th>Sort Number</th>
      <th class="text-center" colspan="2" style="width:3%;"></th>
      <th class="text-center" style="width:3%; display: none;"></th>
    </tr>
  </thead>
  <tbody>
      <c:forEach items="${filters}" var="title">
    <c:set var="count" value="${count + 1}" scope="page"/>
    
    <tr>
      <td class="text-center">${count}</td>
        <td class="text-center">${title.id}</td>
        <td  class="text-center">
            <c:choose>
                <c:when test="${title.groupID == 0}">
                    <img src="${Constants.URL}img/group_marker.png" />
                </c:when>    
                <c:otherwise>
                    <img src="${Constants.URL}img/markers/${title.shortTitle}.png" />
                </c:otherwise>
            </c:choose>
        </td>
      <td>${title.shortTitle}</td>
      <td>${title.fullTitle}</td>
      <td>${title.groupID}</td>
      <td>${title.sortNumber}</td>
      <td><a href="<c:url value="/system/filters/edit/${title.id}"/>"><img class="edit-delete" src="${Constants.URL}img/edit.png" /></a></td>
      <td><a href="<c:url value="/system/filters/delete/${title.id}"/>"><img class="edit-delete" src="${Constants.URL}img/delete.png" /></a></td>
    </tr>
    </c:forEach>
  </tbody>
</table>                            
      
                           
			</div>
		</div> 
        </div>
</t:adminpage>