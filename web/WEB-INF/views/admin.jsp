<%-- 
    Document   : admin
    Created on : Dec 18, 2025, 11:37:14 PM
    Author     : zed
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="false"%>
<%
    HttpSession sess = request.getSession(false);
    if (sess == null) {
        response.sendRedirect("index");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Admin Page</title>

        <!-- Bootstrap CSS -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
    </head>

    <body class="bg-light" id="adminpg">

        <!-- Navigation Bar -->
        <%@include file="components/navbar.jspf"%>

        <!-- Main Content -->
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-10">

                    <div class="card shadow-sm">
                        <div class="card-body text-center py-5">
                            <h2 class="mb-3">Hello Admin 👑</h2>
                            <p class="text-muted mb-4">
                                Welcome to the admin dashboard.
                            </p>

                            <div class="row mt-4">

                                <div class="col-md-4 mb-3">
                                    <div class="border rounded p-4 h-100">
                                        <h5 class="mb-2">Manage Users</h5>
                                        <p class="text-muted small">
                                            View and control user accounts.
                                        </p>
                                    </div>
                                </div>

                                <div class="col-md-4 mb-3">
                                    <div class="border rounded p-4 h-100">
                                        <h5 class="mb-2">Verify Sellers</h5>
                                        <p class="text-muted small">
                                            Approve or reject seller requests.
                                        </p>
                                    </div>
                                </div>

                                <div class="col-md-4 mb-3">
                                    <div role="button" class="border rounded p-4 h-100" onclick="fetchApiImportProducts();">
                                        <h5 class="mb-2">Import Products</h5>
                                        <p class="text-muted small">
                                            Fetch API and import all products.
                                        </p>
                                        <div id="importSpinner" class="d-none mt-3">

                                            <div class="spinner-border text-primary"
                                                 role="status">
                                            </div>

                                            <p class="mt-2 text-muted">
                                                Importing products...
                                            </p>

                                        </div>
                                        <div id="importStatus"
                                             class="mt-2 fw-bold">
                                        </div>
                                    </div>
                                </div>

                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </div>

        <!-- JS Files -->
        <script src="https://unpkg.com/react@16/umd/react.development.js"></script>
        <script src="https://unpkg.com/react-dom@16/umd/react-dom.development.js"></script>
        <script src="${pageContext.request.contextPath}/js/indexpage.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.js" type="text/javascript"></script>
    </body>
</html>
