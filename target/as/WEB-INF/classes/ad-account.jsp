<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>东师拾遗--管理员账户</title>

	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<meta name="apple-mobile-web-app-capable" content="yes" />    

	<link href="./css/bootstrap.min.css" rel="stylesheet" />
	<link href="./css/bootstrap-responsive.min.css" rel="stylesheet" />

	<link rel="stylesheet" type="text/css" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css
	">
	<link rel="stylesheet" href="css/bootstrapValidator.css"/>

	<link href="./css/font-awesome.css" rel="stylesheet" />

	<link href="./css/adminia.css" rel="stylesheet" /> 
	<link href="./css/adminia-responsive.css" rel="stylesheet" /> 


	<link href="./css/pages/plans.css" rel="stylesheet" /> 

	<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
      <![endif]-->

      <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>

      <body>
	  <%
		  String userId = "";
		  String userName = "";
		  String userEmail = "";
		  Cookie cookies[] = request.getCookies();
		  if (cookies != null) {
			  for (int i = 0; i < cookies.length; i++) {  //遍历cookie对象集合
				  if (cookies[i].getName().equals("userId")) {
					  userId = cookies[i].getValue();
					  request.setAttribute("userId", userId);
				  }
				  if (cookies[i].getName().equals("userName")) {
					  userName = cookies[i].getValue();
					  request.setAttribute("userName", userName);
				  }
				  if (cookies[i].getName().equals("userEmail")) {
					  userEmail = cookies[i].getValue();
					  request.setAttribute("userEmail", userEmail);
				  }
			  }
		  }
	  %>

      	<div class="navbar navbar-fixed-top">

      		<div class="navbar-inner">

      			<div class="container">

      				<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> 
      					<span class="icon-bar"></span> 
      					<span class="icon-bar"></span> 
      					<span class="icon-bar"></span> 				
      				</a>

      				<p class="brand" href="./">东师拾遗后台</p>

      				<div class="nav-collapse">

      					<ul class="nav pull-right">

      						<li class="divider-vertical"></li>

      						<li class="dropdown">

      							<a data-toggle="dropdown" class="dropdown-toggle " href="#">
									<%=request.getAttribute("userName")%> <b class="caret"></b>
      							</a>

      							<ul class="dropdown-menu">
      								<li>
      									<a href="./ad-account.jsp"><i class="icon-user"></i> 账户设置  </a>
      								</li>


      								<li class="divider"></li>

      								<li>
      									<a href="./"><i class="icon-off"></i> 退出登录</a>
      								</li>
      							</ul>
      						</li>
      					</ul>

      				</div> <!-- /nav-collapse -->

      			</div> <!-- /container -->

      		</div> <!-- /navbar-inner -->

      	</div> <!-- /navbar -->




      	<div id="content">

      		<div class="container">

      			<div class="row">

      				<div class="span3">

      					<div class="account-container">

      						<div class="account-avatar">
      							<img src="./img/headshot.png" alt="" class="thumbnail" />
      						</div> <!-- /account-avatar -->

      						<div class="account-details">

      							<span class="account-name"><%=request.getAttribute("userName")%></span>

      							<span class="account-role"><%=request.getAttribute("userEmail")%></span>



      						</div> <!-- /account-details -->

      					</div> <!-- /account-container -->

      					<hr />

      					<ul id="main-nav" class="nav nav-tabs nav-stacked">

      						<li>
      							<a href="./ad-check.jsp">
      								<i class="icon-home"></i>
      								审核管理 			
      							</a>
      						</li>

      						<li>
      							<a href="./ad-user.jsp">
      								<i class="icon-pushpin"></i>
      								用户管理	
      							</a>
      						</li>

      						<li>
      							<a href="./ad-power.jsp">
      								<i class="icon-th-list"></i>
      								权限管理		
      							</a>
      						</li>

      						<li>
      							<a href="./ad-lost.jsp">
      								<i class="icon-th-large"></i>
      								招领管理	
      							</a>
      						</li>

      						<li>
      								<a href="./ad-lost.jsp">
      								<i class="icon-th-large"></i>
      								遗失管理	
      							</a>
      						</li>

      						<li class="active">
      							<a href="./ad-account.jsp">
      								<i class="icon-user"></i>
      								个人账户							
      							</a>
      						</li>

      					</ul>



      					<hr />

      					<div class="sidebar-extra">
      						<p>请各位管理员认真完成自己的任务，禁止虚假信息及个人广告出现在页面中。</p>
      					</div> <!-- .sidebar-extra -->

      					<br />

      				</div> <!-- /span3 -->



      				<div class="span8">

      					<h1 class="page-title" style="height:40px; line-height:30px;">
      						<i class="icon-th-large"></i>
      						个人账户					
      					</h1>


      					<div class="row">

      						<div class="span8" style="margin-left:15px;">

      							<div class="widget">

      								<div class="widget-header">
      									<h3 style="margin:0px; padding:0px;">基本信息</h3>
      								</div> <!-- /widget-header -->

      								<div class="widget-content">



      									<div class="tabbable">
      										<ul class="nav nav-tabs">
      											<li class="active">
      												<a href="#1" data-toggle="tab">简介</a>
      											</li>
      										</ul>

      										<br />
											<%--
											================================================================================================
											 从现在开始进行后台处理
											=================================================================================================
											--%>
      										<div class="tab-content">
      											<div class="tab-pane active" id="1">


      												<form id="defaultForm" method="post" class="form-horizontal" action="/adAccountServlet">
      													<div class="form-group">
      														<label class="col-lg-3 control-label">用户名</label>
      														<div class="col-lg-5">
      															<input type="text" class="form-control" name="username" placeholder="<%=request.getAttribute("userName")%>"/>
      														</div>
      													</div>

      													<div class="form-group">
      														<label class="col-lg-3 control-label">邮箱</label>
      														<div class="col-lg-5">
      															<input type="text" class="form-control" name="email" readonly="readonly" value="<%=request.getAttribute("userEmail") %>"/>
      														</div>
      													</div>

      													<div class="form-group">
      														<label class="col-lg-3 control-label">密码</label>
      														<div class="col-lg-5">
      															<input type="password" class="form-control" name="password" placeholder="*********"/>
      														</div>
      													</div>

      													<div class="form-group">
      														<label class="col-lg-3 control-label">确认密码</label>
      														<div class="col-lg-5">
      															<input type="password" class="form-control" name="confirmPassword" placeholder="*********"/>
      														</div>
      													</div>

      													<div class="form-group">
      														<label class="col-lg-3 control-label">联系电话</label>
      														<div class="col-lg-5">
      															<input type="text" class="form-control" name="phone" placeholder="13104453847"/>
      														</div>
      													</div>
      													<br/>
      													<br/>



      													<div class="form-group">
      														<div class="col-lg-9 col-lg-offset-3">
      															<button type="submit" class="btn btn-info" id="validateBtn">编辑个人资料</button>

      															<button type="reset" class="btn btn-info" id="resetBtn">取消编辑</button>
      														</div>
      													</div>

      												</form>
								</div>
							</div>
						</div>








				</div> <!-- /widget-content -->

			</div> <!-- /widget -->

		</div> <!-- /span9 -->

	</div> <!-- /row -->









</div> <!-- /span9 -->


</div> <!-- /row -->

</div> <!-- /container -->

</div> <!-- /content -->


<div id="footer">
	
	<div class="container">				
		<hr />
		<p align="center">&copy; 2018 东师拾遗.</p>
	</div> <!-- /container -->
	
</div> <!-- /footer -->




<!-- Le javascript
	================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="./js/jquery-1.7.2.min.js"></script>


	<script src="./js/bootstrap.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/bootstrapValidator.js"></script>


	<script type="text/javascript">
		$(document).ready(function() {
    // Generate a simple captcha

    $('#defaultForm').bootstrapValidator({
      live: 'disabled',
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
				message: '用户名不能为空'
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
	/*email: {
		validators: {
			notEmpty: {
				message: '邮箱不能为空'
			},
			regexp: {
				regexp:  /^[a-zA-Z]{3,}[0-9]{3,}@nenu.edu.cn$/,
				message: '邮箱地址格式有误'
			}
		}
	},*/
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
	phone: {
		validators: {
			notEmpty: {
				message: '联系电话不能为空'
			},
			regexp: {
				regexp:  /^1[3|4|5|8][0-9]\d{4,8}$/,
				message: '请输入正确的号码'
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
