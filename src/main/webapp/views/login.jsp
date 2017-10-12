<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctxPath" value="${pageContext.request.contextPath }" scope="page"></c:set>
<!DOCTYPE html>
<html lang="en">
<head>
<title>郑州兴唐</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<link rel="stylesheet" href="${ctxPath }/static/css/bootstrap.min.css" />
<link rel="stylesheet" href="${ctxPath }/static/css/camera.css" />
<link rel="stylesheet" href="${ctxPath }/static/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="${ctxPath }/static/css/matrix-login.css" />
<link rel="stylesheet" href="${ctxPath }/static/css/font-awesome.css" rel="stylesheet" />
<script type="text/javascript" src="${ctxPath }/static/js/jquery-1.9.1.min.js"></script>

</head>
<body>

	<div
		style="width:100%;text-align: center;margin: 0 auto;position: absolute;">
		<div id="loginbox">
			<form action="" method="post" name="loginForm"
				id="loginForm">
				<div class="control-group normal_text">
					<h3>
						<img src="${ctxPath }/static/img/logo.png" alt="Logo" />
					</h3>
				</div>
				<div class="control-group">
					<div class="controls">
						<div class="main_input_box">
							<span class="add-on bg_lg">
							<i><img height="37" src="${ctxPath }/static/img/user.png" /></i>
							</span><input type="text" name="userName" id="userName" value="" placeholder="请输入用户名" />
						</div>
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
						<div class="main_input_box">
							<span class="add-on bg_ly">
							<i><img height="37" src="${ctxPath }/static/img/suo.png" /></i>
							</span><input type="password" name="passwd" id="passwd" placeholder="请输入密码" value="" />
						</div>
					</div>
				</div>
				<div style="float:right;padding-right:10%;">
					<div style="float: left;margin-top:3px;margin-right:2px;">
						<font color="white">记住密码</font>
					</div>
					<div style="float: left;">
						<input name="form-field-checkbox" id="saveid" type="checkbox"
							onclick="savePasswd();" style="padding-top:0px;"/>
					</div>
				</div>
				<div class="form-actions">
					<div style="width:86%;padding-left:8%;">
						<div style="float: left;" class="codediv">
							<input type="text" name="code" id="code" class="login_code"
								style="height:25px; padding-top:0px;" placeholder="验证码"/>
						</div>
						<div style="float: left;">
							<i><img style="height:30px;" id="codeImg" alt="点击更换"
								title="点击更换" src="" /></i>
						</div>

						<span class="pull-right" style="padding-right:3%;"><a
							href="javascript:quxiao();" class="btn btn-success">取消</a></span> <span
							class="pull-right"><a onclick="severCheck();"
							class="flip-link btn btn-info" id="to-recover">登录</a></span>

					</div>
				</div>

			</form>


			<div class="controls">
				<div class="main_input_box">
					<font color="white"><span id="nameerr">Copyright © 郑州兴唐教育研发中心  2015-2019</span></font>
				</div>
			</div>
		</div>
	</div>
	<div id="templatemo_banner_slide" class="container_wapper">
		<div class="camera_wrap camera_emboss" id="camera_slide">
			<div data-src="${ctxPath }/static/img/login/banner_slide_01.jpg"></div>
			<div data-src="${ctxPath }/static/img/login/banner_slide_02.jpg"></div>
			<div data-src="${ctxPath }/static/img/login/banner_slide_03.jpg"></div>
		</div>
		<!-- #camera_wrap_3 -->
	</div>

	<script type="text/javascript">
	
		//服务器校验
		function severCheck(){
			if(check()){
				var userName = $("#userName").val();
				var passwd = $("#passwd").val();
				var code = loginname+"^XT^"+password + "^XT^" + $("#code").val();
				$.ajax({
					type: "POST",
					url: '${ctxPath }/sysUser.action',
			    	data: {KEYDATA:code, tm:new Date().getTime()},
					dataType:'json',
					cache: false,
					success: function(data){
						if("success" == data.result){
							saveCookie();
							window.location.href="main/index";
						}else if("usererror" == data.result){
							$("#userName").tips({
								side : 1,
								msg : "用户名或密码有误",
								bg : '#FF5080',
								time : 15
							});
							$("#userName").focus();
						}else if("codeError" == data.result){
							$("#code").tips({
								side : 1,
								msg : "验证码输入有误",
								bg : '#FF5080',
								time : 15
							});
							$("#code").focus();
						}else{
							$("#userName").tips({
								side : 1,
								msg : "缺少参数",
								bg : '#FF5080',
								time : 15
							});
							$("#userName").focus();
						}
					}
				});
			}
		}
	
		$(document).ready(function() {
			changeCode();
			$("#codeImg").bind("click", changeCode);
		});

		$(document).keyup(function(event) {
			if (event.keyCode == 13) {
				$("#to-recover").trigger("click");
			}
		});

		function genTimestamp() {
			var time = new Date();
			return time.getTime();
		}

		function changeCode() {
			$("#codeImg").attr("src", "${ctxPath }/verifyCode.action?t=" + genTimestamp());
		}

		//客户端校验
		function check() {

			if ($("#userName").val() == "") {
				$("#userName").tips({
					side : 2,
					msg : '用户名不得为空',
					bg : '#AE81FF',
					time : 3
				});
				$("#userName").focus();
				return false;
			} else {
				$("#userName").val(jQuery.trim($('#userName').val()));
			}

			if ($("#passwd").val() == "") {
				$("#passwd").tips({
					side : 2,
					msg : '密码不得为空',
					bg : '#AE81FF',
					time : 3
				});
				$("#passwd").focus();
				return false;
			}
			if ($("#code").val() == "") {
				$("#code").tips({
					side : 1,
					msg : '验证码不得为空',
					bg : '#AE81FF',
					time : 3
				});
				$("#code").focus();
				return false;
			}

			$("#loginbox").tips({
				side : 1,
				msg : '正在登录 , 请稍后 ...',
				bg : '#68B500',
				time : 10
			});

			return true;
		}

		function savePasswd() {
			if (!$("#saveid").attr("checked")) {
				$.cookie('userName', '', {
					expires : -1
				});
				$.cookie('passwd', '', {
					expires : -1
				});
				$("#userName").val('');
				$("#passwd").val('');
			}
		}

		function saveCookie() {
			if ($("#saveid").attr("checked")) {
				$.cookie('userName', $("#userName").val(), {
					expires : 7
				});
				$.cookie('passwd', $("#passwd").val(), {
					expires : 7
				});
			}
		}
		function quxiao() {
			$("#userName").val('');
			$("#passwd").val('');
		}
		
		jQuery(function() {
			var loginname = $.cookie('userName');
			var password = $.cookie('passwd');
			if (typeof(loginname) != "undefined"
					&& typeof(password) != "undefined") {
				$("#userName").val(loginname);
				$("#passwd").val(password);
				$("#saveid").attr("checked", true);
				$("#code").focus();
			}
		});
	</script>
	<script>
		//TOCMAT重启之后 点击左侧列表跳转登录首页 
		if (window != top) {
			top.location.href = location.href;
		}
	</script>

	<script type="text/javascript" src="${ctxPath }/static/js/jquery-1.7.2.js"></script>
	<script type="text/javascript" src="${ctxPath }/static/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${ctxPath }/static/js/jquery.easing.1.3.js"></script>
	<script type="text/javascript" src="${ctxPath }/static/js/jquery.mobile.customized.min.js"></script>
	<script type="text/javascript" src="${ctxPath }/static/js/camera.min.js"></script>
	<script type="text/javascript" src="${ctxPath }/static/js/templatemo_script.js"></script>
	<script type="text/javascript" src="${ctxPath }/static/js/jquery.tips.js"></script>
	<script type="text/javascript" src="${ctxPath }/static/js/jquery.cookie.js"></script>
</body>
</html>