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
    <div class="container-fluid header" id="header" style="border-bottom: solid 4px lightgrey">
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
                        <a class="nav-link" href="${pageContext.request.contextPath}/admin?account=${requestScope["account"]}">Trang
                            chủ</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/admin?action=shirt&type=Áo&account=${requestScope["account"]}">Áo</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/admin?action=trousers&type=Quần&account=${requestScope["account"]}">Quần</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/admin?action=shoes&type=Giày&account=${requestScope["account"]}">Giày</a>
                    </li>
                </ul>
                <form class="form-inline my-2 my-lg-0"
                      action="${pageContext.request.contextPath}/admin?action=search&account=${requestScope["account"]}"
                      method="post">
                    <button class="btn btn-primary" type="button" data-toggle="modal" data-target=".bs-example-modal-lg-create"><font color="black" size="+1">Thêm</font></button>
                    <p>&nbsp;&nbsp;</p>
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
        <c:if test='${requestScope["mess"] != null}'>
            <div class="col-xs-1 col-sm-1 col-md-1 col-lg-3 col-xl-3"></div>
            <div class="col-xs-11 col-sm-11 col-md-11 col-lg-9 col-xl-9">
                <img class="img-responsive img-thumbnail" src="/img/meomeomeo.jpg" alt="ko có" width="550px" height="200px">
            </div>
        </c:if>
        <jsp:useBean id="listAllProduct" scope="request" type="java.util.List"/>
        <c:forEach items="${listAllProduct}" var="products">
            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-3 col-xl-3 product">
                <div class="block-image-product" style="position: relative">
                    <img src="${products.getImageUrl()}" class="img-responsive img-thumbnail" alt="không có"
                         width="300px" height="300px">
                    <div class="block-status-product" style="height: 30px; text-align: center ; position: absolute ; top: 10px ; left: 10px ;background-color: #ff253a">
                        <h5>
                            <c:if test='${products.getAmount() == 0}'>
                                <span style="color: white ; margin: 5px">Hết hàng</span>
                            </c:if>
                        </h5>
                    </div>
                </div>
                <div class="block-name-product" style="text-align: center; margin-top: 10px">
                        ${products.getName()}
                </div>
                <div class="block-price-product" style="text-align: center">
                        ${products.getPrice()}
                </div>
                <div class="block-button" style="text-align: center">
                    <a href="${pageContext.request.contextPath}/admin?action=delete&id=${products.getID()}&account=${requestScope["account"]}"><i class="fa fa-trash"></i>&ensp;&ensp;</a>
                    <a href="${pageContext.request.contextPath}/admin?action=edit&id=${products.getID()}&account=${requestScope["account"]}"><i class="fa fa-edit"></i></a>
                </div>
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

<!--tạo sản phẩm mới-->
<div class="modal fade bs-example-modal-lg-create" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="row">
                <div class="col-lg-5 col-xl-5 block-image">
                    <img src="img/logo.png" alt="Lỗi hiển thị" class="img-responsive"
                         width="300px" height="500px" style="margin: 20px">
                </div>
                <div class="col-lg-6 col-xl-6 block-contact">
                    <h3 style="text-align: center">Đăng ký</h3>
                    <form action="${pageContext.request.contextPath}/control?action=createProduct&account=${requestScope["account"]}" method="post">
                        <div class="form-group">
                            <label>
                                <input type="text" class="form-control" placeholder="Enter code product"
                                       required="" name="product-code" size="50">
                            </label>
                        </div>
                        <div class="form-group">
                            <label>
                                <input type="text" class="form-control" placeholder="Enter name product"
                                       required="" name="product-name" size="50">
                            </label>
                        </div>
                        <div class="form-group">
                            <label>
                                <input type="text" class="form-control" placeholder="Enter type product"
                                       required="" name="product-type" size="50">
                            </label>
                        </div>
                        <div class="form-group">
                            <label>
                                <input type="text" class="form-control" required=""
                                       placeholder="Enter price product" name="product-price" size="50">
                            </label>
                        </div>
                        <div class="form-group">
                            <label>
                                <input type="text" class="form-control" required=""
                                       placeholder="Enter description product" name="product-description" size="50">
                            </label>
                        </div>
                        <div class="form-group">
                            <label>
                                <input type="text" class="form-control" required=""
                                       placeholder="Enter image product" name="product-imageUrl" size="50">
                            </label>
                        </div>
                        <div class="form-group">
                            <label>
                                <input type="text" class="form-control" required=""
                                       placeholder="Enter amount product" name="product-amount" size="50">
                            </label>
                        </div>
                        <div class="form-group" style="text-align: center">
                            <input type="submit" class="btn btn-primary" value="Create New Product">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!--tạo sản phẩm mới-->

<%--dialog box for delete--%>
<c:if test='${requestScope["product"] != null}'>
    <div id="deleteModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Thông báo</h4>
                </div>
                <div class="modal-body">
                    <p>Bạn muốn xóa sản phẩm?</p>
                </div>
                <div class="modal-footer">
                    <a href="${pageContext.request.contextPath}/control?action=deleteProduct&id=${requestScope["product"].getID()}&account=${requestScope["account"]}">Xác nhận</a>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</c:if>
<c:if test='${requestScope["controller"] != null}'>
    <script type="text/javascript">
        $(window).on('load',function(){
            $('#${requestScope["controller"]}').modal('show');
        });
    </script>
</c:if>
<%--dialog box for delete--%>

<%--dialog box for edit--%>
<c:if test='${requestScope["product"] != null}'>
    <div class="modal fade bs-example-modal-lg-edit" role="dialog" id="editModal"
         aria-labelledby="myLargeModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="row">
                    <div class="col-lg-5 col-xl-5 block-image">
                        <img src="${requestScope["product"].imageUrl}" alt="Lỗi hiển thị" class="img-responsive"
                             width="300px" height="500px" style="margin: 20px">
                    </div>
                    <div class="col-lg-6 col-xl-6 block-contact">
                        <h3 style="text-align: center">Edit product</h3>
                        <form action="${pageContext.request.contextPath}/control?action=editProduct&id=${requestScope["product"].getID()}&account=${requestScope["account"]}" method="post">
                            <div class="form-group">
                                <label>
                                    <input type="text" class="form-control" name="product-code"
                                           size="50"
                                           value="${requestScope["product"].getCode()}">
                                </label>
                            </div>
                            <div class="form-group">
                                <label>
                                    <input type="text" class="form-control" name="product-name"
                                           size="50"
                                           value="${requestScope["product"].getName()}">
                                </label>
                            </div>
                            <div class="form-group">
                                <label>
                                    <input type="text" class="form-control" name="product-type"
                                           size="50"
                                           value="${requestScope["product"].getProductType()}">
                                </label>
                            </div>
                            <div class="form-group">
                                <label>
                                    <input type="text" class="form-control" name="product-price"
                                           size="50"
                                           value="${requestScope["product"].getPrice()}">
                                </label>
                            </div>
                            <div class="form-group">
                                <label>
                                    <input type="text" class="form-control"
                                           name="product-description" size="50"
                                           value="${requestScope["product"].getDescription()}">
                                </label>
                            </div>
                            <div class="form-group">
                                <label>
                                    <input type="text" class="form-control"
                                           name="product-imageUrl" size="50"
                                           value="${requestScope["product"].getImageUrl()}">
                                </label>
                            </div>
                            <div class="form-group">
                                <label>
                                    <input type="text" class="form-control" name="product-amount"
                                           size="50"
                                           value="${requestScope["product"].getAmount()}">
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
</c:if>
<c:if test='${requestScope["controller"] != null}'>
    <script type="text/javascript">
        $(window).on('load',function(){
            $('#${requestScope["controller"]}').modal('show');
        });
    </script>
</c:if>
<%--dialog box for edit--%>
</body>
</html>