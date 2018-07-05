package servlet;

import dao.GoodsDAO;
import dao.TypeDAO;
import entity.Good;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;


public class UploadLostServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html");

		Good good = new Good();
		GoodsDAO goodsDAO = new GoodsDAO();

		String name = req.getParameter("name");
		String typename = req.getParameter("type");
		/*String time = req.getParameter("time");*/
		String site = req.getParameter("site");
		String explain = req.getParameter("explain");
		String contact = req.getParameter("contact");

		good.setName(name);

		//Type的设置
		TypeDAO typeDAO = new TypeDAO();
		int typeid = typeDAO.findTypeIdByName(typename);
		good.setType(typeid);

		//时间的设置
		//格式 24小时制：2016-07-06 09:39:58
		/*DateFormat dFormat = new SimpleDateFormat("yyyy/MM/dd"); //HH表示24小时制；
		String formatDate = dFormat.format(time);
		System.out.println(formatDate);*/

	   /*time+=" 07:18:09";
	   *//*String time2="1996-09-18 07:18:09";*//*
	   SimpleDateFormat format2=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date= null;//将字符串转换成时间
		try {
			date = format2.parse(time);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		System.out.println(date);*/

		/*//这个时间并不是用户输入的时间，而是正常的北京时间
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		good.setTime(sdf);*/

		//把各种属性值添加到对象中
		/*good.setTime(date);*/
		/*good.setGoodtime(date);*/
		good.setSite(site);
		good.setExplain(explain);
		good.setFabucontact(contact);
		good.setKind(0);


		//userId的获取
		int userId = Integer.parseInt(req.getParameter("userId"));
		good.setFabuid(userId);

		good.setGoodState(0);

		String LostOrFound = "失物";
		req.setAttribute("失物",LostOrFound);

		req.setAttribute("goodUploadLost",good);

		//保存信息到数据库
		goodsDAO.save(good);

//		PrintWriter out = resp.getWriter();
//		out.println("信息发布成功");

		//传id到lost-detail.jsp
		System.out.println(good);
		int id1 = good.getId();
		req.setAttribute("id1",id1);
		/*req.getRequestDispatcher("ad-check.jsp?id1="+id1).forward(req,resp);*/
		req.getRequestDispatcher("checking.jsp?id1="+id1).forward(req,resp);


	}
}
