<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 08/31/2020
  Time: 12:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../css/main.css">
    <script src="../js/main.js"></script>
    <link rel="stylesheet" href="../css/all.css">
    <script src="../js/all.js"></script>
</head>
<body>

<!--đây là header-->
<header>
    <div class="container-fluid header" id="header">
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-lg-2 col-xl-2 block-image">
            </div>
            <div class="col-xs-12 col-sm-12 col-lg-8 col-xl-8 block-background">
                <h1 class="name-shop">Shop HQ</h1>
                <br>
                <div class="container-ef">
                    <div class="text"><span>Chào mừng bạn đến với shop HQ chuyên Adidas</span></div>
                </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-lg-2 col-xl-2 block-login">
                <c:if test='${requestScope["account"] != null}'>
                    <a href="${pageContext.request.contextPath}/customer?action=customer&account=${requestScope["account"]}"
                       class="customer-link"><span>Xin chào ${requestScope["name"]}</span></a>
                    <span>&ensp;|&ensp;</span>
                </c:if>
                <a href="${pageContext.request.contextPath}/home" class="customer-link">Thoát</a>
            </div>
        </div>
    </div>
</header>
<!--đây là header-->

<!--đây là menu-->
<div class="container-fluid menu-navbar">
    <div class="container">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="${pageContext.request.contextPath}/customer?account=${requestScope["account"]}">Trang chủ</a>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
</div>
<!--đây là menu-->

<!--đây là section-->
<div class="container">
    <c:if test='${requestScope["mess"] != null}'>
        <div class="col-xs-1 col-sm-1 col-md-1 col-lg-3 col-xl-3"></div>
        <div class="col-xs-11 col-sm-11 col-md-11 col-lg-9 col-xl-9">
            <img class="img-responsive img-thumbnail" src="/img/meomeomeo.jpg" alt="ko có" width="550px" height="200px">
        </div>
    </c:if>
    <c:if test='${requestScope["message"] != null}'>
        <div class="col-xs-1 col-sm-1 col-md-1 col-lg-3 col-xl-3"></div>
        <div class="col-xs-11 col-sm-11 col-md-11 col-lg-9 col-xl-9">
            <img class="img-responsive img-thumbnail" src="/img/meomeomeo.jpg" alt="ko có" width="550px" height="200px">
        </div>
    </c:if>
    <jsp:useBean id="listOrder" scope="request" type="java.util.List"/>
    <c:forEach items="${listOrder}" var="orders">
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-3 col-xl-3 order" style="border: solid 1px lightgrey">
            <div class="block-image-product">
                <img src="${orders.getImagebuy()}" class="img-responsive img-thumbnail" alt="không có"
                     width="300px" height="300px">
            </div>
            <div class="block-name-product" style="text-align: center; margin-top: 10px">
                    ${orders.getNamebuy()}
            </div>
            <div class="block-price-product" style="text-align: center">
                    ${orders.getPricebuy()}
            </div>
            <div class="block-description-product" style="text-align: center">
                    ${orders.getDescriptionbuy()}
            </div>
            <div class="block-amount-product" style="height: 30px; text-align: center">
                <input type="number" class="form-control" name="customer-account"
                       value="${orders.getAmountbuy()}">
            </div>
        </div>
    </c:forEach>
</div>
<!--đây là section-->
<br>
<br>
<%--tổng tiền--%>
<div class="container">
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12 total-amount">
            <c:if test='${requestScope["totalPrice"] != null}'>
                <h3>&ensp;Tổng tiền : ${requestScope["totalPrice"]}</h3>
            </c:if>
        </div>
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-2 col-xl-2 total-amount">
            <a href="">&ensp;&ensp;Thanh toán</a>
        </div>
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-2 col-xl-2 total-amount">
            <a href="${pageContext.request.contextPath}/order?action=delete&account=${requestScope["account"]}">Hủy</a>
        </div>
    </div>
</div>
<%--tổng tiền--%>

<!--đây là footer-->
<footer class="page-footer font-small special-color-dark pt-4">
    <div class="container">
        <ul class="list-unstyled list-inline text-center">
            <li class="list-inline-item">
                <a class="btn-floating btn-fb mx-1" href="https://www.facebook.com/ShopHQCodeGym/">
                    <i class="fab fa-facebook-f"> </i>
                </a>
            </li>
            <li class="list-inline-item">
                <a class="btn-floating btn-gplus mx-1">
                    <i class="fab fa-google-plus-g"> </i>
                </a>
            </li>
            <li class="list-inline-item">
                <a class="btn-floating btn-tw mx-1">
                    <i class="fab fa-tiktok"> </i>
                </a>
            </li>
            <li class="list-inline-item">
                <a class="btn-floating btn-li mx-1">
                    <i class="fab fa-youtube"> </i>
                </a>
            </li>
        </ul>
    </div>
    <div class="footer-copyright text-center py-3">© 2020
        All rights reserved:
        <a href="#"> ShopHQ.com</a>
    </div>
</footer>
<!--đây là footer-->

<!--hiệu ứng-->
<div class="back-to-header">
    <a href="#header">Về đầu trang</a>
</div>
<!--hiệu ứng-->
</body>
</html>