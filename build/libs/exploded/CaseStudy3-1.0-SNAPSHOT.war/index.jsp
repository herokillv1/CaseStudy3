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
                <button type="button" class="btn btn-link1" data-toggle="modal" data-target=".bs-example-modal-lg">
                    Đăng ký
                </button>
                <button type="button" class="btn btn-link2" data-toggle="modal"
                        data-target=".bs-example-modal-md-login">
                    Đăng nhập
                </button>
            </div>
        </div>
    </div>
</header>
<!--đây là header-->

<!--đây là menu-->
<div class="container-fluid menu-navbar">
    <div class="container">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#">Navbar</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Home </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Link1</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Link2</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Link3</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Link4</a>
                    </li>
                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                </form>
            </div>
        </nav>
    </div>
</div>
<!--đây là menu-->

<div>
    <h1>hihihi</h1>
    <h1>hihihi</h1>
    <h1>hihihi</h1>
    <h1>hihihi</h1>
    <h1>hihihi</h1>
    <h1>hihihi</h1>
    <h1>hihihi</h1>
    <h1>hihihi</h1>
    <h1>hihihi</h1>
    <h1>hihihi</h1>
    <h1>hihihi</h1>
    <h1>hihihi</h1>
    <h1>hihihi</h1>
    <h1>hihihi</h1>
    <h1>hihihi</h1>
    <h1>hihihi</h1>
    <h1>hihihi</h1>
    <h1>hihihi</h1>
    <h1>hihihi</h1>
    <h1>hihihi</h1>
    <h1>hihihi</h1>
    <h1>hihihi</h1>
    <h1>hihihi</h1>
    <h1>hihihi</h1>
</div>

<!--đây là section-->
<div class="container">
    <div class="row">
        <c:forEach items="${listAllProduct}" var="products">
            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-3 col-xl-3 product">
                <img src="${products.imageUrl}" alt="không có" width="200px" height="200px">
                    ${products.getName()}
                    ${products.getPrice()}
                <a href="/users?action=edit&id=${products.getID}">Edit</a>
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
                                    <form action="/home" method="get">
                                        <div class="form-group">
                                            <label>
                                                <input type="text" class="form-control" name="product-name"
                                                       size="50"
                                                       value="${product.name}">
                                            </label>
                                        </div>
                                        <div class="form-group">
                                            <label>
                                                <input type="text" class="form-control" name="product-type"
                                                       size="50"
                                                       value="${product.price}">
                                            </label>
                                        </div>
                                        <div class="form-group">
                                            <label>
                                                <input type="text" class="form-control" name="product-price"
                                                       size="50"
                                                       value="${products}">
                                            </label>
                                        </div>
                                        <div class="form-group">
                                            <label>
                                                <input type="text" class="form-control"
                                                       name="product-description" size="50"
                                                       value="${products.name}">
                                            </label>
                                        </div>
                                        <div class="form-group">
                                            <label>
                                                <input type="text" class="form-control" name="product-imageurl"
                                                       size="50"
                                                       value="${products.name}">
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
                <button type="button" class="btn btn-link" data-toggle="modal"
                        data-target=".bs-example-modal-lg-edit">
                    Sửa
                </button>
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

<div class="back-to-header">
    <a href="#header">Về đầu trang</a>
</div>

</body>
</html>
