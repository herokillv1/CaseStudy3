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
    <link rel="stylesheet" href="../css/main.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="../js/main.js"></script>
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
                        <a class="nav-link"
                           href="${pageContext.request.contextPath}/customer?account=${requestScope["account"]}">Trang
                            chủ</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link"
                           href="${pageContext.request.contextPath}/customer?action=repassword&account=${requestScope["account"]}">Đổi
                            mật khẩu</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link"
                           href="${pageContext.request.contextPath}/customer?action=historycart&account=${requestScope["account"]}">Lịch
                            sử mua hàng</a>
                    </li>
                </ul>
                <form class="form-inline my-2 my-lg-0"
                      action="${pageContext.request.contextPath}/customer?action=search&account=${requestScope["account"]}"
                      method="post">
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
    <c:if test='${requestScope["customer"] != null}'>
        <form action="${pageContext.request.contextPath}/control?action=updateCustomer&account=${requestScope["account"]}"
              method="post">
            <div class="form-group">
                <label>Full name:&ensp;</label>
                <input type="text" class="form-control" name="customer-name"
                       value="${requestScope["customer"].getName()}">
            </div>
            <div class="form-group">
                <label>Age:&ensp;</label>
                <input type="number" class="form-control" name="customer-age"
                       value="${requestScope["customer"].getAge()}">
            </div>
            <div class="form-group">
                <label>Render:&ensp;</label>
                <input type="text" class="form-control" name="customer-render"
                       value="${requestScope["customer"].getRender()}">
            </div>
            <div class="form-group">
                <label>Email:&ensp;</label>
                <input type="text" class="form-control" name="customer-email"
                       value="${requestScope["customer"].getEmail()}">
            </div>
            <div class="form-group">
                <label>Address:&ensp;</label>
                <input type="text" class="form-control" name="customer-address"
                       value="${requestScope["customer"].getAddress()}">
            </div>
            <div class="form-group">
                <label>Phone:&ensp;</label>
                <input type="text" class="form-control" name="customer-phone"
                       value="${requestScope["customer"].getPhone()}">
            </div>
            <button type="submit" class="btn btn-primary">Cập nhât</button>
        </form>
    </c:if>
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

<%--thông báo cập nhập thành công--%>
<div id="updateCustomer" class="modal fade " role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Thông báo</h4>
            </div>
            <div class="modal-body">
                <p>Cập nhập thành công thông tin người dùng!</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<c:if test='${requestScope["controller"] != null}'>
    <script type="text/javascript">
        $(window).on('load', function () {
            $('#${requestScope["controller"]}').modal('show');
        });
    </script>
</c:if>
<%--thông báo cập nhập thành công--%>

<%--form đổi mật khẩu--%>
<c:if test='${requestScope["customer"] != null}'>
    <div class="container">
        <div class="row">
            <div class="col-lg-1 col-xl-1 block-empty"></div>
            <div id="rePassword" class="col-lg-10 col-xl-10 modal fade " role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" style="text-align: center">Thông báo</h4>
                        </div>
                        <form action="${pageContext.request.contextPath}/control?action=rePassword&account=${requestScope["account"]}"
                              method="post">
                            <div class="form-group input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">Account </span>
                                </div>
                                <input type="text" class="form-control" name="customer-account" readonly
                                       value="${requestScope["account"]}">
                            </div>

                            <div class="form-group col-xs-1 col-sm-1 col-md-1 col-lg-5 col-xl-5"></div>
                            <div class="col-xs-11 col-sm-11 col-md-11 col-lg-7 col-xl-7">
                                <label>New-Password:&ensp;</label>
                                <input type="password" class="form-control" name="customer-new-pass"
                                       placeholder="New Password">
                            </div>
                            <div class="form-group col-xs-1 col-sm-1 col-md-1 col-lg-5 col-xl-5"></div>
                            <div class="col-xs-11 col-sm-11 col-md-11 col-lg-7 col-xl-7">
                                <label>Renew-Password:&ensp;</label>
                                <input type="password" class="form-control" name="customer-renew-pass"
                                       placeholder="Renew Password">
                            </div>
                            <div class="col-xs-1 col-sm-1 col-md-1 col-lg-5 col-xl-5"></div>
                            <div class="col-xs-11 col-sm-11 col-md-11 col-lg-7 col-xl-7">
                                <br>
                                <button type="submit" class="btn btn-primary">Đổi mật khẩu</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-lg-1 col-xl-1 block-empty"></div>
        </div>
    </div>
</c:if>
<c:if test='${requestScope["controller"] != null}'>
    <script type="text/javascript">
        $(window).on('load', function () {
            $('#${requestScope["controller"]}').modal('show');
        });
    </script>
</c:if>
<%--form đổi mật khẩu--%>

<%--thông báo đổi mật khẩu thành công--%>
<div id="alert" class="modal fade " role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Thông báo</h4>
            </div>
            <div class="modal-body">
                <p>Đổi mật khẩu thành công</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<c:if test='${requestScope["controller"] != null}'>
    <script type="text/javascript">
        $(window).on('load', function () {
            $('#${requestScope["controller"]}').modal('show');
        });
    </script>
</c:if>
<%--thông báo đổi mật khẩu thành công--%>
</body>
</html>