<%-- 
    Document   : archive_page
    Created on : Jun 26, 2015, 9:03:07 PM
    Author     : kiwi
--%>

<%@tag description="Admin page" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:useBean id="Constants" class="ua.aits.Carpath.functions.Constants" scope="session"/>
<c:if test="${sessionScope.user == null && pageContext.request.servletPath.substring(pageContext.request.servletPath.lastIndexOf('/')) != '/Login.jsp'}">
    <style>
        body {
            display:none;
        }
    </style>
    <script>window.location.href = "${Constants.URL}en/login";</script>
</c:if>
<c:if test="${not fn:containsIgnoreCase(pageContext.request.servletPath, 'archive') && sessionScope.user.user_role == 0  && pageContext.request.servletPath.substring(pageContext.request.servletPath.lastIndexOf('/')) != '/UserSettings.jsp'}">
    <c:if test="${sessionScope.user.user_name != 'matsko'}">
    <style>
        body {
            display:none;
        }
    </style>
    <script>window.location.href = "${Constants.URL}system/archive/index";</script>
    </c:if>    
</c:if>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="${Constants.URL}img/favicon2.ico" rel="shortcut icon" type="image/x-icon" />
    <title>Admin page</title>

    <!-- Bootstrap Core CSS -->
    <link href="${Constants.URL}css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="${Constants.URL}css/admin.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="${Constants.URL}archive/css/plugins/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="${Constants.URL}archive/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <link rel="stylesheet" href="${Constants.URL}archive/css/dropzone.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
    <link href="${Constants.URL}css/bootstrap-switch.css" rel="stylesheet" />

    <script src="http://google-maps-utility-library-v3.googlecode.com/svn/trunk/markerclusterer/src/markerclusterer.js" type="text/javascript"></script>
    <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=true"></script>
    <style>
        @font-face {
            font-family: 'Circe';
            src: url('${Constants.URL}fonts/Circe.otf');
        }
    </style>
</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="${Constants.URL}system/index"> 
                    <img src="${Constants.URL}img/logo_4.png"></a>
            </div>
            <!-- Top Menu Items -->
            <c:if test="${sessionScope.user != null}">
            <ul class="nav navbar-right top-nav">
                
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><img class="user-avatar" src="${Constants.URL}${sessionScope.user.user_avatar}" /> ${sessionScope.user.user_firstname} ${sessionScope.user.user_lastname} <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li style="display:none;">
                            <a href="<c:url value="/system/users/settings/"/>${sessionScope.user.user_id}"><i class="fa fa-fw fa-cog"></i> Settings</a>
                        </li>
                        <li>
                            <a href="<c:url value="/system/do/logout.do"/>"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                        </li>
                    </ul>
                </li>
            </ul>
            </c:if>
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <c:choose>
                        <c:when test="${sessionScope.user == null}">
                            <li class="active">
                                <a href="<c:url value="/archive/login"/>"><i class="fa fa-fw fa-sign-in"></i> Login page</a>
                            </li>
                        </c:when>    
                        <c:otherwise>
                            <c:if test="${sessionScope.user.user_role == 1}">
                            <li id="index">
                                <a href="<c:url value="/system/index"/>"><i class="fa fa-fw fa-list-alt"></i> Main page</a>
                            </li>
                            </c:if>
                            <li id="archive">
                                <a href="<c:url value="/system/archive/index"/>"><i class="fa fa-fw fa-folder"></i> Archive</a>
                            </li>
                            <li id="archive">
                                <a href="<c:url value="/system/archive/search"/>"><i class="fa fa-fw fa-search"></i> Search</a>
                            </li>
                            <c:if test="${sessionScope.user.user_role == 1}">
                            <li id="users">
                                <a href="<c:url value="/system/users"/>"><i class="fa fa-fw fa-users"></i> Users</a>
                            </li>
                            <li id="slider">
                                <a href="<c:url value="/system/slider"/>"><i class="fa fa-fw fa-picture-o"></i> Slider</a>
                            </li>
                            <li id="filters">
                                <a href="<c:url value="/system/filters"/>"><i class="fa fa-fw fa-filter"></i> Filters</a>
                            </li>
                            </c:if>
                            <c:if test="${sessionScope.user.user_role == 1 || sessionScope.user.user_name == 'matsko'}">
                            <li id="routes">
                                <a href="<c:url value="/system/routes"/>"><i class="fa fa-fw fa-road"></i> Routes</a>
                            </li>
                            </c:if>
                            <li id="logout">
                                <a href="<c:url value="/system/do/logout.do"/>"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>

        <div id="page-wrapper">

            <div class="container-fluid">
                <jsp:doBody/>
            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

    </div>
            
    <script src="${Constants.URL}archive/js/jquery.js"></script>
    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
    <script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
    <script src="${Constants.URL}js/bootstrap.min.js"></script>
    <script src="${Constants.URL}js/bootstrap-select.js"></script>
    <script src="${Constants.URL}js/bootstrap-switch.js"></script>
    <script src="${Constants.URL}js/jquery.cookie.js"></script>
    <script>
        $(document).ready(function () {
            if('${Constants.URL}' === '/') {
                var url = window.location.href.split('/')[4];
            }
            else {
                var url = window.location.href.split('/')[5];
            }
            if(url === 'panel' || url === 'index' || url === 'main' || url === 'articles') {
                $("#index").addClass('active');
            }
            else {
                $("#"+url).addClass('active');
            }
        });
    </script>
</body>

</html>
