package com.kh.redding.company.model.dao;

import static com.kh.redding.common.JDBCTemplate.*;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import com.kh.redding.attachment.model.vo.Attachment;
import com.kh.redding.company.model.vo.Company;
import com.kh.redding.member.model.vo.Member;

public class CompanyDao {

	Properties prop = new Properties();
	
	public CompanyDao() {
		String fileName = CompanyDao.class.getResource("/sql/company/company-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public int registerCheck(Connection con, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		try {
			pstmt = con.prepareStatement(prop.getProperty("idCheck"));
			
			pstmt.setString(1, userId);
			
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

	//업체 회원가입 시 회원용
	public int insertMember(Connection con, Member joinMember) {
		PreparedStatement pstmt =null;
		int result = 0;
		
		String query = prop.getProperty("insertMember");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, joinMember.getMemberId());
			pstmt.setString(2, joinMember.getMemberPwd());
			pstmt.setString(3, joinMember.getMemberName());
			pstmt.setString(4, joinMember.getEmail());
			pstmt.setString(5, joinMember.getEmailCheck());
			pstmt.setString(6, joinMember.getPhone());
			pstmt.setInt(7, 20);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		
		return result;
	}

	//회원가입 시 멤버 db에 넣고 그 id 조회
	public int selectMID(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int mno = 0;
		
		String query = prop.getProperty("selectMNO");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if (rset.next()) {
				mno = rset.getInt("currval");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		
		return mno;
	}

	public int insertCompany(Connection con, Company joinCompany) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertCompany");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, joinCompany.getCNO());
			pstmt.setInt(2, joinCompany.getCom_Rep_Num());
			pstmt.setString(3, joinCompany.getRepName());
			pstmt.setString(4, joinCompany.getComAddress());
			pstmt.setString(5, joinCompany.getComUrl());
			pstmt.setString(6, joinCompany.getOpenTime());
			pstmt.setString(7, joinCompany.getEndTime());
			pstmt.setInt(8, joinCompany.getAccountCode());
			pstmt.setString(9, joinCompany.getAccountNum());
			pstmt.setString(10, joinCompany.getAccountName());
			pstmt.setString(11, joinCompany.getComType());
			pstmt.setString(12, joinCompany.getHoliday());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertRegNum(Connection con, Attachment joinAttach) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertRegNum");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, joinAttach.getOriginname());
			pstmt.setString(2, joinAttach.getChangename());
			pstmt.setString(3, joinAttach.getFilepath());
			pstmt.setInt(4, joinAttach.getMno());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public int selectRegNum(Connection con) {
		Statement pstmt = null;
		ResultSet rset = null;
		int reg_num = 0;
		
		String query = prop.getProperty("selectRegNum");
		
		try {
			pstmt = con.createStatement();
			
			rset= pstmt.executeQuery(query);
			
			if (rset.next()) {
				reg_num = rset.getInt(1);
			
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return reg_num;
	}

	public Company selectCompanyInf(Connection con, int mno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Company loginCompany = null;
		
		String query = prop.getProperty("selectCompany");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, mno);
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				loginCompany = new Company();
				
				loginCompany.setCNO(mno);
				loginCompany.setCom_Rep_Num(rset.getInt(""));
			}
					
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return loginCompany;
	}


}
