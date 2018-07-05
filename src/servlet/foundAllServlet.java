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

@WebServlet ("/foundAll")
public class foundAllServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String s=request.getParameter("name1");
        // 设置响应内容类型
        // 设置响应内容类型
        response.setContentType("text/json; charset=utf-8");
        PrintWriter out = response.getWriter();

        Connection conn = null;
        PreparedStatement stat = null;
        ResultSet rs1 = null;


        try {
            conn = JDBCUtils.getConnection();
            String sql;
            sql = "SELECT * FROM good Where kind = 0";
            stat = conn.prepareStatement(sql);
            rs1 = stat.executeQuery(sql);

            JSONArray array = new JSONArray();
            JSONObject obj = new JSONObject();
            // 展开结果集数据库
            while(rs1.next()){
                // 通过字段检索
                obj.put("campus", rs1.getString("goodcampus"));
                obj.put("datetime",rs1.getString("fabutime"));
                obj.put("name", rs1.getString("goodname"));
                obj.put("type", rs1.getString("goodtype"));
                obj.put("site", rs1.getString("goodsite"));
                obj.put("explain", rs1.getString("goodexplain"));

                array.add(obj);
            }

            JSONObject obj1 = new JSONObject();
            obj1.put("total",array.size());
            obj1.put("rows",array);



           /* System.out.println(jsonarray.toString());*/

            PrintWriter writer=response.getWriter();


            writer.print(obj1);
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
