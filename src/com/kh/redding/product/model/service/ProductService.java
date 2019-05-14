package com.kh.redding.product.model.service;

import static com.kh.redding.common.JDBCTemplate.close;
import static com.kh.redding.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.redding.company.model.vo.Company;
import com.kh.redding.product.model.dao.ProductDao;
import com.kh.redding.product.model.vo.PageInfo;
import com.kh.redding.product.model.vo.Product;

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

	   public int insertProduct(Product pro, int cno) {
	      Connection con = getConnection();
	      int resultPro = 0;
	      //인서트 전에
	      //영업시간, 영업종료시간을 먼저 받아와야 한다.
	      Company com = new ProductDao().selectCompanyOne(con,cno);
	      
	      
	      if(com != null) {
	    	  //상품을 등록시킨다.
	         resultPro = new ProductDao().insertProduct(con, pro, com);
	         
	         if(resultPro > 0) {
	        	 //영업시작시간부터 종료시간까지 한시간 단위로 쪼개야 한다.
	        	 //상품이 등록되었을 때 제품이 등록되어야 한다.
	            
	            
	            
	         }
	         
	      }else {
	    	  //조회해 온 업체가 없다
	      }
	      
	      
	      return resultPro;
	   }

	}