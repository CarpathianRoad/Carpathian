<%-- 
    Document   : Login
    Created on : Jun 26, 2015, 8:49:01 PM
    Author     : kiwi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <t:archive_page>
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">
                Log In Page
            </h1>
        </div>
    </div>
    <div class="row">
                    <div class="col-lg-6">

                        <form role="form">
                            <div class="form-group">
                                <label>Your login:</label>
                                <input class="form-control" type="text" placeholder="Enter login">
                            </div>
                            <div class="form-group">
                                <label>Your password:</label>
                                <input class="form-control" type="password" placeholder="Enter password">
                            </div>
                            <button type="submit" class="btn btn-primary">Log In</button>
                            <button type="submit" class="btn btn-danger">Clean</button>

                        </form>

                    </div>
                </div>
</t:archive_page>
