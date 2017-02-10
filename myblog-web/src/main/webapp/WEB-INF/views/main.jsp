<%@page import="com.nfd.omega.WebConstant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<!DOCTYPE html>
<html style="height: 100%;">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="include.jsp"%>
<style type="text/css">
.cls{
height: 100%!important; min-height:100%!important
}
.layui-layer-molv .layui-layer-title{
background-color: #00a65a;
height: auto;
}
.layui-layer-content{
overflow-x:hidden!important; 
overflow-y:hidden!important; 
height: auto!important;
}
.layui-layer-molv{
width: auto;
}
/* .details-form-field input, .details-form-field select {
	width: 250px;
	float: right;
}

.details-form-field {
	margin: 12px 0;
}

.details-form-field:first-child {
	margin-top: 10px;
}

.details-form-field:last-child {
	margin-bottom: 10px;
}

.details-form-field button {
	display: block;
	width: auto;
	margin: 0 auto;
}

input.error, select.error {
	border: 1px solid #ff9999;
	background: #ffeeee;
}

label.error {
	float: right;
	margin: auto;
	font-size: .5em;
	color: #ff6666;
} */
</style>
<link rel="stylesheet" type="text/css" href="<%=webRoot%>/resources/omega/css/resourceManager.css"/>
</head>
<body class="skin-green-light sidebar-mini" style="height: 100%;">
	<div class="wrapper" style="height: 100%;">

		<%@include file="head.jsp"%>
		<%@include file="left.jsp"%>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper cls" >
			<%@include file="home.jsp"%>
		</div>
	</div>
	<div style="position: fixed;bottom: 0;width: 100%">
	<%@include file="footer.jsp"%>
	</div>
	<!-- 修改密码div -->
	<div class="tab-pane" id="tab_2" style="display: none;">
		<!-- 修改密码 输入框填写在这里 -->
		<div>
			<div class="box-header with-border">
				<h3 class="box-title">修改密码</h3>
			</div>
			<!-- /.box-header -->
			<!-- form start -->
			<form class="form-horizontal" name="FirstupdatePasswordForm"
				id="FirstupdatePasswordForm">
				<div class="box-body">
					<div class="form-group">
						<label for="fuserPassword1" class="col-sm-3 control-label">新密码</label>
						<div class="col-sm-7">
							<input type="password" class="form-control" id="fuserPassword1"
								name="fuserPassword1" placeholder="密码不能少于8位，必须需包含数字大小写字母,不能包含特殊符号 '()<>;">
						</div>
					</div>
					<div class="form-group">
						<label for="fuserPassword2" class="col-sm-3 control-label">确认密码</label>
						<div class="col-sm-7">
							<input type="password" class="form-control" id="fuserPassword2"
								name="fuserPassword2" placeholder="密码不能少于8位，必须需包含数字大小写字母,不能包含特殊符号 '()<>;">
						</div>
					</div>
				</div>
				<!-- /.box-body -->
				<div class="box-footer">
					<div class="col-md-offset-4 col-md-4">
						<button type="reset" class="btn btn-default" id="resetN">重置</button>
						<button type="submit" class="btn btn-primary ">修改</button>
					</div>
				</div>
				<!-- /.box-footer -->
			</form>
		</div>
	</div>

</body>
<script type="text/javascript">
	$(function() {

		//获取登陆之后的的第一次标记 first flag
<%String resetFlag = (String) request.getSession().getAttribute(WebConstant.RESET_FLAG);
		if (null != resetFlag) {%>
		var resetFlag = '${resetFlag}';
		console.log('first Flag is :' + resetFlag);

		if (resetFlag == 'Y') {//是第一次登陆 需要显示修改密码的窗口
			$("#tab_2").show();
			layer.open({
				type : 1,
				area : [ '50%', 'auto' ],
				closeBtn : false,
				title : "亲,为了您的信息安全,请修改您的密码,谢谢 ^_^",
				shadeClose : false, //点击遮罩关闭
				skin : "layui-layer-molv",
				content : $('#tab_2'),
				move: false
			});
			$.validator.addMethod("pwdStrength",function(value,element){
			    var strU = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])/;
			    //var spec=/[,.<>{}~!@#$%^&*]/; //特殊字符
			    var spec= /^[^'<>();]+$/;
			   return strU.test(value) && spec.test(value);
			    	
			});
			
		
			$("#FirstupdatePasswordForm").validate({
				rules : {
					fuserPassword1 : {
						required : true,
						minlength:8,
						maxlength:16,
						pwdStrength:true
					},
					fuserPassword2:{
						required:true,
						minlength:8,
						maxlength:16,
						pwdStrength:true,
						equalTo: '#fuserPassword1'
					}
					
				},
				messages : {
					fuserPassword1 : {
						required : "亲,新密码不能为空哦  ^_^",
						minlength: "亲,密码不能少于8个字符哦  ^_^",
						maxlength: "亲,密码长度不能超过16个字符哦  ^_^",
						pwdStrength:"亲,密码需要包含数字和大小写字母,且不能包含特殊字符'()<>;等,防止坏人窃取  ^_^"
							
					},
					fuserPassword2:{
						required : "亲,新密码不能为空哦  ^_^",
						minlength: "亲,密码不能少于8个字符哦  ^_^",
						maxlength: "亲,密码长度不能超过16个字符哦  ^_^",
						pwdStrength:"亲,密码需要包含数字和大小写字母,且不能包含特殊字符'()<>;等,防止坏人窃取  ^_^",
						equalTo:  "哎呀!! 两次密码不一致,请确认密码一致 ||0_0||"
					}
				
				},
				submitHandler : function() {
					var isresetFlag = 'Y';
					$.ajax({
						type : "POST",
						url : _webRoot + "/updateToFirstLoginPwd",
						data : {
							userPassword : $("#fuserPassword2").val(),
							isResetFlag :isresetFlag
						},
						dataType : "json",
						success : function(data) {
							if (data.status == 0) {
								Omega.Base.showTip ("成功","亲，您的密码修改成功了哦  ","i","","","");
								$("#FirstupdatePasswordForm").validate().resetForm(); //清空样式
								$("#FirstupdatePasswordForm")[0].reset(); //清空form
								$("#tab_2").hide();
								layer.closeAll();
							} else if(data.status == 1) {
								Omega.Base.showTip ("失败",data.statusDesc,"e","","","");
							}
						}
					});
				}
			});
			
			$("#resetN").bind("click",function(){
				$("#FirstupdatePasswordForm").validate().resetForm();
				$("#FirstupdatePasswordForm").find(".error").removeClass("error");
			});
		}
<%}%>
});
</script>
</html>
