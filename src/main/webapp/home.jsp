<%@ page import="com.ptit.demo.model.Category" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home Page</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>
<div class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>Categories</h2>
        <a href="add-category" class="btn btn-success">
            <i class="fas fa-plus mr-1"></i> Add Category
        </a>
    </div>

    <div class="table-responsive">
        <table class="table table-striped table-bordered table-hover">
            <thead class="thead-dark">
            <tr>
                <th scope="col">ID</th>
                <th scope="col">Name</th>
                <th scope="col">Describe</th>
                <th scope="col" class="text-center">Actions</th>
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
                <td class="text-center">
                    <div class="btn-group" role="group">
                        <a href="update-category?id=<%= category.getId() %>" class="btn btn-sm btn-primary mr-1">
                            <i class="fas fa-edit"></i> Edit
                        </a>
                        <button type="button" class="btn btn-sm btn-danger"
                                onclick="confirmDelete(<%= category.getId() %>, '<%= category.getName() %>')">
                            <i class="fas fa-trash-alt"></i> Delete
                        </button>
                    </div>
                </td>
            </tr>
            <%
                }
            } else {
            %>
            <tr>
                <td colspan="4" class="text-center">No categories found</td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>
</div>

<!-- Bootstrap JS Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- Delete confirmation script -->
<script>
    function confirmDelete(id, name) {
        if (confirm("Are you sure you want to delete category '" + name + "'?")) {
            window.location.href = "delete-category?id=" + id;
        }
    }
</script>
</body>
</html>