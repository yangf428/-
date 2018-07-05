<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" %>
<%@ page import="entity.Good" %>
<%@ page import="service.GoodService" %>
<%@ page import="service.TypeService" %>
<%@ page import="entity.Type" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/jquery.easy_slides.js"></script>
    <script type="text/javascript" src="js/use.js"></script>

    <link rel="stylesheet" type="text/css" href="css/reset.css">
    <link rel="stylesheet" type="text/css" href="css/index.css">
    <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
    <title>东师拾遗--首页</title>

    <style type="text/css">
        header > div.col-md-6.col-lg-6 > ul > a:nth-child(1) > li{
            color: white;
            background-color:#b2cf87;
        }
    </style>


</head>
<body>
<!-- 导航栏部分 -->

<div class="contain">
    <header>
        <!-- logo部分 -->
        <div class="col-md-3 col-lg-3 col-sm-3 hea_logo">
            <h1></h1>
        </div>

        <!-- 导航栏表单部分 -->
        <div class="col-md-6 col-lg-6 col-sm-6">
            <ul class="nav">

                <a href="index.jsp"> <li>首页</li> </a>

                <a href="lost-all.html"> <li>寻物</li> </a>

                <a href="found-all.html"> <li>拾物</li> </a>

                <a target="_blank" href="mine.jsp"> <li>我的</li> </a>

            </ul>
        </div>

        <!-- 导航栏登录部分 -->
        <div class="col-md-3 col-lg-3 col-sm-3 hea_login">
            <div class="log_a">
                <a href="upload-lost.jsp">寻物</a>
                <a href="upload-found.jsp">拾物</a>
            </div>
        </div>
    </header>

    <%
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
    <!-- 页面主体 -->
    <main class="col-lg-10 col-md-10 col-md-offset-1 col-lg-offset-1 clearfix">

        <!-- 轮播部分 -->
        <div class="carrousel">
            <div class="slider slider_four_in_line">
                <div>
                    <img src="img/book.jpg">
                </div>
                <div>
                    <img src="img/cup.jpg">
                </div>
                <div>
                    <img src="img/pencilcase.jpg">
                </div>
                <div>
                    <img src="img/u.jpg">
                </div>
                <div>
                    <img src="img/powerbeats.jpg">
                </div>
                <div>
                    <img src="img/book.jpg">
                </div>
                <div>
                    <img src="img/cup.jpg">
                </div>
                <div>
                    <img src="img/powerbeats.jpg">
                </div>
                <div>
                    <img src="img/pencilcase.jpg">
                </div>
                <div class="next_button"></div>
                <div class="prev_button"></div>
            </div>
        </div>


        <!-- 三列布局包围部分 -->
        <div class="outer">
            <!-- 公告部分 -->
            <div class="out_bb">
                <div class="bb_1 ">
                    <h2>公告</h2>
                    <div class="bb_2">

                    </div>
                    <div class="bb_2">

                    </div>
                    <div class="bb_2">

                    </div>
                </div>
            </div>

            <%--
            ========================================
               现在开始后台信息处理部分
            ========================================
            --%>


            <%-- 后台信息Begin：--%>
            <%
                GoodService gservice=new GoodService();
                TypeService tservice=new TypeService();
                ArrayList<Good> listByKindLost = gservice.getGoodByKind(0);
                ArrayList<Good> listByKindFound = gservice.getGoodByKind(1);
                Good g;
            %>


            <!-- 失物招领部分 -->
            <div class="out_lost">
                <div class="lost_1 clearfix">

                    <h2>
                        小可爱你在哪里
                    </h2>

                    <table class="table table-hover table-responsive">
                        <tbody>
                        <%

                             /*
                            说明：
                             *lost传至的detail界面的变量id
                             * 所有属性都为原属性名
                             */

                            if (listByKindLost!=null || listByKindLost.size()>=10){
                            	for (int i=0;i<10;i++){

                            		g = listByKindLost.get(i);
                            		//获取list的一个Good对象
                            		Type t3 = tservice.findTypeById(g.getType());
                            		String typename = t3.getTypename();
                            		String goodcampus;

                            		int id = g.getId();
                            		//失物物品的id
                                    pageContext.setAttribute("id",id);

                                    if(g.getGoodcampus()==0){
                                        goodcampus="净月";
                                    }
                                    else {
                                        goodcampus="本部";
                                    }
                        %>

                        <tr>
                            <td><a href="found-detail.jsp?id=${id}"><%=g.getName()%></a></td>
                            <td><%=typename%></td>
                            <td><%=goodcampus%></td>
                            <td><%=g.getFabutime()%></td>
                        </tr>

                        <%
                                }
                            }
                        %>
                        </tbody>
                    </table>

                    <!-- most-popular-ads -->
                    <a href="lost-all.html" class="lost_2">更多</a>
                </div>
            </div>





            <!-- 寻物启事部分 -->
            <div class="out_found">
                <div class="found_1 clearfix">
                    <h2>
                        等待主人的小可爱
                    </h2>
                    <table class="table table-hover table-responsive">
                        <tbody>
                        <%

                            /*
                            说明：
                             *found传至的detail界面的变量id1
                             * 所有属性都为原属性名加数字1
                             */
                            if (listByKindFound!=null || listByKindFound.size()>=10){
                                for (int i=0;i<10;i++){

                                    g = listByKindFound.get(i);
                                    //获取list的一个Good对象
                                    Type t3 = tservice.findTypeById(g.getType());
                                    String typename1 = t3.getTypename();
                                    String goodcampus1;

                                    int id1 = g.getId();
                                    //失物物品的id
                                    pageContext.setAttribute("id1",id1);

                                    if(g.getGoodcampus()==0){
                                        goodcampus1="净月";
                                    }
                                    else {
                                        goodcampus1="本部";
                                    }
                        %>
                        <tr>
                            <td><a href="lost-detail.jsp?id1=${id1}"><%=g.getName()%></a></td>
                            <td><%=typename1%></td>
                            <td><%=goodcampus1%></td>
                            <td><%=g.getFabutime()%></td>
                        </tr>

                        <%
                                }
                            }
                        %>

                        </tbody>
                    </table>
                    <a href="found-all.html" class="found_2">更多</a>

                </div>
            </div>
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