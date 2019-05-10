package com.kh.redding.member.model.service;
import java.sql.Connection;

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

}
