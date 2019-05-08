package redding.member.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import redding.member.model.vo.Member;
import static redding.common.JDBCTemplate.*;

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
				loginUser.setNickName(rset.getString("NICK_NAME"));
				loginUser.setPhone(rset.getString("PHONE"));
				loginUser.setEmergenCon(rset.getString("EMERGEN_CON"));
				loginUser.setEmail(rset.getString("EMAIL"));
				loginUser.setEmailCheck(rset.getString("EMAIL_CHECK"));
				loginUser.setGender(rset.getString("GENDER"));
				loginUser.setEnrollDate(rset.getDate("ENROLL_DATE"));
				loginUser.setModifyDate(rset.getDate("MODIFY_DATE"));
				loginUser.setStatus(rset.getString("STATUS"));
				loginUser.setMemberType(rset.getString("MTYPE"));
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
			pstmt.setString(5, insertMember.getPhone());
			pstmt.setString(6, insertMember.getEmergenCon());
			pstmt.setString(7, insertMember.getEmail());
			pstmt.setString(8, insertMember.getGender());
			pstmt.setString(9, insertMember.getStatus());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}

