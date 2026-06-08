<%-- 
    Document   : productdisplay
    Created on : Feb 8, 2026, 11:11:35 PM
    Author     : khateeb
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="pixelmart.beans.Product,pixelmart.beans.CategoryInfo"%>
<%
    Product product = (Product) request.getAttribute("product");
    CategoryInfo category = (CategoryInfo) request.getAttribute("category");
%>
<!DOCTYPE html>
<html>
    <head>
        <title><%=product.getProductName()%> | Pixel Mart</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/logos/favicon.png">
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/productdisplay.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
    </head>

    <body class="product-page">

        <%@include file="/WEB-INF/views/components/navbar.jspf"%>

        <!-- =========================
             BREADCRUMB
        ========================== -->

        <section class="breadcrumb-section">

            <div class="container">

                <nav aria-label="breadcrumb">

                    <ol class="breadcrumb">

                        <li class="breadcrumb-item">
                            <a href="welcome">
                                Home
                            </a>
                        </li>

                        <li class="breadcrumb-item">
                            <a href="prodcat?catid=<%=category.getCatId()%>">
                                <%=category.getCatName()%>
                            </a>
                        </li>

                        <li class="breadcrumb-item">
                            <a href="prodld?subcatid=<%=category.getSubcatId()%>">
                                <%=category.getSubcatName()%>
                            </a>
                        </li>

                        <li class="breadcrumb-item active">
                            <%=product.getProductName()%>
                        </li>

                    </ol>

                </nav>

            </div>

        </section>

        <!-- =========================
             PRODUCT HERO
        ========================== -->

        <section class="product-hero">

            <div class="container">

                <div class="hero-surface">

                    <div class="row align-items-center g-5">

                        <!-- PRODUCT IMAGE -->

                        <div class="col-lg-6">

                            <div class="gallery-surface">
                                
                                <img src="data:image/type;base64,<%=product.getProductImagePath()%>"
                                     alt="<%=product.getProductName()%>"
                                     class="product-image">

                            </div>

                        </div>

                        <!-- PRODUCT INFO -->

                        <div class="col-lg-6">

                            <div class="purchase-panel">

                                <span class="brand-pill">
                                    <%=product.getProductBrand()%>
                                </span>

                                <h1 class="product-title mt-4">
                                    <%=product.getProductName()%>
                                </h1>

                                <p class="product-subtitle">
                                    <%=product.getProductDescription()%>
                                </p>

                                <div class="price-section">

                                    <h2 class="current-price">
                                        $<%=String.format("%.2f",
                                                product.getProductSellingPrice())%>
                                    </h2>

                                    <div class="price-meta">

                                        <span class="old-price">
                                            $<%=String.format("%.2f",
                                                    product.getProductPrice())%>
                                        </span>

                                        <span class="discount-pill">
                                            <%=String.format("%.2f",
                                                    product.getProductDiscount())%>% OFF
                                        </span>

                                    </div>

                                    <div class="savings-text">

                                        You Save

                                        $<%=String.format("%.2f",
                                                product.getProductPrice()
                                                - product.getProductSellingPrice())%>

                                    </div>

                                </div>

                                <div class="stock-pill mt-4">

                                    <i class="bi bi-check-circle-fill"></i>

                                    <span>
                                        In Stock
                                    </span>

                                    <small>
                                        (<%=product.getProductQuantity()%> Available)
                                    </small>

                                </div>

                                <div class="quantity-section mt-4">

                                    <label class="quantity-label">
                                        Quantity
                                    </label>

                                    <div class="quantity-wrapper">

                                        <button id="minusBtn"
                                                class="qty-btn">

                                            <i class="bi bi-dash-lg"></i>

                                        </button>

                                        <span id="qtyValue">
                                            1
                                        </span>

                                        <button id="plusBtn"
                                                class="qty-btn">

                                            <i class="bi bi-plus-lg"></i>

                                        </button>

                                    </div>

                                </div>

                                <div class="action-buttons">

                                    <button class="btn btn-buy" onclick="buyNow(<%=product.getProductId()%>)">

                                        <i class="bi bi-lightning-fill me-2"></i>

                                        Buy Now

                                    </button>

                                    <button class="btn btn-cart" onclick="addToCart(<%=product.getProductId()%>)">

                                        <i class="bi bi-cart-fill me-2"></i>

                                        Add To Cart

                                    </button>

                                    <button class="btn btn-wishlist" onclick="toggleWishlist(<%=product.getProductId()%>)">

                                        <i class="bi bi-heart"></i>

                                    </button>

                                </div>

                                <div class="trust-pills">

                                    <span class="trust-pill">
                                        <i class="bi bi-shield-check"></i>
                                        Secure Payment
                                    </span>

                                    <span class="trust-pill">
                                        <i class="bi bi-arrow-repeat"></i>
                                        Easy Returns
                                    </span>

                                    <span class="trust-pill">
                                        <i class="bi bi-truck"></i>
                                        Fast Delivery
                                    </span>

                                    <span class="trust-pill">
                                        <i class="bi bi-patch-check"></i>
                                        Warranty Included
                                    </span>

                                </div>

                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </section>

        <!-- =========================
                PRODUCT STORY
        ========================== -->

        <section class="story-section">

            <div class="container">

                <div class="content-surface">

                    <div class="section-header">

                        <span class="section-tag">
                            Product Story
                        </span>

                        <h2 class="section-title">
                            Crafted For Everyday Excellence
                        </h2>

                    </div>

                    <div class="row justify-content-center">

                        <div class="col-lg-10">

                            <p class="story-content">

                                <%=product.getProductDescription()%>

                            </p>

                        </div>

                    </div>

                </div>

            </div>

        </section>

        <!-- =========================
             FEATURE SHOWCASE
        ========================== -->

        <section class="feature-section">

            <div class="container">

                <div class="section-header text-center mb-5">

                    <span class="section-tag">
                        Why Choose This Product
                    </span>

                    <h2 class="section-title">
                        Designed Around Your Needs
                    </h2>

                    <p class="section-subtitle">

                        Premium quality, dependable performance,
                        and a seamless ownership experience.

                    </p>

                </div>

                <div class="row g-4">

                    <div class="col-lg-4 col-md-6">

                        <div class="feature-card">

                            <div class="feature-icon">

                                <i class="bi bi-lightning-charge-fill"></i>

                            </div>

                            <h4>
                                High Performance
                            </h4>

                            <p>

                                Engineered to deliver exceptional
                                speed, responsiveness and reliability.

                            </p>

                        </div>

                    </div>

                    <div class="col-lg-4 col-md-6">

                        <div class="feature-card">

                            <div class="feature-icon">

                                <i class="bi bi-shield-check"></i>

                            </div>

                            <h4>
                                Trusted Quality
                            </h4>

                            <p>

                                Manufactured using premium materials
                                and backed by quality assurance.

                            </p>

                        </div>

                    </div>

                    <div class="col-lg-4 col-md-6">

                        <div class="feature-card">

                            <div class="feature-icon">

                                <i class="bi bi-stars"></i>

                            </div>

                            <h4>
                                Premium Experience
                            </h4>

                            <p>

                                Thoughtfully designed to provide a
                                smooth and enjoyable experience.

                            </p>

                        </div>

                    </div>

                </div>

            </div>

        </section>

        <!-- =========================
             SPECIFICATIONS
        ========================== -->

        <section class="specification-section">

            <div class="container">

                <div class="section-header text-center mb-5">

                    <span class="section-tag">
                        Technical Details
                    </span>

                    <h2 class="section-title">
                        Specifications
                    </h2>

                    <p class="section-subtitle">

                        Everything you need to know about
                        this product at a glance.

                    </p>

                </div>

                <div class="spec-grid">

                    <div class="spec-card">

                        <span class="spec-label">

                            Brand

                        </span>

                        <strong class="spec-value">

                            <%=product.getProductBrand()%>

                        </strong>

                    </div>

                    <div class="spec-card">

                        <span class="spec-label">

                            Warranty

                        </span>

                        <strong class="spec-value">

                            <%=product.getProductWarranty()%>

                        </strong>

                    </div>

                    <div class="spec-card">

                        <span class="spec-label">

                            Weight

                        </span>

                        <strong class="spec-value">

                            <%=product.getProductWeight()%> kg

                        </strong>

                    </div>

                    <div class="spec-card">

                        <span class="spec-label">

                            Dimensions

                        </span>

                        <strong class="spec-value">

                            <%=product.getProductDimensions()%>

                        </strong>

                    </div>

                    <div class="spec-card">

                        <span class="spec-label">

                            Available Stock

                        </span>

                        <strong class="spec-value">

                            <%=product.getProductQuantity()%> Units

                        </strong>

                    </div>

                    <div class="spec-card">

                        <span class="spec-label">

                            Category

                        </span>

                        <strong class="spec-value">

                            <%=category.getCatName()%>

                        </strong>

                    </div>

                    <div class="spec-card">

                        <span class="spec-label">

                            Subcategory

                        </span>

                        <strong class="spec-value">

                            <%=category.getSubcatName()%>

                        </strong>

                    </div>

                    <div class="spec-card">

                        <span class="spec-label">

                            Product ID

                        </span>

                        <strong class="spec-value">

                            #<%=product.getProductId()%>

                        </strong>

                    </div>

                </div>

            </div>

        </section>

        <!-- =========================
                TRUST & DELIVERY
        ========================== -->

        <section class="delivery-section">

            <div class="container">

                <div class="section-header text-center mb-5">

                    <span class="section-tag">
                        Shop With Confidence
                    </span>

                    <h2 class="section-title">
                        Trusted By Thousands Of Customers
                    </h2>

                    <p class="section-subtitle">

                        Secure shopping experience designed to
                        make every purchase simple and worry-free.

                    </p>

                </div>

                <div class="delivery-surface">

                    <div class="row g-4">

                        <div class="col-lg-3 col-md-6">

                            <div class="delivery-card">

                                <div class="delivery-icon">

                                    <i class="bi bi-truck"></i>

                                </div>

                                <h5>
                                    Fast Delivery
                                </h5>

                                <p>

                                    Quick and reliable shipping
                                    right to your doorstep.

                                </p>

                            </div>

                        </div>

                        <div class="col-lg-3 col-md-6">

                            <div class="delivery-card">

                                <div class="delivery-icon">

                                    <i class="bi bi-arrow-repeat"></i>

                                </div>

                                <h5>
                                    Easy Returns
                                </h5>

                                <p>

                                    Hassle-free return process
                                    for complete peace of mind.

                                </p>

                            </div>

                        </div>

                        <div class="col-lg-3 col-md-6">

                            <div class="delivery-card">

                                <div class="delivery-icon">

                                    <i class="bi bi-shield-lock"></i>

                                </div>

                                <h5>
                                    Secure Payments
                                </h5>

                                <p>

                                    Protected transactions
                                    with trusted payment gateways.

                                </p>

                            </div>

                        </div>

                        <div class="col-lg-3 col-md-6">

                            <div class="delivery-card">

                                <div class="delivery-icon">

                                    <i class="bi bi-patch-check"></i>

                                </div>

                                <h5>
                                    Genuine Products
                                </h5>

                                <p>

                                    Authentic products sourced
                                    directly from trusted sellers.

                                </p>

                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </section>

        <!-- =========================
             RELATED PRODUCTS
        ========================== -->

        <section class="related-section">

            <div class="container">

                <div class="section-header text-center mb-5">

                    <span class="section-tag">
                        Discover More
                    </span>

                    <h2 class="section-title">
                        Similar Products
                    </h2>

                    <p class="section-subtitle">

                        Explore products related to your interests.

                    </p>

                </div>

                <div id="relatedProducts">

                    <div class="row g-4">

                        <!-- AJAX Loaded Products -->

                    </div>

                </div>

            </div>

        </section>

        <!-- =========================
             NEWSLETTER
        ========================== -->

        <section class="newsletter-section">

            <div class="container">

                <div class="newsletter-surface">

                    <div class="row align-items-center">

                        <div class="col-lg-7">

                            <h2 class="newsletter-title">

                                Stay Updated With PixelMart

                            </h2>

                            <p class="newsletter-text">

                                Get updates on new arrivals,
                                exclusive offers and trending products.

                            </p>

                        </div>

                        <div class="col-lg-5">

                            <div class="newsletter-form">

                                <input type="email"
                                       class="form-control newsletter-input"
                                       placeholder="Enter your email">

                                <button class="btn newsletter-btn">

                                    Subscribe

                                </button>

                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </section>

        <%@include file="/WEB-INF/views/components/footer.jspf"%>

        <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>

        <script src="${pageContext.request.contextPath}/js/productdisplay.js"></script>

    </body>

</html>