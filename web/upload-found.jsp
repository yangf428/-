<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" %>
    <!DOCTYPE html>
	<html lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="css/reset.css">
		<link rel="stylesheet" type="text/css" href="css/index.css">
		<link href="http://cdn.bootcss.com/twitter-bootstrap/2.0.4/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="css/bootstrap.css">

		<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
		<script type="text/javascript" src="js/bootstrap.min.js"></script>
		<title>东师拾遗--寻找失主</title>
		<style type="text/css">
			main{
				height: auto;
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
						<a href="upload-lost.jsp">失物</a>
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
			<!-- 页面主体 -->
			<main class="col-lg-6 col-md-6 col-md-offset-3 col-lg-offset-3 clearfix">

				<!-- 表单部分 -->
				<div class="f_out">
				<form class="form-horizontal" action="/UploadFoundServlet" method="post">
					<fieldset>
						<div id="legend" class="">
							<legend class="">填写拾物详细页面</legend>
						</div>
						<div class="control-group">

							<!-- Text input-->
							<%--@declare id="input01"--%>
							<label class="control-label" for="input01">名称</label>
							<div class="controls">
								<input type="text" placeholder="" class="input-xlarge"  name="name">
								<p class="help-block">请不要输入超过8个字</p>
							</div>
						</div>

						<div class="control-group">

							<!-- Select Basic -->
							<label class="control-label">种类</label>
							<div class="controls">
								<select class="input-xlarge" name="type">
									<option>校园卡</option>
									<option>银行卡</option>
									<option>U盘</option>
									<option>现金</option>
									<option>钥匙</option>
									<option>钱包</option>
									<option>手机</option>
									<option>背包</option>
									<option>服饰</option>
									<option>数码电子</option>
									<option>图书资料</option>
									<option>生活用品</option>
									<option>其它卡类</option>
									<option>眼镜</option>
									<option>文具</option>
									<option>其他物品</option>
									<option>身份证</option>
								</select>
								</div>

							</div>

							<div class="control-group">

								<!-- Text input-->
								<label class="control-label" for="input01">时间</label>
								<div class="controls">
									<input type="text" placeholder="年/月/日" class="input-xlarge" name="time">
									<p class="help-block">请按照格式输入</p>
								</div>
							</div>

							<div class="control-group">

								<!-- Textarea -->
								<label class="control-label">地点</label>
								<div class="controls">
									<div class="textarea">
										<textarea type="" class="" id="site" name="site" > </textarea>
									</div>
								</div>
							</div>

							<div class="control-group">

								<!-- Textarea -->
								<label class="control-label">详细</label>
								<div class="controls">
									<div class="textarea">
										<textarea type="" class="" id="detail" name="detail"> </textarea>
									</div>
								</div>
							</div>

							<div class="control-group">

								<!-- Textarea -->
								<label class="control-label">联系方式</label>
								<div class="controls">
									<div class="textarea">
										<textarea type="" class="" id="contact" name="contact"> </textarea>
									</div>
								</div>
							</div>





							<div class="control-group">
								<label class="control-label">照片</label>

								<!-- File Upload -->
								<div class="controls">
									<input class="input-file" id="fileInput" type="file">
								</div>
							</div>

							<div class="control-group">
								<label class="control-label"></label>
								<input type="hidden"  value="${userId}" name="userId"/>
								<!-- Button -->
								<div class="controls">
									<button class="btn btn-success">提交</button>
								</div>
							</div>

						</fieldset>
					</form>
					</div>



				</main>
			</div>

			<!-- footer部分 -->
			<div class="footer">
				<p>Posted by: KingBack</p>
				<p>Contact information: <a href="javascript:;">yangf428@nenu.edu.cn</a>.</p>
			</div>

		</body>
		</html>