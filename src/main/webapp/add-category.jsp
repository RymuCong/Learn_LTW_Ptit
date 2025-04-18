<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Category</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4">
    <div class="row">
        <div class="col-md-8 offset-md-2">
            <div class="card">
                <div class="card-header bg-primary text-white">
                    <h4 class="mb-0">Add New Category</h4>
                </div>
                <div class="card-body">
                    <form action="add-category" method="post">
                        <div class="form-group">
                            <label for="categoryId">ID</label>
                            <input type="number" class="form-control" id="categoryId" name="id" required>
                        </div>

                        <div class="form-group">
                            <label for="categoryName">Name</label>
                            <input type="text" class="form-control" id="categoryName" name="name"
                                   maxlength="30" required>
                        </div>

                        <div class="form-group">
                            <label for="categoryDescribe">Describe</label>
                            <textarea class="form-control" id="categoryDescribe" name="describe"
                                      rows="3" maxlength="50"></textarea>
                        </div>

                        <div class="form-group text-center mt-4">
                            <button type="submit" class="btn btn-primary px-5">Save</button>
                            <a href="home" class="btn btn-secondary ml-2">Cancel</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>