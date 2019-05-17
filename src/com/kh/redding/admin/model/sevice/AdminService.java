package com.kh.redding.admin.model.sevice;

import static com.kh.redding.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.redding.admin.model.dao.AdminDao;
import com.kh.redding.admin.model.vo.TotalMemberPageInfo;
import com.kh.redding.member.model.vo.Member;

public class AdminService {

	// 전체 회원 목록 조회 (페이징 처리)
	public ArrayList<HashMap<String, Object>> selectList(TotalMemberPageInfo pi) {

		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list = new AdminDao().selectList(con, pi);
		
		close(con);
		
		return list;
	}

	// 전체 회원 수 조회용 메소드
	public int getAllListCount() {
		
		Connection con = getConnection();
		
		int allMemberListCount = new AdminDao().getAllListCount(con);
		
		close(con);
		
		return allMemberListCount;
	}

	// 신규 회원 수 조회용 메소드
	public int getNewListCount() {

		Connection con = getConnection();
		
		int newMemberlistCount = new AdminDao().getNewListCount(con);
		
		close(con);
		
		return newMemberlistCount;
	}

	// 탈퇴 회원 수 조회용 메소드
	public int getWithdrawalListCount() {
		
		Connection con = getConnection();
		
		int withdrawalMemberlistCount = new AdminDao().allMemberListCount(con);
		
		close(con);
		
		return withdrawalMemberlistCount;
	}

	// 회원 상세 정보 조회용 메소드
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

}
