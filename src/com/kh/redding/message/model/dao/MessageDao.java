package com.kh.redding.message.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

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
	//보낸 쪽지 전체 조회 서블릿
	public ArrayList<Message> selectListMes(Connection con, int wtype) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Message> mesList = null;
		Message mes = null;
		
		String query = prop.getProperty("selectListMes");
		
		//System.out.println("con : " + con);
		//System.out.println("wtype : " + wtype);
		//System.out.println("query : " + query);
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, wtype);
			
			rset = pstmt.executeQuery();
			
			//System.out.println("rset : " + rset);
			
			mesList = new ArrayList<Message>();
			
			while(rset.next()) {
				mes = new Message();
				
				mes.setMessageCode(rset.getInt("MESSAGE_CODE"));
				//System.out.println("rset.getInt(MESSAGE_CODE) : " + rset.getInt("MESSAGE_CODE"));
				mes.setMesContent(rset.getString("MESSAGE_CONTENT"));
				//System.out.println("rset.getString(MESSAGE_CONTENT) : " +rset.getString("MESSAGE_CONTENT"));
				mes.setMesDisDate(rset.getDate("MESSAGE_DISDATE"));
				//System.out.println("rset.getDate(MESSAGE_DISDATE) : " + rset.getDate("MESSAGE_DISDATE"));
				mes.setMesCkDate(rset.getDate("MESSAGE_CKDATE"));
				//System.out.println("rset.getDate(MESSAGE_CKDATE) : " + rset.getDate("MESSAGE_CKDATE"));
				mes.setMesLevel(rset.getInt("MESSAGE_LEVEL"));
				//System.out.println("rset.getInt(MESSAGE_LEVEL) : " + rset.getInt("MESSAGE_LEVEL"));
				mes.setMesWType(rset.getInt("MESSAGE_WTYPE"));
				//System.out.println("rset.getint : " +rset.getInt("MESSAGE_WTYPE"));
				mes.setMesRefCode(rset.getInt("MESSAGE_REFCODE"));
				//System.out.println("rset.getIntMESSAGE_REFCODE) : " + rset.getInt("MESSAGE_REFCODE"));
				mes.setCno(rset.getInt("CNO"));
				//System.out.println("rset.getInt(CNO) : " + rset.getInt("CNO"));
				
				//System.out.println("mes : " + mes);
				mesList.add(mes);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		//System.out.println("mesList Dao : " + mesList);
		return mesList;
	}
	//listCount 확인용 메소드
	public HashMap<String, Object> selectListCount(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		HashMap<String, Object> hmap = null;
		
		String query = prop.getProperty("selectListCount");
		
		try {
			stmt  = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				hmap = new HashMap<String, Object>();
				hmap.put("CK_COUNT", rset.getInt("CK_COUNT"));
				hmap.put("NOCK_COUNT", rset.getInt("NOCK_COUNT"));
				hmap.put("TOTAL_COUNT", rset.getInt("TOTAL_COUNT"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return hmap;
	}

}