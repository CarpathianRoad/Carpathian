<%-- 
    Document   : EditFilter
    Created on : Jul 20, 2015, 3:42:51 PM
    Author     : kiwi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:adminpage>
        <div class="container admin-panel-container">
            <form name="filterAdd" method="POST" action="${Constants.URL}system/editfilter.do" id="editFilter" enctype="multipart/form-data" type="multipart/form-data">
                <input type="hidden" name="id" value="${filter.id}"/>
                <div class="row">
                <div class="col-lg-2 field" style="text-align: center;">
                    <img style="width: 100px;" src="${Constants.URL}img/markers/${filter.shortTitle}.png" />
                </div>                         
                <div class="col-lg-2 field">
                                                    <div class="form-group">
                                                        <label for="tlt">Filter icon:</label>
                                                            <input type="file" name="filter_icon" class="form-control" id="filterIcon" />
                                                            <div class="validation"></div>
                                                    </div>
                                                </div>
                </div>
                <br/>
                <div class="row">
                    
						<div class="col-lg-2 field">
                                                    <div class="form-group">
                                                <label for="tlt">Short title:</label>
                                                <input type="text" name="short_title" value="${filter.shortTitle}" class="form-control" id="shortTitle">
                                                <div class="validation"></div>
                                              </div>
						</div>
                                            <div class="col-lg-2 field">
                                                    <div class="form-group">
                                                <label for="tlt">Full title:</label>
                                                <input type="text" name="full_title" value="${filter.fullTitle}" class="form-control" id="fullTitle">
                                                <div class="validation"></div>
                                              </div>
						</div>
                </div>
                <div class="row">
                    
                                            <div class="col-lg-2 field">
                                                    <div class="form-group">
                                                <label for="tlt">Group ID:</label>
                                                <input type="text" name="group_id" value="${filter.groupID}" class="form-control" id="groupID">
                                                <div class="validation"></div>
                                              </div>
						</div>
                                            <div class="col-lg-2 field">
                                                    <div class="form-group">
                                                <label for="tlt">Sort Number:</label>
                                                <input type="text" name="sort_number" value="${filter.sortNumber}" class="form-control" id="sort_number">
                                                <div class="validation"></div>
                                              </div>
						</div>
                </div>
                <div class="row">
                    
                    <div class="col-lg-2">
                        <input class="btn btn-primary btn-mini margintop-button" id="sudmitData" value="Add filter" type="submit">
                    </div>
                </div>     
            </form>
            
	</div> 
</t:adminpage>