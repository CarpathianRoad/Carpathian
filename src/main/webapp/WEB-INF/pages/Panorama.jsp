<%-- 
    Document   : Panorama
    Created on : May 27, 2015, 7:05:40 PM
    Author     : kiwi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:indexpage>

	<section id="content">
	<div class="container">
		<div class="row">
                    <div class="col-lg-8">
                        <object width="800" height="300">
                            <param name="movie" value="${Constants.URL}${url}">
                            <embed src="${Constants.URL}${url}" width="100" height="100">
                            </embed>
                        </object>
                    </div>
                       
		</div>
	</div>
	</section>

   </t:indexpage>
