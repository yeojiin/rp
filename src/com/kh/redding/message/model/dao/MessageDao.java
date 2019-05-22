package com.kh.redding.message.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.redding.company.model.vo.Company;
import com.kh.redding.member.model.vo.Member;
import com.kh.redding.message.model.vo.Message;

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
	public Member selectCompanyOne(Connection con, int cno) {
		PreparedStatement pstmt = null;
	    ResultSet rset = null;
	    Member company = null;
	    
	    String query = prop.getProperty("selectCompanyOne");
	    
	    try {
	       pstmt = con.prepareStatement(query);
	       
	       pstmt.setInt(1, cno);
	       
	       rset = pstmt.executeQuery();
	       
	       company = new Member();
	       
	       if(rset.next()) {
	          
	    	   company.setMno(rset.getInt("MNO"));
	    	   company.setMemberId(rset.getString("MID"));
	    	   company.setMemberPwd(rset.getString("MPWD"));
	    	   company.setMemberName(rset.getString("MNAME"));
	    	   company.setNickName(rset.getString("NICK_NAME"));
	    	   company.setPhone(rset.getString("PHONE"));
	    	   company.setEmergenCon(rset.getString("EMERGEN_CON"));
	    	   company.setEmail(rset.getString("EMAIL"));
	    	   company.setEmailCheck(rset.getString("EMAIL_CHECK"));
	    	   company.setGender(rset.getString("GENDER"));
	    	   company.setEnrollDate(rset.getDate("ENROLL_DATE"));
	    	   company.setModifyDate(rset.getDate("MODIFY_DATE"));
	    	   company.setStatus(rset.getString("STATUS"));
	    	   company.setMemberType(rset.getInt("MTYPE"));
	    	   company.setOutDate(rset.getDate("OUT_DATE"));
	    	   company.setWeddingDate(rset.getDate("WEDDING_DATE"));
	    	   company.setMnotiType(rset.getInt("MNOTI_TYPE"));
	       }
	       
	    } catch (SQLException e) {
	       e.printStackTrace();
	    }
	    
	    
	    return company;
	}
	//새로 쪽지 보내기 (insert)
	public int insertMesToCompany(Connection con, Message mes) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertMesToCompany");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, mes.getMesContent());
			pstmt.setDate(2, mes.getMesDisDate());
			pstmt.setInt(3, mes.getCno());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
				
		return result;
	}

}