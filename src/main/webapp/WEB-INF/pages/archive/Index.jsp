<%-- 
    Document   : Index
    Created on : Jun 26, 2015, 8:49:24 PM
    Author     : kiwi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<t:archive_page>
    <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Category list
                        </h1>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12">
                        
                        <div class="list-group">
                            ${menuList}
                        </div>
                    </div>
                </div>
</t:archive_page>
<script>
    $(document).ready(function() {
        console.log("${sessionScope.user.user_name}");
    });
</script>
