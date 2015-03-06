<%@tag description="Other Pages Description" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="Constants" class="ua.aits.Carpath.functions.Constants" scope="session"/>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Carpathian Tourist Road</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="" />
<meta name="author" content="http://bootstraptaste.com" />
<link href="${Constants.URL}css/bootstrap.min.css" rel="stylesheet" />
<link href="${Constants.URL}css/style.css" rel="stylesheet" />
<link href="${Constants.URL}css/admin.css" rel="stylesheet" />
<link href="${Constants.URL}css/bootstrap-switch.css" rel="stylesheet" />
<link href="${Constants.URL}img/favicon.ico" rel="shortcut icon" type="image/x-icon" />


<script src="http://google-maps-utility-library-v3.googlecode.com/svn/trunk/markerclusterer/src/markerclusterer.js" type="text/javascript"></script>
    
	<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=true"></script>
	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>

</head>
<c:if test="${sessionScope.user == null}">
    <script>window.location.href = "${Constants.URL}index";</script>
</c:if>
<body>
<div class="wrapper">
    <header>
        <div class="black-top-line black-color">
                <div class="admin-functions">
                    <a id="panel" href="<c:url value="/system/panel"/>">Content</a>
                    <c:if test="${sessionScope.user.username == 'admin'}">
                    <a id="users" href="<c:url value="/system/users"/>">Users</a>
                    <a id="markers" href="<c:url value="/system/markers"/>">Markers</a>
                    <a id="filters" href="<c:url value="/system/filters"/>">Filters</a>
                    <a id="routes" href="<c:url value="/system/routes"/>">Routes</a>
                    </c:if>
                </div>
                
            <div class="user-info-admin">
                <span><c:out value="${sessionScope.user.username}"/></span>
                <a href="<c:url value="/system/logout"/>"> <img src="${Constants.URL}img/shutdown.png" alt="Logout"/></a>
            </div>
        </div>
    </header>
                <jsp:doBody/>
</div>
<a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>
<!-- javascript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="${Constants.URL}js/bootstrap.min.js"></script>
<script src="${Constants.URL}js/bootstrap-select.js"></script>
<script src="${Constants.URL}js/bootstrap-switch.js"></script>
<script src="${Constants.URL}js/jquery.cookie.js"></script>
<script>
    var str_url = window.location.href; 
    var spl = str_url.split('/');

    $('.admin-functions a').removeClass("active");
    var curr = spl[spl.length-1].split(";");
    if($("#"+curr[0]).length == 0){
        $("#panel").addClass("active"); 
    }
    else {
       $("#"+curr[0]).addClass("active"); 
    }
    
</script>

</body>
</html>