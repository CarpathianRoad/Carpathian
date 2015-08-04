<%-- 
    Document   : Articles
    Created on : Jul 16, 2015, 1:37:34 PM
    Author     : kiwi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:adminpage>
    <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Articles in category
                        </h1>
                        <ol class="breadcrumb">
                            <li class="active">
                                <a href="${Constants.URL}system/archive/index"> <i class="fa fa-fw fa-list-alt"></i> Back to categories</a>
                            </li>
                        </ol>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12">
                        <div class="table-responsive">
                            <div class="add-button-panel"><button class="btn btn-success btn-mini" id="sudmitData" type="submit"><a href="<c:url value="/system/archive/add/"/>${category}">+ Add article</a></button></div>
                            <table class="article-table table table-bordered table-hover table-striped">
                                <thead>
                                    <tr>
                                        <th class="text-center" style="width:3%">#</th>
                                        <th style="width:55%">Title</th>
                                        <th class="text-center" style="width:10%">Images</th>
                                        <th class="text-center" style="width:10%">Files</th>
                                        <th class="text-center" style="width:13%">Edit date</th>
                                        <th class="text-center" style="width:5%">Editor</th>
                                        <th class="text-center" style="width:5%">Publish</th>
                                        <th colspan="3" style="width:3%;"></th>
                                        <th style="width:3%; display: none;"></th>
                                        <th style="width:5%; display: none;"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:if test="${empty articles}">
                                        <tr>
                                            <td colspan="9">No articles in this category...</td>
                                        </tr>
                                    </c:if>
                                    <c:set var="count" value="1" scope="page" />
                                    <c:forEach items="${articles}" var="item">
                                        <tr>
                                            <td class="text-center counter">${count}</td>
                                            <td>${item.article_title_en}</td>
                                            <td class="text-center">${item.article_image_size}</td>
                                            <td class="text-center">${item.article_file_size}</td>
                                            <td class="text-center">${item.article_edit_date}</td>
                                            <td class="text-center">${item.article_editor}</td>
                                            <td class="text-center">
                                                <c:if test="${item.article_is_publish == 1}">
                                                    <i class="fa fa-fw fa-check-circle"></i>
                                                </c:if>
                                            </td>
                                            <td class="text-center"><a href="<c:url value="/system/archive/edit/${item.article_id}"/>"><img class="article-buttons" src="${Constants.URL}img/edit.png" /></a></td>
                                            <td class="text-center"><a href="<c:url value="/system/archive/delete/${item.article_id}"/>"><img class="article-buttons" src="${Constants.URL}img/delete.png" /></a></td>
                                            <td class="text-center"><button class="btn btn-success btn-xs" id="publishData" type="submit"><a href="<c:url value="/system/archive/publish/${item.article_id}"/>">Publish</a></button></td>
                                        </tr>
                                        <c:set var="count" value="${count + 1}" scope="page"/>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
</t:adminpage>
<script>
    $(document).ready(function() {
        console.log("${sessionScope.user.user_name}");
    });
</script>
