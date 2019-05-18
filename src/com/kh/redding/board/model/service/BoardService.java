package com.kh.redding.board.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.redding.attachment.model.vo.Attachment;
import com.kh.redding.board.model.dao.BoardDao;
import com.kh.redding.board.model.vo.Board;
import com.kh.redding.board.model.vo.BoardPageInfo;
import com.kh.redding.member.model.vo.Member;

import static com.kh.redding.common.JDBCTemplate.*;

public class BoardService {
	//게시물 수 조회용 메소드
	public int getListCount() {
		Connection con = getConnection();
		int listCount = new BoardDao().getListCount(con);
		close(con);
		return listCount;
	}

	public ArrayList<HashMap<String, Object>> selectBoardList(BoardPageInfo pi) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list = new BoardDao().selectBoardList(con, pi);
		for(int i=0; i<list.size();i++) {
			
//			System.out.println(list.get(i));
		}
		
		close(con);
		
		return list;
	}

	public Board selectOne(int num) {
		Connection con = getConnection();
		
		Board b = new BoardDao().selectOne(con, num);
		
		
		if(b != null) {
			int result = new BoardDao().updateCount(con, b.getBid());
			
			if(result > 0) {
				commit(con);
			}else {
				rollback(con);
			}
			
		}
		
		
		close(con);
		
		return b;
	}

	
	

}
