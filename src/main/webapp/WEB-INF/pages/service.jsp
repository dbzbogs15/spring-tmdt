<%@ page import="com.tmdt.model.Homestay" %>
<%@ page import="com.tmdt.model.RegisterService" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Collections" %>
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

                        <c:if test="${message != null}">
                            <h1>${message}</h1>
                            <a href="#lichsu"
                                class="btn btn-default">
                                Click để xem chi tiết
                            </a>
                        </c:if>
                        <div id="service" class="panel panel-info">
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
                                                        $
                                                    </p>
                                                    <a class="btn btn-default" data-toggle="modal"
                                                       data-target="#${service.service_id}">
                                                        <span class="glyphicon glyphicon-shopping-cart"></span>
                                                        Mua</a>
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
                                                                                  value="${service.service_price}"/> USD
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
                                                                <div class="col-sm-offset-1 col-sm-10">
                                                                    <h3 style="color: blue;">
                                                                        <span class="glyphicon glyphicon-hand-right"></span>
                                                                        Nếu homestay vẫn còn thời gian chạy quảng cáo thì sẽ cộng dồn thời khi đăng ký thêm
                                                                    </h3>
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
                            <div class="panel-heading">
                                <h3 class="panel-title">TRẠNG THÁI DỊCH VỤ</h3>
                            </div>
                            <div class="panel-body">
                                <%--<div class="row">--%>
                                <%--<c:forEach var="homestay" items="${homestay}">--%>
                                <%--&lt;%&ndash;<fmt:parseDate value="${nows}" pattern="yyyy-MM-dd" var="nows"/>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<fmt:formatDate value="${nows}"&ndash;%&gt;--%>
                                <%--&lt;%&ndash;var="nows"&ndash;%&gt;--%>
                                <%--&lt;%&ndash;pattern="yyyy-MM-dd"/>&ndash;%&gt;--%>
                                <%--<div class="col-md-4">--%>
                                <%--<div class="thumbnail" style="height: 350px;">--%>
                                <%--<a href="/w3images/nature.jpg">--%>
                                <%--<img src="https://www.w3schools.com/w3images/fjords.jpg"--%>
                                <%--alt="Nature"--%>
                                <%--style="width:100%">--%>
                                <%--<div class="caption">--%>
                                <%--&lt;%&ndash;<c:if test="${nows < i.date_finished}">&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<button class="btn btn-default">&ndash;%&gt;--%>
                                <%--&lt;%&ndash;Dịch vụ đang chạy&ndash;%&gt;--%>
                                <%--&lt;%&ndash;</button>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;</c:if>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<p>Ngày kết thúc: ${i.date_finished}}</p>&ndash;%&gt;--%>
                                <%--<c:forEach items="${running}" var="running">--%>
                                <%--<c:choose>--%>
                                <%--<c:when test="${running.homestay_id == homestay.homestay_id}">--%>
                                <%--<div class="btn btn-default" style="width: 100%">--%>
                                <%--Đang chạy--%>
                                <%--</div>--%>
                                <%--</c:when>--%>
                                <%--<c:when test="${running.homestay_id != homestay.homestay_id}">--%>
                                <%--<div class="btn btn-default" style="width: 100%">--%>
                                <%--Chưa có dịch vụ--%>
                                <%--</div>--%>
                                <%--</c:when>--%>
                                <%--<c:otherwise>--%>
                                <%--</c:otherwise>--%>
                                <%--</c:choose>--%>
                                <%--</c:forEach>--%>
                                <%--<p>${homestay.homestay_name}</p>--%>
                                <%--<p>${homestay.homestay_id}</p>--%>
                                <%--</div>--%>
                                <%--</a>--%>
                                <%--</div>--%>
                                <%--</div>--%>
                                <%--</c:forEach>--%>
                                <%--</div>--%>
                                <div class="row">
                                    <%
                                        List<Homestay> homestays = (List<Homestay>) request.getAttribute("homestay");
                                        List<Integer> running = (List<Integer>) request.getAttribute("running");
                                        List<RegisterService> reg = (List<RegisterService>) request.getAttribute("reg");
                                        List<RegisterService> runObj = (List<RegisterService>) request.getAttribute("runObj");
                                        Collections.reverse(runObj);
                                        for (Homestay h : homestays) {
                                    %>
                                    <div class="col-md-4">
                                        <div class="thumbnail" style="height: 350px;">
                                            <a>
                                                <img src="/resources/<%=h.getHomestay_image()%>"
                                                     alt="Nature"
                                                     style="width:100%; height: 170px">
                                                <div class="caption">
                                                    <%
                                                        if (running.contains(h.getHomestay_id())) {
                                                    %>
                                                    <a class="btn btn-default"
                                                       href="#lichsu"
                                                       style="width: 100%">
                                                        <span class="glyphicon glyphicon-time"></span>
                                                        Đang chạy
                                                    </a>
                                                    <%
                                                    } else {
                                                    %>
                                                    <a class="btn btn-default"
                                                       href="#service"
                                                       style="width: 100%">
                                                        <span class="glyphicon glyphicon-off"></span>
                                                        Chưa có dịch vụ
                                                    </a>
                                                    <%
                                                        }
                                                    %>
                                                    <hr>
                                                    <p class="label label-primary"
                                                       style="position: absolute; bottom: 5%">
                                                        <%
                                                            if (running.contains(h.getHomestay_id())) {
                                                                for (RegisterService r : runObj) {
                                                                    if (r.getHomestay_id() == h.getHomestay_id()) {
                                                                        out.print("Ngày kết thúc: " + r.getDate_finished());
                                                                        break;
                                                                    }
                                                                }
                                                            } else {
                                                                out.print("Chưa đăng ký");
                                                            }
                                                        %>
                                                    </p>
                                                    <p><%out.print(h.getHomestay_name()); %></p>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                    <%
                                        }
                                    %>
                                </div>
                            </div>
                        </div>
                        <div id="lichsu" class="panel panel-info">
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
                                        <th>Giá</th>
                                        <th>Action</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${reg}" var="reg" varStatus="loop">
                                        <tr>
                                            <td>
                                                    ${loop.index}
                                            </td>
                                            <td width="40%">
                                                    ${reg.homestay.homestay_name}
                                            </td>
                                            <td>
                                                    ${reg.buy.service_name}
                                            </td>
                                            <td>
                                                    ${reg.price} $
                                            </td>
                                            <td>
                                                <a class="btn btn-default"
                                                   data-toggle="modal" data-target="#my${loop.index}"
                                                >
                                                    Xem chi tiết
                                                </a>
                                                <c:if test="${loop.index == 0}">
                                                <img src="/resources/images/1_new_4a.gif">
                                                </c:if>
                                            </td>
                                        </tr>
                                        <div id="my${loop.index}" class="modal fade" role="dialog">
                                            <div class="modal-dialog">

                                                <!-- Modal content-->
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                        <h4 class="modal-title">Thông tin thanh toán</h4>
                                                    </div>
                                                    <div class="modal-body">
                                                        <p>Tên homestay: <b>${reg.homestay.homestay_name}</b></p>
                                                        <p>Ngày đăng ký: <b>${reg.date_started}</b></p>
                                                        <p>Ngày kết thúc dịch vụ: <b>${reg.date_finished}</b></p>
                                                        <p>Phí thanh toán: <b>${reg.price} USD</b></p>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
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