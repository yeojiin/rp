package com.kh.redding.admin.model.dao;

import static com.kh.redding.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
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

import com.kh.redding.admin.model.vo.TotalMemberPageInfo;
import com.kh.redding.member.model.vo.Member;

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
	public ArrayList<HashMap<String, Object>> selectList(Connection con, TotalMemberPageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String,Object> hlist = null;
		String num = "";
		Member member = null;
		
		String query = prop.getProperty("selectListAfterPaging");
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
		int endRow = startRow + pi.getLimit() - 1;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			System.out.println(startRow);
			System.out.println(endRow);
						
			rset = pstmt.executeQuery();
						
			list = new ArrayList<HashMap<String, Object>>();
			
			while(rset.next()) {
				hlist = new HashMap<String,Object>();
				member = new Member();
				
				num = rset.getInt("RNUM")+ "";
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
				member.setWeddingDate(rset.getDate("WEDDING_DATE"));
				
				//System.out.println(num);
				
				
				hlist.put("num", num);
				hlist.put("member", member);
				list.add(hlist);
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

	// 회원 상세 정보 조회용 메소드
	public Member selectOneMember(Connection con, int num) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member onemember = null;
		
		String query = prop.getProperty("selectOneMember");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				onemember = new Member();
				
				onemember.setMno(rset.getInt("MNO"));
				onemember.setMemberId(rset.getString("MID"));
				onemember.setMemberPwd(rset.getString("MPWD"));
				onemember.setMemberName(rset.getString("MNAME"));
				onemember.setNickName(rset.getString("NICK_NAME"));
				onemember.setPhone(rset.getString("PHONE"));
				onemember.setEmergenCon(rset.getString("EMERGEN_CON"));
				onemember.setEmail(rset.getString("EMAIL"));
				onemember.setEmailCheck(rset.getString("EMAIL_CHECK"));
				onemember.setGender(rset.getString("GENDER"));
				onemember.setEnrollDate(rset.getDate("ENROLL_DATE"));
				onemember.setMnotiType(rset.getInt("MNOTI_TYPE"));
				onemember.setStatus(rset.getString("STATUS"));
				onemember.setWeddingDate(rset.getDate("WEDDING_DATE"));
				onemember.setOutDate(rset.getDate("OUT_DATE"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return onemember;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
