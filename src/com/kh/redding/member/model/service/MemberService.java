package com.kh.redding.member.model.service;
import static com.kh.redding.common.JDBCTemplate.close;
import static com.kh.redding.common.JDBCTemplate.commit;
import static com.kh.redding.common.JDBCTemplate.getConnection;
import static com.kh.redding.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.redding.attachment.model.vo.Attachment;
import com.kh.redding.board.model.vo.Board;
import com.kh.redding.board.model.vo.BoardPageInfo;
import com.kh.redding.company.model.vo.Company;
import com.kh.redding.member.model.dao.MemberDao;
import com.kh.redding.member.model.vo.M_ComQnaListPageInfo;
import com.kh.redding.member.model.vo.M_comListPageInfo;
import com.kh.redding.member.model.vo.Member;
import com.kh.redding.product.model.vo.Product;

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
	public int getListCount(String comType) {
		Connection con = getConnection();
		int listCount = new MemberDao().getListCount(con, comType);
		close(con);
		
		return listCount;
	}

	public ArrayList<HashMap<String, Object>> selectComList(M_comListPageInfo clpi, String comType) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list = new MemberDao().selectComList(con, clpi, comType);
	
		
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

	public HashMap<String, Object> selectDetailCom(int cno) {
		Connection con = getConnection();
		
		//ArrayList<HashMap<String, Object>> list = new MemberDao().selectDetailCom(con, clpi, mname);
		HashMap<String, Object> list = new HashMap<String, Object>();
		
		Company com = new MemberDao().selectDetailCom(con, cno);
		
		if (com != null) {
			list.put("Company", com);			
		}
		
		Member mem = new MemberDao().selectDetailMem(con, cno);
		
		if (mem != null) {
			list.put("Member", mem);			
		}
		
		ArrayList<Attachment> at = new MemberDao().selectDetailAt(con, cno);
		
		if (at != null) {
			list.put("Attachment", at);			
		}
		
		ArrayList<Product> pd = new MemberDao().selectDetailPd(con, cno);
		
		if (pd != null) {
			list.put("Product", pd);			
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

	//업체Qna목록(광섭)
	public ArrayList<HashMap<String, Object>> selectDetailComQna(M_ComQnaListPageInfo cqlpi, int cno) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> blist = null;
		
		HashMap<String, Object> list = new HashMap<String, Object>();
		
		blist = new MemberDao().selectDetailComQna(con, cqlpi, cno);
		
		Company com = new MemberDao().selectDetailCom(con, cno);
		
		if (com != null) {
			list.put("Company", com);			
		}
		
		Member mem = new MemberDao().selectDetailMem(con, cno);
		
		if (mem != null) {
			list.put("Member", mem);			
		}
		
		ArrayList<Attachment> at = new MemberDao().selectDetailAt(con, cno);
		
		if (at != null) {
			list.put("Attachment", at);			
		}
		
		ArrayList<Product> pd = new MemberDao().selectDetailPd(con, cno);
		
		if (pd != null) {
			list.put("Product", pd);			
		}
		
		blist.add(list);
		
		close(con);
		
		System.out.println("blistService : " + blist);
		
		
		return blist;
	}
	
	
	public ArrayList<HashMap<String, Object>> getPackage(int subno, int mno) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> hmap = new MemberDao().getPackage(con, subno, mno);
		
		close(con);
		
		return hmap;
	}

	public ArrayList<HashMap<String, Object>> getPayment(int mno, int[] upnoArr) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list = new MemberDao().getPayment(con,mno,upnoArr);
		
		close(con);
		
		return list;
}
    
    
	//아이디 , 이메일을 받아서 아이디 비밀번호 찾기(지원)
	public int MemberIdSearch(String memberid, String email) {
		Connection con = getConnection();
		
		int result = new MemberDao().memberIdSearch(con,memberid, email);
		
		
		close(con);
		
		return result;
	}

	//아이디 조회 - 아이디 찾기
	public String SelectMemberId(String memberid, String email) {
		Connection con = getConnection();
		
		String memberId = new MemberDao().selectMemberId(con, memberid ,email);
		
		close(con);
		
		return memberId;
	}

	//비밀번호 찾기 - 있는 멤버인지 확인 
	public int MemberPasswordSelect(String memberid, String membername, String email) {
		Connection con = getConnection();
		
		int result = new MemberDao().MemberPasswordSelect(con, memberid , membername , email);
		
		close(con);
		
		return result;
	}

	public int updateMemberPassword(String membrid, String memberPwd) {
		Connection con = getConnection();
		
		System.out.println("여기로 옴");
		
		int result = new MemberDao().updateMemberPassword(con, membrid , memberPwd);
		
		//System.out.println("memberservice result : " + result);
		
		if (result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public int memberDelete(String memberid) {
		Connection con = getConnection();
		
		int result = new MemberDao().memberDelete(con,memberid);
		
		if (result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		
		close(con);
		
		return result;
	}

	//Qna목록페이지수조회
	public int getQnaListCount(int cno) {
		Connection con = getConnection();
		int listCount = new MemberDao().getQnaListCount(con, cno);
		close(con);
		
		return listCount;
	}
	
	
	//업체Qna삭제(광섭)
	public int deleteQna(int bid) {
		Connection con = getConnection();
		
		int result = new MemberDao().deleteQna(con, bid);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	//업체페이지 Qna답변작성(0524광섭)
	/*public int insertComQnaReply(int bid, int mno, String content) {
		Connection con = getConnection();
		
		int result = new BoardDao().insertComQnaReply(con, bid, mno, content);
		
		if (result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		
		close(con);
		
		return result;
	}*/

	//Qna상세페이지조회
	public ArrayList<HashMap<String, Object>> SelectComQnaDetail(int bid) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> ComQnaDetail = new MemberDao().SelectComQnaDetail(con, bid);
		
		close(con);
		
		return ComQnaDetail;
	}

}
