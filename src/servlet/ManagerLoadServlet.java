package servlet;

import dao.AdUserDAO;
import dao.UserDAO;
import entity.Aduser;
import entity.User;
import service.AduserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/manager-load")
public class ManagerLoadServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


		String password=req.getParameter("password");
		String email=req.getParameter("email");
		System.out.println("前台获取");
		System.out.println(password);
		System.out.println(email);

		Aduser aduser=new Aduser();
		aduser.setAdemail(email);
		aduser.setAdpassword(password);

		AdUserDAO adUserDAO = new AdUserDAO();



		/*
		 * 验证输入的email和密码是否正确
		 */
		Aduser aduser1 = adUserDAO.validate(aduser);
		System.out.println("输出aduser1");
		System.out.println(aduser1);

		int id = aduser1.getAdid();
		//System.out.println(id);
        /*if(user1.getId()!=0){*/
		if(id==0){
			//如果验证不正确
			resp.sendRedirect("/manager-load.jsp?message=login fail");
            /* req.getRequestDispatcher("/load.jsp?message=login fail").forward(req,resp);*/
			// resp.sendRedirect("/main");
		}else{
			//如果验证正确
			resp.addCookie(new Cookie("userId",String.valueOf(aduser1.getAdid())));
			resp.addCookie(new Cookie("userName",String.valueOf(aduser1.getAdname())));
			resp.addCookie(new Cookie("userEmail",String.valueOf(aduser1.getAdemail())));
			System.out.println(aduser1.getAdid());
			System.out.println(aduser1.getAdname());
			System.out.println(aduser1.getAdemail());
			resp.sendRedirect("/HandleCookiesServlet");
		}
	}
}
