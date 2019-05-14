package com.kh.redding.product.model.vo;

import java.sql.Date;

public class Use_Product implements java.io.Serializable{
	private int upno;
	private String upname;
	private Date usedate;
	private String usestarttime;
	private String useendtime;
	private int pno;
	private int unum;
	
	public Use_Product() {}

	public Use_Product(int upno, String upname, Date usedate, String usestarttime, String useendtime, int pno,
			int unum) {
		super();
		this.upno = upno;
		this.upname = upname;
		this.usedate = usedate;
		this.usestarttime = usestarttime;
		this.useendtime = useendtime;
		this.pno = pno;
		this.unum = unum;
	}

	public int getUpno() {
		return upno;
	}

	public void setUpno(int upno) {
		this.upno = upno;
	}

	public String getUpname() {
		return upname;
	}

	public void setUpname(String upname) {
		this.upname = upname;
	}

	public Date getUsedate() {
		return usedate;
	}

	public void setUsedate(Date usedate) {
		this.usedate = usedate;
	}

	public String getUsestarttime() {
		return usestarttime;
	}

	public void setUsestarttime(String usestarttime) {
		this.usestarttime = usestarttime;
	}

	public String getUseendtime() {
		return useendtime;
	}

	public void setUseendtime(String useendtime) {
		this.useendtime = useendtime;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public int getUnum() {
		return unum;
	}

	public void setUnum(int unum) {
		this.unum = unum;
	}

	@Override
	public String toString() {
		return "Use_Product [upno=" + upno + ", upname=" + upname + ", usedate=" + usedate + ", usestarttime="
				+ usestarttime + ", useendtime=" + useendtime + ", pno=" + pno + ", unum=" + unum + "]";
	}
	
	

}
