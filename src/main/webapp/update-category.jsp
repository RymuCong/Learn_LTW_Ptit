<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.ptit.demo.model.Category" %>
<html>
<head>
    <title>Update Category</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
<%
    Category category = (Category) request.getAttribute("category");
    if (category == null) {
        category = new Category(); // Fallback empty object
    }
%>
<div class="container mt-4">
    <div class="row">
        <div class="col-md-8 offset-md-2">
            <div class="card">
                <div class="card-header bg-primary text-white">
                    <h4 class="mb-0">Update Category</h4>
                </div>
                <div class="card-body">
                    <form action="update-category" method="post">
                        <div class="form-group">
                            <label for="categoryId">ID</label>
                            <input type="number" class="form-control" id="categoryId" name="id"
                                   value="<%= category.getId() %>" readonly>
                            <small class="form-text text-muted">ID cannot be changed</small>
                        </div>

                        <div class="form-group">
                            <label for="categoryName">Name</label>
                            <input type="text" class="form-control" id="categoryName" name="name"
                                   value="<%= category.getName() != null ? category.getName() : "" %>"
                                   maxlength="30" required>
                        </div>

                        <div class="form-group">
                            <label for="categoryDescribe">Description</label>
                            <textarea class="form-control" id="categoryDescribe" name="describe"
                                      rows="3" maxlength="50"><%= category.getDescribe() != null ? category.getDescribe() : "" %></textarea>
                        </div>

                        <div class="form-group text-center mt-4">
                            <button type="submit" class="btn btn-primary px-5">Update</button>
                            <a href="home" class="btn btn-secondary ml-2">Cancel</a>
                        </div>
                    </form>
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