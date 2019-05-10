package com.kh.redding.company.model.service;

import static com.kh.redding.common.JDBCTemplate.*;

import java.sql.Connection;

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

	public int insertCompany(Member joinMember, Company joinCompany) {
		Connection con = getConnection();
		
		int mem_result = new CompanyDao().insertMember(con,joinMember);
		
		if (mem_result > 0) {
			int mno = new CompanyDao().selectMID(con);
			
			joinCompany.setCNO(mno);
			
		}
		
		int com_result = new CompanyDao().insertCompany(con,joinCompany);
		
		if (com_result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return com_result;
	}

}
