<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<c:if test="${sessionScope.user == null}">--%>
<%--<c:redirect url="${pageContext.servletContext.contextPath}/login"></c:redirect>--%>
<%--</c:if>--%>
<div class="col-md-3">
    <div class="sidebar-wrap">
        <div class="side search-wrap animate-box">
            <h3 class="sidebar-heading">Thông tin của bạn</h3>
            <hr>
            <form method="post" action="hotels.html" class="colorlib-form">
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                                <img src="${sessionScope.user.user_image}"
                                     class="img-thumbnail"
                                     id="imgshow1"
                                     width="100%" height="220.5px">
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="form-group">
                            <label>Họ tên:
                                <span class="check-date">${sessionScope.user.user_fullname}</span>
                            </label>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="form-group">
                            <label>Địa chỉ:
                                <span class="check-date">${sessionScope.user.user_address}</span>
                            </label>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="form-group">
                            <label>Số điện thoại:
                                <span class="check-date">
                                    ${sessionScope.user.user_phone}
                                </span>
                            </label>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="form-group">
                            <label>Email:
                                <span class="check-date">
                                    ${sessionScope.user.user_email}
                                </span>
                            </label>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <hr>
                        <a href="${pageContext.servletContext.contextPath}/ucp"
                           class="btn br btn-default" style="border-radius: 0; width: 100%; text-align: left">
                            <span class="glyphicon glyphicon-pencil"></span>
                            Thay đổi thông tin
                        </a>
                        <a href="${pageContext.servletContext.contextPath}/change_pwd"
                           class="btn br btn-default" style="border-radius: 0; width: 100%; text-align: left">
                            <span class="glyphicon glyphicon-cog"></span>
                            Đổi mật khẩu
                        </a>
                        <a href="${pageContext.servletContext.contextPath}/booking/history"
                           class="btn br btn-default" style="border-radius: 0; width: 100%; text-align: left">
                            <span class="glyphicon glyphicon-check"></span>
                            Đặt phòng của tôi
                        </a>
                        <a href="${pageContext.servletContext.contextPath}/booking/ad"
                           class="btn br btn-default" style="border-radius: 0; width: 100%; text-align: left">
                            <span class="glyphicon glyphicon-list-alt"></span>
                            Đặt phòng của khách
                        </a>
                        <a href="${pageContext.servletContext.contextPath}/homestay/my_homestay"
                           class="btn br btn-default" style="border-radius: 0; width: 100%; text-align: left">
                            <span class="glyphicon glyphicon-th-list"></span>
                            Homestay của tôi
                        </a>
                        <a href="${pageContext.servletContext.contextPath}/service"
                                class="btn br btn-default" style="border-radius: 0; width: 100%; text-align: left">
                            <span class="glyphicon glyphicon-shopping-cart"></span>
                            Gói dịch vụ
                        </a>
                        <a class="btn br btn-default" style="border-radius: 0; width: 100%; text-align: left">
                            <span class="glyphicon glyphicon-log-out"></span>
                            Đăng xuất</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>