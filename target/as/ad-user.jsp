<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" %>
<%@ page import="entity.User" %>
<%@ page import="dao.UserDAO" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>东师拾遗--用户管理</title>

	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<meta name="apple-mobile-web-app-capable" content="yes" />    

	<link href="./css/bootstrap.min.css" rel="stylesheet" />
	<link href="./css/bootstrap-responsive.min.css" rel="stylesheet" />


	<link href="./css/font-awesome.css" rel="stylesheet" />

	<link href="./css/adminia.css" rel="stylesheet" /> 
	<link href="./css/adminia-responsive.css" rel="stylesheet" /> 


	<link href="./css/pages/faq.css" rel="stylesheet" /> 

	<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
      <![endif]-->
      <style type="text/css">
		h3{
	float: left;
	width: 90px;
}
input{
	font-size: 15px;
}
#submit{
	margin-left: 60%;
	width: 100px;
	height: 30px;
	background-color: white;
	font-size: 20px;
	line-height: 30px;
}
	</style>
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
      								<%=request.getAttribute("userName")%><b class="caret"></b>
      							</a>

      							<ul class="dropdown-menu">
      								<li>
      									<a href="./ad-account.jsp"><i class="icon-user"></i> 账户设置 </a>
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

      						<li class="active">
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
      						<li>
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

					<%
						UserDAO userDAO = new UserDAO();
						ArrayList<User> userList= userDAO.getAllUsers();
						User user;
					%>



      				<div class="span9">

      					<h1 class="page-title">
      						<i class="icon-pushpin"></i>
      						用户管理					
      					</h1>

      					<div class="widget">
														
					<div class="widget-content">
						
						<%--<h3>所属校区</h3>
						<input type="radio" name="school" value="campus one">本部校区
						<input type="radio" name="school" value="campus two"/>净月校区
						<input type="submit" name="submit" id="submit" value="筛选"/>--%>
						
						<div class="widget widget-table">
										
					<div class="widget-header">
						<%--<i class="icon-th-list"></i>--%>
						<h3 style="line-height: 40px;">用户列表</h3>
					</div> <!-- /widget-header -->
					
					<div class="widget-content">
					
						<table class="table table-striped table-bordered">
							<thead>
								<tr>
									<th>用户ID</th>
									<th>校内邮箱</th>
									<th>手机号码</th>
								</tr>
							</thead>							
							<tbody>
							<%
								for (int i = 0;i<userList.size()-1;i++){
									user = userList.get(i);
							%>
								<tr>
									<td><%=user.getId()%></td>
									<td><%=user.getEmail()%></td>
									<td><%=user.getPassword()%></td>
								</tr>
							<%
								}
							%>

							</tbody>
						</table>

					</div> <!-- /widget-content -->
					
				</div> <!-- /widget -->
					</div> <!-- /widget-content -->
					
				</div> <!-- /widget -->




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

</body>
</html>
