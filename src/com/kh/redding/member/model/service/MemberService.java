package com.kh.redding.member.model.service;
import java.sql.Connection;
import java.util.ArrayList;

import com.kh.redding.member.model.dao.MemberDao;
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

}
