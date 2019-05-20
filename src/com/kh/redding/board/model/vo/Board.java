package com.kh.redding.board.model.vo;

import java.sql.Date;

public class Board implements java.io.Serializable{
	private int bid;				//게시글번호
	private String btitle;			//게시글제목
	private int bwriter;			//작성자
	private Date bdate;				//작성일자
	private int bcount;				//조회수
	private String bcontent;		//게시글내용
	private int bcategory;			//카테고리
	private int blike;				//추천수
	private String bdivision;			//게시판구분
	private Date bmodify_date;		//게시글수정일자
	private int ref_cnum;			//업체회원번호
	
	public Board () {}

	public Board(int bid, String btitle, int bwriter, Date bdate, int bcount, String bcontent, int bcategory, int blike,
			String bdivision, Date bmodify_date, int ref_cnum) {
		super();
		this.bid = bid;
		this.btitle = btitle;
		this.bwriter = bwriter;
		this.bdate = bdate;
		this.bcount = bcount;
		this.bcontent = bcontent;
		this.bcategory = bcategory;
		this.blike = blike;
		this.bdivision = bdivision;
		this.bmodify_date = bmodify_date;
		this.ref_cnum = ref_cnum;
	}

	public int getBid() {
		return bid;
	}

	public void setBid(int bid) {
		this.bid = bid;
	}

	public String getBtitle() {
		return btitle;
	}

	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}

	public int getBwriter() {
		return bwriter;
	}

	public void setBwriter(int bwriter) {
		this.bwriter = bwriter;
	}

	public Date getBdate() {
		return bdate;
	}

	public void setBdate(Date bdate) {
		this.bdate = bdate;
	}

	public int getBcount() {
		return bcount;
	}

	public void setBcount(int bcount) {
		this.bcount = bcount;
	}

	public String getBcontent() {
		return bcontent;
	}

	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}

	public int getBcategory() {
		return bcategory;
	}

	public void setBcategory(int bcategory) {
		this.bcategory = bcategory;
	}

	public int getBlike() {
		return blike;
	}

	public void setBlike(int blike) {
		this.blike = blike;
	}

	public String getBdivision() {
		return bdivision;
	}

	public void setBdivision(String bdivision) {
		this.bdivision = bdivision;
	}

	public Date getBmodify_date() {
		return bmodify_date;
	}

	public void setBmodify_date(Date bmodify_date) {
		this.bmodify_date = bmodify_date;
	}

	public int getRef_cnum() {
		return ref_cnum;
	}

	public void setRef_cnum(int ref_cnum) {
		this.ref_cnum = ref_cnum;
	}

	@Override
	public String toString() {
		return "Board [bid=" + bid + ", btitle=" + btitle + ", bwriter=" + bwriter + ", bdate=" + bdate + ", bcount="
				+ bcount + ", bcontent=" + bcontent + ", bcategory=" + bcategory + ", blike=" + blike + ", bdivision="
				+ bdivision + ", bmodify_date=" + bmodify_date + ", ref_cnum=" + ref_cnum + "]";
	}
	
	
}
