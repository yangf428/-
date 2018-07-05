package servlet;

import dao.UserDAO;
import entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/*
 * Cookies设置页面，由load的页面传入相关值
 * param：userId
 * param：userEmail
 */

@WebServlet(urlPatterns = "/load")
public class LoadServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String email=req.getParameter("email");
        String password=req.getParameter("password");

        User user=new User();
            user.setEmail(email);
            user.setPassword(password);

        UserDAO userDao=new UserDAO();
        User user1=userDao.validate(user);
        //System.out.println("user111"+user1.getId());
        //System.out.println("user111"+user1.getEmail());

        int id = user1.getId();
        /*System.out.println(id);*/
        /*if(user1.getId()!=0){*/
        if(id==0){
            resp.sendRedirect("/load.jsp?message=login fail");
            /* req.getRequestDispatcher("/load.jsp?message=login fail").forward(req,resp);*/
           // resp.sendRedirect("/main");
        }else{
            resp.addCookie(new Cookie("userId",String.valueOf(user1.getId())));
            resp.addCookie(new Cookie("userEmail",String.valueOf(user1.getEmail())));
            resp.sendRedirect("/main");

            //resp.sendRedirect("/load.jsp?message=login fail");
        }
    }
}
