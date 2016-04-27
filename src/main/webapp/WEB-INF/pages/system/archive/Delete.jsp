<%-- 
    Document   : Delete
    Created on : Jul 27, 2015, 6:08:24 PM
    Author     : kiwi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<t:adminpage>
    <div class="margintop20">
        <h4>Delete article in category "${cat_name}"</h4>
        <ol class="breadcrumb">
            <li class="active">
                <a href="<c:url value="/system/archive/articles/${article.article_category}" />"> <i class="fa fa-fw fa-list-alt"></i> Back to category "${cat_name}"</a>
            </li>
        </ol>
	<div class="row add-row">
                <div class="col-lg-12 margintop30">
                    <div class="delete-row">Delete article <strong>"${article.article_title_en}"</strong> ?</div>
                    <p>
                        <a href="<c:url value="/system/archive/do/deletearticle/${article.article_id}" />"><button class="btn btn-success margintop30 marginbottom30" id="sudmitDelete" type="submit">Delete article</button></a>
                        <a href="<c:url value="/system/archive/articles/${article.article_category}" />"><button class="btn btn-danger margintop30 marginbottom30" id="sudmitData" type="submit">Back to category</button></a>
                    </p>
                </div>
        </div>
    </div>
</t:adminpage>
