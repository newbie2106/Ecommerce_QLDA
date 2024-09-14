<%-- 
    Document   : verify-otp
    Created on : Sep 3, 2024, 8:15:40 PM
    Author     : tongh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


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
    <div class="login-container">
        <h2 class="mb-4">Xác nhận OTP</h2>
                        <c:if test="${not empty errorMessage}">
                            <div class="alert alert-danger" role="alert">
                                ${errorMessage}
                            </div>
                        </c:if>
                        <c:url value="/verify-otp" var="action" />
                        <form:form action="${action}" method="post">
                            <input type="hidden" name="username" value="${username}" />
                            <div class="mb-3">
                                <input type="text" name="otp" class="form-control form-control-lg" id="otp" placeholder="Mã xác thực OTP" required="true">
                            </div>
                            <button type="submit" class="btn btn-primary btn-lg w-100">Xác nhận</button>
                        </form:form>
    </div>
</div>
