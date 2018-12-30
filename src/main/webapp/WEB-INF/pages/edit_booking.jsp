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
                                    <a href="/booking/history">LỊCH SỬ ĐẶT PHÒNG</a>
                                    > SỬA THÔNG TIN
                                </div>
                            </div>
                            <div class="panel-body">
                                <form method="post"
                                      action="/booking/edit_booking?id_booking=${booking.booking_id}">
                                    <div class="form-horizontal">
                                        <div class="form-group form-group-sm">
                                            <label class="col-sm-3 control-label">Tên khách hàng</label>
                                            <div class="col-sm-7">
                                                <input class="form-control"
                                                       value="${booking.customer_fullname}"
                                                       name="customer_name"
                                                       type="text" placeholder="Tên khách hàng">
                                            </div>
                                        </div>
                                        <div class="form-group form-group-sm">
                                            <label class="col-sm-3 control-label">Số điện thoại</label>
                                            <div class="col-sm-7">
                                                <input class="form-control"
                                                       value="${booking.customer_phone}"
                                                       name="phone"
                                                       type="text" placeholder="Số điện thoại">
                                            </div>
                                        </div>
                                        <div class="form-group form-group-sm">
                                            <label class="col-sm-3 control-label">Địa chỉ khách hàng</label>
                                            <div class="col-sm-7">
                                                <input class="form-control"
                                                       value="${booking.customer_address}"
                                                       name="address"
                                                       type="text" placeholder="Địa chỉ khách hàng">
                                            </div>
                                        </div>
                                        <div class="form-group form-group-sm">
                                            <label class="col-sm-3 control-label">Ngày nhận</label>
                                            <div class="col-sm-7">
                                                <input class="form-control date"
                                                       value="<fmt:formatDate value="${booking.check_in}" pattern="MM/dd/yyyy"/>"
                                                       name="check_in"
                                                       autocomplete="off"
                                                       id="date1"
                                                       type="text" placeholder="Ngày nhận">
                                            </div>
                                        </div>
                                        <div class="form-group form-group-sm">
                                            <label class="col-sm-3 control-label">Ngày trả</label>
                                            <div class="col-sm-7">
                                                <input class="form-control date"
                                                       value="<fmt:formatDate value="${booking.check_out}" pattern="MM/dd/yyyy"/>"
                                                       autocomplete="off"
                                                       name="check_out"
                                                       id="date2"
                                                       type="text" placeholder="Ngày trả">
                                            </div>
                                        </div>
                                        <div class="form-group form-group-sm">
                                            <label id="songay" class="col-sm-3 control-label">Giá</label>
                                            <div class="col-sm-7">
                                                <input class="form-control"
                                                       id="price"
                                                       value="${booking.booking_price}"
                                                       name="price"
                                                       type="text" placeholder="Ngày trả">
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="form-group form-group-sm">
                                            <label class="col-sm-3 control-label">Phòng đã đặt</label>
                                            <div class="col-sm-7">
                                                <input class="form-control"
                                                       value="${booking.room.room_name}"
                                                       disabled
                                                       type="text">
                                            </div>
                                        </div>
                                        <div class="form-group form-group-sm">
                                            <label class="col-sm-3 control-label">Trạng thái</label>
                                            <div class="col-sm-7">
                                                <input class="form-control"
                                                <c:choose>
                                                <c:when test="${booking.booking_status == 1}">
                                                       value="Đã thanh toán"
                                                </c:when>
                                                <c:when test="${booking.booking_status == 2}">
                                                       value="Đã chờ"
                                                </c:when>
                                                <c:otherwise>
                                                       value="Đã hủy"
                                                </c:otherwise>
                                                </c:choose>
                                                       disabled
                                                       type="text">
                                            </div>
                                        </div>
                                        <div class="row col-sm-offset-3">
                                            <a href="/booking/history"
                                               class="btn btn-default">
                                                <span class="glyphicon glyphicon-backward"></span>
                                                Quay lại
                                            </a>
                                            <button type="submit" class="btn btn-default">
                                                <span class="glyphicon glyphicon-check"></span>
                                                Xác nhận
                                            </button>
                                            <a href="/booking/cancel_booking?booking_id=${booking.booking_id}"
                                                    class="btn btn-danger">
                                                <span class="glyphicon glyphicon-remove"></span>
                                                Hủy đặt phòng
                                            </a>
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
<script>
    $('document').ready(function () {
        $("#imgload").change(function () {
            if (this.files && this.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#imgshow').attr('src', e.target.result);
                }
                reader.readAsDataURL(this.files[0]);
            }
        });
    });
</script>
<script>
    $(document).ready(function () {
        $('#date1').change(function () {
            var d1 = new Date($('#date1').val());
            var d2 = new Date($('#date2').val());
            var timeDiff = Math.abs(d2.getTime() - d1.getTime());
            var diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24));
            var gia =
            ${booking.room.room_price} *
            diffDays;
            $('#songay').html("Giá : ${booking.room.room_price} x " + diffDays + " ngày");
            $('#price').val(gia);
            console.log(diffDays);
        })
        $('#date2').change(function () {
            var d1 = new Date($('#date1').val());
            var d2 = new Date($('#date2').val());
            var timeDiff = Math.abs(d2.getTime() - d1.getTime());
            var diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24));
            var gia =
            ${booking.room.room_price} *
            diffDays;
            $('#songay').html("Giá : ${booking.room.room_price} x " + diffDays + " ngày");
            $('#price').val(gia);
            console.log(diffDays);
        })
    })
</script>

</body>
</html>