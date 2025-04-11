<%@ page import="com.ptit.demo.model.Category" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--khai bao the jstl--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Home Page</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4">
    <h2 class="mb-4">Categories</h2>

    <div class="table-responsive">
        <table class="table table-striped table-bordered table-hover">
            <thead class="thead-dark">
            <tr>
                <th scope="col">ID</th>
                <th scope="col">Name</th>
                <th scope="col">Describe</th>
            </tr>
            </thead>
            <tbody>
            <%
                List<Category> categories = (List<Category>) request.getAttribute("categories");
                if (categories != null && !categories.isEmpty()) {
                    for (Category category : categories) {
            %>
            <tr>
                <td><%= category.getId() %></td>
                <td><%= category.getName() %></td>
                <td><%= category.getDescribe() %></td>
            </tr>
            <%
                }
            } else {
            %>
            <tr>
                <td colspan="3" class="text-center">No categories found</td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>
</div>

<%--<!-- Bootstrap JS, Popper.js, and jQuery -->--%>
<%--<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"--%>
<%--        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>--%>
<%--<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"--%>
<%--        integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>--%>
<%--<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"--%>
<%--        integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>--%>
</body>
</html>