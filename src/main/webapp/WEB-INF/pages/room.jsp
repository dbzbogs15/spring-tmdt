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
            <li class="breadcrumb-item active" aria-current="page">Danh Sách Phòng</li>
        </ol>
    </nav>
    <div class="container">
        <div class="row">
            <div class="col-md-9">
                <div class="row">
                    <div class="col-md-12">
                        <div class="wrap-division">
                            <div class="col-md-12 col-md-offset-0 heading2 animate-box">
                                <h2>Tên HOMESTAY</h2>
                            </div>
                            <div class="row">
                                <c:forEach var="room" items="${room}">
                                    <div class="col-md-12 animate-box">
                                        <div class="room-wrap">
                                            <div class="row">
                                                <div class="col-md-6 col-sm-6">
                                                    <div class="room-img"
                                                         style="background-image: url(${pageContext.servletContext.contextPath}/resources/${room.room_image});"></div>
                                                </div>
                                                <div class="col-md-6 col-sm-6">
                                                    <div class="desc">
                                                        <h2>${room.room_name}
                                                            + ${room.homestay.location.location_id}</h2>
                                                        <p class="price"><span>${room.room_price}</span>
                                                            <small>/ ngày</small>
                                                        </p>
                                                        <p>
                                                                ${room.room_describe}
                                                        </p>
                                                        <p><a href="details.html" class="btn btn-primary">Đặt phòng</a>
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
                    <div class="side search-wrap animate-box">
                        <h3 class="sidebar-heading">Tìm căn hộ cho bạn</h3>
                        <form method="post" action="hotels.html" class="colorlib-form">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="date">Ngày nhận:</label>
                                        <div class="form-field">
                                            <i class="icon icon-calendar2"></i>
                                            <input type="text" value="${sessionScope.check_in}" id="date"
                                                   class="form-control date"
                                                   placeholder="Ngày nhận">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="date">Ngày trả: </label>
                                        <div class="form-field">
                                            <i class="icon icon-calendar2"></i>
                                            <input type="text" value="${sessionScope.check_out}" id="date"
                                                   class="form-control date"
                                                   placeholder="Ngày trả">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="guest">Số người</label>
                                        <div class="form-field">
                                            <i class="icon icon-arrow-down3"></i>
                                            <select name="guest" id="people" class="form-control">
                                                <option value="#">1</option>
                                                <option value="#">2</option>
                                                <option value="#">3</option>
                                                <option value="#">4</option>
                                                <option value="#">5+</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <input type="submit" name="submit" id="submit" value="Search"
                                           class="btn btn-primary btn-block">
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="side animate-box">
                        <div class="row">
                            <div class="col-md-12">
                                <h3 class="sidebar-heading">Tầm giá</h3>
                                <form method="post" class="colorlib-form-2">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="guests">Từ: </label>
                                                <div class="form-field">
                                                    <i class="icon icon-arrow-down3"></i>
                                                    <select name="people" id="people" class="form-control">
                                                        <option value="#">1</option>
                                                        <option value="#">200</option>
                                                        <option value="#">300</option>
                                                        <option value="#">400</option>
                                                        <option value="#">1000</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="guests">Đến: </label>
                                                <div class="form-field">
                                                    <i class="icon icon-arrow-down3"></i>
                                                    <select name="people" id="people" class="form-control">
                                                        <option value="#">2000</option>
                                                        <option value="#">4000</option>
                                                        <option value="#">6000</option>
                                                        <option value="#">8000</option>
                                                        <option value="#">10000</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="side animate-box">
                        <div class="row">
                            <div class="col-md-12">
                                <h3 class="sidebar-heading">Review Rating</h3>
                                <form method="post" class="colorlib-form-2">
                                    <div class="form-check">
                                        <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                        <label class="form-check-label" for="exampleCheck1">
                                            <p class="rate"><span><i class="icon-star-full"></i><i
                                                    class="icon-star-full"></i><i class="icon-star-full"></i><i
                                                    class="icon-star-full"></i><i class="icon-star-full"></i></span></p>
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                        <label class="form-check-label" for="exampleCheck1">
                                            <p class="rate"><span><i class="icon-star-full"></i><i
                                                    class="icon-star-full"></i><i class="icon-star-full"></i><i
                                                    class="icon-star-full"></i></span></p>
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                        <label class="form-check-label" for="exampleCheck1">
                                            <p class="rate"><span><i class="icon-star-full"></i><i
                                                    class="icon-star-full"></i><i class="icon-star-full"></i></span></p>
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                        <label class="form-check-label" for="exampleCheck1">
                                            <p class="rate"><span><i class="icon-star-full"></i><i
                                                    class="icon-star-full"></i></span></p>
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                        <label class="form-check-label" for="exampleCheck1">
                                            <p class="rate"><span><i class="icon-star-full"></i></span></p>
                                        </label>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="side animate-box">
                        <div class="row">
                            <div class="col-md-12">
                                <h3 class="sidebar-heading">Loại phòng</h3>
                                <form method="post" class="colorlib-form-2">
                                    <div class="form-check">
                                        <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                        <label class="form-check-label" for="exampleCheck1">
                                            <h4 class="place">Apartment</h4>
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                        <label class="form-check-label" for="exampleCheck1">
                                            <h4 class="place">Hotel</h4>
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                        <label class="form-check-label" for="exampleCheck1">
                                            <h4 class="place">Hostel</h4>
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                        <label class="form-check-label" for="exampleCheck1">
                                            <h4 class="place">Inn</h4>
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                        <label class="form-check-label" for="exampleCheck1">
                                            <h4 class="place">Villa</h4>
                                        </label>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="side animate-box">
                        <div class="row">
                            <div class="col-md-12">
                                <h3 class="sidebar-heading">Điểm đến</h3>
                                <form method="post" class="colorlib-form-2">
                                    <c:forEach var="location" items="${location}">
                                        <div class="form-check">
                                            <input type="checkbox"
                                            <c:if test="${location_s == location.location_id}">
                                                   checked
                                            </c:if>
                                                   class="form-check-input" id="exampleCheck1">
                                            <label class="form-check-label" for="exampleCheck1">
                                                <h4 class="place">${location.location_name}</h4>
                                            </label>
                                        </div>
                                    </c:forEach>
                                </form>
                            </div>
                        </div>
                    </div>
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