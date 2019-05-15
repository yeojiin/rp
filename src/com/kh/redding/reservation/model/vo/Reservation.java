package com.kh.redding.reservation.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Reservation implements Serializable{
	private String userName;
	private String userPhone;
	private String rapplyDate;
	private String status;
	private String startDate;
	private String endDate;
	private String productName;
	private Date completedDate;
	private int resNo;
	public Reservation() {}


	public Reservation(String userName, String userPhone, String rapplyDate, String status, String startDate,
			String endDate, String productName, Date completedDate, int resNo) {
		super();
		this.userName = userName;
		this.userPhone = userPhone;
		this.rapplyDate = rapplyDate;
		this.status = status;
		this.startDate = startDate;
		this.endDate = endDate;
		this.productName = productName;
		this.completedDate = completedDate;
		this.resNo = resNo;
	}


	public int getResNo() {
		return resNo;
	}


	public void setResNo(int resNo) {
		this.resNo = resNo;
	}


	public Date getCompletedDate() {
		return completedDate;
	}



	public void setCompletedDate(Date completedDate) {
		this.completedDate = completedDate;
	}



	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getRapplyDate() {
		return rapplyDate;
	}

	public void setRapplyDate(String rapplyDate) {
		this.rapplyDate = rapplyDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}


	@Override
	public String toString() {
		return "Reservation [userName=" + userName + ", userPhone=" + userPhone + ", rapplyDate=" + rapplyDate
				+ ", status=" + status + ", startDate=" + startDate + ", endDate=" + endDate + ", productName="
				+ productName + ", completedDate=" + completedDate + ", resNo=" + resNo + "]";
	}

	
}
