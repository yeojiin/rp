package com.kh.redding.company.model.service;

import static com.kh.redding.common.JDBCTemplate.close;
import static com.kh.redding.common.JDBCTemplate.commit;
import static com.kh.redding.common.JDBCTemplate.getConnection;
import static com.kh.redding.common.JDBCTemplate.rollback;

import java.sql.Connection;

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
	public Company selectCompanyInf(int mno) {
		Connection con = getConnection();
		
		Company loginCompany = new CompanyDao().selectCompanyInf(con,mno);
		
		close(con);
		
		return loginCompany;
	}
	
}
