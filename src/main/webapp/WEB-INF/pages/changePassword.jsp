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
            <%@include file="components/ad_info.jsp" %>
            <div class="col-md-9">
                <div class="row">
                    <div class="wrap-division">

                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <h3 class="panel-title">THÔNG TIN CÁ NHÂN</h3>
                            </div>
                            <span style="color: red">${message}</span>
                            <h3 style="color: red;" class="col-md-offset-3" id="res"></h3>
                            <div class="panel-body">
                                <div class="form-group form-group-sm">
                                    <label class="col-sm-2 control-label">Mật khẩu cũ</label>
                                    <div class="col-sm-9">
                                        <input class="form-control"
                                               name="pwd"
                                               id="pwd"
                                               required
                                               type="password">
                                    </div>
                                    <label class="col-sm-2 control-label">Mật khẩu mới</label>
                                    <div class="col-sm-9">
                                        <input class="form-control"
                                               required
                                               type="password"
                                               id="new_pwd"
                                               name="new_pwd">
                                    </div>
                                    <label class="col-sm-2 control-label">Xác nhận mật khẩu mới</label>
                                    <div class="col-sm-9">
                                        <input class="form-control"
                                               required
                                               type="password"
                                               id="confirm_pwd"
                                               name="confirm_pwd">
                                    </div>
                                    <div class="form-group form-group-sm">
                                        <label class="col-sm-2 control-label"></label>
                                        <div class="col-sm-9">
                                            <button id="ok" style="border-radius: 0" class="btn btn-default" type="submit">
                                                <span class="glyphicon glyphicon-ok"></span>
                                                Đổi thông tin
                                            </button>
                                            <a style="border-radius: 0" class="btn btn-default" href="/booking/history">
                                                <span class="glyphicon glyphicon-circle-arrow-left"></span>
                                                Quay lại
                                            </a>
                                        </div>
                                    </div>
                                </div>
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
    $(document).ready(function () {
        $('#ok').click(function () {
            var old_pwd = $('#pwd').val();
            var new_pwd = $('#new_pwd').val();
            var confirm_pwd = $('#confirm_pwd').val();
            $.ajax({
                type: 'POST',
                data: {old_pwd: old_pwd, new_pwd: new_pwd, confirm_pwd: confirm_pwd},
                url: '/change_pwd',
                success: function (result) {
                    $('#res').html(result);
                }
            })
        })
    });
</script>
</body>
</html>