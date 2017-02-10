<%@ page language="java" contentType="text/html; charset=UTF-8"  isErrorPage="true"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="../include.jsp"%>
<title>没有权限访问</title>
</head>
<body class="skin-green-light sidebar-mini">
<div class="wrapper">
		<%@include file="../head.jsp"%>
		<%@include file="../left.jsp"%>
      <div class="content-wrapper">
        <section class="content">
          <div class="error-page">
            <h2 class="headline text-yellow"> 403</h2>
            <div class="error-content">
              <h3><i class="fa fa-warning text-yellow"></i> 哎呀! 您没有权限</h3>
              <br>
              <br>
              <p>
               	很抱歉,您没有权限访问该页面,如您有需要请联系管理员,谢谢 <br>
                <a href="#" onclick="javascript:Omega.Base.loadContent('/dashboard')">返回到仪表盘 </a> 
              </p>
              <!-- <form class="search-form">
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
      </div>
</div>
	<%@include file="../footer.jsp"%>
      <!-- Add the sidebar's background. This div must be placed
           immediately after the control sidebar -->
</body>
</html>