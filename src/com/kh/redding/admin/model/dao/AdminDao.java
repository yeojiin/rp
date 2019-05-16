package com.kh.redding.admin.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.redding.admin.model.vo.TotalMemberPageInfo;
import com.kh.redding.member.model.vo.Member;
import static com.kh.redding.common.JDBCTemplate.*;

public class AdminDao {
	
	private Properties prop = new Properties();
	
	public AdminDao() {
		
		String fileName = AdminDao.class.getResource("/sql/admin/admin-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	// 전체 회원 목록 조회 (페이징 처리)
	public ArrayList<Member> selectList(Connection con, TotalMemberPageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Member> list = null;
		
		String query = prop.getProperty("selectListAfterPaging");
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
		int endRow = startRow + pi.getLimit() - 1;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
						
			rset = pstmt.executeQuery();
						
			list = new ArrayList<Member>();
			
			while(rset.next()) {
				Member member = new Member();
				
				member.setMno(rset.getInt("MNO"));
				member.setMemberId(rset.getString("MID"));
				member.setMemberPwd(rset.getString("MPWD"));
				member.setMemberName(rset.getString("MNAME"));
				member.setNickName(rset.getString("NICK_NAME"));
				member.setPhone(rset.getString("PHONE"));
				member.setEmergenCon(rset.getString("EMERGEN_CON"));
				member.setEmail(rset.getString("EMAIL"));
				member.setEmailCheck(rset.getString("EMAIL_CHECK"));
				member.setGender(rset.getString("GENDER"));
				member.setEnrollDate(rset.getDate("ENROLL_DATE"));
				member.setModifyDate(rset.getDate("MODIFY_DATE"));
				member.setStatus(rset.getString("STATUS"));
				member.setMemberType(rset.getInt("MTYPE"));
				
				list.add(member);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}
	
	// 전체 회원 수 조회용 메소드
	public int getAllListCount(Connection con) {
		
		Statement stmt = null;
		int allMemberListCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("allMemberlistCount");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				allMemberListCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		return allMemberListCount;
	}
		
	// 신규 회원 수 조회용 메소드
	public int getNewListCount(Connection con) {
		Statement stmt = null;
		int newMemberlistCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("newMemberlistCount");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				newMemberlistCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		return newMemberlistCount;
	}

	// 탈퇴 회원 수 조회용 메소드
	public int allMemberListCount(Connection con) {
		Statement stmt = null;
		int withdrawalMemberlistCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("withdrawalMemberlistCount");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				withdrawalMemberlistCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		return withdrawalMemberlistCount;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
