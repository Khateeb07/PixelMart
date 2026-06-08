<%-- 
    Document   : subcategories
    Created on : Feb 27, 2026, 2:16:58 AM
    Author     : khateeb
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.ArrayList;"%>
<%
    String catName = request.getAttribute("catname").toString();
    int catId = (Integer) request.getAttribute("catid");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=catName%> | Pixel Mart</title>
        <link rel="icon"
              type="image/x-icon"
              href="${pageContext.request.contextPath}/images/logos/favicon.png">
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/categories.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
    </head>
    <body onload="showSubcategoryCards(<%=catId%>);" id="subcategorypg">

        <!-- Navbar -->
        <%@include file="components/navbar.jspf" %>

        <!-- Hero Section -->
        <div class="container-fluid bg-dark text-light pt-4 pb-3 border-bottom">

            <div class="container">

                <nav class="mb-3">

                    <small class="text-secondary">
                        Home >
                        <span class="text-light">
                            <%=catName%>
                        </span>
                    </small>

                </nav>

                <h1 class="display-5 fw-bold">
                    <%=catName%>
                </h1>

                <p class="lead text-secondary">
                    Discover top products, trending brands and
                    the latest collections in <%=catName%>.
                </p>

            </div>

        </div>

        <!-- Statistics Sections -->
        <div class="container my-5">

            <div class="row text-center">

                <div class="col-md-3">
                    <h2 class="fw-bold text-primary">18+</h2>
                    <p class="text-muted">Subcategories</p>
                </div>

                <div class="col-md-3">
                    <h2 class="fw-bold text-primary">190+</h2>
                    <p class="text-muted">Products</p>
                </div>

                <div class="col-md-3">
                    <h2 class="fw-bold text-primary">24/7</h2>
                    <p class="text-muted">Support</p>
                </div>

                <div class="col-md-3">
                    <h2 class="fw-bold text-primary">Fast</h2>
                    <p class="text-muted">Delivery</p>
                </div>

            </div>

        </div>

        <!-- Subcategory Grid -->
        <div class="container my-5">

            <div class="text-center mb-5">

                <h2 class="fw-bold">

                    Browse Subcategories

                </h2>

                <p class="text-muted">

                    Discover products by category

                </p>

            </div>

            <div class="row g-4" id="subcategoryContainer">

            </div>

        </div>

        <!-- Why Shop Section -->
        <div class="container py-5">

            <div class="row align-items-center g-5">

                <div class="col-lg-6">

                    <h2 class="fw-bold mb-4">

                        Why Shop <%=catName%>?

                    </h2>

                    <p class="text-muted mb-4">

                        Discover carefully organized products,
                        trusted brands and the latest collections.

                    </p>

                    <div class="mb-3">
                        <i class="bi bi-check-circle-fill text-success me-2"></i>
                        Wide Product Selection
                    </div>

                    <div class="mb-3">
                        <i class="bi bi-check-circle-fill text-success me-2"></i>
                        Trusted Brands
                    </div>

                    <div class="mb-3">
                        <i class="bi bi-check-circle-fill text-success me-2"></i>
                        Quality Products
                    </div>

                    <div class="mb-3">
                        <i class="bi bi-check-circle-fill text-success me-2"></i>
                        Easy Shopping Experience
                    </div>

                </div>

                <!-- Right Side -->
                <div class="col-lg-5">

                    <div class="category-showcase">

                        <img
                            src="${pageContext.request.contextPath}/images/catdisplay/catimg<%=catId%>.png"
                            alt="<%=catName%>"
                            class="showcase-image">

                    </div>

                </div>

            </div>

        </div>
        <%@include file="components/footer.jspf" %>

        <script src="https://unpkg.com/react@16/umd/react.development.js"></script>
        <script src="https://unpkg.com/react-dom@16/umd/react-dom.development.js"></script>
        <script src="${pageContext.request.contextPath}/js/indexpage.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/welcome.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.js" type="text/javascript"></script>
    </body>
</html>
