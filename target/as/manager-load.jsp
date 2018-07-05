<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/bootstrapValidator.js"></script>
	
	<link rel="stylesheet" type="text/css" href="css/index.css">
	<link rel="stylesheet" type="text/css" href="css/reset.css">
	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
	<title>东师拾遗--管理员登录</title>
</head>
<body>
	<header>
		<div class="hea_si">
			<h2>东师拾遗</h2>		
		</div>
	</header>

	<main class="sign">
		<div class="col-md-6 col-lg-6 col-md-offset-3 col-lg-offset-3 sign_h">
			<div class="sign_out">
				<div class="sign_left">
					<h2 style="font-family: '楷体';font-size: 35px;">管理员须知</h2>
					<br>
					<p>本网站旨在为东北师范大学师生服务，一个校内邮箱只能绑定一个账号，管理员应当尽自己的职责并且无违法乱纪行为。</p>

					<ul>
						<li><a href="register.jsp">用户注册</a></li>
						<li><a href="load.jsp">用户登录</a></li>
					</ul>
				</div>

				<div class="sign_right">
					<h2>欢迎登录<b style="font-size: 35px;">东师拾遗</b></h2>

					<br>

					<!-- 表单部分 -->
					<form id="defaultForm" method="post" class="form-horizontal" action="/manager-load">

						<div class="form-group">
							<label class="col-lg-2 control-label">邮箱</label>
							<div class="col-lg-8">
								<input type="text" class="form-control" name="email" />
							</div>
						</div>

						<div class="form-group">
							<label class="col-lg-2 control-label">密码</label>
							<div class="col-lg-8">
								<input type="password" class="form-control" name="password" />
							</div>
						</div>

						<div class="form-group">
							<div class="col-lg-9 col-lg-offset-3">
								<button type="button" class="btn btn-info" id="validateBtn" onclick="this.form.submit()">登录</button>
							</div>
						</div>

					</form>

				</div>
			</div>
		</div>
	</main>

	<div class="footer">
		<p>Posted by: KingBack</p>
		<p>Contact information: <a href="#">someone@nenu.com</a>.</p>
	</div>


	<script type="text/javascript">
		$(document).ready(function() {
    // Generate a simple captcha

    $('#defaultForm').bootstrapValidator({
	//        live: 'disabled',
	message: 'This value is not valid',
	feedbackIcons: {
		valid: 'glyphicon glyphicon-ok',
		invalid: 'glyphicon glyphicon-remove',
		validating: 'glyphicon glyphicon-refresh'
	},
	fields: {
		email: {
			validators: {
				notEmpty: {
					message: '邮箱不能为空'
				},
				regexp: {
					regexp:  /^[a-zA-Z]{3,}[0-9]{3,}@nenu.edu.cn$/,
					message: '邮箱地址格式有误'
				}
			}
		},
		password: {
			validators: {
				notEmpty: {
					message: '密码不能位空'
				}
			}
		}
	}
});

    // Validate the form manually
    $('#validateBtn').click(function() {
    	$('#defaultForm').bootstrapValidator('validate');
    });
});
</script>
</body>
</html>