<%-- 
    Document   : sellersignup
    Created on : Dec 31, 2025, 2:19:19 PM
    Author     : zed
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="false"%>
<%
    HttpSession sess = request.getSession();
    if (sess != null) {
        sess.invalidate();
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Seller Signin</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
    </head>
    <body class="bg-light" id="slrsigninpg">
            
        <!-- Navigation Bar -->
        <%@include file="components/navbar.jspf" %>

        <div class="container my-5">
            <div class="row justify-content-center">
                <div class="col-md-4">

                    <div class="card shadow-sm">
                        <div class="card-body py-5">

                            <div class="h2 text-center my-2 fw-normal">Hello! Seller</div>
                            <div class="h6 text-center fw-light text-secondary my-2">
                                Sign in to continue to your account
                            </div>

                            <form action="sellersignedin" method="POST" class="row justify-content-center">
                                <div class="col-md-8 my-2">
                                    <input type="email"
                                           class="form-control rounded-0 border-0 border-bottom shadow-none"
                                           placeholder="Email"
                                           name="emailin"
                                           required>
                                </div>

                                <div class="col-md-8 my-2">
                                    <input type="password"
                                           class="form-control rounded-0 border-0 border-bottom shadow-none"
                                           placeholder="Password"
                                           name="passin"
                                           required>
                                </div>

                                <div class="row col-md-8 my-2 justify-content-center">
                                    <input type="submit"
                                           value="Sign In"
                                           class="btn btn-primary my-3">
                                </div>
                            </form>

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
