package redding.member.model.vo;

import java.sql.Date;

public class Member implements java.io.Serializable {
	private int mno;
	private String memberId;
	private String memberPwd;
	private String memberName;
	private String nickName;
	private String phone;
	private String emergenCon;
	private String email;
	private String emailCheck;
	private String gender;
	private Date enrollDate;
	private Date modifyDate;
	private String status;
	private String memberType;
	
	public Member() {}

	public Member(int mno, String memberId, String memberPwd, String memberName, String nickName, String phone,
			String emergenCon, String email, String emailCheck, String gender, Date enrollDate, Date modifyDate,
			String status, String memberType) {
		super();
		this.mno = mno;
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.nickName = nickName;
		this.phone = phone;
		this.emergenCon = emergenCon;
		this.email = email;
		this.emailCheck = emailCheck;
		this.gender = gender;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.status = status;
		this.memberType = memberType;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPwd() {
		return memberPwd;
	}

	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmergenCon() {
		return emergenCon;
	}

	public void setEmergenCon(String emergenCon) {
		this.emergenCon = emergenCon;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getEmailCheck() {
		return emailCheck;
	}

	public void setEmailCheck(String emailCheck) {
		this.emailCheck = emailCheck;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getMemberType() {
		return memberType;
	}

	public void setMemberType(String memberType) {
		this.memberType = memberType;
	}

	@Override
	public String toString() {
		return "Member [mno=" + mno + ", memberId=" + memberId + ", memberPwd=" + memberPwd + ", memberName="
				+ memberName + ", nickName=" + nickName + ", phone=" + phone + ", emergenCon=" + emergenCon + ", email="
				+ email + ", emailCheck=" + emailCheck + ", gender=" + gender + ", enrollDate=" + enrollDate
				+ ", modifyDate=" + modifyDate + ", status=" + status + ", memberType=" + memberType + "]";
	}

	
}
