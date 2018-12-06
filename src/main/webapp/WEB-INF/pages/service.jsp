<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="components/header.jsp" %>
    <style>
        .form-control {
            margin-bottom: 5px;
        }
    </style>
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
                                <h3 class="panel-title">
                                    MUA DỊCH VỤ</h3>
                            </div>
                            <div class="panel-body">
                                <div class="row">
                                    <c:forEach items="${service}" var="service">
                                        <div class="col-sm-4">
                                            <div class="thumbnail">
                                                <img src="https://www.w3schools.com/w3images/fjords.jpg">
                                                <div class="caption">
                                                    <h3>Gói ${service.service_name}</h3>
                                                    <p>
                                                        <fmt:formatNumber pattern="###,###"
                                                                          type="number"
                                                                          value="${service.service_price}"/>
                                                        VNĐ
                                                    </p>
                                                    <a class="btn btn-default" data-toggle="modal"
                                                       data-target="#${service.service_id}">Mua</a>
                                                </div>
                                            </div>
                                        </div>

                                        <div id="${service.service_id}" class="modal fade" role="dialog">
                                            <div class="modal-dialog">

                                                <!-- Modal content-->
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal">&times;
                                                        </button>
                                                        <h4 class="modal-title">KÍCH HOẠT DỊCH VỤ</h4>
                                                    </div>
                                                    <form class="text-center"
                                                          method="get"
                                                          action="${pageContext.servletContext.contextPath}/service/pay">
                                                        <div class="modal-body">
                                                            <h2>Bạn muốn kích hoạt gói ${service.service_name}
                                                                với giá
                                                                <fmt:formatNumber pattern="###,###"
                                                                                  type="number"
                                                                                  value="${service.service_price}"/> VNĐ
                                                                cho homestay nào ?</h2>
                                                            <div class="form-group">
                                                                <div class="col-sm-offset-1 col-sm-10">
                                                                    <select name="homestay_id" class="form-control">
                                                                        <c:forEach var="list" items="${homestay}">
                                                                            <option value="${list.homestay_id}">
                                                                                    ${list.homestay_name}
                                                                            </option>
                                                                        </c:forEach>
                                                                    </select>
                                                                    <input type="hidden"
                                                                           name="service_id"
                                                                           value="${service.service_id}"/>
                                                                    <input type="hidden"
                                                                           name="price"
                                                                           value="${service.service_price}"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <button class="btn btn-default" type="submit">Thanh toán
                                                        </button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-info">
                            <div class="panel panel-heading">
                                <h3 class="panel-title">
                                    LỊCH SỬ THANH TOÁN</h3>
                            </div>
                            <div class="panel-body">
                                <table class="table table-hover">
                                    <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Tên homestay</th>
                                        <th>Gói</th>
                                        <th>Ngày đăng ký</th>
                                        <th>Ngày kết thúc</th>
                                        <th>Giá</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${reg}" var="reg" varStatus="loop">
                                        <tr>
                                            <td>
                                                ${loop.index}
                                            </td>
                                            <td>
                                                ${reg.homestay.homestay_name}
                                            </td>
                                            <td>
                                                ${reg.buy.service_name}
                                            </td>
                                            <td>
                                                ${reg.date_started}
                                            </td>
                                            <td>
                                                ${reg.date_finished}
                                            </td>
                                            <td>
                                                ${reg.price} $
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
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