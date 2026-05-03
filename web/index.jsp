<%-- 
    Document   : index
    Created on : Dec 16, 2025, 2:25:03 PM
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
        <title>Pixel Mart App</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
    </head>
    <body class="bg-light" onload="navbtn('index'); sinform('sform');" id="index">
        
        <!-- Navigation Bar-->
        <%@include file="WEB-INF/views/components/navbar.jspf" %>

        <!-- Start of Sign Up Modal -->
        <%@include file="WEB-INF/views/components/buyersignup.jspf" %>
        <!-- End of Sign Up Modal -->

        <div class="container my-5">
            <div class="row justify-content-center">
                <div class="col-md-4">

                    <div class="card shadow-sm">
                        <div class="card-body py-5">

                            <div class="h2 text-center my-2 fw-normal">Welcome Back</div>
                            <div class="h6 text-center fw-light text-secondary my-2">
                                Sign in to continue to your account
                            </div>

                            <!--Form through asynchronous request-->
                            <div id="sform">
                            </div>

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