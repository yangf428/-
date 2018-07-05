package servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import dao.UserDAO;
import entity.User;


public class RegisterServlet extends HttpServlet {


	/*
	* 接受前台注册页面的email和password并保存至数据库
	* 之后跳转至登录页面
	* */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String username=req.getParameter("username");
		User user = new User();
		user.setEmail(email);
		user.setPassword(password);
		user.setName(username);

        PrintWriter out = resp.getWriter();

		UserDAO userDao = new UserDAO();

		try {
			userDao.save(user);
			out.println("注册成功！欢迎"+ email + "!" );
			resp.sendRedirect("load.jsp");

		} catch (Exception e) {
			out.println("注册失败！");
		}



	}

	@Override
	public void destroy() {

	}
}
