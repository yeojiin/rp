package com.kh.redding.message.model.service;

import static com.kh.redding.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.redding.company.model.vo.Company;
import com.kh.redding.member.model.vo.Member;
import com.kh.redding.message.model.dao.MessageDao;
import com.kh.redding.message.model.vo.Message;

public class MessageService {
   //쪽지 보내기를 위한 업체 번호 받아오기
	public Member selectCompanyOne(int cno) {
		Connection con = getConnection();
		Member company = new MessageDao().selectCompanyOne(con, cno);
		close(con);
		return company;
	}
	//새로 쪽지 보내기
	public int insertMesToCompany(Message mes) {
		Connection con = getConnection();
		int result = new MessageDao().insertMesToCompany(con, mes);
		
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		return result;
	}

}