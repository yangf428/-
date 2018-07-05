package servlet;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import utils.JDBCUtils;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet ("/lostAll")
public class lostAllServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name1=request.getParameter("name1");
        // 设置响应内容类型
        // 设置响应内容类型
        response.setContentType("text/json; charset=utf-8");
        PrintWriter out = response.getWriter();

        Connection conn = null;
        PreparedStatement stat = null;
        ResultSet rs = null;


        try {
            conn = JDBCUtils.getConnection();
            String sql;
            sql = "SELECT * FROM good Where kind = 1";
            stat = conn.prepareStatement(sql);
            rs = stat.executeQuery(sql);

            JSONArray jsonarray = new JSONArray();
            JSONObject jsonobj = new JSONObject();
            // 展开结果集数据库
            while(rs.next()){
                // 通过字段检索
                jsonobj.put("campus", rs.getString("goodcampus"));
                jsonobj.put("datetime",rs.getString("fabutime"));
                jsonobj.put("name", rs.getString("goodname"));
                jsonobj.put("type", rs.getString("goodtype"));
                jsonobj.put("site", rs.getString("goodsite"));
                jsonobj.put("explain", rs.getString("goodexplain"));

                jsonarray.add(jsonobj);
            }

            JSONObject jsonobj1 = new JSONObject();
            jsonobj1.put("total",jsonarray.size());
            jsonobj1.put("rows",jsonarray);


            System.out.println(jsonarray.toString());

            PrintWriter writer=response.getWriter();


            writer.print(jsonobj1);
            writer.close();


        }catch (Exception e) {
            //out.print("get data error!");
            e.printStackTrace();
        }

    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}
