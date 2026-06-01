<%-- 
    Document   : welcome
    Created on : Jan 22, 2026, 5:51:35 PM
    Author     : khateeb
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pixel Mart</title>
        <link rel="icon"
              type="image/x-icon"
              href="${pageContext.request.contextPath}/images/logos/favicon.png">
        
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/welcome.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
    </head>
    <body class="bg-light" onload="loadProducts('trends', 'trending'); loadProducts('deals', 'bestDeals'); loadProducts('new', 'latest'); loadCategories('category');" id="welcome">

        <header>
            <div id="banner">
                <%@include file="components/welcome/banner.jspf"%>
            </div>
            <div id="navbar">
                <%@include file="components/welcome/navbar.jspf"%>
            </div>
        </header>
        <main>
            <!--Hero Carousel-->
            <div id="carousel-show"></div>

            <!--Trust Section-->
            <div class="container mb-5">
                <div class="row text-center">

                    <div class="col-md-3">
                        <div class="card border-0 shadow-sm p-3">
                            <i class="bi bi-truck fs-1 text-primary"></i>
                            <h5 class="mt-2">Fast Delivery</h5>
                            <small class="text-muted">
                                Delivered to your doorstep
                            </small>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="card border-0 shadow-sm p-3">
                            <i class="bi bi-shield-check fs-1 text-success"></i>
                            <h5 class="mt-2">Secure Shopping</h5>
                            <small class="text-muted">
                                Safe and reliable payments
                            </small>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="card border-0 shadow-sm p-3">
                            <i class="bi bi-arrow-repeat fs-1 text-warning"></i>
                            <h5 class="mt-2">Easy Returns</h5>
                            <small class="text-muted">
                                Hassle-free returns
                            </small>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <div class="card border-0 shadow-sm p-3">
                            <i class="bi bi-tag fs-1 text-danger"></i>
                            <h5 class="mt-2">Best Deals</h5>
                            <small class="text-muted">
                                Save more every day
                            </small>
                        </div>
                    </div>

                </div>
            </div>

            <!-- Category Display Section -->
            <%@include file="components/welcome/catdisplay.jspf"%>

            <!-- Category Pills Section -->
            <%@include file="components/welcome/catpills.jspf"%>

            <!<!-- Catalogs Section -->
            <%@include file="components/welcome/catalogs.jspf"%>
            
            <!<!-- Why Us Section -->
            <%@include file="components/welcome/whyus.jspf"%>

        </main>
        <footer class="bg-dark text-light mt-5">

            <div class="container py-5">

                <div class="row">

                    <div class="col-md-4">
                        <h4>Pixel Mart</h4>
                        <p class="text-secondary">
                            Your one-stop destination for modern online shopping.
                        </p>
                    </div>

                    <div class="col-md-4">
                        <h5>Quick Links</h5>
                        <ul class="list-unstyled">
                            <li>About Us</li>
                            <li>Contact</li>
                            <li>Privacy Policy</li>
                        </ul>
                    </div>

                    <div class="col-md-4">
                        <h5>Follow Us</h5>
                        <a href="https://github.com/khateeb07" target="_blank" class="text-light me-3 social-icon"><i class="bi bi-github fs-4"></i></a>
                        <a href="https://linkedin.com/in/khateeb07" target="_blank" class="text-light me-3 social-icon"><i class="bi bi-linkedin fs-4"></i></a>
                        <i class="bi bi-twitter-x fs-4 social-icon"></i>
                    </div>

                </div>

                <hr>

                <p class="text-center mb-0">
                    © 2026 Pixel Mart. All Rights Reserved.
                </p>

            </div>

        </footer>

        <script src="https://unpkg.com/react@16/umd/react.development.js"></script>
        <script src="https://unpkg.com/react-dom@16/umd/react-dom.development.js"></script>
        <script src="${pageContext.request.contextPath}/js/indexpage.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/welcome.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.js" type="text/javascript"></script>
    </body>
</html>
