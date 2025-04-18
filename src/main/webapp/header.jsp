<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-dark">
    <a class="navbar-brand" href="#">
        <img src="images/logo.png" alt="Nike Logo">
    </a>
    <div class="navbar-nav mr-auto">
        <a class="nav-link" href="#">iPhone</a>
        <a class="nav-link" href="#">Samsung</a>
        <a class="nav-link" href="#">Oppo</a>
        <a class="nav-link" href="#">Vsmart</a>
        <a class="nav-link" href="#">SS7</a>
    </div>
    <div class="search-box">
        <input type="text" class="search-input" placeholder="search">
        <button class="search-button">Search</button>
    </div>
    <div class="auth-buttons">
        <a href="#">Login</a>
        <a href="#">Register</a>
    </div>
</nav>

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
</style>