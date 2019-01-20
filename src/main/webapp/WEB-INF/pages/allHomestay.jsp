<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="components/header.jsp" %>
</head>
<body>
<%@include file="components/navbar.jsp" %>
<div class="colorlib-wrap" style="padding-top: 0">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#">Trang chủ</a></li>
            <li class="breadcrumb-item"><a href="#">Tìm kiếm</a></li>
            <li class="breadcrumb-item"><a href="#">Homestay</a></li>
            <li class="breadcrumb-item active" aria-current="page">Kết quả tìm kiếm</li>
        </ol>
    </nav>
    <div class="container">
        <div class="row">
            <div class="col-md-9">
                <div class="row">
                    <div class="col-md-12">
                        <div class="wrap-division">
                            <div class="row">
                                <c:forEach var="homestay" items="${homestay}">
                                    <div class="col-md-12 animate-box">
                                        <div class="room-wrap">
                                            <div class="row">
                                                <div class="col-md-6 col-sm-6">
                                                    <div class="room-img"
                                                         style="background-image: url(${pageContext.servletContext.contextPath}/resources/${homestay.homestay_image});"></div>
                                                </div>
                                                <div class="col-md-6 col-sm-6">
                                                    <div class="desc">
                                                        <h2>${homestay.homestay_name}</h2>
                                                        <p class="price"><span>${homestay.location.location_name}</span>
                                                            <small></small>
                                                        </p>
                                                        <p>
                                                                ${homestay.homestay_description}
                                                        </p>
                                                        <p>
                                                            <a href="${pageContext.servletContext.contextPath}/homestay?id=${homestay.homestay_id}"
                                                               class="btn btn-primary">Xem danh sách phòng</a>
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- SIDEBAR-->
            <div class="col-md-3">
                <div class="sidebar-wrap">
                    <%@include file="components/right_bar.jsp"%>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 text-center">
            <ul class="pagination">
                <li class="disabled"><a href="#">&laquo;</a></li>
                <li class="active"><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">&raquo;</a></li>
            </ul>
        </div>
    </div>
</div>
<%@include file="components/footer.jsp" %>
</body>
</html>