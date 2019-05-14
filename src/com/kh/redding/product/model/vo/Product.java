package com.kh.redding.product.model.vo;

import java.sql.Date;

public class Product implements java.io.Serializable{
	private int pno;
	private String pname;
	private String pcontent;
	private int price;
	private Date penroll_date;
	private int cno;
	private Date pmodify_date;
	
	public Product() {}

	public Product(int pno, String pname, String pcontent, int price, Date penroll_date, int cno, Date pmodify_date) {
		super();
		this.pno = pno;
		this.pname = pname;
		this.pcontent = pcontent;
		this.price = price;
		this.penroll_date = penroll_date;
		this.cno = cno;
		this.pmodify_date = pmodify_date;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getPcontent() {
		return pcontent;
	}

	public void setPcontent(String pcontent) {
		this.pcontent = pcontent;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Date getPenroll_date() {
		return penroll_date;
	}

	public void setPenroll_date(Date penroll_date) {
		this.penroll_date = penroll_date;
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public Date getPmodify_date() {
		return pmodify_date;
	}

	public void setPmodify_date(Date pmodify_date) {
		this.pmodify_date = pmodify_date;
	}

	@Override
	public String toString() {
		return "Product [pno=" + pno + ", pname=" + pname + ", pcontent=" + pcontent + ", price=" + price
				+ ", penroll_date=" + penroll_date + ", cno=" + cno + ", pmodify_date=" + pmodify_date + "]";
	}
	
	
}
