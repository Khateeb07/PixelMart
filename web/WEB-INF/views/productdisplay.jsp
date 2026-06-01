<%-- 
    Document   : productdisplay
    Created on : Feb 8, 2026, 11:11:35 PM
    Author     : khateeb
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="pixelmart.beans.Product"%>
<%
    Product product = (Product) request.getAttribute("product");
%>
<!DOCTYPE html>
<html>
    <head>
        <title><%=product.getProductName()%></title>
        <link rel="icon"
              type="image/x-icon"
              href="${pageContext.request.contextPath}/images/logos/favicon.png">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
    </head>
    <body class="bg-light">

        <%@include file="/WEB-INF/views/components/navbar.jspf"%>

        <div class="container mb-5">

            <!-- Product Section -->

            <div class="card border-0 shadow-sm">

                <div class="row g-0">

                    <!-- Product Image -->

                    <div class="col-lg-5 p-4">

                        <div class="bg-white rounded d-flex justify-content-center align-items-center"
                             style="height:550px;">

                            <img
                                src="data:image/jpeg;base64,<%=request.getAttribute("imageData")%>"
                                alt="<%=product.getProductName()%>"
                                class="img-fluid"
                                style="max-height:500px; object-fit:contain;">
                        </div>

                    </div>

                    <!-- Product Details -->

                    <div class="col-lg-7">

                        <div class="p-4">

                            <h2 class="fw-bold mb-2">
                                <%=product.getProductName()%>
                            </h2>

                            <h5 class="text-secondary mb-4">
                                <%=product.getProductBrand()%>
                            </h5>

                            <!-- Rating Placeholder -->

                            <div class="mb-3">

                                <span class="badge bg-success">
                                    ★ 4.5
                                </span>

                                <span class="text-muted ms-2">
                                    Ratings coming soon
                                </span>

                            </div>

                            <!-- Pricing -->

                            <div class="mb-4">

                                <h2 class="fw-bold text-success">

                                    $<%=product.getProductSellingPrice()%>

                                </h2>

                                <span class="text-muted text-decoration-line-through fs-5">

                                    $<%=product.getProductPrice()%>

                                </span>

                                <span class="badge bg-danger ms-2">

                                    <%=product.getProductDiscount()%>% OFF

                                </span>

                            </div>

                            <!-- Stock -->

                            <div class="mb-4">

                                <% if (product.getProductQuantity() > 0) { %>

                                <h5 class="text-success">

                                    <i class="bi bi-check-circle-fill"></i>
                                    In Stock

                                </h5>

                                <% } else { %>

                                <h5 class="text-danger">

                                    <i class="bi bi-x-circle-fill"></i>
                                    Out Of Stock

                                </h5>

                                <% }%>

                            </div>

                            <!-- Quantity -->

                            <div class="mb-4">

                                <label class="form-label fw-bold">

                                    Quantity

                                </label>

                                <input
                                    type="number"
                                    value="1"
                                    min="1"
                                    max="<%=product.getProductQuantity()%>"
                                    class="form-control"
                                    style="width:120px;">

                            </div>

                            <!-- Buttons -->

                            <div class="d-flex gap-3 mb-4">

                                <button
                                    class="btn btn-warning btn-lg px-5">

                                    <i class="bi bi-cart-fill"></i>
                                    Add To Cart

                                </button>

                                <button
                                    class="btn btn-dark btn-lg px-5">

                                    Buy Now

                                </button>

                            </div>

                            <!-- Extra Info -->

                            <div class="row text-muted">

                                <div class="col-md-6">

                                    <p>

                                        <i class="bi bi-truck"></i>
                                        Fast Delivery

                                    </p>

                                </div>

                                <div class="col-md-6">

                                    <p>

                                        <i class="bi bi-arrow-repeat"></i>
                                        Easy Returns

                                    </p>

                                </div>

                            </div>

                        </div>

                    </div>

                </div>

            </div>

            <!-- Description -->

            <div class="card mt-4 border-0 shadow-sm">

                <div class="card-body">

                    <h3 class="fw-bold mb-3">

                        Product Description

                    </h3>

                    <p class="text-secondary">

                        <%=product.getProductDescription()%>

                    </p>

                </div>

            </div>

            <!-- Specifications -->

            <div class="card mt-4 border-0 shadow-sm">

                <div class="card-body">

                    <h3 class="fw-bold mb-4">

                        Specifications

                    </h3>

                    <table class="table table-borderless">

                        <tr>
                            <th width="250">Brand</th>
                            <td><%=product.getProductBrand()%></td>
                        </tr>

                        <tr>
                            <th>Warranty</th>
                            <td><%=product.getProductWarranty()%></td>
                        </tr>

                        <tr>
                            <th>Dimensions</th>
                            <td><%=product.getProductDimensions()%></td>
                        </tr>

                        <tr>
                            <th>Weight</th>
                            <td><%=product.getProductWeight()%> kg</td>
                        </tr>

                        <tr>
                            <th>Available Quantity</th>
                            <td><%=product.getProductQuantity()%></td>
                        </tr>

                    </table>

                </div>

            </div>

        </div>

        <script src="https://unpkg.com/react@16/umd/react.development.js"></script>
        <script src="https://unpkg.com/react-dom@16/umd/react-dom.development.js"></script>
        <script src="${pageContext.request.contextPath}/js/indexpage.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>

    </body>
</html>
