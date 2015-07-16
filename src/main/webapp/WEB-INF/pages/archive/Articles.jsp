<%-- 
    Document   : Articles
    Created on : Jul 16, 2015, 1:37:34 PM
    Author     : kiwi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:archive_page>
    <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Articles in category
                        </h1>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12">
                        <div class="table-responsive">
                            <div class="add-button-panel"><button class="btn btn-success btn-mini" id="sudmitData" type="submit"><a href="<c:url value="/system/add"/>">+ Add article</a></button></div>
                            <table class="table table-bordered table-hover table-striped">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Title</th>
                                        <th>Images</th>
                                        <th>Files</th>
                                        <th>Edit date</th>
                                        <th>Editor</th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td colspan="9">No articles in this category...</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
</t:archive_page>
<script>
    $(document).ready(function() {
        console.log("${sessionScope.user.user_name}");
    });
</script>
