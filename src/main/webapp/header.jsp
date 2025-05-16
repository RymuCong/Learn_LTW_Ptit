<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-dark">
    <a class="navbar-brand" href="product">
        <img src="images/logo.png" alt="Nike Logo">
    </a>
    <div class="navbar-nav mr-auto">
        <c:forEach var="category" items="${categories}">
            <a class="nav-link" href="category?cid=${category.id}">${category.name}</a>
        </c:forEach>
    </div>
    <div class="search-box">
        <input type="text" class="search-input" placeholder="search">
        <button class="search-button">Search</button>
    </div>
    <div class="auth-buttons">
        <c:choose>
            <c:when test="${sessionScope.admin != null}">
                <div class="dropdown">
                    <a class="dropdown-toggle" href="#" id="authDropdown" role="button" data-toggle="dropdown">
                        <i class="fas fa-user-circle mr-1"></i>${sessionScope.admin.username}
                    </a>
                    <div class="dropdown-menu dropdown-menu-right">
                        <a class="dropdown-item" href="profile.jsp">
                            <i class="fas fa-id-card mr-2"></i>Profile
                        </a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="logout">
                            <i class="fas fa-sign-out-alt mr-2"></i>Logout
                        </a>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <a href="login">Login</a>
                <a href="#">Register</a>
            </c:otherwise>
        </c:choose>
    </div>
</nav>

<style>
    .dropdown-toggle {
        color: white;
        text-decoration: none;
    }
    .dropdown-toggle:hover {
        color: #f0f0f0;
        text-decoration: none;
    }
    .dropdown-item {
        color: #212529 !important;  /* Ensures black text in dropdown items */
    }
    .dropdown-item:hover {
        background-color: #f8f9fa;
    }
    .dropdown-menu {
        border: 1px solid rgba(0,0,0,.15);
        box-shadow: 0 0.5rem 1rem rgba(0,0,0,.175);
    }
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
</style>