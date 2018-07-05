package dao;

import entity.Aduser;
import entity.User;
import utils.JDBCUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class AdUserDAO {


	/**
	 * 获得所有物品
	 * @return aduser
	 */
	public ArrayList<Aduser> getAllAdusers() {
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;

		ArrayList list = new ArrayList();
		try {
			conn = JDBCUtils.getConnection();

			String sql = "select * from aduser /*order by userid *//*desc*//* */";
			stat = conn.prepareStatement(sql);

			rs = stat.executeQuery();

			while (rs.next()) {
				Aduser ad = new Aduser();
				ad.setAdid(rs.getInt("adid"));
				ad.setAdname(rs.getString("adname"));
				ad.setAdpassword(rs.getString("adpassword"));
				ad.setAdemail(rs.getString("ademail"));
				ad.setAdphone(rs.getString("adphone"));

				list.add(ad);
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

	/*
	 * 通过用户email返回用户id
	 * @param：email
	 * @return：
	 */
	public Integer findAdidByEmail(String email) throws SQLException{

		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		int id=0;

		try {
			//3.获取连接后发送sql语句访问数据库
			conn = JDBCUtils.getConnection();

			String sql = "select adid from aduser where ademail=?";
			stat = conn.prepareStatement(sql);
			stat.setString(1, email);

			rs=stat.executeQuery(sql);


			if (rs.next()){
			 id = rs.getInt("adid");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtils.release(rs, stat, conn);
		}
		return id;
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
	 * 通过用户id查找用户
	 * @param email
	 * @return
	 */
	public Aduser findUserByEmail(String email) throws SQLException{
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		try {
			conn = JDBCUtils.getConnection();

			String sql = "select * from aduser where ademail=?";
			stat = conn.prepareStatement(sql);
			stat.setString(1, email);

			rs = stat.executeQuery();

			if (rs.next()) {
				Aduser aduser = new Aduser();
				aduser.setAdid(rs.getInt("adid"));
				aduser.setAdname(rs.getString("adname"));
				aduser.setAdpassword(rs.getString("adpassword"));
				aduser.setAdemail(rs.getString("ademail"));
				aduser.setAdphone("adphone");
				return aduser;
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

			String sql = "insert into user (username,userpassword,useremail) values(?,?,?)";
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
	 * @param id
	 *//*



	//通过username获取userid，然后通过userid指定需要修改的数据！

	public void changeAduserData(Aduser aduser) throws SQLException{
		Connection conn = null;
		PreparedStatement stat = null;
		try {
			conn = JDBCUtils.getConnection();

			String sql = "UPDATE aduser SET adname=?adpassword=?,ademail=?,adphone=? WHERE adid=?";
			stat = conn.prepareStatement(sql);

			stat.setString(1,aduser.getAdpassword());
			stat.setString(2,aduser.getAdemail());
			stat.setString(3,aduser.getAdphone());
			stat.setString(4,aduser.getAdname());

			stat.execute();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtils.release(null, stat, conn);
		}
	}*/


	/**
	 * 修改数据
	 * @param aduser
	 **/
	public void changeAduserData(Aduser aduser) throws SQLException{
		Connection conn = null;
		PreparedStatement stat = null;
		try {
			conn = JDBCUtils.getConnection();

			String sql = "UPDATE aduser SET adname=?,adpassword=?,ademail=?,adphone=? WHERE adid=?";
			stat = conn.prepareStatement(sql);

			stat.setString(1,aduser.getAdname());
			stat.setString(2,aduser.getAdpassword());
			stat.setString(3,aduser.getAdemail());
			stat.setString(4,aduser.getAdphone());
			stat.setInt(5,aduser.getAdid());

			stat.execute();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtils.release(null, stat, conn);
		}
	}
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

	public Aduser validate(Aduser user) {
		Connection conn = null;
		PreparedStatement stat = null;
		ResultSet rs = null;
		Aduser u = new Aduser();
		try {

			conn = JDBCUtils.getConnection();

			String sql = "select * from aduser where ademail=? and adpassword=?";
			stat = conn.prepareStatement(sql);
			stat.setString(1, user.getAdemail());
			stat.setString(2, user.getAdpassword());

			rs = stat.executeQuery();

			if (rs.next()) {

				u.setAdid(rs.getInt("adid"));
				u.setAdname(rs.getString("adname"));
				u.setAdpassword(rs.getString("adpassword"));
				u.setAdemail(rs.getString("ademail"));
				/*System.out.println(u.getAdid()+"idididiididdi");*/
				return u;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtils.release(rs, stat, conn);
		}
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
