package com.kh.redding.wishlist.model.dao;

import java.io.FileReader;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import static com.kh.redding.common.JDBCTemplate.*;
import com.kh.redding.member.model.dao.MemberDao;
import com.kh.redding.wishlist.model.vo.WishList;

public class WishListDao {
	private Properties prop = new Properties();
	
	public WishListDao() {
		String fileName = MemberDao.class.getResource("/sql/wishList/wishList-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	//위시리스트 조회용 메소드
	public ArrayList<HashMap<String, Object>> showWishList(Connection con, int num) {
		PreparedStatement pstmt = null;
		ArrayList<HashMap<String,Object>> list = null;
		HashMap<String, Object> hmap = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("showWishList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset=pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String,Object>>();
			
			while(rset.next()) {
				hmap =new HashMap<String, Object>();
				
				hmap.put("mno", rset.getInt("MNO"));
				hmap.put("upname", rset.getString("UPNAME"));
				hmap.put("pcontent", rset.getString("PCONTENT"));
				hmap.put("price", rset.getInt("PRICE"));
				hmap.put("mname", rset.getString("MNAME"));
				hmap.put("rapplyDate", rset.getDate("RAPPLY_DATE"));
				hmap.put("rcompletedDate", rset.getDate("RCOMPLETED_DATE"));
				
				list.add(hmap);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}

}
