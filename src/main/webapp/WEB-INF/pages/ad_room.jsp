<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <style>
        .form-control {
            display: block;
            width: 100%;
            height: 34px;
            padding: 6px 12px;
            font-size: 14px;
            line-height: 1.42857143;
            color: #555;
            background-color: #fff;
            background-image: none;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
            transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s
        }
    </style>
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
            <%@include file="components/ad_info.jsp" %>
            <div class="col-md-9">
                <div class="row">
                    <div class="wrap-division">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <h3 class="panel-title">QUẢN LÝ HOMESTAY</h3>
                            </div>
                            <div class="panel-body">
                                <a href="${pageContext.servletContext.contextPath}/homestay/add_homestay"
                                   class="btn btn-default">
                                    <span class="glyphicon glyphicon-plus"></span>
                                </a>
                                <div style="color: red">${message}</div>
                                <table class="table table-hover">
                                    <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Tên phòng</th>
                                        <%--<th>Giới thiệu</th>--%>
                                        <th>Trạng thái</th>
                                        <th>Giá</th>
                                        <th>Action</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${room}" var="room" varStatus="loop">
                                        <tr>
                                            <td>${loop.index}</td>
                                            <td>${room.room_name}</td>
                                            <td>
                                                <select class="form-control">
                                                    <c:forEach var="i" begin="1" end="2">
                                                        <option value="${i}">
                                                            <c:if test="${i == 1}">
                                                                Đang mở
                                                            </c:if>
                                                            <c:if test="${i == 2}">
                                                                Đang đóng
                                                            </c:if>
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                            <td>${room.room_price}</td>
                                            <td>
                                                <a class="btn btn-default"
                                                >
                                                    <span class="glyphicon glyphicon-edit"></span>
                                                </a>
                                                <a class="btn btn-default">
                                                    <span class="glyphicon glyphicon-trash"></span>
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                <c:if test="${fn:length(room) == 0}">
                                    <div class="text-center">
                                        <a class="btn btn-default"
                                           href="${pageContext.servletContext.contextPath}/homestay/add_homestay"
                                        >
                                            <span style="font-size: 20px" class="glyphicon glyphicon-plus"></span>
                                        </a>
                                        <br>
                                        Thêm homestay
                                    </div>
                                </c:if>
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