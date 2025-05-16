<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Balo Store</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        .navbar {
            background-color: #0066ff !important;
        }
        .content {
            padding: 20px;
            background-color: #f8f9fa;
            min-height: calc(100vh - 56px);
        }
        .welcome-banner {
            background-color: #28a745;
            color: white;
            padding: 20px;
            border-radius: 5px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container">
        <a class="navbar-brand" href="#">
            <i class="fas fa-shopping-bag mr-2"></i>Quản trị
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="balo">Dashboard</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="products">Sản phẩm</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="categories">Nhãn hàng</a>
                </li>
            </ul>

            <ul class="navbar-nav">
                <c:choose>
                    <c:when test="${sessionScope.admin != null}">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown">
                                <i class="fas fa-user-circle mr-1"></i>${sessionScope.admin.username}
                            </a>
                            <div class="dropdown-menu dropdown-menu-right">
                                <a class="dropdown-item" href="profile.jsp"><i class="fas fa-id-card mr-2"></i>Profile</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="logout"><i class="fas fa-sign-out-alt mr-2"></i>Logout</a>
                            </div>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item">
                            <a class="nav-link" href="login.jsp"><i class="fas fa-sign-in-alt mr-1"></i>Login</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="register.jsp"><i class="fas fa-user-plus mr-1"></i>Register</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <!-- Include Sidebar -->
        <div class="col-md-2">
            <jsp:include page="sidebar.jsp" />
        </div>

        <!-- Main Content -->
        <div class="col-md-10 content">
            <c:choose>
                <c:when test="${sessionScope.admin != null}">
                    <div class="welcome-banner">
                        <h2><i class="fas fa-hand-paper mr-2"></i>Xin chào, ${sessionScope.admin.username}!</h2>
                        <p>Role: ${sessionScope.admin.role}.</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="jumbotron">
                        <h1 class="display-4">Access Restricted</h1>
                        <p class="lead">You need to login to access the Balo Management System.</p>
                        <hr class="my-4">
                        <p>Please login with your administrator credentials.</p>
                        <a class="btn btn-primary btn-lg" href="login.jsp" role="button">Login Now</a>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>

<!-- Bootstrap JS Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</body>
</html>