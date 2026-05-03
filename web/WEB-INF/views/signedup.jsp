<%-- 
    Document   : registered
    Created on : Dec 18, 2025, 2:55:52 PM
    Author     : zed
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
        <title>Registration Successful</title>
    </head>
    <body class="bg-light">       
        <!-- Navigation Bar-->
        <%@include file="components/navbar.jspf" %>
        
        <div class="d-flex justify-content-center align-items-center">
            <div class="card shadow text-center p-4" style="max-width: 420px;">
                <div class="card-body">
                    <h2 class="text-success mb-3">Registration Successful</h2>
                    <p class="text-muted mb-4">
                        Your account has been created successfully.
                    </p>
                    <h4 class="text-secondary mb-4">Dear user, go to your inbox and verify your email</h4>
                    <!-- Button link to index.jsp -->
                    <a href="index" class="btn btn-primary col-md-4">
                        Sign In
                    </a>
                </div>
            </div>
        </div>
        <script src="https://unpkg.com/react@16/umd/react.development.js"></script>
        <script src="https://unpkg.com/react-dom@16/umd/react-dom.development.js"></script>
        <script src="${pageContext.request.contextPath}/js/indexpage.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.js" type="text/javascript"></script>
    </body>
</html>
