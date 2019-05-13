package com.kh.redding.product.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.redding.product.model.dao.ProductDao;
import com.kh.redding.product.model.vo.PageInfo;
import com.kh.redding.product.model.vo.Product;
import static com.kh.redding.common.JDBCTemplate.*;

public class ProductService {
	
	//게시물 목록 조회(페이징 처리 후)
	public ArrayList<Product> selectList(PageInfo pi) {
		Connection con = getConnection();
		
		ArrayList<Product> list = new ProductDao().selectList(con, pi);
		
		close(con);
		
		return list;
	}
	
	//게시물 수 조회용 메소드
	public int getListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

}
