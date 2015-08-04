<%-- 
    Document   : Search
    Created on : Aug 4, 2015, 7:54:24 PM
    Author     : kiwi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<t:adminpage>
    <script src="${Constants.URL}js/ckeditor/ckeditor.js"></script>
    <div class="margintop20">
        <h4>Search articles</h4>
	<form action="${Constants.URL}system/user/do/insertdata.do" name="addArticleForm" id="addForm" method="POST"  enctype="multipart/form-data" type="multipart/form-data">
            <input type="hidden" class="form-control" id="auth" name="author" value="<c:out value="${sessionScope.user.user_name}"/>">
            <div class="row add-row">
                <div class="col-lg-4 margintop10 field">
                    <input type="text" id="search" name="search_string" class="form-control">
                    <div class="validation"></div>
                </div>
                <div class="col-lg-4 margintop10">
                     <button class="btn btn-success marginbottom30" id="sudmitData" type="submit">Search</button>
                </div>
            </div>
            
        </form>
    </div>
</t:adminpage>
<script>
    $(document).ready(function() {
        console.log("${sessionScope.user.user_name}");
    });
</script>
