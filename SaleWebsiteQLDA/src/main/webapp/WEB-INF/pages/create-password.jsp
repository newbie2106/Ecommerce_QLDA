

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
    .auth-form-light {
        border-radius: 8px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }
    .auth-form-btn {
        font-size: 16px;
    }
    .brand-logo img {
        max-width: 150px;
    }
    .alert-custom {
        margin-bottom: 20px;
    }
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
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger alert-custom" role="alert">
                <p>${errorMessage}</p>
            </div>
        </c:if>

        <!-- Hiển thị thông báo thành công nếu có -->
        <c:if test="${not empty successMessage}">
            <script>
                window.onload = function () {
                    var successModal = new bootstrap.Modal(document.getElementById('successModal'));
                    successModal.show();

                    var countdownElement = document.getElementById('countdown');
                    var countdownTime = 10; // Thời gian đếm ngược bắt đầu từ 10 giây

                    function updateCountdown() {
                        if (countdownTime <= 0) {
                            document.getElementById("logoutForm").submit();
                        } else {
                            countdownElement.textContent = countdownTime;
                            countdownTime--;
                        }
                    }

                    // Cập nhật đếm ngược mỗi giây
                    var countdownInterval = setInterval(updateCountdown, 1000);

                    // Nếu người dùng nhấn nút Đăng xuất ngay, hủy bỏ đếm ngược
                    document.getElementById('logoutNowButton').addEventListener('click', function () {
                        clearInterval(countdownInterval);
                    });
                }
            </script>

            <!-- Modal thông báo đổi mật khẩu thành công -->
            <div class="modal fade" id="successModal" tabindex="-1" aria-labelledby="successModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="successModalLabel">Thông báo</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <p>${successMessage}</p>
                            <p style="color: blue;">Bạn sẽ tự động chuyển sang trang đăng nhập sau <span id="countdown">10</span> giây hoặc click <strong id="logoutNowButton">Đăng nhập ngay</strong>!</p>
                        </div>
                        <div class="modal-footer">
                            <form id="logoutForm" action="${pageContext.request.contextPath}/login" method="post">
                                <button type="submit" class="btn btn-primary">Đăng nhật ngay</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </c:if>

        <c:url value="/create-password" var="action" />

        <form:form method="post" action="${action}">
            <div class="mb-3">
                <input type="hidden" name="username" value="${username}" class="form-control" id="username" placeholder="Tài khoản" required>
            </div>
            <div class="mb-3">
                <input type="password" name="newPassword" class="form-control" id="newPassword" placeholder="Nhập mật khẩu mới" required>
            </div>
            <div class="mb-3">
                <input type="password" name="rePassword" class="form-control" id="rePassword" placeholder="Nhập lại mật khẩu" required>
            </div>
            <button type="submit" class="btn btn-primary btn-lg btn-block auth-form-btn">
                Xác nhận
            </button>
        </form:form>


    </div>
</div>
