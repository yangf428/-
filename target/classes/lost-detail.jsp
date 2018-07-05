<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" %>
<%@ page import="entity.Good" %>
<%@ page import="service.TypeService" %>
<%@ page import="service.GoodService" %>
<%@ page import="java.sql.Timestamp" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		
		<link rel="stylesheet" type="text/css" href="css/reset.css">
		<link rel="stylesheet" type="text/css" href="css/index.css">
		<link rel="stylesheet" href="css/bootstrap.css">
		<title>东师拾遗--遗失详细</title>
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
				int userId = 0;
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
				}

			%>
			<%--把从a标签传过来的id保存到域--%>
			<%
				Good g;
				TypeService t3 = new TypeService();
				GoodService gservise = new GoodService();
				int id1 = Integer.parseInt(request.getParameter("id1"));
				g = gservise.getGoodById(id1);
				String name = g.getName();
				String time = String.valueOf(g.getGoodtime());
				/*Timestamp time = g.getGoodtime();*/
				String site = g.getSite();
				String type = t3.findTypeNameById(g.getType());
				String explain = g.getExplain();
				String fabucontext = g.getFabucontact();
				String fabupicture = g.getPicture();
			%>

			<!--页面主体-->
			<div class="col-lg-6 col-md-6 col-md-offset-3 col-lg-offset-3 clearfix" style="margin-top: 100px; margin-bottom: 100px;">
				<h2>
					失物详细信息
				</h2>
				<table class="table table-hover table-responsive">
					<tbody>
					<tr>
						<td>名称</td>
						<td><%=name%></td>
					</tr>
					<tr>
						<td>种类</td>
						<td><%=type%></td>
					</tr>
					<tr>
						<td>时间</td>
						<td><%--<%=time%>--%>2017-01-23</td>
					</tr>
					<tr>
						<td>地点</td>
						<td><%=site%></td>
					</tr>
					<tr>
						<td>详情</td>
						<td><%=explain%></td>
					</tr>
					<tr>
						<td>联系方式</td>
						<td><%=fabucontext%></td>
					</tr>
					<tr>
						<td>照片</td>
						<td>
							<%= fabupicture%>
						</td>
					</tr>
					</tbody>
				</table>
			</div>
		</div>
			<!-- footer部分 -->
		<div class="footer">
			<p>Posted by: KingBack</p>
			<p>Contact information: <a href="javascript:;">yangf428@nenu.edu.cn</a>.</p>
		</div>
		
	</body>
</html>
