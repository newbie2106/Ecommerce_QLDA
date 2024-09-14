<%-- 
    Document   : update-user
    Created on : Aug 24, 2024, 3:59:27 PM
    Author     : tongh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<h1 class="text-center text-info mt-1">QUẢN LÝ TÀI KHOẢN</h1>

<c:url value="/update-user" var="action" />
<form:form method="post" action="${action}" modelAttribute="user" enctype="multipart/form-data">
    <form:errors path="*" element="div" cssClass="alert alert-danger" />
    <div class="form-floating mb-3 mt-3">
        <form:input type="text" class="form-control" path="firstName" id="firstName" placeholder="Họ" name="firstName" />
        <label for="name">Họ</label>
    </div>
    <div class="form-floating mb-3 mt-3">
        <form:input type="text" class="form-control" path="lastName" id="lastName" placeholder="Tên" name="lastName" />
        <label for="name">Tên</label>
    </div>
    <div class="form-floating mb-3 mt-3">
        <form:input type="text" class="form-control" path="address" id="address" placeholder="Địa chỉ" name="address" />
        <label for="name">Địa chỉ</label>
    </div>
    <div class="form-floating mb-3 mt-3">
        <form:input type="email" class="form-control" path="email" id="email" placeholder="email" name="email" />
        <label for="name">Email</label>
    </div>
    <div class="form-floating mb-3 mt-3">
        <form:input type="phone" class="form-control" path="phone" id="phone" placeholder="Số điện thoại" name="phone" />
        <label for="name">Số điện thoại</label>
    </div>
    <div class="form-floating">
        <form:input type="text" class="form-control" path="role" id="role" name="role" value="ROLE_ADMIN" disabled="true"/>
        <label for="name" class="form-label">Vai trò</label>
    </div>
    <div class="form-floating mb-3 mt-3">
        <div class="mt-1">
            <label for="file">Ảnh đại diện</label>
            <form:input type="file" accept=".png,.jpg" class="form-control" path="file" id="file" name="file" />
            <c:if test="${user.avatar != null}">
                <img src="${user.avatar}" width="200" />
            </c:if>
        </div>
    </div>
    <form:hidden path="username" />
    <form:hidden path="password" />
    <form:hidden path="rePassword" />

    <div class="form-floating">
        <button class="btn btn-info mt-1" type="submit">
            Cập nhật
        </button>
    </div>
</form:form>

<!--JAVA SCRIPT-->
<script src="<c:url value="/js/script.js" />"></script>
