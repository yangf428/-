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
		<title>东师拾遗--修改内容</title>
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
					<form class="form-horizontal">
						<fieldset>
							<div id="legend" class="">
								<legend class="">修改栏中进行修改</legend>
							</div>
							<div class="control-group">

								<!-- Text input-->
								<label class="control-label" >名称</label>
								<div class="controls">
									<input type="text" placeholder="" class="input-xlarge" id="name" name="name">
									<p class="help-block">请不要输入超过8个字</p>
								</div>
							</div>

							<div class="control-group">

								<!-- Select Basic -->
								<label class="control-label">种类</label>
								<div class="controls">
									<select class="input-xlarge">
										<option>全部</option>
										<option>学生卡</option>
										<option>身份证</option>
										<option>学生证</option>
										<option>银行卡</option>
										<option>手机</option>
										<option>钥匙</option>
										<option>钱包</option>
										<option>背包</option>
										<option>耳机</option>
										<option>眼镜</option>
										<option>U盘</option>
										<option>水杯</option>
										<option>课本</option>
										<option>饰品</option>
										<option>电子产品</option>
										<option>书籍</option>
										<option>雨伞</option>
										<option>运动器材</option>
										<option>手表</option>
										<option>衣物</option>
										<option>其他</option>
									</select>
								</div>

							</div>

							<div class="control-group">

								<!-- Text input-->
								<label class="control-label">时间</label>
								<div class="controls">
									<input type="text" placeholder="年/月/日" class="input-xlarge" id="datetime" name="datetime">
									<p class="help-block">请按照格式输入</p>
								</div>
							</div>

							<div class="control-group">

								<!-- Textarea -->
								<label class="control-label">地点</label>
								<div class="controls">
									<div class="textarea">
										<textarea type="" class="" name="site" id="site"> </textarea>
									</div>
								</div>
							</div>

							<div class="control-group">

								<!-- Textarea -->
								<label class="control-label">详细</label>
								<div class="controls">
									<div class="textarea">
										<textarea type="" class="" name="detail" id="detail"> </textarea>
									</div>
								</div>
							</div>

							<div class="control-group">

								<!-- Textarea -->
								<label class="control-label">联系方式</label>
								<div class="controls">
									<div class="textarea">
										<textarea type="" class="" name="contact" id="contact"> </textarea>
									</div>
								</div>
							</div>





							<div class="control-group">
								<label class="control-label">照片</label>

								<!-- File Upload -->
								<div class="controls">
									<input class="input-file" id="fileInput" type="file" name="picture">
								</div>
							</div>

							<div class="control-group">
								<label class="control-label"></label>

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