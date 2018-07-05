package entity;

import java.sql.Timestamp;
import java.util.Date;

public class Good {
	
	private int id;
	private String name;
	private String site;
	private String explain;
	private int type;
	private int fabuid;
	private int state;
	private String picture;
	private String fabucontact;
	private Timestamp goodtime;
	private Timestamp fabutime;
	private int goodcampus;
	private Timestamp time;
	private int kind;
	private int goodState;

	public int getKind() {
		return kind;
	}

	public void setKind(int kind) {
		this.kind = kind;
	}

	public Good(String name, String site, String explain, int type, int goodcampus,
				String fabucontact, Timestamp time) {
		this.name = name;
		this.site = site;
		this.explain = explain;
		this.type = type;
		this.goodcampus = goodcampus;
		this.fabucontact = fabucontact;
		this.time = time;
	}

	public Good(String name, String site, String explain, int type, int fabuid,
				String fabucontact, Timestamp goodtime, int goodcampus, String picture) {
		this.name = name;
		this.site = site;
		this.explain = explain;
		this.type = type;
		this.fabuid = fabuid;
		this.picture = picture;
		this.fabucontact = fabucontact;
		this.goodtime = goodtime;
		this.goodcampus = goodcampus;
	}

	/*public Good(String name, String site, String explain, int type, int fabuid,
				String fabucontact, Timestamp time, int goodcampus, String picture) {
		this.name = name;
		this.site = site;
		this.explain = explain;
		this.type = type;
		this.fabuid = fabuid;
		this.picture = picture;
		this.fabucontact = fabucontact;
		this.time = time;
		this.goodcampus = goodcampus;
	}*/

	public Date getTime() {
		return this.time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}

	public int getGoodcampus() {
		return goodcampus;
	}

	public void setGoodcampus(int goodcampus) {
		this.goodcampus = goodcampus;
	}

	public Timestamp getFabutime() {
		return this.fabutime;
	}

	public void setFabutime(Timestamp fabutime) {
		this.fabutime = fabutime;
	}

	public String getFabucontact() {
		return this.fabucontact;
	}

	public void setFabucontact(String fabucontact) {
		this.fabucontact = fabucontact;
	}

	public Timestamp getGoodtime() {
		return this.goodtime;
	}

	public void setGoodtime(Timestamp goodtime) {
		this.goodtime = goodtime;
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSite() {
		return this.site;
	}

	public void setSite(String site) {
		this.site = site;
	}

	public String getExplain() {
		return this.explain;
	}

	public void setExplain(String explain) {
		this.explain = explain;
	}

	public int getType() {
		return this.type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getFabuid() {
		return this.fabuid;
	}

	public void setFabuid(int fabuid) {
		this.fabuid = fabuid;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getPicture() {
		return this.picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public int getState() {
		return this.state;
	}

	public int getGoodState() {
		return goodState;
	}

	public void setGoodState(int goodState) {
		this.goodState = goodState;
	}

	public Good() {
	}

	@Override
	public String toString() {
		return "Good{" +
				"id=" + id +
				", name='" + name + '\'' +
				", site='" + site + '\'' +
				", explain='" + explain + '\'' +
				", type=" + type +
				", fabuid=" + fabuid +
				", state='" + state + '\'' +
				", picture='" + picture + '\'' +
				", fabucontact='" + fabucontact + '\'' +
				", goodtime=" + goodtime +
				", fabutime=" + fabutime +
				", goodcampus=" + goodcampus +
				", time='" + time + '\'' +
				'}';
	}
}