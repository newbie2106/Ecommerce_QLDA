<%-- 
    Document   : users
    Created on : Jul 26, 2024, 5:28:51 PM
    Author     : tongh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<h1 class="text-center text-info mt-1">QUẢN LÝ SẢN PHẨM</h1>

<c:url value="/users" var="action" />
<form:form method="post" action="${action}" modelAttribute="user" enctype="multipart/form-data">
    <form:errors path="*" element="div" cssClass="alert alert-danger" />
    <c:choose>
        <c:when test="${empty user.id}">
            <div class="form-floating mb-3 mt-3">
                <form:input type="text" class="form-control" path="firstName" id="firstName" placeholder="Họ" name="firstName" />
                <label for="name">Họ</label>
            </div>
            <div class="form-floating mb-3 mt-3">
                <form:input type="text" class="form-control" path="lastName" id="lastName" placeholder="Tên" name="lastName" />
                <label for="name">Tên</label>
            </div>
            <div class="form-floating mb-3 mt-3">
                <form:input type="email" class="form-control" path="email" id="email" placeholder="Email" name="email" />
                <label for="name">Email</label>
            </div>
            <div class="form-floating mb-3 mt-3">
                <form:input type="phone" class="form-control" path="phone" id="phone" placeholder="Số điện thoại" name="phone" />
                <label for="name">Số điện thoại</label>
            </div>
            <div class="form-floating mb-3 mt-3">
                <form:input type="text" class="form-control" path="address" id="address" placeholder="Địa chỉ" name="address" />
                <label for="name">Địa chỉ</label>
            </div>
            <div class="form-floating mb-3 mt-3">
                <form:input type="text" class="form-control" path="username" id="username" placeholder="Tên đăng nhập" name="username" />
                <label for="name">Tên đăng nhập</label>
            </div>
            <div class="form-floating mb-3 mt-3">
                <form:input type="password" class="form-control" path="password" id="password" placeholder="Mật khẩu" name="password" />
                <label for="name">Mật khẩu</label>
            </div>
            <div class="form-floating mb-3 mt-3">
                <form:input type="password" class="form-control" path="confirm" id="confirm" placeholder="Xác nhận mật khẩu" name="confirm" />
                <label for="name">Xác nhận mật khẩu</label>
            </div>
            <div class="form-floating">
                <form:select class="form-select" id="roleId"  path="roleId">
                    <c:forEach items="${role}" var="r">
                        <option value="${r.id}" selected>${r.roleName}</option>
                    </c:forEach>
                </form:select>
                <label for="categoryId" class="form-label">Vai trò</label>
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
        </c:when>
        <c:otherwise>
            <div class="form-floating mb-3 mt-3">
                <form:input type="text" class="form-control" path="firstName" id="firstName" placeholder="Họ" name="firstName" />
                <label for="name">Họ</label>
            </div>
            <div class="form-floating mb-3 mt-3">
                <form:input type="text" class="form-control" path="lastName" id="lastName" placeholder="Tên" name="lastName" />
                <label for="name">Tên</label>
            </div>
            <div class="form-floating mb-3 mt-3">
                <form:input type="email" class="form-control" path="email" id="email" placeholder="Email" name="email" />
                <label for="name">Email</label>
            </div>
            <div class="form-floating mb-3 mt-3">
                <form:input type="phone" class="form-control" path="phone" id="phone" placeholder="Số điện thoại" name="phone" />
                <label for="name">Số điện thoại</label>
            </div>
            <div class="form-floating mb-3 mt-3">
                <form:input type="text" class="form-control" path="address" id="address" placeholder="Địa chỉ" name="address" />
                <label for="name">Địa chỉ</label>
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
        </c:otherwise>
    </c:choose>
    <div class="form-floating">
        <button class="btn btn-info mt-1" type="submit">
            <c:choose>
                <c:when test="${user.id > 0}"> Cập nhât</c:when>
                <c:otherwise> Thêm</c:otherwise>
            </c:choose>
        </button>
        <form:hidden path="id" />
    </div>
</form:form>
