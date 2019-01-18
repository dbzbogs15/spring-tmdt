<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
            transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
            margin-bottom: 5px;
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
            <%@include file="components/ad_info.jsp"%>
            <div class="col-md-9">
                <div class="row">
                    <div class="wrap-division">

                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <h3 class="panel-title">THÔNG TIN CÁ NHÂN</h3>
                            </div>
                            <span style="color: red">${message}</span>
                            <div class="panel-body">
                                <form action="/ucp"
                                      enctype="multipart/form-data"
                                      method="post">
                                    <div class="form-group form-group-sm">
                                        <div class="col-sm-offset-2">
                                            <img src="/resources/${sessionScope.user.user_image}"
                                                 id="imgshow"
                                                 style="width: 587px; margin-left: 13px"
                                                 class="thumbnail">
                                        </div>
                                    </div>
                                    <label class="col-sm-2 control-label">Ảnh đại diện</label>
                                    <div class="col-sm-9">
                                        <input class="form-control"
                                               id="imgload"
                                               type="file"
                                               name="avatar">
                                    </div>
                                    <div class="form-group form-group-sm">
                                        <label class="col-sm-2 control-label">Email</label>
                                        <div class="col-sm-9">
                                            <input class="form-control"
                                                   value="${sessionScope.user.user_email}"
                                                   name="email"
                                                   required
                                                   type="email">
                                        </div>
                                        <label class="col-sm-2 control-label">Họ và tên</label>
                                        <div class="col-sm-9">
                                            <input class="form-control"
                                                   value="${sessionScope.user.user_fullname}"
                                                   required
                                                   type="text" name="name">
                                        </div>
                                        <label class="col-sm-2 control-label">Địa chỉ</label>
                                        <div class="col-sm-9">
                                        <textarea class="form-control"
                                                  rows="4"
                                                  name="address"
                                                  required
                                        >${sessionScope.user.user_address}</textarea>
                                        </div>
                                        <label class="col-sm-2 control-label">Số điện thoại</label>
                                        <div class="col-sm-9">
                                            <input class="form-control"
                                                   value="${sessionScope.user.user_phone}"
                                                   type="text"
                                                   required
                                                   name="phone">
                                        </div>
                                    </div>
                                    <div class="form-group form-group-sm">
                                        <label class="col-sm-2 control-label"></label>
                                        <div class="col-sm-9">
                                            <button style="border-radius: 0" class="btn btn-danger" type="submit">
                                                <span class="glyphicon glyphicon-ok"></span>
                                                Đổi thông tin
                                            </button>
                                            <button style="border-radius: 0" class="btn btn-default" type="submit">
                                                <span class="glyphicon glyphicon-circle-arrow-left"></span>
                                                Quay lại
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
</body>
</html>