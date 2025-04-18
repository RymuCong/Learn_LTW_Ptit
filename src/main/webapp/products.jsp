<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>LIST OF PRODUCTS</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        .navbar {
            background-color: #0066ff !important;
            padding: 10px 20px;
        }
        .navbar-brand img {
            width: 40px;
            height: auto;
        }
        .nav-link {
            color: white !important;
            margin-right: 20px;
        }
        .search-box {
            display: flex;
            align-items: center;
        }
        .search-input {
            border-radius: 4px 0 0 4px;
            border: none;
            padding: 6px 12px;
        }
        .search-button {
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 0 4px 4px 0;
            padding: 6px 12px;
        }
        .auth-buttons {
            margin-left: 20px;
        }
        .auth-buttons a {
            color: white;
            text-decoration: none;
            margin-left: 15px;
        }
        .left-sidebar {
            background-color: #20b2aa;
            padding: 20px;
            min-height: calc(100vh - 70px);
        }
        .left-sidebar a {
            display: block;
            color: white;
            text-decoration: none;
            padding: 10px 0;
            font-size: 18px;
        }
        .left-sidebar a:hover {
            color: #f0f0f0;
        }
        .product-card {
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 15px;
            margin-bottom: 20px;
            background-color: white;
            transition: transform 0.2s;
        }
        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        .product-image {
            width: 100%;
            height: 200px;
            object-fit: contain;
            margin-bottom: 15px;
        }
        .product-title {
            font-size: 1.2rem;
            font-weight: bold;
            margin-bottom: 10px;
            text-align: center;
        }
        .product-price {
            color: #333;
            font-size: 1.1rem;
            margin-bottom: 15px;
            text-align: center;
        }
        .detail-btn {
            width: 100%;
            background-color: #007bff;
            color: white;
            border: none;
            padding: 8px;
            border-radius: 4px;
        }
        .page-header {
            background-color: #add8e6;
            padding: 10px;
            margin-bottom: 20px;
        }
        body {
            background-color: #5f9ea0;
            margin: 0;
            padding: 0;
        }
        .main-content {
            margin-top: 20px;
        }
    </style>
</head>
<body>
<!-- Include Header -->
<jsp:include page="header.jsp" />

<div class="container-fluid">
    <div class="row">
        <!-- Include Sidebar -->
        <div class="col-md-2">
            <jsp:include page="sidebar.jsp" />
        </div>

        <!-- Main Content -->
        <div class="col-md-10">
            <div class="main-content">
                <div class="page-header">
                    <h2 class="text-dark">LIST OF PRODUCTS</h2>
                </div>

                <div class="row">
                    <c:choose>
                        <c:when test="${not empty products}">
                            <c:forEach var="product" items="${products}">
                                <div class="col-md-4">
                                    <div class="product-card">
                                        <img src="${product.image}" alt="${product.name}" class="product-image">
                                        <div class="product-title">${product.name}</div>
                                        <div class="product-price">
                                            Price: <fmt:formatNumber value="${product.price}" type="currency" currencySymbol="VND"/>
                                        </div>
                                        <a href="product-detail?id=${product.id}" class="btn detail-btn">Detail</a>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <div class="col-12">
                                <p class="text-center">No products found</p>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>