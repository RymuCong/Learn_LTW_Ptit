<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Login</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <style>
    html, body {
      height: 100%;
    }
    .login-container {
      height: 100%;
      display: flex;
      justify-content: center;
      align-items: center;
    }
    .login-form {
      width: 100%;
      max-width: 330px;
      padding: 15px;
      margin: auto;
    }
  </style>
</head>
<body>
<!-- Include Header -->
<jsp:include page="header.jsp" />

<div class="container-fluid">

  <div class="container login-container">
    <div class="login-form">
      <form action="login" method="post">
        <h1 class="h3 mb-3 font-weight-normal text-center">Đăng nhập</h1>

        <div class="form-group">
          <label for="username" class="sr-only">Username</label>
          <input type="text" id="username" name="username" class="form-control" placeholder="Username" required autofocus>
        </div>

        <div class="form-group">
          <label for="password" class="sr-only">Password</label>
          <input type="password" id="password" name="password" class="form-control" placeholder="Password" required>
        </div>

        <div class="form-group">
          <c:if test="${not empty error}">
            <div class="alert alert-danger" role="alert">
                ${error}
            </div>
          </c:if>
        </div>

        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>

        <p class="mt-3 text-center">
          <a href="register.jsp">Register</a> | <a href="forgot-password.jsp">Forgot Password?</a>
        </p>
      </form>
    </div>
  </div>
</div>
<!-- Bootstrap JS dependencies -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</body>
</html>