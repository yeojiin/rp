package com.kh.redding.member.model.service;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.redding.board.model.vo.BoardPageInfo;
import com.kh.redding.member.model.dao.MemberDao;
import com.kh.redding.member.model.vo.M_comListPageInfo;
import com.kh.redding.member.model.vo.Member;

import static com.kh.redding.common.JDBCTemplate.*;

public class MemberService {

	// member 로그인용 메소드
	public Member loginCheck(String memberId, String memberPwd) {
				
		Connection con = getConnection();
		
		Member loginUser = new MemberDao().loginCheck(con, memberId, memberPwd);
		
		close(con);
		
		return loginUser;
	}

	// member 회원가입용 메소드
	public int insertMember(Member insertMember) {
		
		Connection con = getConnection();
		
		int result = new MemberDao().insertMember(con, insertMember);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	// 닉네임 중복 체크 메소드
	public int nickChecked(String nickName) {
		Connection con = getConnection();
		
		int result = new MemberDao().nickChecked(con, nickName);
		
		close(con);
		
		return result;
	}

	// member 개인정보 수정 메소드
	public int updateMember(Member reqMember) {
		
		Connection con = getConnection();
		
		int result = new MemberDao().updateMember(con, reqMember);
		
		System.out.println("result service : " + result);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	//업체 페이지 목록
	public int getListCount() {
		Connection con = getConnection();
		int listCount = new MemberDao().getListCount(con);
		close(con);
		
		return listCount;
	}

	public ArrayList<HashMap<String, Object>> selectComList(M_comListPageInfo clpi) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list = new MemberDao().selectComList(con, clpi);
		for(int i = 0; i < list.size(); i++) {
			
		}
		
		close(con);
		
		return list;
	}

	public HashMap<String, Object> selectCount(int mno) {
		Connection con = getConnection();
		
		HashMap<String, Object> hmap = new MemberDao().selectCount(con,mno);
		
		close(con);
		
		return hmap;
	}

	public ArrayList<HashMap<String, Object>> resWaitSelect(int value,int mno) {
		Connection con = getConnection();
		
				
		ArrayList<HashMap<String,Object>> list = new MemberDao().resWaitSelect(con, value, mno);
		
		close(con);
		
		return list;
	}

	public ArrayList<HashMap<String, Object>> selectDetailCom(M_comListPageInfo clpi, String mname) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list = new MemberDao().selectDetailCom(con, clpi, mname);
		for(int i = 0; i < list.size(); i++) {
			
		}
		System.out.println("list service : " + list);
		
		close(con);
		
		return list;
	}
	
	
	public int getCountList(int value) {
		Connection con = getConnection();
		
		int count = new MemberDao().getCountList(con, value);
		
		close(con);
		
		return count;
	}

	public ArrayList<HashMap<String, Object>> getPackage(int subno, int mno) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> hmap = new MemberDao().getPackage(con, subno, mno);
		
		close(con);
		
		return hmap;
	}

}
