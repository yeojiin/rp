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
	
	public ArrayList<Member> selectList(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Member> list = null;
		
		String query = prop.getProperty("selectList");
		
		try {
			stmt = con.createStatement();
						
			rset = stmt.executeQuery(query);
						
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
		}
		return list;
	}

}
