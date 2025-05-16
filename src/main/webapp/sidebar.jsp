<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Left Sidebar -->
<div class="left-sidebar">
    <c:forEach var="category" items="${categories}">
        <a href="category?cid=${category.id}">
            <i class="fas fa-folder mr-2"></i> ${category.name}
        </a>
    </c:forEach>
</div>

<style>
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
        transform: translateX(5px);
        transition: transform 0.3s ease;
    }
    .left-sidebar a.active {
        font-weight: bold;
        color: #ffff00;
    }
</style>