<%@page import="com.nfd.omega.WebConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<meta name="renderer" content="webkit">
<title>用户登录</title>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

<link rel="shortcut icon" href="<%=path%>/resources/omega/img/fav_32.ico" type="/image/x-icon" />


<!-- Bootstrap 3.3.4 -->
<link href="<%=path%>/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<!-- Font Awesome Icons -->
<link href="<%=path%>/resources/plugins/font-awesome-4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<!-- Theme style -->
<link href="<%=path%>/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
<!-- iCheck -->
<link href="<%=path%>/resources/plugins/iCheck/square/blue.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/resources/omega/css/omega.css" rel="stylesheet" type="text/css" />

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<!--[if lt IE 10]>
<style type="text/css">
nav.navbar,div.container-fluid,.login-box,footer {display:none !important;}
</style>
<p style="text-align:center;">
    当前网页不兼容IE10以下浏览器，推荐使用Chrome、Firefox浏览器访问！
</p>
<![endif]-->
</head>
<body class="login-page" onload="getCookie();">
	<div class="login-box">
		<div class="login-logo">
			<img alt="Omega" title="Omega" src="<%=request.getContextPath()%>/resources/omega/img/logo.png" height="256"
				width="256">
		</div>
		<!-- /.login-logo -->
		<div class="login-box-body">
			<p class="login-box-msg"></p>
			<form action="<%=path%>/login" method="post" id="loginform" name="loginform">
				<div class="form-group has-feedback">
					<input type="text" class="form-control" placeholder="请输入手机号" name="userCode" id="userCode" /> <span
						class="glyphicon glyphicon-user form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="password" class="form-control" placeholder="请输入密码" name="userPwd" id="userPwd" /> <span
						class="glyphicon glyphicon-lock form-control-feedback"></span>
				</div>
				<div class="input-group has-feedback" id="PhoneMsg" name="PhoneMsg" style="display: none;" >
                    <input type="text" class="form-control" id="pmsg" name="pmsg" placeholder="短信验证码"><span class="glyphicon glyphicon-envelope form-control-feedback" style="margin-right: 120px;"></span>
                    <span class="input-group-btn">
                      <button class="btn  btn-primary btn-flat" id="getMsg" name="getMsg" style="margin-left:20px;" onclick="getLoginCode(this);" type="button">获取验证码</button>
                    </span>
               </div>
               <div class="form-group has-feedback">
				</div>
				<div class="row">
					<div class="col-xs-8">
						<div class="checkbox icheck">
							<label><input value="yes" type="checkbox" name="remb" id="remb"> 记住我</label>
						</div>
					</div>
					<!-- /.col -->
					<div class="col-xs-4">
						<button type="button" class="btn btn-primary btn-block btn-flat" onclick="doSubmit();">登录</button>
					</div>
					<!-- /.col -->
				</div>
				<div class="row">
					<div class="col-xs-8">
					</div>
					<div class="col-xs-4" style="text-align: right;">
						<a href="#" onclick='findPassword();' >忘记密码?</a>
					</div>
				</div>

			</form>

			<!-- <a href="#" class="col-xs-8">忘记密码</a> <br> -->
		</div>
		<!-- /.login-box-body -->
	</div>
	<!-- /.login-box -->

	<!-- jQuery 2.1.4 -->
	<script src="<%=path%>/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
	<!-- Bootstrap 3.3.2 JS -->
	<script src="<%=path%>/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
	<!-- iCheck -->
	<script src="<%=path%>/resources/plugins/iCheck/icheck.min.js" type="text/javascript"></script>
	<script src="<%=path%>/resources/plugins/jQuery/jquery.cookie.js" type="text/javascript"></script>
	<script src="<%=path%>/resources/plugins/jquery-address/jquery.address.js" type="text/javascript"></script>
	<script src="<%=path%>/resources/omega/js/omega.js" type="text/javascript"></script>
   	<script src="<%=path %>/resources/plugins/jquery-address/jquery.address.js"></script>
   	<script src="<%=path %>/resources/plugins/way/way.js"></script>
	<script>
		
	
	$(function() {
			$('input').iCheck({
				checkboxClass : 'icheckbox_square-blue',
				radioClass : 'iradio_square-blue',
				increaseArea : '20%' // optional
			});
			
			$("#userCode").focus(function(){
				Omega.Base.showHit ("userCode","请您输入账号 ","b","w");
				Omega.Base.closeHit ("userCode");
	          }).blur(function(){
	        	  var userCode = $("#userCode").val();
		            if(userCode==""){
		            	Omega.Base.showHit ("userCode","请您输入账号 ","b","w");
		            }
	          }).change(function(){
	        	  $("#PhoneMsg").hide();
	          });
			
			$("#userPwd").focus(function(){
				Omega.Base.showHit ("userPwd","请您输入密码 ","b","w");
				Omega.Base.closeHit ("userPwd");
	          }).blur(function(){
	        	  var userCode = $("#userPwd").val();
		            if(userCode==""){
		            	Omega.Base.showHit ("userPwd","请您输入密码 ","b","w");
		            }
	          });
			
			//判断是否隐藏
			var temp= $("#PhoneMsg").is(":hidden");
				$("#pmsg").focus(function(){
					Omega.Base.showHit ("pmsg","请您输入短信验证码 ","b","w");
					Omega.Base.closeHit ("pmsg");
					$("#getMsg").css({"margin-top":"0px"});
		          }).blur(function(){
		        	  var pmsg = $("#pmsg").val();
			            if(pmsg==""){
			            	Omega.Base.showHit ("pmsg","请您输入短信验证码","b","w");
			            	$("#getMsg").css({
			            		"margin-top":"-24px"
			            	});
			            }
		          });
			
		
			<%
			String errMsg = (String)request.getAttribute("errMsg");
			String isShowMsgBox =(String) request.getSession().getAttribute(WebConstant.IS_SHOW_MSG_BOX_DESC);
			String isMsgFlag = (String) request.getSession().getAttribute(WebConstant.IS_MSG_DESC);
			if(errMsg!=null){
			%>
				Omega.Base.showTip ("登录失败","${errMsg}","e","","","");
			<%
			}
			%>
			var isShowMsgBox ='<%=isShowMsgBox%>';
			var isMsgFlag ='<%=isMsgFlag%>';
			console.log("isShowMsgBox value is：${isShowMsgBox}");
			if(isShowMsgBox == "Y"){
				 $("#PhoneMsg").show();
			}
			var isHide= $("#PhoneMsg").is(":hidden");
			var exMsg = '${SPRING_SECURITY_LAST_EXCEPTION.message}';
			if(exMsg !=""){
				if(isShowMsgBox == 'Y'){
					if(isMsgFlag=='Y'){
						Omega.Base.showHit ("pmsg","${SPRING_SECURITY_LAST_EXCEPTION.message} ","b","w");
						$("#getMsg").css({
		            		"margin-top":"-24px"
		            	});
					}
					else{
						Omega.Base.showHit ("userPwd","${SPRING_SECURITY_LAST_EXCEPTION.message} ","b","w");
				}
				}else{
					Omega.Base.showHit ("userPwd","${SPRING_SECURITY_LAST_EXCEPTION.message} ","b","w");
				}
			}
		});
	

	


		/**
		 * 设置Cookie
		 */
		function setCookie() {
			var remb = $('input[id="remb"]:checked').val();
			if (remb != 'yes') {
				return false;
			}

			var userCode = $("#userCode").val();

			$.cookie('userCode', userCode, {
				 expires: 7,
				path : '/'
			});
			//alert($.cookie('userCode'));
		}
		
		function getCookie(){
			$("#userCode").val($.cookie('userCode'));
		}

		function doSubmit() {
			setCookie();
			var form1 = document.loginform;

			if (form1.userCode.value == '') {
				Omega.Base.showHit ("userCode","请您输入账号 ","b","w");
				return;
			}
			if (form1.userPwd.value == '') {
				Omega.Base.showHit ("userPwd","请您输入密码 ","b","w");
				return;
			}
			
			
			
			//判断是否隐藏
			var isHie= $("#PhoneMsg").is(":hidden");
			//console.log(temp);
			if(!isHie){
				if(form1.pmsg.value == ''){
					Omega.Base.showHit ("pmsg","请您输入短信验证码 ","b","w");
					$("#getMsg").css({
	            		"margin-top":"-24px"
	            	});
					return;
				}
			}
			
			check(form1,isHie);
		}
		

		// 绑定键盘按下事件  
		$(document).keypress(function(e) {
			// 回车键事件  
			if (e.which == 13) {
				e.preventDefault();
				doSubmit();
			}
		});
		
		
		
		//验证是否需要发送手机验证码进行登录
		function check(form1,isHie){
			
			if(isHie){
				console.log("check the phone is special");
				var username = $("#userCode").val();
				var userpwd  = $("#userPwd").val();
				$.ajax({
					type:"post",
					url:"<%=path%>/logon",
					data:{username:username,userpwd:userpwd},
					dataType:"json",
					async:false, 
					success:function(data){
						if(data.resultData == 1){ //不需要验证直接登陆
							form1.submit();
						}else{
							$("#PhoneMsg").show();  // 显示div
						}
					}
				});
			}else{
				console.log("submit the from");
				$("#PhoneMsg").hide();
				form1.submit();
			}
		}
		
		function getLoginCode(o){
			
			//验证div 是否显示
			var isHie= $("#PhoneMsg").is(":hidden");
			time(o); // 倒计时
			if(!isHie){
				var mobile = $("#userCode").val();
				var userPwd = $("#userPwd").val();
				$.ajax({
					type:"post",
					data:{mobile:mobile,userPwd:userPwd},
					dataType:"json",
					url:"<%=path%>/getLoginCode",
					success:function(data){
						console.log(data);
						if(data != null && data.resultData == 1){
							Omega.Base.showHit ("pmsg",data.msg,"b","w");
							$("#getMsg").css({
			            		"margin-top":"-24px"
			            	});
						}
					}
				});
			} 
			
		}
		
		//倒计时
		var wait=60;
		function time(o) {
			var $o =$(o);
		        if (wait == 0) {
		            $o.removeAttr("disabled");            
		            $o.html("获取验证码");
		            wait = 60;
		        } else {
		        	$o.attr("disabled", true);
		            $o.html("重新发送(" + wait + ")");
		           
		            wait--;
		            setTimeout(function() {
		                time(o)
		            },
		            1000)
		        }
		    }
		
		function findPassword(){
			window.location.replace('<%=path%>/userInfo/findPassword');
		}
	</script>
	<%
		request.getSession().invalidate(); //清除所有session
	%>
</body>
</html>