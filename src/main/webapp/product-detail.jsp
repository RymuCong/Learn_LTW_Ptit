<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Product Detail</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        .product-detail-container {
            background-color: white;
            border-radius: 8px;
            padding: 20px;
            margin-top: 20px;
        }
        .product-image {
            max-height: 400px;
            object-fit: contain;
        }
        .product-info {
            padding: 20px;
        }
        .product-name {
            font-size: 2rem;
            font-weight: bold;
            margin-bottom: 15px;
        }
        .product-price {
            font-size: 1.5rem;
            color: #e63946;
            margin-bottom: 15px;
        }
        .product-description {
            margin-bottom: 20px;
        }
        .product-attributes {
            margin-top: 20px;
        }
        .attribute-label {
            font-weight: bold;
        }
        body {
            background-color: #5f9ea0;
        }
        .page-header {
            background-color: #add8e6;
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 5px;
        }
    </style>
</head>
<body>
<!-- Include Header -->
<jsp:include page="header.jsp" />
<div class="container">
    <div class="page-header mt-4">
        <h2 class="text-dark">PRODUCT DETAIL</h2>
    </div>

    <div class="product-detail-container">
        <div class="row">
            <div class="col-md-5">
                <img src="${product.image}" alt="${product.name}" class="img-fluid product-image">
            </div>
            <div class="col-md-7 product-info">
                <h1 class="product-name">${product.name}</h1>
                <div class="product-price">
                    <fmt:formatNumber value="${product.price}" type="currency" currencySymbol="VND"/>
                </div>

                <div class="product-description">
                    <p>${product.describe}</p>
                </div>

                <div class="product-attributes">
                    <div class="row">
                        <div class="col-md-6">
                            <p><span class="attribute-label">Quantity in Stock:</span> ${product.quantity}</p>
                        </div>
                        <div class="col-md-6">
                            <p><span class="attribute-label">Release Date:</span>
                                <fmt:formatDate value="${product.releaseDate}" pattern="dd-MM-yyyy"/>
                            </p>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-md-6">
                            <p><span class="attribute-label">Product ID:</span> ${product.id}</p>
                        </div>
                        <div class="col-md-6">
                            <p><span class="attribute-label">Category ID:</span> ${product.cid}</p>
                        </div>
                    </div>
                </div>

                <div class="mt-4">
                    <a href="product" class="btn btn-secondary">
                        <i class="fas fa-arrow-left"></i> Back to Products
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