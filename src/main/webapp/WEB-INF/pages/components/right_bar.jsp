<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="side search-wrap animate-box">
    <h3 class="sidebar-heading">Tìm căn hộ cho bạn</h3>
    <form method="get" action="/room/search" class="colorlib-form">
        <div class="row">
            <div class="col-md-12">
                <div class="form-group">
                    <label for="date">Ngày nhận:</label>
                    <div class="form-field">
                        <i class="icon icon-calendar2"></i>
                        <input type="text" value="${sessionScope.check_in}"
                               name="check-in"
                               id="date"
                               class="form-control date"
                               autocomplete="off"
                               placeholder="Ngày nhận">
                    </div>
                    <input type="hidden" name="guest" value="1">
                </div>
            </div>
            <div class="col-md-12">
                <div class="form-group">
                    <label for="date">Ngày trả: </label>
                    <div class="form-field">
                        <i class="icon icon-calendar2"></i>
                        <input type="text" value="${sessionScope.check_out}" id="date"
                               class="form-control date"
                               name="check-out"
                               autocomplete="off"
                               placeholder="Ngày trả">
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <div class="form-group">
                    <label>Điểm đến</label>
                    <div class="form-field">
                        <i class="icon icon-arrow-down3"></i>
                        <select name="location" class="form-control">
                            <option style="background-color: #eee; color: #0b0b0b" value="1">Nha Trang</option>
                            <option style="background-color: #eee; color: #0b0b0b" value="2">Đà Lạt</option>
                            <option style="background-color: #eee; color: #0b0b0b" value="3">Đà Nẵng</option>
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
