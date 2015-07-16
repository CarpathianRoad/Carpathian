<%-- 
    Document   : archive_page
    Created on : Jun 26, 2015, 9:03:07 PM
    Author     : kiwi
--%>

<%@tag description="Archive page" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="Constants" class="ua.aits.Carpath.functions.Constants" scope="session"/>

<c:if test="${sessionScope.user == null && pageContext.request.servletPath.substring(pageContext.request.servletPath.lastIndexOf('/')) != '/Login.jsp'}">
    <script>window.location.href = "${Constants.URL}archive/login";</script>
</c:if>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="${Constants.URL}img/favicon2.ico" rel="shortcut icon" type="image/x-icon" />
    <title>Archive page</title>

    <!-- Bootstrap Core CSS -->
    <link href="${Constants.URL}archive/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="${Constants.URL}archive/css/sb-admin.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="${Constants.URL}archive/css/plugins/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="${Constants.URL}archive/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

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
                <a class="navbar-brand" href="index.html"> 
                    <img src="${Constants.URL}img/logo_4.png"></a>
            </div>
            <!-- Top Menu Items -->
            <c:if test="${sessionScope.user != null}">
            <ul class="nav navbar-right top-nav">
                
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><img class="user-avatar" src="${Constants.URL}${sessionScope.user.user_avatar}" /> ${sessionScope.user.user_firstname} ${sessionScope.user.user_lastname} <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="<c:url value="/archive/do/logout.do"/>"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
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
                                <a href="${Constants.URL}archive/login"><i class="fa fa-fw fa-sign-in"></i> Login page</a>
                            </li>
                        </c:when>    
                        <c:otherwise>
                            <li class="active">
                                <a href="${Constants.URL}archive/index"><i class="fa fa-fw fa-list-alt"></i> Main page</a>
                            </li>
                            <c:if test="${sessionScope.user.user_role == 1}">
                            <li class="">
                                <a href="${Constants.URL}archive/index"><i class="fa fa-fw fa-users"></i> Users</a>
                            </li>
                            <li class="">
                                <a href="${Constants.URL}archive/index"><i class="fa fa-fw fa-picture-o"></i> Slider</a>
                            </li>
                            <li class="">
                                <a href="${Constants.URL}archive/index"><i class="fa fa-fw fa-road"></i> Routes</a>
                            </li>
                            <li class="">
                                <a href="${Constants.URL}archive/index"><i class="fa fa-fw fa-filter"></i> Filters</a>
                            </li>
                            <li class="">
                                <a href="${Constants.URL}archive/index"><i class="fa fa-fw fa-map-marker"></i> Markers</a>
                            </li>
                            </c:if>
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
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="${Constants.URL}archive/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="${Constants.URL}archive/js/bootstrap.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="${Constants.URL}archive/js/plugins/morris/raphael.min.js"></script>
    <script src="${Constants.URL}archive/js/plugins/morris/morris.min.js"></script>
    <script src="${Constants.URL}archive/js/plugins/morris/morris-data.js"></script>

</body>

</html>
