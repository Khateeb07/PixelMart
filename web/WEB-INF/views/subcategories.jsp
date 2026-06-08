<%-- 
    Document   : welcome
    Created on : Jan 21, 2026, 2:28:01 PM
    Author     : khateeb
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String catName = request.getAttribute("catname").toString();
    int catId = (Integer) request.getAttribute("catid");
    String subcatName = request.getAttribute("subcatname").toString();
    int subcatId = (Integer) request.getAttribute("subcatid");
%>
<!DOCTYPE html>
<html>
    <head>
        <title><%=subcatName%> | Pixel Mart</title>
        <link rel="icon" href="${pageContext.request.contextPath}/images/logos/favicon.png">
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/welcome.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
    </head>

    <body id="productspg" onload="loadProducts(<%=subcatId%>, 'products')">

        <%@include file="components/navbar.jspf"%>

        <!-- Breadcrumb -->
        <div class="container mt-4">
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item">
                        <a href="welcome">
                            Home
                        </a>
                    </li>
                    <li class="breadcrumb-item">
                        <a href="prodcat?catid=<%=catId%>">
                            <%=catName%>
                        </a>
                    </li>
                    <li class="breadcrumb-item active">
                        <%=subcatName%>
                    </li>
                </ol>
            </nav>
        </div>

        <!-- Page Header -->

        <div class="container mb-4">
            <div class="d-flex justify-content-between align-items-center">
                <div>
                    <h2 class="fw-bold">
                        <%=subcatName%>
                    </h2>
                    <p class="text-muted mb-0">
                        Discover the best products in
                        <%=subcatName%>
                    </p>
                </div>

                <div>
                    <select class="form-select">
                        <option>Relevance</option>

                        <option>Price: Low to High</option>

                        <option>Price: High to Low</option>

                        <option>Newest First</option>
                    </select>
                </div>
            </div>
        </div>

        <!-- Main Content -->
        <div class="container mb-5">
            <div class="row">

                <!-- Filters -->
                <div class="col-lg-3">
                    <div class="card border-0 shadow-sm">
                        <div class="card-body">
                            <h5 class="fw-bold mb-4">Filters</h5>

                            <h6>Availability</h6>

                            <div class="form-check">
                                <input
                                    class="form-check-input"
                                    type="checkbox">
                                <label class="form-check-label">
                                    In Stock
                                </label>
                            </div>

                            <hr>

                            <h6>Price</h6>

                            <div class="form-check">
                                <input
                                    class="form-check-input"
                                    type="checkbox">
                                <label class="form-check-label">
                                    Under ₹1000
                                </label>
                            </div>

                            <div class="form-check">
                                <input
                                    class="form-check-input"
                                    type="checkbox">
                                <label class="form-check-label">
                                    ₹1000 - ₹5000
                                </label>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Products -->
                <div class="col-lg-9">
                    <div id="products">

                    </div>
                </div>
            </div>
        </div>

        <!-- Load More -->

        <div class="text-center mb-5">
            <button class="btn btn-outline-primary px-4">
                Load More Products
            </button>
        </div>

        <%@include file="components/footer.jspf"%>

        <script src="https://unpkg.com/react@16/umd/react.development.js"></script>
        <script src="https://unpkg.com/react-dom@16/umd/react-dom.development.js"></script>
        <script src="${pageContext.request.contextPath}/js/indexpage.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>