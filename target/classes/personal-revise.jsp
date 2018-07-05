<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" type="text/css" href="css/reset.css">
	<link rel="stylesheet" type="text/css" href="css/index.css">
	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="css/bootstrapValidator.css"/>

	<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/bootstrapValidator.js"></script>
	<title>东师拾遗--个人信息</title>
	<style>
		.large{
			margin-bottom: 150px;
		}
	</style>
</head>
<body>
	<!-- 导航栏部分 -->	

	<div class="contain">
		<header>
			<!-- logo部分 -->
			<div class="col-md-3 col-lg-3 hea_logo">
				<h1></h1>
			</div>

			<!-- 导航栏表单部分 -->
			<div class="col-md-6 col-lg-6">
				<ul class="nav">

					<a href="index.jsp"> <li>首页</li> </a>

					<a href="lost-all.html"> <li>寻物</li> </a>

					<a href="found-all.html"> <li>拾物</li> </a>

					<a target="_blank" href="mine.jsp"> <li>我的</li> </a>

				</ul>
			</div>

			<!-- 导航栏登录部分 -->
			<div class="col-md-3 col-lg-3 hea_login">
				<div class="log_a">
					<a href="upload-lost.jsp">寻物</a>
					<a href="upload-found.jsp">拾物</a>
				</div>
			</div>
		</header>

		<%
			/*int userId = 0;
			String useremail="";
			Cookie cookies[]=request.getCookies();
			if(cookies !=null){
				for(int i = 0;i < cookies.length;i++) {  //遍历cookie对象集合
					if (cookies[i].getName().equals("userId")) {
						userId = Integer.parseInt(cookies[i].getValue());
						request.setAttribute("userId",userId);
					}if(cookies[i].getName().equals("useremail")){
						useremail = cookies[i].getValue();
						request.setAttribute("userEamil",useremail);
					}
				}
			}*/
			int userId = 0;
			String userEmail="";
			Cookie cookies[]=request.getCookies();
			if(cookies !=null){
				for(int i = 0;i < cookies.length;i++) {  //遍历cookie对象集合
					if (cookies[i].getName().equals("userId")) {
						userId = Integer.parseInt(cookies[i].getValue());
						request.setAttribute("userId",userId);
					}if(cookies[i].getName().equals("userEmail")){
						userEmail = cookies[i].getValue();
						request.setAttribute("userEmail",userEmail);
					}
				}
			}

		%>
		<!--页面主体-->
		<div class="personal">
			<div class="col-lg-6 col-md-6 col-md-offset-3 col-lg-offset-3 clearfix" >
				<h2>
					个人信息修改
				</h2>

				<!-- form表单部分 -->
				<form id="defaultForm" method="post" class="form-horizontal" action="#">
					<div class="form-group">
						<label class="col-lg-3 control-label">用户名</label>
						<div class="col-lg-5">
							<input type="text" class="form-control" name="username" />
						</div>
					</div>

					<div class="form-group">
						<label class="col-lg-3 control-label">邮箱</label>
						<div class="col-lg-5">
							<input type="text" class="form-control" name="email" readonly="readonly" value="${userEmail}"/>
						</div>
					</div>

					<div class="form-group">
						<label class="col-lg-3 control-label">密码</label>
						<div class="col-lg-5">
							<input type="password" class="form-control" name="password" />
						</div>
					</div>

					<div class="form-group">
						<label class="col-lg-3 control-label">确认密码</label>
						<div class="col-lg-5">
							<input type="password" class="form-control" name="confirmPassword" />
						</div>
					</div>

					<div class="form-group">
						<label class="col-lg-3 control-label">校区</label>
						<div class="col-lg-5">
							<div class="radio">
								<label>
									<input type="radio" name="campus" value="0" /> 本部校区
								</label>
							</div>
							<div class="radio">
								<label>
									<input type="radio" name="campus" value="1" /> 净月校区
								</label>
							</div>
						</div>
					</div>
					<br/>
					<br/>



					<div class="form-group large">
						<div class="col-lg-9 col-lg-offset-3">
							<button type="button" class="btn btn-info" id="validateBtn">确认修改</button>

							<button type="button" class="btn btn-info" id="resetBtn">取消修改</button>
						</div>
					</div>

				</form>


			</div>
		</div>

	</div>
	<!-- footer部分 -->
	<div class="footer">
		<p>Posted by: KingBack</p>
		<p>Contact information: <a href="#">yangf428@nenu.com</a>.</p>
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
    username: {
        /*message: '用户名无效',*/
        validators: {
            notEmpty: {
                message: '用户名不能位空'
            },
            stringLength: {
                min: 4,
                max: 16,
                message: '用户名必须大于3，小于17个字'
            },
            regexp: {
                regexp:  /^[\da-zA-Z_\u4e00-\u9f5a]{4,16}$/,
                message: '用户名只能由中英文组成'
            },
            /*remote: {
                url: '#',
                message: '用户名不可用'
            },*/
            different: {
                field: 'password',
                message: '用户名和密码不能相同'
            }
        }
    },

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
			},
			identical: {
				field: 'confirmPassword',
				message: '两次密码不一致'
			},
			different: {
				field: 'username',
				message: '用户名和密码不能相同'
			}
		}
	},
	confirmPassword: {
		validators: {
			notEmpty: {
				message: '密码不能为空'
			},
			identical: {
				field: 'password',
				message: '两次密码不一致'
			},
			different: {
				field: 'username',
				message: '用户名和密码不能相同'
			}
		}
	},
	campus: {
		validators: {
			notEmpty: {
				message: '请选择校区'
			}
		}
	}
}
});

    // Validate the form manually
    $('#validateBtn').click(function() {
    	$('#defaultForm').bootstrapValidator('validate');
    });

    $('#resetBtn').click(function() {
    	$('#defaultForm').data('bootstrapValidator').resetForm(true);
    });
});
</script>
</body>
</html>
