<%-- 
    Document   : invalidpage
    Created on : Dec 18, 2025, 8:11:21 PM
    Author     : zed
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="false"%>
<%
    Object validity = request.getAttribute("vldt");
    int vl = 0;
    if (validity != null)
        vl = (int) validity;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
        <title>Invalid Action</title>
    </head>

    <body class="bg-light" id="invalidpg">

        <!-- Navigation Bar -->
        <%@include file="components/navbar.jspf" %>

        <!-- Message Card -->
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6">

                    <div class="card shadow-sm">
                        <div class="card-body text-center py-5">

                            <% if (vl == 0) { %>
                            <h2 class="text-danger mb-3">Registration Unsuccessful</h2>
                            <p class="text-muted">
                                There was a problem creating your account.
                            </p>

                            <div class="mt-4">
                                <a href="index" class="btn btn-primary">
                                    Sign Up
                                </a>
                            </div>
                            <% } else if (vl == 2) { %>
                            <h2 class="text-warning mb-3">Invalid Credentials</h2>
                            <p class="text-muted">
                                The username or password you entered is incorrect.
                            </p>

                            <div class="mt-4">
                                <a href="index" class="btn btn-primary">
                                    Go Back to Login
                                </a>
                            </div>
                            <% } else if (vl == 3) { %>
                            <h2 class="text-warning mb-3">Invalid Credentials</h2>
                            <p class="text-muted">
                                The username or password you entered is incorrect.
                            </p>

                            <div class="mt-4">
                                <a href="sellersignin" class="btn btn-primary">
                                    Go Back to Login
                                </a>
                            </div>
                            <% }%>
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
