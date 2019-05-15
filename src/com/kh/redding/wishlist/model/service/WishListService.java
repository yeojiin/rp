package com.kh.redding.wishlist.model.service;

import static com.kh.redding.common.JDBCTemplate.close;
import static com.kh.redding.common.JDBCTemplate.commit;
import static com.kh.redding.common.JDBCTemplate.getConnection;
import static com.kh.redding.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.redding.wishlist.model.dao.WishListDao;

public class WishListService {

	//위시리스트 조회용 메소드
	public ArrayList<HashMap<String, Object>> showWishList(int num) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list = new WishListDao().showWishList(con, num);
		
		close(con);
		
		return list;
	}


	//위시리스트 삭제용 메소드
	public int deleteWishList(ArrayList<String> deleteList, int num) {
		Connection con = getConnection();
		
		int result = new WishListDao().deleteWishList(con, deleteList, num);
		
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		
		return result;
	}

}
