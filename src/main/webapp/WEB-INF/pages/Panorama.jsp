<%-- 
    Document   : Panorama
    Created on : May 27, 2015, 7:05:40 PM
    Author     : kiwi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<jsp:useBean id="Constants" class="ua.aits.Carpath.functions.Constants" scope="session"/>
<html>
    <head><title>Panorama</title></head>
    <body style="background-color: #797979">
        
    <div class="s-new markerPageTable">
                        <object width="100%" height="500px">
                            <param name="movie" value="${Constants.URL}${url}">
                            <embed src="${Constants.URL}${url}" width="100" height="100">
                            </embed>
                        </object>
    </div>

    </body>
</html>
