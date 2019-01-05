<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<footer id="colorlib-footer" role="contentinfo">
    <div class="container">
        <div class="row row-pb-md">
            <div class="col-md-3 colorlib-widget">
                <h4>Tour Agency</h4>
                <p>Facilis ipsum reprehenderit nemo molestias. Aut cum mollitia reprehenderit. Eos cumque dicta adipisci
                    architecto culpa amet.</p>
                <p>
                <ul class="colorlib-social-icons">
                    <li><a href="#"><i class="icon-twitter"></i></a></li>
                    <li><a href="#"><i class="icon-facebook"></i></a></li>
                    <li><a href="#"><i class="icon-linkedin"></i></a></li>
                    <li><a href="#"><i class="icon-dribbble"></i></a></li>
                </ul>
                </p>
            </div>
            <div class="col-md-2 colorlib-widget">
                <h4>Book Now</h4>
                <p>
                <ul class="colorlib-footer-links">
                    <li><a href="#">Flight</a></li>
                    <li><a href="#">Hotels</a></li>
                    <li><a href="#">Tour</a></li>
                    <li><a href="#">Car Rent</a></li>
                    <li><a href="#">Beach &amp; Resorts</a></li>
                    <li><a href="#">Cruises</a></li>
                </ul>
                </p>
            </div>
            <div class="col-md-2 colorlib-widget">
                <h4>Top Deals</h4>
                <p>
                <ul class="colorlib-footer-links">
                    <li><a href="#">Edina Hotel</a></li>
                    <li><a href="#">Quality Suites</a></li>
                    <li><a href="#">The Hotel Zephyr</a></li>
                    <li><a href="#">Da Vinci Villa</a></li>
                    <li><a href="#">Hotel Epikk</a></li>
                </ul>
                </p>
            </div>
            <div class="col-md-2">
                <h4>Blog Post</h4>
                <ul class="colorlib-footer-links">
                    <li><a href="#">The Ultimate Packing List For Female Travelers</a></li>
                    <li><a href="#">How These 5 People Found The Path to Their Dream Trip</a></li>
                    <li><a href="#">A Definitive Guide to the Best Dining and Drinking Venues in the City</a></li>
                </ul>
            </div>

            <div class="col-md-3 col-md-push-1">
                <h4>Contact Information</h4>
                <ul class="colorlib-footer-links">
                    <li>291 South 21th Street, <br> Suite 721 New York NY 10016</li>
                    <li><a href="tel://1234567920">+ 1235 2355 98</a></li>
                    <li><a href="mailto:info@yoursite.com">info@yoursite.com</a></li>
                    <li><a href="#">yoursite.com</a></li>
                </ul>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 text-center">
                <p>
                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    Copyright &copy;
                    <script>document.write(new Date().getFullYear());</script>
                    All rights reserved | This template is made with <i
                        class="icon-heart2" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></span>
                    <span class="block">Demo Images: <a href="http://unsplash.co/" target="_blank">Unsplash</a> , <a
                            href="http://pexels.com/"
                            target="_blank">Pexels.com</a></span>
                </p>
            </div>
        </div>
    </div>
</footer>
</div>

<div class="gototop js-top">
    <a href="#" class="js-gotop"><i class="icon-arrow-up2"></i></a>
</div>
<!-- Load Facebook SDK for JavaScript -->
<div id="fb-root"></div>
<script>
    window.fbMessengerPlugins = window.fbMessengerPlugins || {
        init: function () {
            FB.init({
                appId            : '205308183714279',
                autoLogAppEvents : true,
                xfbml            : true,
                version          : 'v2.10'
            });
        }, callable: []
    };
    window.fbAsyncInit = window.fbAsyncInit || function () {
        window.fbMessengerPlugins.callable.forEach(function (item) { item(); });
        window.fbMessengerPlugins.init();
    };
    setTimeout(function () {
        (function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) { return; }
            js = d.createElement(s);
            js.id = id;
            js.src = "https://connect.facebook.net/en_US/sdk/xfbml.customerchat.js";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));
    }, 0);
</script>

<div
        class="fb-customerchat"
        page_id="164884314147621"
        ref="">
</div>
<!-- jQuery -->
<script src="${pageContext.servletContext.contextPath}/resources/js/jquery.min.js"></script>
<!-- jQuery Easing -->
<script src="${pageContext.servletContext.contextPath}/resources/js/jquery.easing.1.3.js"></script>
<!-- Bootstrap -->
<script src="${pageContext.servletContext.contextPath}/resources/js/bootstrap.min.js"></script>
<!-- Waypoints -->
<script src="${pageContext.servletContext.contextPath}/resources/js/jquery.waypoints.min.js"></script>
<!-- Flexslider -->
<script src="${pageContext.servletContext.contextPath}/resources/js/jquery.flexslider-min.js"></script>
<!-- Owl carousel -->
<script src="${pageContext.servletContext.contextPath}/resources/js/owl.carousel.min.js"></script>
<!-- Magnific Popup -->
<script src="${pageContext.servletContext.contextPath}/resources/js/jquery.magnific-popup.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/resources/js/magnific-popup-options.js"></script>
<!-- Date Picker -->
<script src="${pageContext.servletContext.contextPath}/resources/js/bootstrap-datepicker.js"></script>
<!-- Stellar Parallax -->
<script src="${pageContext.servletContext.contextPath}/resources/js/jquery.stellar.min.js"></script>
<!-- Main -->
<script src="${pageContext.servletContext.contextPath}/resources/js/main.js"></script>