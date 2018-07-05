package service;

import dao.AdUserDAO;
import entity.Aduser;

import java.sql.SQLException;

public class AduserService {

	private AdUserDAO adUserDAO= new AdUserDAO();


	public void changeAduserData(Aduser aduser) throws SQLException {
		adUserDAO.changeAduserData(aduser);
	}
	public Integer findAdidByEmail(String email) throws SQLException{
		return adUserDAO.findAdidByEmail(email);
	}
	public Aduser findUserByEmail(String email) throws SQLException {
		return adUserDAO.findUserByEmail(email);
	}
}
