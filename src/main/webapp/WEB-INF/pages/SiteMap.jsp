<%-- 
    Document   : SiteMap
    Created on : Apr 20, 2015, 7:35:58 PM
    Author     : kiwi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:indexpage>
    <div class="s-new widthClass">
        <div class="site-map-menu">
            ${mapHTML} 
        </div>     
        <div class="s-clear"></div>
    </div>
        <style>
            .site-map-menu li, .site-map-menu ul, .site-map-menu a {
                color: rgb(86,105,143) !important;
                text-transform: uppercase;
            }
        </style>
            <script>
                $( document ).ready(function() {
                    $( ".site-map-menu li" ).attr("class","").attr("id","");
                    $( ".site-map-menu ul" ).attr("class","").attr("id","");
                    $(".menuLine").remove();
                });
            </script>
</t:indexpage>
 
