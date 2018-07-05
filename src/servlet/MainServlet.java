package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/main")
public class MainServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Cookie[] cookies=req.getCookies();
        int id=0;
        String useremail="";
        for(Cookie cookie:cookies){
            if(cookie.getName().equals("userId")){
                id=Integer.parseInt(cookie.getValue());
            }
            if(cookie.getName().equals("userEmail")){
                useremail=cookie.getValue();
            }

        }
        req.getRequestDispatcher("/index.jsp").forward(req,resp);
    }
}
