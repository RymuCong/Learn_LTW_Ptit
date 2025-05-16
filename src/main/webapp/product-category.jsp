<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Products by Category</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        .navbar {
            background-color: #0066ff !important;
            padding: 10px 20px;
        }
        .left-sidebar {
            background-color: #20b2aa;
            padding: 20px;
            min-height: calc(100vh - 70px);
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
            border-radius: 5px;
        }
        body {
            background-color: #5f9ea0;
            margin: 0;
            padding: 0;
        }
        .main-content {
            margin-top: 20px;
        }
        .category-badge {
            position: absolute;
            top: 10px;
            right: 10px;
            z-index: 10;
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
                <div class="page-header d-flex justify-content-between align-items-center">
                    <h2 class="text-dark mb-0">
                        <c:if test="${not empty category}">
                            <i class="fas fa-folder-open mr-2"></i> ${category.name}
                        </c:if>
                        <c:if test="${empty category}">
                            <i class="fas fa-folder-open mr-2"></i> Category Products
                        </c:if>
                    </h2>
                    <span class="badge badge-pill badge-primary">
                        <c:if test="${not empty productsByCategory}">
                            ${productsByCategory.size()} product(s)
                        </c:if>
                        <c:if test="${empty productsByCategory}">
                            0 product
                        </c:if>
                    </span>
                </div>

                <div class="row">
                    <c:choose>
                        <c:when test="${not empty productsByCategory}">
                            <c:forEach var="product" items="${productsByCategory}">
                                <div class="col-md-4 mb-4">
                                    <div class="product-card position-relative">
                                        <div class="category-badge">
                                            <span class="badge badge-info">
                                                <i class="fas fa-tag mr-1"></i> ${product.category.name}
                                            </span>
                                        </div>
                                        <img src="${product.image}" alt="${product.name}" class="product-image">
                                        <div class="product-title">${product.name}</div>
                                        <div class="product-price">
                                            Price: <fmt:formatNumber value="${product.price}" type="currency" currencySymbol="VND"/>
                                        </div>
                                        <div class="d-flex justify-content-between align-items-center mb-3">
                                            <span class="badge badge-success">
                                                <i class="fas fa-cubes mr-1"></i> In stock: ${product.quantity}
                                            </span>
                                            <span class="badge badge-secondary">
                                                <i class="fas fa-calendar-alt mr-1"></i>
                                                <fmt:formatDate value="${product.releaseDate}" pattern="dd/MM/yyyy"/>
                                            </span>
                                        </div>
                                        <a href="product-detail?id=${product.id}" class="btn detail-btn">
                                            <i class="fas fa-info-circle mr-1"></i> Detail
                                        </a>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <div class="col-12">
                                <div class="alert alert-info text-center">
                                    <i class="fas fa-exclamation-circle mr-2"></i> No products found in this category
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>

                <div class="mt-4">
                    <a href="product" class="btn btn-secondary">
                        <i class="fas fa-arrow-left mr-1"></i> Back to All Products
                    </a>
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