<%-- 
    Document   : NewsPage
    Created on : Jan 10, 2015, 7:57:32 PM
    Author     : kiwi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:indexpage>
	<section style="display: none" id="inner-headline">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<ul class="breadcrumb">
					<li><a href="#"><i class="fa fa-home"></i></a><i class="icon-angle-right"></i></li>
					<li class="active">Blog</li>
				</ul>
			</div>
		</div>
	</div>
	</section>
    <div class="s-new">
        <div class="countriesFilter">
            <a href="#">All countries</a>
            <a href="#">Poland</a>
            <a href="#">Hungary</a>
            <a href="#">Romania</a>
            <a href="#">Slovakia</a>
            <a href="#">Ukraine</a>
        </div>
	<c:forEach items="${newsList}" var="news">		
            <article>
                <a href="${Constants.URL}article/full/${news.id}"><div id="newsMainPhoto"><img src="${Constants.URL}${news.image}"></div></a>
                <div class="intendNews">
                    <div class="post-image">
                        <div class="post-heading">
                            <a id="titleBlock" href="${Constants.URL}article/full/${news.id}">${news.title}</a>
                        </div>
                    </div>
                    <a href="${Constants.URL}article/full/${news.id}">
                        <div class="newsText">
                            ${news.textEN}
                        </div>
                    </a>
                    <div class="bottom-article">
                        <i class="icon-calendar"></i>${news.date}&nbsp;&nbsp;&nbsp;${news.country}
                        <a href="${Constants.URL}article/full/${news.id}" class="pull-right">Continue reading <i class="icon-angle-right"></i></a>
                    </div>
                </div>
            </article>             
	</c:forEach>
    </div>
				<div style="display:none;" id="pagination">
					<span class="all">Page 1 of 3</span>
					<span class="current">1</span>
					<a href="#" class="inactive">2</a>
					<a href="#" class="inactive">3</a>
				</div>
</t:indexpage>
 