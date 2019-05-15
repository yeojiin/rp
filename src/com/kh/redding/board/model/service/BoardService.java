package com.kh.redding.board.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.redding.board.model.dao.BoardDao;
import com.kh.redding.board.model.vo.Board;
import com.kh.redding.board.model.vo.BoardPageInfo;

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
			
			System.out.println(list.get(i));
		}
		
		close(con);
		
		return list;
	}

	

}
