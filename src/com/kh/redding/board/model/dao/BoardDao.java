package com.kh.redding.board.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.redding.attachment.model.vo.Attachment;
import com.kh.redding.board.model.vo.Board;
import com.kh.redding.member.model.vo.Member;
import com.kh.redding.product.model.vo.PageInfo;
import static com.kh.redding.common.JDBCTemplate.*;

public class BoardDao {
	private Properties prop = new Properties();

	//게시물 목록 조회용 메소드
	public ArrayList<Board> selectList(Connection con, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		
		String query = prop.getProperty("selectBoardList");
		
		//조회 시작할 행 번호와 마지막 행 번호 계산
		int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
		int endRow = startRow + pi.getLimit() - 1;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Board>();
			
			while(rset.next()) {
				Board b = new Board();
				Member m = new Member();
				Attachment a = new Attachment();
				
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

}
