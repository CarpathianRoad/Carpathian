<%-- 
    Document   : Panorama
    Created on : May 27, 2015, 7:05:40 PM
    Author     : kiwi
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="Constants" class="ua.aits.Carpath.functions.Constants" scope="session"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
        <link href="${Constants.URL}css/bootstrap.min.css" rel="stylesheet" />
        <link href="${Constants.URL}css/style.css" rel="stylesheet" />
        <link href="${Constants.URL}css/admin.css" rel="stylesheet" />
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
    </head>
    <body>
         <div class="img-upl">
             <object width="100%" height="100%">
                            <param name="movie" value="${Constants.URL}files/panoramas/${name}">
                            <embed src="${Constants.URL}files/panoramas/${name}" width="700" height="450">
                            </embed>
                        </object>
         </div>
    </body>
</html>