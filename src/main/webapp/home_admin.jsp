<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 9/4/2020
  Time: 9:09 AM
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
    <link rel="stylesheet" href="css/main.css">
    <script src="js/main.js"></script>
    <link rel="stylesheet" href="css/all.css">
    <script src="js/all.js"></script>
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
                Xin chào  ${requestScope["account"]}
                <a href="${pageContext.request.contextPath}/home" class="customer-link">  Thoát</a>
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
                        <a class="nav-link" href="${pageContext.request.contextPath}/home">Trang chủ</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/product?action=shirt">Áo</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/product?action=trousers">Quần</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/product?action=shoes">Giày</a>
                    </li>
                </ul>
                <form class="form-inline my-2 my-lg-0"
                      action="${pageContext.request.contextPath}/product?action=searchHome" method="post">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search"
                           name="regex">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                </form>
            </div>
        </nav>
    </div>
</div>
<!--đây là menu-->

<!--đây là section-->
<div class="container">
    <div class="row">
        <jsp:useBean id="listAllProduct" scope="request" type="java.util.List"/>
        <c:forEach items="${listAllProduct}" var="products">
            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-3 col-xl-3 product">
                <div class="block-image-product">
                    <img src="${products.getImageUrl()}" class="img-responsive img-thumbnail" alt="không có"
                         width="300px" height="300px">
                </div>
                <div class="block-image-product" style="text-align: center; margin-top: 10px">
                        ${products.getName()}
                </div>
                <div class="block-image-product" style="text-align: center">
                        ${products.getPrice()}
                </div>
                <div class="block-button" style="text-align: center">
                    <a href="${pageContext.request.contextPath}/product?action=delete&id=${products.getID()}">Delete</a>
                    <a href="${pageContext.request.contextPath}/product?action=edit&id=${products.getID()}">Edit</a>

                </div>

                    <%--đây là form edit product--%>
                <div class="modal fade bs-example-modal-lg-edit" tabindex="-1" role="dialog"
                     aria-labelledby="myLargeModalLabel">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div class="row">
                                <div class="col-lg-5 col-xl-5 block-image">
                                    <img src="${products.imageUrl}" alt="Lỗi hiển thị" class="img-responsive"
                                         width="300px" height="500px" style="margin: 20px">
                                </div>
                                <div class="col-lg-6 col-xl-6 block-contact">
                                    <h3 style="text-align: center">Edit product</h3>
                                    <form action="${pageContext.request.contextPath}/product?action=edit&id=${products.getID()}"
                                          method="get">
                                        <div class="form-group">
                                            <label>
                                                <input type="text" class="form-control" name="product-name"
                                                       size="50"
                                                       value="${products.getName()}">
                                            </label>
                                        </div>
                                        <div class="form-group">
                                            <label>
                                                <input type="text" class="form-control" name="product-type"
                                                       size="50"
                                                       value="${products.getPrice()}">
                                            </label>
                                        </div>
                                        <div class="form-group">
                                            <label>
                                                <input type="text" class="form-control" name="product-price"
                                                       size="50"
                                                       value="${products.getProductType()}">
                                            </label>
                                        </div>
                                        <div class="form-group">
                                            <label>
                                                <input type="text" class="form-control"
                                                       name="product-description" size="50"
                                                       value="${products.getDescription()}">
                                            </label>
                                        </div>
                                        <div class="form-group">
                                            <label>
                                                <input type="text" class="form-control" name="product-imageurl"
                                                       size="50"
                                                       value="${products.getImageUrl()}">
                                            </label>
                                        </div>
                                        <div class="form-group" style="text-align: center">
                                            <input type="submit" class="btn btn-primary" value="Edit">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                    <%--đây là form edit product--%>
            </div>
        </c:forEach>
    </div>
</div>
<!--đây là section-->

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

<!--đây là đăng nhập-->
<div class="modal fade bs-example-modal-md-login" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
    <div class="modal-dialog modal-md" role="document">
        <div class="modal-content">
            <div class="row">
                <div class="col-lg-1 col-xl-1 empty-block"></div>
                <div class="col-lg-10 col-xl-10 block-login">
                    <h3 style="text-align: center">Đăng nhập</h3>
                    <form action="${pageContext.request.contextPath}/login?action=login" method="post">
                        <table>
                            <tr>
                                <td><label><span>Tài khoản:&nbsp;</span></label></td>
                                <td><label>
                                    <input type="text" class="form-control" placeholder="Enter your account"
                                           name="customer-account" size="35" required="">
                                </label></td>
                            </tr>
                            <tr>
                                <td><label><span>Mật khẩu:&nbsp;</span></label></td>
                                <td><label>
                                    <input type="password" class="form-control" placeholder="Enter your password"
                                           name="customer-password" size="35" required="">
                                </label></td>
                            </tr>
                        </table>
                        <div class="form-group" style="text-align: center">
                            <input type="submit" class="btn btn-primary" value="Đăng nhập">
                        </div>
                        <label>
                            <span>Bạn chưa có tài khoản?&nbsp;</span>
                            <button type="button" class="btn btn-link" data-toggle="modal"
                                    data-target=".bs-example-modal-lg">
                                Tạo tài khoản
                            </button>
                        </label>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!--đây là đăng nhập-->

<!--đây là đăng ký-->
<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="row">
                <div class="col-lg-5 col-xl-5 block-image">
                    <img src="img/logo.png" alt="Lỗi hiển thị" class="img-responsive"
                         width="300px" height="500px" style="margin: 20px">
                </div>
                <div class="col-lg-6 col-xl-6 block-contact">
                    <h3 style="text-align: center">Đăng ký</h3>
                    <form action="${pageContext.request.contextPath}/login?action=registration" method="post">
                        <div class="form-group">
                            <label>
                                <input type="text" class="form-control" placeholder="Enter your name"
                                       required="" name="customer-name" size="50">
                            </label>
                        </div>
                        <div class="form-group">
                            <label>
                                <input type="number" class="form-control" placeholder="Enter your age"
                                       required="" name="customer-age">
                            </label>
                        </div>
                        <div class="form-group">
                            <label>
                                <input type="text" class="form-control" required=""
                                       placeholder="Enter your phone-number" name="customer-phone"
                                       size="50">
                            </label>
                        </div>
                        <div class="form-group">
                            <label>
                                <input type="email" class="form-control" required=""
                                       placeholder="Enter your email" name="customer-email" size="50">
                            </label>
                        </div>
                        <div class="form-group">
                            <label>
                                <input type="text" class="form-control" required=""
                                       placeholder="Enter your address" name="customer-address" size="50">
                            </label>
                        </div>
                        <div class="form-group">
                            <label>
                                <input type="radio" id="male" name="customer-gender" value="male" required="">
                                <label for="male">Male</label>
                                <input type="radio" id="female" name="customer-gender" value="female" required="">
                                <label for="female">Female</label>
                                <input type="radio" id="other" name="customer-gender" value="other" required="">
                                <label for="other">Other</label>
                            </label>
                        </div>
                        <div class="form-group">
                            <label>
                                <input type="text" class="form-control" required=""
                                       placeholder="Enter your account" name="customer-acc" size="50">
                            </label>
                        </div>
                        <div class="form-group">
                            <label>
                                <input type="password" class="form-control" required=""
                                       placeholder="Enter your password" name="customer-pass" size="50">
                            </label>
                        </div>
                        <div class="form-group" style="text-align: center">
                            <input type="submit" class="btn btn-primary" value="Tạo tài khoản">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!--đây là đăng ký-->
</body>
</html>
