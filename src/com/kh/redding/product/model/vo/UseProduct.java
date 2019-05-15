package com.kh.redding.product.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class UseProduct implements Serializable{
	private int upNo;
	private String upName;
	private Date useDate;
	private String useStartTime;
	private String useEndTime;
	private int pNo;
	private int uNum;
	
	public UseProduct() {}

	public UseProduct(int upNo, String upName, Date useDate, String useStartTime, String useEndTime, int pNo,
			int uNum) {
		super();
		this.upNo = upNo;
		this.upName = upName;
		this.useDate = useDate;
		this.useStartTime = useStartTime;
		this.useEndTime = useEndTime;
		this.pNo = pNo;
		this.uNum = uNum;
	}

	public int getUpNo() {
		return upNo;
	}

	public void setUpNo(int upNo) {
		this.upNo = upNo;
	}

	public String getUpName() {
		return upName;
	}

	public void setUpName(String upName) {
		this.upName = upName;
	}

	public Date getUseDate() {
		return useDate;
	}

	public void setUseDate(Date useDate) {
		this.useDate = useDate;
	}

	public String getUseStartTime() {
		return useStartTime;
	}

	public void setUseStartTime(String useStartTime) {
		this.useStartTime = useStartTime;
	}

	public String getUseEndTime() {
		return useEndTime;
	}

	public void setUseEndTime(String useEndTime) {
		this.useEndTime = useEndTime;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public int getuNum() {
		return uNum;
	}

	public void setuNum(int uNum) {
		this.uNum = uNum;
	}

	@Override
	public String toString() {
		return "UseProduct [upNo=" + upNo + ", upName=" + upName + ", useDate=" + useDate + ", useStartTime="
				+ useStartTime + ", useEndTime=" + useEndTime + ", pNo=" + pNo + ", uNum=" + uNum + "]";
	}
	
}
