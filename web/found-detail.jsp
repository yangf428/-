<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" %>
<%@ page import="entity.Good" %>
<%@ page import="dao.GoodsDAO" %>
<%@ page import="service.GoodService" %>
<%@ page import="entity.Type" %>
<%@ page import="service.TypeService" %>
<%@ page import="java.sql.Timestamp" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="css/reset.css">
		<link rel="stylesheet" type="text/css" href="css/index.css">
		<link rel="stylesheet" href="css/bootstrap.css">
		<title>东师拾遗--拾物详细</title>
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

			<%--把从a标签传过来的id保存到域--%>
			<%
				Good g;
				TypeService t3 = new TypeService();
				GoodService gservise = new GoodService();
				int id = Integer.parseInt(request.getParameter("id"));
				g = gservise.getGoodById(id);
				String name = g.getName();
				/*Timestamp time = g.getGoodtime();*/
				String site = g.getSite();
				String type = t3.findTypeNameById(g.getType());
				String explain = g.getExplain();
				String fabucontext = g.getFabucontact();
				String fabupicture = g.getPicture();
				int check = g.getGoodState();
			%>
			
			<!--页面主体-->
			<div class="col-lg-6 col-md-6 col-md-offset-3 col-lg-offset-3 clearfix"  style="margin-top: 100px; margin-bottom: 100px;">
				<h2>
					拾物详细信息<span id="showCheck"></span>
				</h2>
				<input type="hidden" value="<%= check %>" id="check"/>
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
		<script>
			var check=document.getElementById("check").value;
			var show=document.getElementById("showCheck").innerText;
			if(check==='0'){
			    show = "审核中……";
				show.fontcolor("#b2cf87");
			}else if(check==='1'){
                show = "审核通过";
                show.fontcolor("#b2df89");

			}else{
                show = "审核未通过";
                show.fontcolor("#f80");

			}

		</script>
	</body>
</html>
