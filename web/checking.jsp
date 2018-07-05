<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: apple
  Date: 2018/7/2
  Time: 15:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>提交成功</title>
    <style type="text/css">
        div{
            width:400px;
            height:200px;
            margin: 300px auto;
            border:1px solid #2b542c;
        }
        div h1{
            font-size: 30px;
            color:#2b542c;
            font-family: "SimSun", "宋体";
            font-weight: bold;
        }

        a{
            text-decoration: underline;
            color: #0e90d2;
        }
    </style>
</head>
<body>

        <div align="center">
            <input type="hidden" id="use"  value="<%= request.getAttribute("id1")%>"/>
            <h1>正在审核中，<span id="his">3</span>秒后自动跳转</h1><hr/>
            <h1>若未跳转，请点击<a href="index.jsp">这里</a></h1>
        </div>

<script type="text/javascript">

        var time = 3; //时间,秒
        var timelong = 0;
        var id1=document.getElementById("use").value;
        console.log(id1);
        function displaytime(){ //时间递减
            document.all.his.innerHTML = time -timelong ;
            timelong ++;
        }
        function redirect(){ //跳转页
//history.back();
            window.location.href="lost-detail.jsp?id1="+id1;//指定要跳转到的目标页面
        }

        timer=setInterval('displaytime()', 1000);//显示时间
        timer=setTimeout('redirect()',time * 1000); //跳转

</script>
</body>
</html>
