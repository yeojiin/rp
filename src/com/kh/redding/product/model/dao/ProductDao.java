package com.kh.redding.product.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.redding.product.model.vo.PageInfo;
import com.kh.redding.product.model.vo.Product;
import static com.kh.redding.common.JDBCTemplate.*;

public class ProductDao {
	private Properties prop = new Properties();
	
	//상품리스트조회
	public ArrayList<Product> selectList(Connection con, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Product> list = null;
		
		String query = prop.getProperty("selectProductList");
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
		int endRow = startRow + pi.getLimit() - 1;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Product>();
			
			while(rset.next()) {
				Product p = new Product();
				
				p.setCno(rset.getInt("PNO"));
				p.setPname(rset.getString("PNAME"));
				p.setPcontent(rset.getString("PCONTENT"));
				p.setPrice(rset.getInt("PRICE"));
				p.setPenroll_date(rset.getDate("PENROLL_DATE"));
				p.setCno(rset.getInt("CNO"));
				p.setPmodify_date(rset.getDate("PMODIFY_DATE"));
				
				list.add(p);
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
