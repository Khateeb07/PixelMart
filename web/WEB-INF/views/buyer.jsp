<%-- 
    Document   : buyer
    Created on : Dec 18, 2025, 11:39:17 PM
    Author     : khateeb
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="false"%>
<%
    HttpSession sess = request.getSession(false);
    String name = "";
    if (sess == null) {
        response.sendRedirect("index");
        return;
    } else {
        name = sess.getAttribute("name").toString();
        name = name.substring(0, name.indexOf(" "));
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Buyer Page</title>
        <link rel="icon"
              type="image/x-icon"
              href="${pageContext.request.contextPath}/images/logos/favicon.png">

        <!-- Bootstrap CSS -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
    </head>

    <body class="bg-light" id="buyerpg">

        <!-- Navigation Bar -->
        <%@include file="components/navbar.jspf" %>

        <!-- Main Content -->
        <div class="container my-5">
            <div class="row justify-content-center">
                <div class="col-md-8">

                    <div class="card shadow-sm">
                        <div class="card-body text-center">
                            <%
                                out.println("<h2 class=\"mb-3\">Welcome, " + name + "</h2>");
                            %>
                            <p class="text-muted">
                                You have successfully logged in.
                            </p>

                            <hr>

                            <div class="row mt-4">
                                <div class="col-md-4 mb-3">
                                    <div class="border rounded p-3">
                                        <h6>Browse Products</h6>
                                    </div>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <div class="border rounded p-3">
                                        <h6>My Orders</h6>
                                    </div>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <div class="border rounded p-3">
                                        <h6>Profile</h6>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://unpkg.com/react@16/umd/react.development.js"></script>
        <script src="https://unpkg.com/react-dom@16/umd/react-dom.development.js"></script>
        <script src="${pageContext.request.contextPath}/js/indexpage.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.js" type="text/javascript"></script>
    </body>
</html>
