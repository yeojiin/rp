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
import com.kh.redding.company.model.vo.Company;
import com.kh.redding.member.model.dao.MemberDao;
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

	// 전체 회원 목록 조회용 메소드 (페이징 처리)
	public ArrayList<HashMap<String, Object>> selectMemberList(Connection con, TotalMemberPageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String,Object> hlist = null;
		String num = "";
		Member member = null;
		 
		String query = prop.getProperty("selectMemberListAfterPaging");
		
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
	
	// 전체 업체 목록 조회용 메소드 (페이징 처리)
	public ArrayList<HashMap<String, Object>> selectCompanyList(Connection con, TotalMemberPageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String,Object> hlist = null;
		String num = "";
		String comType = "";
		Member member = null;
		
		String query = prop.getProperty("selectCompanyListAfterPaging");
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
		int endRow = startRow + pi.getLimit() - 1;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
						
			rset = pstmt.executeQuery();
						
			list = new ArrayList<HashMap<String, Object>>();
			
			while(rset.next()) {
				hlist = new HashMap<String,Object>();
				member = new Member();
				
				num = rset.getInt("RNUM")+ "";
				comType = rset.getString("COM_TYPE");
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
				
				// System.out.println(num);
				
				hlist.put("num", num);
				hlist.put("comType", comType);
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

	// 전체 업체 수 조회용 메소드
	public int getAllCompanyListCount(Connection con) {
		Statement stmt = null;
		int allCompanylistCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("allCompanylistCount");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				allCompanylistCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		return allCompanylistCount;
	}

	// 신규 업체 수 조회용 메소드
	public int getNewCompanyCount(Connection con) {
		Statement stmt = null;
		int newCompanylistCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("newCompanylistCount");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				newCompanylistCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		return newCompanylistCount;
	}

	// 탈퇴 업체 수 조회용 메소드
	public int getWithdrawalCompanyListCount(Connection con) {
		Statement stmt = null;
		int withdrawalCompanylistCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("withdrawalCompanylistCount");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				withdrawalCompanylistCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		return withdrawalCompanylistCount;
	}

	// 업세 상세 정보 조회용 메소드
	public ArrayList<HashMap<String, Object>> selectOneCompany2(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> oneCompany = null;
		HashMap<String,Object> hlist = null;
		Member member = null;
		Company company = null;
		
		String query = prop.getProperty("selectOneCompany");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			oneCompany = new ArrayList<HashMap<String, Object>>();
			
			while(rset.next()) {
				hlist = new HashMap<String,Object>();
				
				member = new Member();
				member.setMemberId(rset.getString("MID"));
				member.setMemberPwd(rset.getString("MPWD"));
				member.setMemberName(rset.getString("MNAME"));
				member.setPhone(rset.getString("PHONE"));
				member.setEmail(rset.getString("EMAIL"));
				member.setEmailCheck(rset.getString("EMAIL_CHECK"));
				member.setEnrollDate(rset.getDate("ENROLL_DATE"));
				member.setMnotiType(rset.getInt("MNOTI_TYPE"));
				member.setStatus(rset.getString("STATUS"));
				member.setOutDate(rset.getDate("OUT_DATE"));
				
				company = new Company();
				company.setCNO(rset.getInt("CNO"));
				company.setCom_Rep_Num(rset.getInt("COM_REP_NUM"));
				company.setRepName(rset.getString("REP_NAME"));
				company.setComAddress(rset.getString("COM_ADDRESS"));
				company.setComUrl(rset.getString("COM_URL"));
				company.setOpenTime(rset.getString("OPEN_TIMES"));
				company.setEndTime(rset.getString("CLOSE_TIMES"));
				company.setAccountCode(rset.getInt("ACCOUNT_CODE"));
				company.setAccountNum(rset.getString("ACCOUNT_NUM"));
				company.setAccountName(rset.getString("ACCOUNT_NAME"));
				company.setComType(rset.getString("COM_TYPE"));
				company.setComLike(rset.getInt("COM_LIKE"));
				company.setHoliday(rset.getString("HOLIDAY"));
				
				hlist.put("member", member);
				hlist.put("company", company);
				oneCompany.add(hlist);
				
				//System.out.println(oneCompany);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return oneCompany;
	}

	
	
	//정산 갯수 리턴용 메소드
		public int getCalcCount(Connection con) {
			Statement stmt = null;
			int calcCount = 0;
			ResultSet rset = null;

			String query = prop.getProperty("allCalcCount");

			try {
				stmt = con.createStatement();
				rset = stmt.executeQuery(query);

				if(rset.next()) {
					calcCount = rset.getInt(1);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(stmt);
				close(rset);
			}

			return calcCount;
		}

		
		//정산관리 조회용 메소드
		public ArrayList<HashMap<String, Object>> showCalc(Connection con, TotalMemberPageInfo pi) {
			PreparedStatement pstmt = null;
			ArrayList<HashMap<String,Object>> list = null;
			HashMap<String, Object> hmap = null;
			ResultSet rset = null;

			String query = prop.getProperty("showCalc");
			int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
			int endRow = startRow + pi.getLimit() - 1;
			
			try {
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);

				
				rset= pstmt.executeQuery();

				list = new ArrayList<HashMap<String,Object>>();

				while(rset.next()) {
					hmap = new HashMap<String, Object>();
					hmap.put("rnum", rset.getInt("RNUM"));
					hmap.put("mname", rset.getString("MNAME"));
					hmap.put("price", rset.getInt("PRICE"));
					hmap.put("pselect", rset.getString("PSELECT"));
					hmap.put("pstatus", rset.getString("PSTATUS"));
					hmap.put("payno", rset.getInt("PAYNO"));
					hmap.put("mno", rset.getInt("MNO"));
					hmap.put("upno", rset.getInt("UPNO"));
					hmap.put("payDiv", rset.getString("PAYDIV"));
					hmap.put("cno", rset.getInt("CNO"));
					hmap.put("cname", rset.getString("CNAME"));
					hmap.put("pname", rset.getString("PNAME"));

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

		public ArrayList<HashMap<String, Object>> searchCompanyList(Connection con, TotalMemberPageInfo pi, ArrayList searchConditionList) {
			Properties prop = new Properties();
			String fileName = MemberDao.class.getResource("/sql/admin/admin-query.properties").getPath();
			try {
				prop.load(new FileReader(fileName));
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			ArrayList<HashMap<String, Object>> searchCompanyList = null;
			HashMap<String, Object> hlist = null;
			Member member = null;
			String num = "";
			String comType = "";
			
			String query = prop.getProperty("selectSearchCompanyList");
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
			int endRow = startRow + pi.getLimit() - 1;
			String companyName = searchConditionList.get(0).toString();
			
			try {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, companyName);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
				
				rset = pstmt.executeQuery();
				
				searchCompanyList = new ArrayList<HashMap<String, Object>>();
				
				while(rset.next()) {
					hlist = new HashMap<String,Object>();
					member = new Member();
					
					num = rset.getInt("RNUM")+ "";
					comType = rset.getString("COM_TYPE");
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
					
					// System.out.println(num);
					
					hlist.put("num", num);
					hlist.put("comType", comType);
					hlist.put("member", member);
					searchCompanyList.add(hlist);
					System.out.println("searchConditionList디에이오 : " + searchConditionList);
					
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}

			return searchCompanyList;
		}
	

	
		
	

}
