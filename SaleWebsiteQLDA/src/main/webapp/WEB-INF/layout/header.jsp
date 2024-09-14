<%-- 
    Document   : header
    Created on : Apr 25, 2024, 7:38:26 PM
    Author     : tongh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand " href="#">HNĐ Website</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDarkDropdown" aria-controls="navbarNavDarkDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
            <ul class="navbar-nav d-flex justify-content-between w-100">
                <c:choose>
                    <c:when test="${pageContext.request.userPrincipal.name != null}">
                        <div class="d-flex">

                            <li class="nav-item">
                                <a class="nav-link" href="<c:url value='/manage-products' />">Quản lý sản phẩm</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="<c:url value='/manage-brands' />">Quản lý nhãn hàng</a>
                            </li>
                            <li class="nav-item">

                                <a class="nav-link" href="<c:url value='/manage-accounts' />">Quản lý tài khoản</a>

                                <a class="nav-link" href="<c:url value='/manage-users' />">Quản lý tài khoản</a>

                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="<c:url value='/stats' />">Thống kê</a>
                            </li>
                        </div>
                        <div class="d-flex align-items-center">
                            <li class="nav-item me-5 dropdown">
                                <a class="nav-link dropdown-toggle" id="navbarDarkDropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false" href="<c:url value="/"/>">
                                    Chào ${pageContext.request.userPrincipal.name}!</a>
                                <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDarkDropdownMenuLink">
<<<<<<< HEAD


                                    <li><a class="nav-link" href="<c:url value="/users/${pageContext.request.userPrincipal.name}" />">Thay đổi thông tin</a></li>

=======
                                    <li><a class="nav-link" href="<c:url value="/update-user/${pageContext.request.userPrincipal.name}" />">Thay đổi thông tin</a></li>
                                    <li><a class="nav-link" href="<c:url value="/change-password" />">Thay đổi mật khẩu</a></li>
>>>>>>> origin/hiep
                                    <li><a class="nav-link" href="<c:url value="/logout"/>">Đăng xuất</a></li>
                                </ul>
                            </li>

                        </div>
                    </c:when>
                    <c:when test="${pageContext.request.userPrincipal.name == null}">
                        <li class="nav-item">
                            <a class="nav-link" href="<c:url value='/login' />">Đăng nhập</a>
                        </li>
                    </c:when>
                </c:choose>
            </ul>
        </div>
    </div>
</nav>