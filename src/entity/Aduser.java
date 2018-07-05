package entity;

public class Aduser {

	private int adid;
	private String adname;
	private String ademail;
	private String adpassword;
	private String adphone;

	public int getAdid() {
		return adid;
	}

	public void setAdid(int adid) {
		this.adid = adid;
	}

	public String getAdname( ) {
		return  adname;
	}

	public void setAdname(String adname) {
		this.adname = adname;
	}

	public String getAdemail() {
		return ademail;
	}

	public void setAdemail(String ademail) {
		this.ademail = ademail;
	}

	public String getAdpassword() {
		return adpassword;
	}

	public void setAdpassword(String adpassword) {
		this.adpassword = adpassword;
	}

	public String getAdphone() {
		return adphone;
	}

	public void setAdphone(String adphone) {
		this.adphone = adphone;
	}

	public Aduser() {
	}

	public Aduser(int adid, String adname, String ademail, String adpassword, String adphone) {
		this.adid = adid;
		this.adname = adname;
		this.ademail = ademail;
		this.adpassword = adpassword;
		this.adphone = adphone;
	}

	@Override
	public String toString() {
		return "Aduser{" +
				"adid=" + adid +
				", adname='" + adname + '\'' +
				", ademail='" + ademail + '\'' +
				", adpassword='" + adpassword + '\'' +
				", adphone='" + adphone + '\'' +
				'}';
	}


}
