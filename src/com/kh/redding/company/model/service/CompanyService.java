package com.kh.redding.company.model.service;

import static com.kh.redding.common.JDBCTemplate.close;
import static com.kh.redding.common.JDBCTemplate.commit;
import static com.kh.redding.common.JDBCTemplate.getConnection;
import static com.kh.redding.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.redding.attachment.model.vo.Attachment;
import com.kh.redding.company.model.dao.CompanyDao;
import com.kh.redding.company.model.vo.Company;
import com.kh.redding.member.model.vo.Member;

public class CompanyService {

	//아이디 중복 조회
	public int registerCheck(String userId) {
		Connection con = getConnection();
		
		int result = new CompanyDao().registerCheck(con,userId);
		
		close(con);
		
		return result;
	}

	//업체 insert -> 회원가입
	public int insertCompany(Member joinMember, Company joinCompany, Attachment joinAttach) {
		Connection con = getConnection();
		
		int mem_result = new CompanyDao().insertMember(con,joinMember);
		int com_result = 0;
		
		if (mem_result > 0) {
			int mno = new CompanyDao().selectMID(con);
			
			joinCompany.setCNO(mno);
			
			joinAttach.setMno(mno);
			
			System.out.println("cno :"+joinCompany.getCNO());
			
			int att_result = new CompanyDao().insertRegNum(con, joinAttach);
			
			if (att_result > 0) {
				int reg_num = new CompanyDao().selectRegNum(con);
				
				joinCompany.setCom_Rep_Num(reg_num);
				
				com_result = new CompanyDao().insertCompany(con,joinCompany);
			}
			
		}
				
		if (com_result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return com_result;
	}

	//업체 정보 조회 
	public HashMap<String, Object> selectCompanyInf(Member loginUser) {
		//업체 정보를 담아놓는 객체
		Connection con = getConnection();
		
		HashMap<String,Object> loginCompany= new CompanyDao().selectCompanyInf(con,loginUser);
		
		close(con);
		
		return loginCompany;
	}

	public int UpdateMemberPasword(String password, String changepassword, String memberId) {
		Connection con = getConnection();
		
		int result = new CompanyDao().UpdateMemberPassword(con, password, changepassword , memberId);
		
		if (result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		
		return result;
	}

	public int UpdateCompany(Member joinMember, Company joinCompany, Attachment joinAttach) {
		Connection con = getConnection();
		
		int totalresult = 0;
		
		int result = new CompanyDao().UpdateMember(con,joinMember);
		
		if (result > 0) {
			int mno = new CompanyDao().selectCNO(con, joinMember.getMemberId() , joinMember.getMemberPwd());
			
			joinCompany.setCNO(mno);
			
			joinAttach.setMno(mno);
			
			int result2 = new CompanyDao().updateAttachment(con, joinAttach);
			
			if (result2 > 0) {
				
				totalresult = new CompanyDao().UpdateCompany(con, joinCompany);
			}
			
		}

		
		if (totalresult > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		
		
		return totalresult;
	}

	

	public int UpdateCompany(Member joinMember, Company joinCompany, int aid) {
		Connection con = getConnection();
		
		int totalresult = 0;
		
		int result = new CompanyDao().UpdateMember(con,joinMember);
		
		if (result > 0) {
			int mno = new CompanyDao().selectCNO(con, joinMember.getMemberId() , joinMember.getMemberPwd());
			
			joinCompany.setCNO(mno);
			
			joinCompany.setCom_Rep_Num(aid);
			
			totalresult = new CompanyDao().UpdateCompany(con, joinCompany);
		
		}

		
		if (totalresult > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		
		
		return totalresult;
	}

	public int insertAttachment(Member loginUser, ArrayList<Attachment> fileList) {
		Connection con = getConnection();
		
		int result = new CompanyDao().inserAttachment(con, loginUser.getMno() , fileList);
		
		if (result == fileList.size()) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		
		return result;
	}


	public ArrayList<Attachment> selectCompanyPhoto(int mno) {
		Connection con = getConnection();
		
		ArrayList<Attachment> list = new CompanyDao().selectCompanyPhoto(con,mno);
		
		close(con);
		
		return list;
	}
	
}
