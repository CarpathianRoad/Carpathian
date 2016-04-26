<%-- 
    Document   : MarkerEdit
    Created on : Mar 10, 2015, 12:04:37 PM
    Author     : kiwi
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:adminpage>
    <div class="container admin-panel-container">
            
            <form name="markerAdd" method="POST" enctype="multipart/form-data" action="<c:url value="/system/editmarker.do" />" id="addMarker" type="multipart/form-data">
                
               <div class="row">
						<div class="col-lg-2 field">
                                                    <div class="form-group">
                                                <label for="tlt">Short title:</label>
                                                <input type="text" name="short_title" class="form-control" id="shortTitle" value="${marker.shortTitle}">
                                                <div class="validation"></div>
                                              </div>
						</div>
                                                </div> <div class="row"></div>
                                                <div class="row">
                                                    <div class="col-lg-2 field">
                    <div class="form-group">
                        <img src="${Constants.URL}img/markers/${marker.shortTitle}.png" style="height:100px;"/>
                    </div>
                </div>
                <div class="col-lg-2 field" style="height:100px; padding-top: 20px;">
                    <div class="form-group">
                                                <label for="tlt">Marker icon:</label>
                                                <input type="file" name="marker_icon" class="form-control" id="markerIcon">
                                                <div class="validation"></div>
                    </div>
                </div>
                                                </div><div class="col-lg-2 field">
                    <div class="col-lg-2">
                        <input type="hidden" value="${marker.id}" name="id"/>
                        <input class="btn btn-primary btn-mini margintop-button" id="sudmitData" value="Save changes" type="submit">
                                        </div></div>
            </form>
            
        </div>
</t:adminpage>
    
    
        
 