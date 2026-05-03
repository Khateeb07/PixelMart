<%-- 
    Document   : welcome
    Created on : Jan 22, 2026, 5:51:35 PM
    Author     : zed
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome Page</title>
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

        <style>
            .bg-blue {
                background-color: #6594B1;
                color: black;
            }
        </style>
    </head>
    <body class="bg-light" onload="loadProducts('products'); loadCategories('category');" id="welcome">

        <header>
            <div id="banner">
                <%@include file="components/banner.jspf" %>
            </div>
            <div id="navbar">
                <%@include file="components/navbarwelcome.jspf"%>
            </div>
        </header>
        <main>
            <!--Carousel-->
            <div id="carousel-show"></div>
            
            <!-- Category Display -->
            <%@include file="components/catdisplay.jspf"%>
            
            <!--Products Display-->
            <div id="products"></div>
        </main>
        <footer>

        </footer>

        <script src="https://unpkg.com/react@16/umd/react.development.js"></script>
        <script src="https://unpkg.com/react-dom@16/umd/react-dom.development.js"></script>
        <script src="${pageContext.request.contextPath}/js/indexpage.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/welcome.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.js" type="text/javascript"></script>
    </body>
</html>
