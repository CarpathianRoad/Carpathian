<%-- 
    Document   : ShowContent
    Created on : Jan 25, 2015, 3:09:34 PM
    Author     : kiwi
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:adminpage>
    <script>
        $(document).ready(function () {
            $.removeCookie('sessionid');
            window.location.href = "${Constants.URL}index";
        });
    </script>
</t:adminpage>
    
    
        
 