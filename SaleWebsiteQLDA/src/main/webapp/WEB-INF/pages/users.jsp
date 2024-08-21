<%-- 
    Document   : users
    Created on : Jul 26, 2024, 5:28:51 PM
    Author     : tongh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<h1 class="text-center text-info mt-1">QUẢN TRỊ LÝ KHOẢN</h1>

<c:url value="/users" var="action" />
<form:form method="post" action="${action}" modelAttribute="user" enctype="multipart/form-data">
    <form:errors path="*" element="div" cssClass="alert alert-danger" />
    <div class="form-floating mb-3 mt-3">
        <div class="mt-1">
            <label for="name">Họ</label>
            <form:input type="text" class="form-control" path="firstName" id="firstName" placeholder="Họ" name="firstName" />
        </div>
        <div class="mt-1">
            <label for="name">Tên</label>
            <form:input type="text" class="form-control" path="lastName" id="lastName" placeholder="Tên" name="lastName" />
        </div>
        <div class="mt-1">
            <label for="name">Email</label>
            <form:input type="email" class="form-control" path="email" id="email" placeholder="Email" name="email" />
        </div>
        <div class="mt-1">
            <label for="name">Phone</label>
            <form:input type="phone" class="form-control" path="phone" id="phone" placeholder="Phone" name="phone" />
        </div>
        <div class="mt-1">
            <label for="name">Địa chỉ</label>
            <form:input type="text" class="form-control" path="address" id="address" placeholder="Địa chỉ" name="address" />
        </div>
        <div class="mt-1">
            <label for="role">Role</label>
            <form:select path="roleId" class="form-control" id="role">
                <form:option value="" label="-- Chọn Role --"/>
                <form:options items="${role}" itemValue="id" itemLabel="name" />
            </form:select>
        </div>
        <div class="mt-1">
            <label for="role">Role</label>
            <form:select path="roleId" class="form-control" id="role">
                <form:option value="" label="-- Chọn Role --"/>
                <form:options items="${roles}" itemValue="id" itemLabel="name" />
            </form:select>
            <div class="form-floating mb-3 mt-3">
                <div class="mt-1">
                    <label for="file">Ảnh đại diện</label>
                    <form:input type="file" accept=".png,.jpg" class="form-control" path="file" id="file" name="file" />
                </div>

            </div>
            <div class="form-floating">
                <button class="btn btn-info mt-1" type="submit">Thêm</button>
                <form:hidden path="id" />
            </div>
        </div>
    </form:form>
