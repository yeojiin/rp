package com.kh.redding.admin.model.sevice;

import static com.kh.redding.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.redding.admin.model.dao.AdminDao;
import com.kh.redding.admin.model.vo.TotalMemberPageInfo;
import com.kh.redding.company.model.vo.Company;
import com.kh.redding.member.model.vo.Member;

public class AdminService {

	// 전체 회원 목록 조회용 메소드 (페이징 처리) (효정)
	public ArrayList<HashMap<String, Object>> selectMemberList(TotalMemberPageInfo pi) {
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> list = new AdminDao().selectMemberList(con, pi);
		close(con);
		return list;
	}

	// 전체 회원 수 조회용 메소드 (효정)
	public int getAllListCount() {
		Connection con = getConnection();
		int allMemberListCount = new AdminDao().getAllListCount(con);
		close(con);
		return allMemberListCount;
	}

	// 신규 회원 수 조회용 메소드 (효정)
	public int getNewListCount() {
		Connection con = getConnection();
		int newMemberlistCount = new AdminDao().getNewListCount(con);
		close(con);
		return newMemberlistCount;
	}

	// 탈퇴 회원 수 조회용 메소드 (효정)
	public int getWithdrawalListCount() {
		Connection con = getConnection();
		int withdrawalMemberlistCount = new AdminDao().allMemberListCount(con);
		close(con);
		return withdrawalMemberlistCount;
	}

	// 회원 상세 정보 조회용 메소드 (효정)
	public Member selectOneMember(int num) {
		Connection con = getConnection();
		Member onemember = new AdminDao().selectOneMember(con, num);
		if(onemember != null) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return onemember;
	}

	// 전체 업체 목록 조회용 메소드 (페이징 처리) (효정)
	public ArrayList<HashMap<String, Object>> selectCompanyList(TotalMemberPageInfo pi) {
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> list = new AdminDao().selectCompanyList(con, pi);
		close(con);
		return list;
	}

	// 전체 업체 수 조회용 메소드 (효정)
	public int getAllCompanyListCount() {
		Connection con = getConnection();
		int allCompanyListCount = new AdminDao().getAllCompanyListCount(con);
		close(con);
		return allCompanyListCount;
	}

	// 신규 업체 수 조회용 메소드 (효정)
	public int getNewCompanyCount() {
		Connection con = getConnection();
		int newCompanyListCount = new AdminDao().getNewCompanyCount(con);
		close(con);
		return newCompanyListCount;
	}

	// 탈퇴 업체 수 조회용 메소드 (효정)
	public int getWithdrawalCompanyListCount() {
		Connection con = getConnection();
		int withdrawalCompanyListCount = new AdminDao().getWithdrawalCompanyListCount(con);
		close(con);
		return withdrawalCompanyListCount;
	}

	// 업체 상세 정보 조회용 메소드 (효정)
	public ArrayList<HashMap<String, Object>> selectOneCompany2(int num) {
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> oneCompany = new AdminDao().selectOneCompany2(con, num);
		if(oneCompany != null) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return oneCompany;
	}

	// 회원 정산관리 갯수 리턴용 메소드 (정연)
	public int getCalcCount() {
		Connection con = getConnection();
		int calcCount = new AdminDao().getCalcCount(con);
		close(con);
		return calcCount;
	}

	// 회원 정산관리 조회용 메소드 (정연)
	public ArrayList<HashMap<String, Object>> showCalc(TotalMemberPageInfo pi) {
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> list = new AdminDao().showCalc(con, pi);
		close(con);
		return list;
	}

	// 검색한 업체 목록 조회용 메소드 (효정)
	public ArrayList<HashMap<String, Object>> searchCompanyList(ArrayList searchConditionList) {
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> searchCompanyList = new AdminDao().searchCompanyList(con, searchConditionList);
		close(con);
		return searchCompanyList;
	}

	// 검색한 회원 목록 조회용 메소드 (효정)
	public ArrayList<HashMap<String, Object>> searchMemberList(ArrayList searchConditionList) {
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> searchMemberList = new AdminDao().searchMemberList(con, searchConditionList);
		close(con);
		return searchMemberList;
	}

	public ArrayList<HashMap<String, Object>> getGenderCount(int value) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> hmap = new AdminDao().getGenderCount(con,value);
		
		close(con);
		
		return hmap;
	}

	
	//맴버 정산 승인하기 버튼(정연)
	public int memberPay(int payno) {
		Connection con = getConnection();
		
		int result = new AdminDao().memberPay(payno, con);
		
		if(result>0) {
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		
		
		return result;
	}





}
