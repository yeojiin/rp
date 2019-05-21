package com.kh.redding.member.model.dao;

import static com.kh.redding.common.JDBCTemplate.close;
import static com.kh.redding.common.JDBCTemplate.getConnection;

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

import com.kh.redding.board.model.dao.BoardDao;
import com.kh.redding.board.model.vo.BoardPageInfo;
import com.kh.redding.member.model.vo.M_comListPageInfo;
import com.kh.redding.member.model.vo.Member;

public class MemberDao {
	private Properties prop = new Properties();
	
	public MemberDao() {
		
		String fileName = MemberDao.class.getResource("/sql/member/member-query.properties").getPath();
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

	public int getListCount(Connection con) {
		Statement stmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("listComCount");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		return listCount;
	}

	public ArrayList<HashMap<String, Object>> selectComList(Connection con, M_comListPageInfo clpi) {
		PreparedStatement pstmt = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectComList");
		
		int startRow = (clpi.getCurrentPage() - 1) * clpi.getLimit() + 1;
		int endRow = startRow + clpi.getLimit() - 1;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String, Object>>();
			
			while(rset.next()) {
				hmap = new HashMap<String, Object>();
				
				hmap.put("filepath", rset.getString("FILE_PATH"));
				hmap.put("changename", rset.getString("CHANGE_NAME"));
				hmap.put("membername", rset.getString("MNAME"));
				hmap.put("price", rset.getInt("PRICE"));
				hmap.put("ComLike", rset.getInt("COM_LIKE"));
				
				list.add(hmap);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}

	public HashMap<String, Object> selectCount(Connection con, int mno) {
		Properties prop = new Properties();
		String fileName = MemberDao.class.getResource("/sql/member/member-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectCount");
		HashMap<String, Object> hmap = null;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, mno);
			pstmt.setInt(2, mno);
			pstmt.setInt(3, mno);
			pstmt.setString(4, "결제");
			
			rset = pstmt.executeQuery();
			
			hmap = new HashMap<String, Object>();
			while(rset.next()) {
				hmap.put("resWait", rset.getInt("RESWAIT"));
				hmap.put("payWait", rset.getInt("PAYWAIT"));
				hmap.put("payFinal", rset.getInt("FINAL"));				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
		return hmap;
	}

	public ArrayList<HashMap<String, Object>> resWaitSelect(Connection con,int value, int mno, BoardPageInfo pi) {
		Properties prop = new Properties();
		String fileName = MemberDao.class.getResource("/sql/member/member-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
			
		PreparedStatement pstmt = null;
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> list = null;
		String query = prop.getProperty("dynamicQuery");
		
					
		try {
			

			if(value == 30 || value == 60 || value == 70){
				pstmt = con.prepareStatement(query);
				if(value == 70) {
					pstmt.setString(1, "환불");
				}else {
					pstmt.setString(1, "결제");
				}
				
				
				rset = pstmt.executeQuery();
				
				list = new ArrayList<HashMap<String, Object>>();
				
				while(rset.next()) {
					HashMap<String, Object> hmap = new HashMap<String, Object>();
					
					hmap.put("payNo", rset.getInt("PAYNO"));
					hmap.put("upno", rset.getInt("UPNO"));
					hmap.put("rnum", rset.getInt("RNUM"));
					hmap.put("pName", rset.getString("PNAME"));
					hmap.put("cName", rset.getString("CNAME"));
					hmap.put("rapply", rset.getString("RAPPLY"));
					hmap.put("price", rset.getInt("PRICE"));
					hmap.put("payDiv", rset.getString("PAYDIV"));
					hmap.put("approval", rset.getString("APPROVAL"));
					
					list.add(hmap);

				}
				
			}else if(value ==10 || value == 20 || value == 40 || value == 50) {   
				stmt = con.createStatement();
				System.out.println("query" + query);
				rset = stmt.executeQuery(query);
				
				list = new ArrayList<HashMap<String, Object>>();
				
				while(rset.next()) {
					
					if(value ==10 || value == 20 ||value == 40 || value == 50) {
						
						HashMap<String, Object> hmap = new HashMap<String, Object>();
						
						hmap.put("resNo", rset.getInt("RESNO"));
						hmap.put("upno", rset.getInt("UPNO"));
						hmap.put("rnum", rset.getInt("RNUM"));
						hmap.put("pName", rset.getString("PNAME"));
						hmap.put("cName", rset.getString("CNAME"));
						hmap.put("rapply", rset.getString("RAPPLY_DATE"));
						hmap.put("price", rset.getInt("PRICE"));
						hmap.put("status", rset.getString("RSTATUS"));
						
						list.add(hmap);
					}
									
				}
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		
		return list;
	}

	public ArrayList<HashMap<String, Object>> selectDetailCom(Connection con, M_comListPageInfo clpi, String mname) {
		PreparedStatement pstmt = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		ResultSet rset = null;
		
		System.out.println("con : " + con);
		System.out.println("mname : " + mname);
		
		String query = prop.getProperty("selectDetailCom");
		
		int startRow = (clpi.getCurrentPage() - 1) * clpi.getLimit() + 1;
		int endRow = startRow + clpi.getLimit() - 1;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, mname);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String, Object>>();
			
			while(rset.next()) {
				hmap = new HashMap<String, Object>();
				
				System.out.println("rset.getString(1) : "+rset.getString("FILE_PATH"));
				
				hmap.put("filepath", rset.getString("FILE_PATH"));
				hmap.put("changename", rset.getString("CHANGE_NAME"));
				hmap.put("comAddress", rset.getString("COM_ADDRESS"));
				hmap.put("ComUrl", rset.getString("COM_URL"));
				hmap.put("OpenTime", rset.getString("OPEN_TIMES"));
				hmap.put("EndTime", rset.getString("CLOSE_TIMES"));
				hmap.put("membername", rset.getString("MNAME"));
				hmap.put("pName", rset.getString("PNAME"));
				
				list.add(hmap);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		System.out.println("hmap : " + hmap);
		System.out.println("listDao : " + list);
		return list;
	}
	
	public int getCountList(Connection con, int value) {
		Properties prop = new Properties();
		String fileName = MemberDao.class.getResource("/sql/member/member-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		Statement stmt = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int count = 0;
		String query = prop.getProperty("countDynamicQuery");
		try {
			if(value == 60) {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, "결제");
				
				rset = pstmt.executeQuery();
				
				
				
			}else {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			}
			
			if(rset.next()) {
				count = rset.getInt(1);				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		
		
		return count;
	}	
	
}

