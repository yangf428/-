<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" %>
<%@ page import="entity.Aduser" %>
<%@ page import="service.GoodService" %>
<%@ page import="service.TypeService" %>
<%@ page import="entity.Good" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>东师拾遗--后台首页</title>

	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<meta name="apple-mobile-web-app-capable" content="yes" />    

	<link href="./css/bootstrap.min.css" rel="stylesheet" />
	<link href="./css/bootstrap-responsive.min.css" rel="stylesheet" />


	<link href="./css/font-awesome.css" rel="stylesheet" />

	<link href="./css/adminia.css" rel="stylesheet" /> 
	<link href="./css/adminia-responsive.css" rel="stylesheet" /> 

	<link href="./css/pages/dashboard.css" rel="stylesheet" /> 


	<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
	<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/bootstrapValidator.js"></script>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
      <![endif]-->

      <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>

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

<%--<%
			int userId = 0;
			String userName ="";
			String userEmail="";
			Cookie cookies[]=request.getCookies();
			if(cookies !=null){
				for(int i = 0;i < cookies.length;i++) {  //遍历cookie对象集合
					if (cookies[i].getName().equals("userId")) {
						userId = Integer.parseInt(cookies[i].getValue());
						request.setAttribute("userId",userId);
					}
					if (cookies[i].getName().equals("userName")) {
						userId = Integer.parseInt(cookies[i].getValue());
						request.setAttribute("userName",userName);
				}
					if(cookies[i].getName().equals("userEmail")){
						userEmail = cookies[i].getValue();
						request.setAttribute("userEmail",userEmail);
					}
			}

		%>--%>


      <body>

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
									<%=request.getAttribute("userName")%>
      								<%--${userEmail}--%> <b class="caret"></b>
      							</a>

      							<ul class="dropdown-menu">
      								<li>
      									<a href="./ad-account.jsp"><i class="icon-user"></i> 账户设置 </a>
      								</li>


      								<li class="divider"></li>

      								<li>
      									<a href="./"><i class="icon-off"></i> 退出登录 </a>
      								</li>
      							</ul>
      						</li>
      					</ul>

      				</div> <!-- /nav-collapse -->

      			</div> <!-- /container -->

      		</div> <!-- /navbar-inner -->

      	</div> <!-- /navbar -->

		<%
			GoodService gservice=new GoodService();
			TypeService tservice=new TypeService();
			ArrayList<Good> listByKindLost = gservice.getGoodByKind(0);
			ArrayList<Good> listByKindFound = gservice.getGoodByKind(1);
			Good g;
		%>

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


      						<li class="active">
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



      				<div class="span9">

      					<h1 class="page-title">
      						<i class="icon-home"></i>
      						审核管理					
      					</h1>

      					<div class="stat-container">

      						<div class="stat-holder">						
      							<div class="stat">							
      								<span>564</span>							
      								已完成审核							
      							</div> <!-- /stat -->						
      						</div> <!-- /stat-holder -->

      						<div class="stat-holder">						
      							<div class="stat">							
      								<span>423</span>							
      								通过审核							
      							</div> <!-- /stat -->						
      						</div> <!-- /stat-holder -->

      						<div class="stat-holder">						
      							<div class="stat">							
      								<span>96</span>							
      								未通过审核							
      							</div> <!-- /stat -->						
      						</div> <!-- /stat-holder -->

      						<div class="stat-holder">						
      							<div class="stat">							
      								<span>2</span>							
      								未完成审核							
      							</div> <!-- /stat -->						
      						</div> <!-- /stat-holder -->

      					</div> <!-- /stat-container -->

				
				
				
				
				<div class="widget widget-table">

					<div class="widget-header">
						<i class="icon-th-list"></i>
						<h3>审核表</h3>
					</div> <!-- /widget-header -->
					
					<div class="widget-content">

						<table class="table table-striped table-bordered">
							<thead>
								<tr>
									<th>事件</th>
									<th>时间</th>
									<th>校区</th>
									<th>详情</th>
									<th>联系方式</th>
									<th>&nbsp;</th>
								</tr>
							</thead>


							<%
                               Good good = (Good) request.getAttribute("goodUploadLost");
                               ArrayList<Good> weiShenHeList = gservice.getGoodsByGoodstate();
                               //获取未审核的列表
								Good good2;
								for (int i=0;i<weiShenHeList.size()-1;i++){
									good2 = weiShenHeList.get(i);
									String goodCampus = "净月";
									if (good2.getGoodcampus()==1){
										goodCampus = "本部";
									};
									pageContext.setAttribute("goodCampus",goodCampus);
							%>
								<tbody>
								<tr>

									<td><input type="hidden" value="<%=good2.getId()%>" /><%=good2.getName()%></td>
									<td><%=good2.getFabutime()%></td>
									<td><%=goodCampus%></td>
									<td><%=good2.getExplain()%></td>
									<td><%=good2.getFabucontact()%></td>
									<td class="action-td">
										<a href="javascript:;" class="btn btn-small btn-warning" >
											<i class="icon-ok"></i>
										</a>
										<a href="javascript:;" class="btn btn-small">
											<i class="icon-remove"></i>
										</a>
									</td>
								</tr>
								</tbody>
							<%
								}
							%>

						</table>

					</div> <!-- /widget-content -->

					<div class='pagination'></div>
					
				</div> <!-- /widget -->
				
				
				
				

				



					</div> <!-- /container -->
				</div>

			</div>
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
		<script type="text/javascript">
                $(document).ready(function(){
                    var state = 0;
                    var ok = 0;
                    var remove = 0;
                    //审核通过为1，审核不通过为2
                    $('a').click(function () {
                        ok = $("a").index(this) - 8;

                        var goodId=$(this).parent().parent().children("td:eq(0)").find("input").val();
                        console.log('goodId='+goodId);
                        var yu=parseInt(ok % 2);
                        console.log('yu='+typeof yu);

                        if (yu===0 ){
                            ok1 = ok / 2;
                            console.log(ok1);
                            state = 1;
//
                            $(this).parent().parent().hide();
                            console.log(state);
                            return goodId, state;

                        }else{
                            ok2 = (ok + 1) / 2;
                            console.log(ok2);
                            state = 2;
//
                            $(this).parent().parent().hide();
                            console.log(state);
                            return state, goodId;
                        }
                    });
                });


			</script>

</body>
</html>
