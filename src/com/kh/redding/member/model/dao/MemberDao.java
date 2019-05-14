package com.kh.redding.member.model.dao;

import static com.kh.redding.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.redding.member.model.vo.Member;

public class MemberDao {
	private Properties prop = new Properties();
	
	public MemberDao() {
		
		String fileName = MemberDao.class.getResource("/sql/member/member-query.properties").getPath();
		System.out.println(fileName);
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	// member 로그인 확인용 메소드
	public Member loginCheck(Connection con, String memberId, String memberPwd) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member loginUser = null;
		
		String query = prop.getProperty("loginSelect");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, memberId);
			pstmt.setString(2, memberPwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				loginUser = new Member();
				loginUser.setMno(rset.getInt("MNO"));
				loginUser.setMemberId(rset.getString("MID"));
				loginUser.setMemberPwd(rset.getString("MPWD"));
				loginUser.setMemberName(rset.getString("MNAME"));
				loginUser.setNickName(rset.getString("NICK_NAME"));
				loginUser.setPhone(rset.getString("PHONE"));
				loginUser.setEmergenCon(rset.getString("EMERGEN_CON"));
				loginUser.setEmail(rset.getString("EMAIL"));
				loginUser.setEmailCheck(rset.getString("EMAIL_CHECK"));
				loginUser.setGender(rset.getString("GENDER"));
				loginUser.setEnrollDate(rset.getDate("ENROLL_DATE"));
				loginUser.setModifyDate(rset.getDate("MODIFY_DATE"));
				loginUser.setStatus(rset.getString("STATUS"));
				loginUser.setMemberType(rset.getInt("MTYPE"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		System.out.println("loginUser5(dao) : " + loginUser);
		return loginUser;
	}

	// member 회원가입용 메소드
	public int insertMember(Connection con, Member insertMember) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertMember");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, insertMember.getMemberId());
			pstmt.setString(2, insertMember.getMemberPwd());
			pstmt.setString(3, insertMember.getMemberName());
			pstmt.setString(4, insertMember.getNickName());
			pstmt.setString(5, insertMember.getEmail());
			
			String email_check;
			if (insertMember.getEmailCheck().equals("인증안됨")) {
				email_check = "N";
			}else {
				email_check = "Y";
			}
			
			pstmt.setString(6, email_check);
			pstmt.setString(7, insertMember.getPhone());
			pstmt.setString(8, insertMember.getEmergenCon());
			pstmt.setString(9, insertMember.getGender());
			pstmt.setInt(10, 10);
			pstmt.setDate(11, insertMember.getWeddingDate());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	// 닉네임 체크 메소드
	public int nickChecked(Connection con, String nickName) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("nickChecked");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, nickName);
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				result = rset.getInt(1);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		
		
		return result;
	}

	// member 개인정보 수정 메소드
	public int updateMember(Connection con, Member reqMember) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateMember");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, reqMember.getMemberPwd());
			pstmt.setString(2, reqMember.getNickName());
			pstmt.setString(3, reqMember.getPhone());
			pstmt.setString(4, reqMember.getEmergenCon());
			pstmt.setString(5, reqMember.getEmail());
			pstmt.setString(6, reqMember.getGender());
			pstmt.setString(7, reqMember.getMemberId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}

