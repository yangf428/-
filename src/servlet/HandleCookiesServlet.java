package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


public class HandleCookiesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userId = "";
        String userName = "";
        String userEmail = "";
        Cookie cookies[] = req.getCookies();
        if (cookies != null) {
            for (int i = 0; i < cookies.length; i++) {  //遍历cookie对象集合
                if (cookies[i].getName().equals("userId")) {
                    userId = cookies[i].getValue();
                    req.setAttribute("userId", userId);
                }
                if (cookies[i].getName().equals("userName")) {
                    userName = cookies[i].getValue();
                    req.setAttribute("userName", userName);
                }
                if (cookies[i].getName().equals("userEmail")) {
                    userEmail = cookies[i].getValue();
                    req.setAttribute("userEmail", userEmail);
                }
            }
        }

        req.getRequestDispatcher("ad-check.jsp").forward(req,resp);
    }

}


       /* Cookie[] cookies=req.getCookies();
        int adid=0;
        String ademail="";
        String adname ="";
        for(Cookie cookie:cookies){
            if(cookie.getName().equals("userId")){
                adid=Integer.parseInt(cookie.getValue());
            }
            if(cookie.getName().equals("userName")){
                adname=cookie.getValue();
            }
            if(cookie.getName().equals("userEmail")){
                ademail=cookie.getValue();
            }

        }

        req.setAttribute("adid",adid);
        req.setAttribute("adname",adname);
        req.setAttribute("ademail",ademail);
        req.getRequestDispatcher("ad-check.jsp").forward(req,resp);*/
