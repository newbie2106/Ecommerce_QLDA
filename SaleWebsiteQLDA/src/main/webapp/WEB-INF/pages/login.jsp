<%-- 
    Document   : login
    Created on : Sep 6, 2024, 10:13:34 PM
    Author     : tongh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
    /* Custom CSS for the login form */
    .login-container {
        max-width: 400px;
        margin: 50px auto;
        padding: 20px;
        box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
        border-radius: 10px;
    }
    .login-container h2 {
        margin-bottom: 20px;
        text-align: center;
    }
</style>

<div class="container">
    <div class="login-container bg-light">
        <h2>Đăng nhập</h2>
        <form action="/login" method="post">
            <div class="mb-3">
                <label for="username" class="form-label">Tài khoản</label>
                <input type="text" class="form-control" id="username" name="username" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Mật khẩu</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <button type="submit" class="btn btn-primary w-100">Đăng nhập</button>
        </form>
        <div class="text-center mt-3">
            <a href="<c:url value='/verify-account'/>" class="auth-link text-primary">Quên mật khẩu?</a>

        </div>
    </div>
</div>
