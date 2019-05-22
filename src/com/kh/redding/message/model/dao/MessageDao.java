package com.kh.redding.message.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.redding.company.model.vo.Company;

public class MessageDao {
	private Properties prop = new Properties();
	
	public MessageDao() {
		String fileName = MessageDao.class.getResource("/sql/message/message-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//쪽지 보내기를 위한 업체 번호 받아오기
	public Company selectCompanyOne(Connection con, String cname) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Company com = null;
		
		String query = prop.getProperty("selectCompanyOne");
		
		try {
			pstmt = con.prepareStatement(query);
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return com;
	}

}
