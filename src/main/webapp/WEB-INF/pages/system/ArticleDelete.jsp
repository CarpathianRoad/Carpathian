<%-- 
    Document   : ArticleDelete
    Created on : Jul 30, 2015, 8:55:49 PM
    Author     : kiwi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<t:adminpage>
    <style>
        .disabled {
            pointer-events: none;
        }
    </style>
    <div class="margintop20">
        <h4>Delete article</h4>
        <ol class="breadcrumb">
            <li class="active">
                <a href="<c:url value="/system/index" />"> <i class="fa fa-fw fa-list-alt"></i> Back to articles</a>
            </li>
        </ol>
	<div class="row add-row">
                <div class="col-lg-12 margintop30">
                    <div class="delete-row">Delete article <strong>"${article.titleEN}"</strong> ?</div>
                    <p>
                        <button class="btn btn-success margintop30 marginbottom30" id="sudmitDelete" type="submit">Delete article</button>
                        <a href="<c:url value="/system/index" />"><button class="btn btn-danger margintop30 marginbottom30" id="sudmitData" type="submit">Back to articles</button></a>
                    </p>
                </div>
        </div>
                    <form action="<c:url value="/system/article/do/deletedata.do" />" name="addArticleForm" id="addForm" method="POST" type="multipart/form-data">
                        <input type="hidden" id="article_id" name="article_id" value="${article.id}"/>
                    </form>
    </div>
</t:adminpage>
<script> 
    $("#sudmitDelete").click(function(){
        $("div.validation").html('');
        var isValidate = true;

        if(isValidate) {
            $("#addForm").submit();
        }
    });
</script>
