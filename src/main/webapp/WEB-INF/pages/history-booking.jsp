<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="components/header.jsp" %>
    <%--
    <c:if test="${sessionScope.user == null}">--%>
    <%--
    <c:redirect url="${pageContext.servletContext.contextPath}/"></c:redirect>
    --%>
    <%--
</c:if>
--%>
</head>
<body>
<%@include file="components/navbar.jsp" %>
<div class="colorlib-wrap" style="padding-top: 0">
    <%--<div class="row well text-center">--%>
    <%--<ul id="progressbar" class="progressbar">--%>
    <%--<li class="current">Chi tiết đặt phòng</li>--%>
    <%--<li class="active">Yêu cầu đặt phòng</li>--%>
    <%--<li class="danger">Phê duyệt đặt phòng</li>--%>
    <%--<li class="">Xác nhận thanh toán</li>--%>
    <%--</ul>--%>
    <%--</div>--%>
    <div class="container" style="margin-top: 50px">
        <div class="row">
            <!-- SIDEBAR-->
            <div class="col-md-3">
                <div class="sidebar-wrap">
                    <div class="side search-wrap animate-box">
                        <h3 class="sidebar-heading">Thông tin của bạn</h3>
                        <hr>
                        <form method="post" action="hotels.html" class="colorlib-form">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="date">Họ tên:
                                            <span class="check-date">${sessionScope.user.user_fullname}</span>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="date">Địa chỉ:
                                            <span class="check-date">${sessionScope.user.user_address}</span>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="date">Số điện thoại:
                                            <span class="check-date">
                                                       ${sessionScope.user.user_phone}
                                                    </span>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="date">Email:
                                            <span class="check-date">
                                                ${sessionScope.user.user_email}
                                            </span>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <hr>
                                    <button class="btn btn-default">Thay đổi thông tin</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-md-9">
                <div class="row">
                    <div class="wrap-division">

                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <h3 class="panel-title">LỊCH SỮ THANH TOÁN</h3>
                            </div>
                            <div class="panel-body">
                                <table class="table table-hover">
                                    <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Tên phòng</th>
                                        <th>Giá phòng</th>
                                        <th>Trạng thái</th>
                                        <th>Action</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="booking" varStatus="loop" items="${booking}">
                                    <tr>
                                        <td>${loop.index}</td>
                                        <td width="30%">${booking.room.room_name}</td>
                                        <td>${booking.booking_price}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${booking.booking_status == 1}">
                                                    Đã thanh toán
                                                </c:when>
                                                <c:when test="${booking.booking_status == 2}">
                                                    Đang chờ
                                                </c:when>
                                                <c:otherwise>
                                                    Đã hủy
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <a href="">Chi tiết</a> |
                                            <a href="">Hủy</a>
                                        </td>
                                    </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="components/footer.jsp" %>
</body>
</html>