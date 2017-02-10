<%@ page language="java" contentType="text/html; charset=UTF-8" isErrorPage="true"
    pageEncoding="UTF-8"%>
      <%@include file="../include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>程序错误页面</title>
</head>
<body>
	<!-- Content Wrapper. Contains page content -->
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            500 Error Page
          </h1>
          <!-- <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            <li><a href="#">Examples</a></li>
            <li class="active">500 error</li>
          </ol> -->
        </section>
        <!-- Main content -->
        <section class="content">

          <div class="error-page">
            <h2 class="headline text-red">500</h2>
            <div class="error-content">
              <h3><i class="fa fa-warning text-red"></i> 哎呀! 程序出了一点小差错.</h3>
              <p>
                                                我们将尽快修复这个问题.为你带来不便,敬请谅解.您可以尝试以下链接
                  <a href="#" onclick="history.back()">返回</a> , 谢谢
              </p>
             <!--  <form class="search-form">
                <div class="input-group">
                  <input type="text" name="search" class="form-control" placeholder="Search" />
                  <div class="input-group-btn">
                    <button type="submit" name="submit" class="btn btn-danger btn-flat"><i class="fa fa-search"></i></button>
                  </div>
                </div>/.input-group
              </form> -->
            </div>
          </div><!-- /.error-page -->
        </section><!-- /.content -->
</body>
</html>