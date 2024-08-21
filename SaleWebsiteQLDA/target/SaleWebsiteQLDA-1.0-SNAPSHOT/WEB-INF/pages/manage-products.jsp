<%-- 
    Document   : manage-products
    Created on : Jul 24, 2024, 9:58:15 PM
    Author     : tongh
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<h1 class="text-center text-info mt-1">QUẢN LÝ SẢN PHẨM</h1>


<ul class="pagination mt-1">
    <c:forEach begin="1" end="${count}" var="i">
        <c:url value="/manage-products" var="pageAction">
            <c:param name="page" value="${i}"/>
        </c:url>
        <li class="page-item">
            <a class="page-link" href="${pageAction}">${i}</a>
        </li>
    </c:forEach>
</ul>

<div>
    <a class="btn btn-success" href="<c:url value="/products" />">Add product</a>
</div>
<table class="table table-striped mt-1">
    <tr>
        <th>Id</th>
        <th>Ảnh</th>
        <th>Tên sản phẩm</th>
        <th>Giá</th>
        <th>Mô tả</th>        
        <th>Thao tác</th>

    </tr>
    <c:forEach items="${products}" var="p">
        <tr>
            <td>${p.id}</td>
            <td class="d-flex justify-content-center align-items-center gap-3">
                <c:if test="${not empty p.imageSet}">
                    <c:forEach items="${p.imageSet}" var="i" varStatus="status">
                        <c:if test="${status.index == 0}">
                            <a href="${i.url}" data-toggle="lightbox" data-gallery="example-gallery">
                                <img src="${i.url}" width="150" height="100"/>
                            </a>
                        </c:if>
                    </c:forEach>
                </c:if>
            </td>
            <td>${p.name}</td>
            <td>${String.format("%,d", p.price)} VNĐ</td>
            <td>${p.description}</td>
            <td>
                <c:url value="/api/products/${p.id}/" var="urlDelete" />
                <a class="btn btn-info" href="<c:url value="/products/${p.id}" />">Cập nhật</a>
                <button onclick="eDelete('${urlDelete}',${p.id})" class="btn btn-danger">Xóa</button>
            </td>
        </tr>
    </c:forEach>
</table>

<script src="<c:url value="/js/script.js" />"></script>


