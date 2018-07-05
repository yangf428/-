package dao;

import entity.Good;
import entity.User;
import utils.JDBCUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UserDAO {

	/**
	 * 获得所有物品
	 * @return
	 */
	public ArrayList<User> getAllUsers() {
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;

		ArrayList list = new ArrayList();
		try {
			conn = JDBCUtils.getConnection();

			String sql = "select * from user /*order by userid *//*desc*//* */";
			stat = conn.prepareStatement(sql);

			rs = stat.executeQuery();

			while (rs.next()) {
				User user = new User();
				user.setId(rs.getInt("userid"));
				user.setName(rs.getString("userid"));
				user.setPassword(rs.getString("userpassword"));
				user.setEmail(rs.getString("useremail"));

				list.add(user);
			}
			ArrayList localArrayList1 = list;
			return localArrayList1;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtils.release(rs, stat, conn);
		}
		return null;
	}
	/**
	 * 通过用户名查找用户
	 * @param name
	 * @return
	 */
	public static User findUserByName(String name) throws SQLException{
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;

		try {
			//3.获取连接后发送sql语句访问数据库
			conn = JDBCUtils.getConnection();
			if(conn!=null){
				conn.setAutoCommit(false);//关闭自动提交，即开启手动事务
			}

			String sql = "select * from user where username=?";
			stat = conn.prepareStatement(sql);
			stat.setString(1, name);

			rs = stat.executeQuery();

			conn.commit();//提交事务

			if (rs.next()) {
				User u = new User();
				u.setId(rs.getInt("userid"));
				u.setName(rs.getString("username"));
				u.setPassword(rs.getString("userpassword"));
				u.setEmail(rs.getString("useremail"));
				User localUser1 = u;
				return localUser1;
			}
		} catch (Exception e) {
			if(conn!=null){
				try{
					conn.rollback();//发生异常回滚事务
				}catch(Exception e1){
					e1.printStackTrace();
					System.out.println("回滚出错");
				}
			}
			e.printStackTrace();
		} finally {
			JDBCUtils.release(rs, stat, conn);
		}
		return null;
	}


	/**
	 * 通过邮箱查找用户
	 * @param email
	 * @return
	 */
	public static User findUserByEmail(String email) throws SQLException{
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		try {
			conn = JDBCUtils.getConnection();

			String sql = "select * from user where useremail=?";
			stat = conn.prepareStatement(sql);
			stat.setString(1, email);

			rs = stat.executeQuery();

			if (rs.next()) {
				User u = new User();
				u.setId(rs.getInt("userid"));
				u.setName(rs.getString("username"));
				u.setPassword(rs.getString("userpassword"));
				u.setEmail(rs.getString("useremail"));
				return u;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtils.release(rs, stat, conn);
		}
		return null;
	}

	/**
	 * 通过用户id查找用户
	 * @param id
	 * @return
	 */
	public static User findUserById(int id) throws SQLException{
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		try {
			conn = JDBCUtils.getConnection();

			String sql = "select * from user where userid=?";
			stat = conn.prepareStatement(sql);
			stat.setInt(1, id);

			rs = stat.executeQuery();

			if (rs.next()) {
				User u = new User();
				u.setId(rs.getInt("userid"));
				u.setName(rs.getString("username"));
				u.setPassword(rs.getString("userpassword"));
				u.setEmail(rs.getString("useremail"));
				return u;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtils.release(rs, stat, conn);
		}
		return null;
	}

	/**
	 * 保存用户信息，注册
	 * @param user
	 */
	public void save(User user) throws SQLException{
		Connection conn = null;
		PreparedStatement stat = null;
		try {
			conn = JDBCUtils.getConnection();

			//String sql = "insert into user(username,userpassword,useremail) values(?,?,?)";
			String sql = "insert into user (username,userpassword,useremail) values(?,?,?)";
			//sql = sql + "values(?,?,?)";*/
			stat = conn.prepareStatement(sql);

			stat.setString(1, user.getName());
			stat.setString(2, user.getPassword());
			stat.setString(3, user.getEmail());

			stat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtils.release(null, stat, conn);
		}
	}

	/**
	 * 修改数据
	 * @param user
	 * 我觉得没用，所以删掉了
	 */


	/**
	 * 修改密码
	 * @param newpass
	 * @param userid
	 */
	public void changePass(String newpass, int userid) throws SQLException{
		Connection conn = null;
		PreparedStatement stat = null;
		try {
			conn = JDBCUtils.getConnection();

			String sql = "UPDATE USER SET userpassword=? where userid=?";
			stat = conn.prepareStatement(sql);

			stat.setString(1, newpass);
			stat.setInt(2, userid);

			stat.execute();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtils.release(null, stat, conn);
		}
	}

	public User validate(User user) {
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		User u = new User();
		try {

			conn = JDBCUtils.getConnection();

			String sql = "select * from user where useremail=? and userpassword=?";
			stat = conn.prepareStatement(sql);
			stat.setString(1,user.getEmail());
			stat.setString(2,user.getPassword());

			rs = stat.executeQuery();

			if (rs.next()) {

				u.setId(rs.getInt("userid"));
				u.setName(rs.getString("username"));
				u.setPassword(rs.getString("userpassword"));
				u.setEmail(rs.getString("useremail"));
				System.out.println(u.getId()+"idididiididdi");
				return u;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}/* finally {
			JDBCUtils.release(rs, stat, conn);
		}*/
		return u;
	}


	public User validate1(String email,String password) {
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		User u = new User();
		try {
			conn = JDBCUtils.getConnection();

			String sql = "select * from user where useremail=? and userpassword=?";
			stat = conn.prepareStatement(sql);

			stat.setString(1, email);
			stat.setString(2,password);

			rs = stat.executeQuery();

			if (rs.next()) {

				u.setId(rs.getInt("userid"));
				u.setName(rs.getString("username"));
				u.setPassword(rs.getString("userpassword"));
				u.setEmail(rs.getString("useremail"));
				System.out.println(u.getId()+"idididiididid");
				return u;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtils.release(rs, stat, conn);
		}
		return u;
	}

}
