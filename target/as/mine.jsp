<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="entity.Good" %>
<%@ page import="dao.GoodsDAO" %>
<%@ page import="service.GoodService" %>
<%@ page import="entity.Type" %>
<%@ page import="service.TypeService" %>
<%@ page import="java.sql.Timestamp" %>
<!DOCTYPE html>
<html  lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>我的</title>
	<link rel="stylesheet" type="text/css" href="css/reset.css">
	<link rel="stylesheet" type="text/css" href="css/mine.css">
	<link rel="stylesheet" type="text/css" href="css/index.css">
	<link rel="stylesheet" href="css/bootstrap.css">

	<style type="text/css">
		header > div.col-md-6.col-lg-6 > ul > a:nth-child(4) > li{
			color: white;
			background-color:#b2cf87;
		}
	</style>

</head>
<body>
			<header>
				<!-- logo部分 -->
				<div class="col-md-3 col-lg-3 hea_logo">
					<h1></h1>
				</div>

				<!-- 导航栏表单部分 -->
				<div class="col-md-6 col-lg-6">
					<ul class="nav">

						<a target="_blank" href="index.jsp"> <li>首页</li> </a>

						<a href="lost-all.html"> <li>寻物</li> </a>

						<a href="found-all.html"> <li>拾物</li> </a>

						<a href="mine.jsp"> <li>我的</li> </a>

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
				ArrayList<Good> g = new ArrayList<Good>();
				TypeService t3 = new TypeService();
				GoodService gservise = new GoodService();

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
				g = gservise.getGoodByFabuId(userId);

			%>


			<%--<%
				/*
				 * 这个是弄cookie的
				 */
				ArrayList<Good> g = new ArrayList<Good>();
				TypeService t3 = new TypeService();
				GoodService gservise = new GoodService();

				int id = 0;
				String useremail="";
			    Cookie cookies[]=request.getCookies();
				if(cookies !=null){
					for(int i = 0;i < cookies.length;i++) {  //遍历cookie对象集合
						if (cookies[i].getName().equals("userId")) {
							id = Integer.parseInt(cookies[i].getValue());
							request.setAttribute("userId",id);
						}if(cookies[i].getName().equals("userEmail")){
						    useremail = cookies[i].getValue();
						    request.setAttribute("userEmail",useremail);
						}
					}
				}
				/*g = gservise.getGoodByFabuId(id);*/


			%>--%>

			<%
				/*
				 * 遍历用户的所有发布记录
				 */
				    Good good ;
				    /*good = gservise.getGoodById(userId);*/
				    ArrayList<Good> list =gservise.getGoodByFabuId(userId);
				    System.out.println(userId);
				    System.out.println(userEmail);
				    System.out.println(list);
					/*pageContext.setAttribute("time",good.getTime());*/
					/*pageContext.setAttribute("site",good.getSite());
					pageContext.setAttribute("type",good.getType());
					pageContext.setAttribute("explain",good.getExplain());
					int state = good.getState();
					if (state==0){
						pageContext.setAttribute("state","未审核");
					}
					else if(state==1){
						pageContext.setAttribute("state","审核通过");
					}else{
						pageContext.setAttribute("state","审核不通过");
					}*/

			%>
			
			<div class="minemain">

				<h2 class="wel">欢迎你！<%= request.getAttribute("userEmail")%></h2>

				<%--<h2 class="wel">欢迎你！&lt;%&ndash;<%= request.getAttribute("userEmail")%>&ndash;%&gt;</h2>--%>

				<a href="personal-revise.jsp"  class="wel-a">修改个人信息</a>
				<!-- 表格部分 -->

				<table>

					<tbody>
					<%--把从a标签传过来的id保存到域--%>
					<tr>
						<td>时间</td>
						<td>地点</td>
						<td>类别</td>
						<td>详情</td>
						<td>状态</td>
					</tr>
					<%--<tr>
						&lt;%&ndash;<td>&lt;%&ndash;${time}&ndash;%&gt;</td>&ndash;%&gt;
						<td>${site}</td>
						<td>${type}</td>
						<td>${explain}</td>
						<td>${state}</td>
					</tr>--%>
					<%
						for(int i=0;i<list.size()-i;i++){
							good = list.get(i);
							String state="未审核" ;
							if(good.getGoodState()==0){

							}else{
								state="审核" ;
							}
							pageContext.setAttribute("state",state);
					%>
					<tr>
						<td><%=good.getFabutime()%></td>
						<td><%=good.getSite()%></td>
						<td><%=good.getType()%> </td>
						<%--<td><%=good.getExplain()%> </td>--%>
						<td><a href="lost-detail.jsp?id1=<%--${good.getId()}--%><%=good.getId()%>"><%= good.getExplain()%></a> </td>
						<td>
							${state}
						</td>
					</tr>

					<%
						}
					%>
					<%--<%
						/*if(g==null) {
							out.print("暂无信息");
						}else{*/

						    for(int i=0;i<g.size();i++){
								GoodService gservice=new GoodService();
								Good g1 =gservice.findGoodById(g.get(i).getId());
								request.setAttribute("goodId",g1.getId());
					%>


					<tr>
						<td><%=g1.getGoodtime()%></td>
						<td><%=g1.getSite()%> </td>
						<td><%=g1.getType()%> </td>
						<td><%=g1.getExplain()%> </td>
						<td><a href="lost-detail.jsp?id1=${goodId}">${ state}</a> </td>
					</tr>

					 <%
							/*}*/
						}
					%>--%>

					</tbody>
				</table>

        		<div class="buttonpos">
        		<input type="submit" name="我要寻物" value="我要寻物" class="minebutton" onclick="window.location.href='upload-lost.jsp'">
        		<input type="submit" name="我要寻物" value="失物寻主" class="minebutton" onclick="window.location.href='upload-found.jsp'">
        		</div>
			</div>



<!-- footer部分 -->
		<div class="footer">
			<p>Posted by: KingBack</p>
			<p>Contact information: <a href="#">yangf428@nenu.com</a>.</p>
		</div>
</body>
</html>