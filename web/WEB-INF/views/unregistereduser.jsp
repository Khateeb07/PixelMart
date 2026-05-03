<%-- 
    Document   : unregistereduser
    Created on : Jan 13, 2026, 3:30:05 PM
    Author     : zed
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="false"%>
<%
    Object registration = request.getAttribute("ureg");
    int reg = 0;
    if (registration != null)
        reg = (int) registration;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
        <title>Unregistered User</title>
    </head>
    <body class="bg-light">
        <!-- Navigation Bar-->
        <%@include file="components/navbar.jspf" %>

        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6">

                    <div class="card shadow-sm text-center">
                        <div class="card-body py-5">

                            <h2 class="text-warning mb-3">User Not Found</h2>
                            <h5 class="text-secondary mb-4">
                                Dear user, you have not yet created a profile.
                            </h5>

                            <% if (reg == 1) { %>
                            <a href="index" class="btn btn-primary px-5">
                                Sign Up
                            </a>
                            <% } else if (reg == 2) { %>
                            <a href="sellersignin" class="btn btn-primary px-5">
                                Sign Up
                            </a>
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