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
	<form action="<c:url value="/system/archive/search" />" name="addArticleForm" id="addForm" method="GET">
            <div class="row add-row">
                <div class="col-lg-4 margintop10 field">
                    <input type="text" id="search" name="search_string" value="${svalue}" class="form-control">
                    <div class="validation"></div>
                </div>
                <div class="col-lg-4 margintop10">
                    <input type="submit" value="Search" class="btn btn-success marginbottom30" />
                </div>
            </div>
            
        </form>
        <c:if test="${!empty svalue}">
            <div class="row">
                    <div class="col-lg-12">
                        <h3 class="page-header">
                            Search result for <strong>"${svalue}"</strong>
                        </h3>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12">
                        <div class="table-responsive">
                            <table class="article-table table table-bordered table-hover table-striped">
                                <thead>
                                    <tr>
                                        <th class="text-center" style="width:3%">#</th>
                                        <th style="width:45%">Title</th>
                                        <th class="text-center" style="width:20%">Category</th>
                                        <th class="text-center" style="width:7%">Images</th>
                                        <th class="text-center" style="width:7%">Files</th>
                                        <th class="text-center" style="width:17%">Edit date</th>
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
                                            <td colspan="9">No results found...</td>
                                        </tr>
                                    </c:if>
                                    <c:set var="count" value="1" scope="page" />
                                    <c:forEach items="${articles}" var="item">
                                        <c:choose>
                                            <c:when test="${sessionScope.user.user_role == 0}">
                                                <c:if test="${item.article_is_delete == 0}"> 
                                                    <tr>
                                                        <td class="text-center counter">${count}</td>
                                                        <td <c:if test="${item.article_author != item.article_editor}">style="color:#622B2B"</c:if>>
                                                            ${item.article_title_en}
                                                        </td>
                                                        <td class="text-center"><a href="<c:url value="/system/archive/articles/${item.article_category}"/>">${item.article_category_text}</a></td>
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
                                                        
                                                    </tr>
                                                </c:if> 
                                            </c:when>    
                                            <c:otherwise>
                                                    <tr>
                                                        <td class="text-center counter">${count}</td>
                                                        <c:choose>
                                                            <c:when test="${item.article_is_delete == 1}">
                                                                <td style="color:#A39595">${item.article_title_en}</td>
                                                            </c:when>
                                                            <c:otherwise>
                                                            <td <c:if test="${item.article_author != item.article_editor}">style="color:#622B2B"</c:if>>
                                                                ${item.article_title_en}
                                                            </td>
                                                            </c:otherwise>
                                                        </c:choose>
                                                        <td class="text-center"><a href="<c:url value="/system/archive/articles/${item.article_category}"/>">${item.article_category_text}</a></td>
                                                        
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
                                                        <c:choose>
                                                            <c:when test="${item.article_is_delete == 1}">
                                                            
                                                        <td class="text-center"><a href="<c:url value="/system/archive/do/undeletearticle/${item.article_id}"/>"><img class="article-buttons" src="${Constants.URL}img/undelete.png" /></a></td>
                                                            </c:when>
                                                            <c:otherwise>
                                                            
                                                        <td class="text-center"><a href="<c:url value="/system/archive/delete/${item.article_id}"/>"><img class="article-buttons" src="${Constants.URL}img/delete.png" /></a></td>
                                                            </c:otherwise>
                                                        </c:choose>
                                                        <c:if test="${sessionScope.user.user_role == 1}">

                                                        <td class="text-center"><button class="btn btn-success btn-xs" id="publishData" type="submit"><a href="<c:url value="/system/archive/publish/${item.article_id}"/>">Publish</a></button></td> 
                                                        </c:if>
                                                    </tr>
                                            </c:otherwise>
                                        </c:choose>
                                        <c:set var="count" value="${count + 1}" scope="page"/>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>  
                                    </c:if>    
    </div>
</t:adminpage>
<script>
    $(document).ready(function() {
        console.log("${sessionScope.user.user_name}");
    });
</script>
