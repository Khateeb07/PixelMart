<%-- 
    Document   : unverifiedusers
    Created on : Dec 18, 2025, 11:40:48 PM
    Author     : zed
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Verification Page</title>
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
    </head>
    <body class="bg-light">
        <%
            Object name = request.getAttribute("name");
            String nm = (name != null) ? name.toString() : "";
        %>


        <!-- Navigation Bar-->
        <%@include file="components/navbar.jspf" %>

        <!-- Verification Card -->
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6">

                    <div class="card shadow-sm text-center">
                        <div class="card-body py-5">

                            <h2 class="text-danger mb-3">
                                Sorry <%= nm%> 😔
                            </h2>

                            <h5 class="text-secondary mb-4">
                                Your account is not verified yet.
                            </h5>

                            <p class="text-muted mb-4">
                                Please verify your email or contact support to activate your account.
                            </p>

                            <a href="index" class="btn btn-primary px-4">
                                Return to Login
                            </a>

                        </div>
                    </div>

                </div>
            </div>
        </div>
        <script src="https://unpkg.com/react@16/umd/react.development.js"></script>
        <script src="https://unpkg.com/react-dom@16/umd/react-dom.development.js"></script>
        <script src="${pageContext.request.contextPath}/js/indexpage.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.js" type="text/javascript"></script>
    </body>
</html>
