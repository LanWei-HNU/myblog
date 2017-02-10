<%@ page language="java" contentType="text/html; charset=UTF-8" isErrorPage="true"
    pageEncoding="UTF-8"%>
    <%@include file="../include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>404 找不到页面</title>
</head>
  <body class="skin-blue sidebar-mini">
      <!-- Content Wrapper. Contains page content -->
        <!-- Content Header (Page header) -->
        <!-- Main content -->
        <section class="content">
          <div class="error-page">
            <h2 class="headline text-yellow"> 404</h2>
            <div class="error-content">
              <h3><i class="fa fa-warning text-yellow"></i> 哎呀! 找不到这个页面.</h3>
              <p>
               	很抱歉! 我们找不到您要找的页面 ,你可以尝试一下链接：
              </p>
              <p>
                                               您可以尝试该链接 <a href="#" onclick="history.back()">返回</a>, 谢谢
             </p>
             <!--  <form class="search-form">
                <div class="input-group">
                  <input type="text" name="search" class="form-control" placeholder="Search" />
                  <div class="input-group-btn">
                    <button type="submit" name="submit" class="btn btn-warning btn-flat"><i class="fa fa-search"></i></button>
                  </div>
                </div>/.input-group
              </form> -->
            </div><!-- /.error-content -->
          </div><!-- /.error-page -->
        </section><!-- /.content -->
      <!-- Add the sidebar's background. This div must be placed
           immediately after the control sidebar -->
           	<%@include file="../footer.jsp"%>
      <div class="control-sidebar-bg"></div>
      
  </body>
</html>