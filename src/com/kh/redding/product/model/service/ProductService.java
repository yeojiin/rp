package com.kh.redding.product.model.service;

import static com.kh.redding.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.redding.company.model.vo.Company;
import com.kh.redding.product.model.dao.ProductDao;
import com.kh.redding.product.model.vo.PageInfo;
import com.kh.redding.product.model.vo.Product;
import com.kh.redding.product.model.vo.UseProduct;

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
      
   public Company selectCompanyOne(int cNo) {
      Connection con = getConnection();
      
      Company com = new ProductDao().selectCompanyOne(con,cNo);
      
      close(con);
      
      return com;
   }
   

   public int insertUseProduct(Product pro, ArrayList<UseProduct> uProList) {
	   Connection con = getConnection();
	   int result = 0 ;
	   
	   //상품등록
	   int result1 = new ProductDao().insertProduct(con, pro);
	   
	   if(result1 > 0) {
		   //상품등록 성공
		   System.out.println("service result1 : " + result1);
		   int pNo = new ProductDao().selectProductCurrval(con);
		   System.out.println("service pno : " + pNo);
		   
		   for(int i=0 ; i<uProList.size() ; i++) {
			   //제품에 상품코드를 넣어준다.
			   uProList.get(i).setpNo(pNo);
			   
		   }
		   int result2 = new ProductDao().insertUseProduct(con, uProList);
		   
		   if(result2 == uProList.size()) {
			   System.out.println("service result2 : " + result2);
			   result = 1;
			   //commit(con);
		   }else {
			   System.out.println("service result2 : " + result2);
			   result = 0;
			   //rollback(con);
		   }
	   }
	   close(con);
	   
	   return result;
   }

}