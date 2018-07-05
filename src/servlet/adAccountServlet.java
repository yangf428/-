package servlet;

import entity.Aduser;
import entity.User;
import service.AduserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.*;
import java.io.IOException;
import java.sql.SQLException;

public class adAccountServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");

		String username = req.getParameter("username");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
        String phone = req.getParameter("phone");

		Aduser aduser = new Aduser();
			aduser.setAdname(username);
			aduser.setAdemail(email);
			aduser.setAdpassword(password);
			aduser.setAdphone(phone);
		//把这些信息放入这个对象中

		//获取对象的id

		try {
			AduserService aservice = new AduserService();
			Aduser aduser1 = aservice.findUserByEmail(email);
			//借助Aduser1获取原来的id
				aduser.setAdid(aduser1.getAdid());
			System.out.println("输出原用户信息");
			System.out.println(aduser1);
			System.out.println("输出后来的用户信息");
			System.out.println(aduser);
			aservice.changeAduserData(aduser);

			System.out.println("更新成功");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		JOptionPane.showMessageDialog(null, "更新成功");
		req.getRequestDispatcher("ad-check.jsp").forward(req,resp);



	}
}
