package com.kh.redding.attachment.model.vo;

public class Attachment implements java.io.Serializable{
	private int aid;
	private String originname;
	private String changename;
	private String filepath;
	private int adivision;
	private int bid;
	private int mno;
	private String acontent;
	
	public Attachment () {}

	public Attachment(int aid, String originname, String changename, String filepath, int adivision, int bid, int mno,
			String acontent) {
		super();
		this.aid = aid;
		this.originname = originname;
		this.changename = changename;
		this.filepath = filepath;
		this.adivision = adivision;
		this.bid = bid;
		this.mno = mno;
		this.acontent = acontent;
	}

	public int getAid() {
		return aid;
	}

	public void setAid(int aid) {
		this.aid = aid;
	}

	public String getOriginname() {
		return originname;
	}

	public void setOriginname(String originname) {
		this.originname = originname;
	}

	public String getChangename() {
		return changename;
	}

	public void setChangename(String changename) {
		this.changename = changename;
	}

	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}

	public int getAdivision() {
		return adivision;
	}

	public void setAdivision(int adivision) {
		this.adivision = adivision;
	}

	public int getBid() {
		return bid;
	}

	public void setBid(int bid) {
		this.bid = bid;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getAcontent() {
		return acontent;
	}

	public void setAcontent(String acontent) {
		this.acontent = acontent;
	}

	@Override
	public String toString() {
		return "Attachment [aid=" + aid + ", originname=" + originname + ", changename=" + changename + ", filepath="
				+ filepath + ", adivision=" + adivision + ", bid=" + bid + ", mno=" + mno + ", acontent=" + acontent
				+ "]";
	}


	
}
