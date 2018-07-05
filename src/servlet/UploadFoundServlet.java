package servlet;

import dao.GoodsDAO;
import dao.TypeDAO;
import entity.Good;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;

@WebServlet(urlPatterns = "/UploadFoundServlet")
public class UploadFoundServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("text/html");

        Good good = new Good();
        GoodsDAO goodsDAO = new GoodsDAO();

        String name = req.getParameter("name");
        String typename = req.getParameter("type");
        //String time = req.getParameter("time");
        String site = req.getParameter("site");
        String explain = req.getParameter("explain");
        String contact = req.getParameter("contact");

        good.setName(name);

        //Type的设置
        TypeDAO typeDAO = new TypeDAO();
        int typeid = typeDAO.findTypeIdByName(typename);
        good.setType(typeid);


        //这个时间并不是用户输入的时间，而是正常的北京时间
        /*SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
        good.setTime(sdf);*/

        good.setSite(site);
        good.setExplain(explain);
        good.setFabucontact(contact);
        good.setKind(1);


        //userId的获取
        int userId = Integer.parseInt(req.getParameter("userId"));
        good.setFabuid(userId);


        //保存信息到数据库
        goodsDAO.save(good);






        //传id到lost-detail.jsp
        int id = good.getId();
        //req.setAttribute("id1",id1);
        req.getRequestDispatcher("found-detail.jsp?id="+id).forward(req,resp);


    }
}
