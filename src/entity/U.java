package entity;

public class U {
	int userid;
	String username;
	String useremail;
	String userpassword;

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUseremail() {
		return useremail;
	}

	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}

	public String getUserpassword() {
		return userpassword;
	}

	public void setUserpassword(String userpassword) {
		this.userpassword = userpassword;
	}


	public U() {

	}

	public U(String username, String useremail, String userpassword) {
		this.username = username;
		this.useremail = useremail;
		this.userpassword = userpassword;
	}

	@Override
	public String toString() {
		return "User{" +
				"userid=" + userid +
				", username='" + username + '\'' +
				", useremail='" + useremail + '\'' +
				", userpassword='" + userpassword + '\'' +
				'}';
	}


}
