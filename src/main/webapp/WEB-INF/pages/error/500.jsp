<%-- 
    Document   : 500
    Created on : Apr 7, 2015, 9:52:03 PM
    Author     : kiwi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="Constants" class="ua.aits.Carpath.functions.Constants" scope="session"/>
<%
    String redirectURL = Constants.URL+"ua/index";
    response.sendRedirect(redirectURL);
%>
