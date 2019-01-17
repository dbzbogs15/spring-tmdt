<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="components/header.jsp" %>
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
<div id="colorlib-contact">
    <div class="container">
        <div class="row">
            <div class="col-md-10 col-md-offset-1 animate-box">
                <h3>Reset mật khẩu</h3>
                <h4 style="color: red">${message}</h4>
                <form action="/reset" method="post">
                    <input type="hidden" name="token" value="${token}">
                    <div class="form-group">
                        <label for="pwd">Mật khẩu mới</label>
                        <input type="password"
                               class="form-control"
                               id="pwd"
                               name="password">
                    </div>
                    <div class="form-group">
                    <label for="pwd">Xác nhận mật khẩu mới:</label>
                    <input type="password"
                           class="form-control"
                           id="pwd">
            </div>
                    <button type="submit" class="btn btn-default">Gửi</button>
                </form>
                <a href="/login" style="color: #0000cc">Đăng nhập</a> hoặc
                <a href="/register" style="color: #0000cc">Đăng ký</a>
            </div>
        </div>
    </div>
</div>
<%@include file="components/footer.jsp" %>
</body>
</html>