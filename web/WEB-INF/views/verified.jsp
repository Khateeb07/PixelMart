<%-- 
    Document   : verified
    Created on : Dec 22, 2025, 3:21:33 PM
    Author     : zed
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
        <title>Verification Successful</title>
    </head>
    <body class="bg-light">

        <!-- Navigation Bar -->
        <%@include file="components/navbar.jspf" %>
        
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6">

                    <div class="card shadow-sm text-center">
                        <div class="card-body py-5">

                            <h2 class="text-success mb-3">
                                Verification Successful 🎉
                            </h2>

                            <h5 class="text-secondary mb-4">
                                Your account has been successfully verified.
                            </h5>

                            <p class="text-muted mb-4">
                                You can now log in and start using Pixel Mart.
                            </p>

                            <a href="index" class="btn btn-primary px-5">
                                Login
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