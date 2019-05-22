package com.kh.redding.message.model.service;

import static com.kh.redding.common.JDBCTemplate.*;

import java.sql.Connection;

import com.kh.redding.company.model.vo.Company;
import com.kh.redding.message.model.dao.MessageDao;

public class MessageService {
	//쪽지 보내기를 위한 업체 번호 받아오기
	public Company selectCompanyOne(String cname) {
		Connection con = getConnection();
		Company com = new MessageDao().selectCompanyOne(con, cname);
		close(con);
		return com;
	}

}
