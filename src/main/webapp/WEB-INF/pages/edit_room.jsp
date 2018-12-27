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
    <script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
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
                                      action="${pageContext.servletContext.contextPath}/room/edit_room/${room.room_id}">
                                    <div class="form-horizontal">
                                        <div class="form-group form-group-sm">
                                            <div class="col-sm-offset-3">
                                                <img src="/resources/${room.room_image}"
                                                     id="imgshow"
                                                     class="thumbnail" width="75%">
                                            </div>
                                        </div>
                                        <div class="form-group form-group-sm">
                                            <label class="col-sm-3 control-label">Images</label>
                                            <div class="col-sm-7">
                                                <input class="form-control"
                                                       name="homestay_image"
                                                       id="imgload"
                                                       type="file">
                                            </div>
                                        </div>
                                        <div class="form-group form-group-sm">
                                            <label class="col-sm-3 control-label">Tên phòng</label>
                                            <div class="col-sm-7">
                                                <input class="form-control" value="${room.room_name}"
                                                       name="room_name"
                                                       type="text" placeholder="Tên">
                                            </div>
                                        </div>
                                        <div class="form-group form-group-sm">
                                            <label class="col-sm-3 control-label">Description</label>
                                            <div class="col-sm-7">
                                                <textarea class="form-control"
                                                          name="description"
                                                          rows="5">${room.room_describe}</textarea>
                                            </div>
                                        </div>
                                        <div class="form-group form-group-sm">
                                            <label class="col-sm-3 control-label">Giá phòng VNĐ</label>
                                            <div class="col-sm-7">
                                                <input class="form-control" value="${room.room_price}"
                                                       name="price"
                                                       type="text" placeholder="Giá phòng">
                                            </div>
                                        </div>
                                        <div class="form-group form-group-sm">
                                            <label class="col-sm-3 control-label">Trạng thái</label>
                                            <div class="col-sm-7">
                                                <select name="status" class="form-control">
                                                    <option <c:if test="${1 == room.room_status}">
                                                        selected</c:if>
                                                            value="1">Hoạt động
                                                    </option>
                                                    <option <c:if test="${0 == room.room_status}">
                                                        selected</c:if>
                                                            value="0">Đóng
                                                    </option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group form-group-sm">
                                            <label class="col-sm-3 control-label">Thông tin phòng</label>
                                            <div class="col-sm-7">
                                                <textarea class="form-control"
                                                          id="noidung"
                                                          name="info"
                                                          rows="5">${room.room_information}</textarea>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="form-group form-group-sm">
                                            <label class="col-sm-3 control-label">Homestay</label>
                                            <div class="col-sm-7">
                                                <select name="homestay_id"
                                                        class="form-control">
                                                    <c:forEach var="homestay" items="${homestay}">
                                                        <option
                                                                <c:if test="${homestay.homestay_id == room.homestay.homestay_id}">
                                                                    selected
                                                                </c:if>
                                                                value="${homestay.homestay_id}">
                                                                ${homestay.homestay_name}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group form-group-sm">
                                            <label class="col-sm-3 control-label">Điểm đánh giá</label>
                                            <div class="col-sm-7">
                                                <input class="form-control" value="${room.room_reviews}"
                                                       type="text"
                                                       disabled
                                                       name="fullname" placeholder="Địa chỉ">
                                            </div>
                                        </div>
                                        <div class="form-group form-group-sm">
                                            <label class="col-sm-3 control-label">Lượt đánh giá</label>
                                            <div class="col-sm-7">
                                                <input class="form-control" value="${room.room_number_reviews}"
                                                       type="text"
                                                       disabled
                                                       name="phone" placeholder="Địa chỉ">
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row col-sm-offset-3">
                                            <a href="${pageContext.servletContext.contextPath}/room/ad_room/${room.homestay_id}"
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
    CKEDITOR.replace('noidung');
</script>
</body>
</html>