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
                                <div class="panel-title">
                                    <a href="/homestay/my_homestay">QUẢN LÝ HOMESTAY</a>
                                    > SỬA THÔNG TIN HOMESTAY
                                </div>
                            </div>
                            <div class="panel-body">
                                <form method="post"
                                      action="${pageContext.servletContext.contextPath}/booking/ad/edit/${booking.booking_id}">
                                    <div class="form-horizontal">
                                        <div class="form-group form-group-sm">
                                            <div class="col-sm-offset-3">
                                                <img src="/resources/${homestay.homestay_image}"
                                                     class="thumbnail" width="50%">
                                            </div>
                                        </div>
                                        <div class="form-group form-group-sm">
                                            <label class="col-sm-3 control-label">Tên homestay</label>
                                            <div class="col-sm-7">
                                                <input class="form-control" value="${homestay.homestay_name}"
                                                       disabled
                                                       type="text" placeholder="Tên">
                                            </div>
                                        </div>
                                        <div class="form-group form-group-sm">
                                            <label class="col-sm-3 control-label">Description</label>
                                            <div class="col-sm-7">
                                                <input disabled class="form-control"
                                                       value="${homestay.homestay_description}"
                                                       type="text" placeholder="Email address">
                                            </div>
                                        </div>
                                        <div class="form-group form-group-sm">
                                            <label class="col-sm-3 control-label">Location</label>
                                            <div class="col-sm-7">
                                                <select class="form-control" name="status">
                                                    <c:forEach var="location" items="${location}">
                                                        <option value="${location.location_id}"

                                                                <c:if test="${location.location_id == homestay.homestay_id}">
                                                                    selected
                                                                </c:if>
                                                        >
                                                                ${location.location_name}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group form-group-sm">
                                            <label class="col-sm-3 control-label">Ngày nhận</label>
                                            <div class="col-sm-7">
                                                <input class="form-control" value="${booking.check_in}"
                                                       type="date" name="fdate" placeholder="Địa chỉ">
                                            </div>
                                        </div>
                                        <div class="form-group form-group-sm">
                                            <label class="col-sm-3 control-label">Ngày trả</label>
                                            <div class="col-sm-7">
                                                <input class="form-control" value="${booking.check_out}"
                                                       type="date" name="sdate" placeholder="Địa chỉ">
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="form-group form-group-sm">
                                            <label class="col-sm-3 control-label">Điểm đánh giá</label>
                                            <div class="col-sm-7">
                                                <input class="form-control" value="${homestay.homestay_reviews}"
                                                       type="text" name="fullname" placeholder="Địa chỉ">
                                            </div>
                                        </div>
                                        <div class="form-group form-group-sm">
                                            <label class="col-sm-3 control-label">Lượt đánh giá</label>
                                            <div class="col-sm-7">
                                                <input class="form-control" value="${homestay.homestay_number_reviews}"
                                                       type="text" name="phone" placeholder="Địa chỉ">
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row col-sm-offset-3">
                                            <a href="${pageContext.servletContext.contextPath}/booking/ad"
                                               class="btn btn-default">
                                                <span class="glyphicon glyphicon-backward"></span>
                                                Quay lại
                                            </a>
                                            <button type="submit" class="btn btn-default">
                                                <span class="glyphicon glyphicon-check"></span>
                                                Xác nhận
                                            </button>
                                        </div>
                                    </div>
                                </form>
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