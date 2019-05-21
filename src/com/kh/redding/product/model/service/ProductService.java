package com.kh.redding.product.model.service;

import static com.kh.redding.common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;

import com.kh.redding.company.model.vo.Company;
import com.kh.redding.product.model.dao.ProductDao;
import com.kh.redding.product.model.vo.PageInfo;
import com.kh.redding.product.model.vo.Product;
import com.kh.redding.product.model.vo.UseProduct;

public class ProductService {
      
      
   //상품 페이징
   public int getListCount(int cno) {
      Connection con = getConnection();
      int listCount = new ProductDao().getListCount(con, cno);
      close(con);
      return listCount;
   }
   //상품리스트 조회용
   public ArrayList<Product> selectList(PageInfo pi, int cno) {
      Connection con = getConnection();
           
      ArrayList<Product> list = new ProductDao().selectList(con, pi, cno);
           
      close(con);
           
      return list;
   }
         
   public Company selectCompanyOne(int cNo) {
      Connection con = getConnection();
            
      Company com = new ProductDao().selectCompanyOne(con,cNo);
            
      close(con);
            
      return com;
   }
      

   
   public int insertUseProduct(Product pro, ArrayList<UseProduct> uProList, ArrayList<String> useDate) {
      Connection con = getConnection();
      int result = 0 ;
      
      //상품등록
      int result1 = new ProductDao().insertProduct(con, pro);
      
      if(result1 > 0) {
         //상품등록 성공
      //System.out.println("service result1 : " + result1);
      int pNo = new ProductDao().selectProductCurrval(con);
      //System.out.println("service pno : " + pNo);
      
      for(int i=0 ; i<uProList.size() ; i++) {
         //제품에 상품코드를 넣어준다.
         uProList.get(i).setpNo(pNo);
         
      }
      int result2 = new ProductDao().insertUseProduct(con, uProList, useDate);
      
      if(result2 == uProList.size()) {
         //System.out.println("service result2 : " + result2);
         result = 1;
         commit(con);
      }else {
         //System.out.println("service result2 : " + result2);
            result = 0;
            rollback(con);
         }
      }else {
         rollback(con);      
      }
      close(con);
      
      return result;
   }
   
   //상품 1개 들고 오기
   public Product selectProductOne(int pno) {
      Connection con = getConnection();
      Product product = new ProductDao().selectProductOne(con, pno);
      close(con);
      return product;
   }
   //제품 전체 리스트 들고오기
   public ArrayList<UseProduct> selectUseProductList(int pno, PageInfo pi, int cno) {
      Connection con = getConnection();
      ArrayList<UseProduct> useProList = new ProductDao().selectUseProductList(con, pno, pi, cno);
      close(con);
      return useProList;
   }
   
   //제품 페이징
	public int getUseProductListCount(int pno, int cno) {
		Connection con = getConnection();
		int listCount = new ProductDao().getUseProductListCount(con, pno, cno);
		close(con);
		return listCount;
	}
	public UseProduct selectUseProductOne(int upNo) {
		Connection con = getConnection();
		UseProduct upro = new ProductDao().selectUseProductOne(con, upNo);
		close(con);
		
		return upro;
	}
	public int updateUseProduct(UseProduct upro) {
		Connection con = getConnection();
		
		int result = new ProductDao().updateUseProduct(con, upro);
		
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return result;
	}
	public Product updateProduct(Product product) {
		Connection con = getConnection();
		Product pro = null;
		int result = new ProductDao().updateProduct(con, product);
		
		if(result > 0) {
			//System.out.println("상품수정 성고");
			pro = new ProductDao().selectProductOne(con, product.getpNo());
			
			if(pro != null) {
				//System.out.println("pro : " + pro);
				commit(con);
			}else {
				rollback(con);
			}
		}else {
			rollback(con);
		}
		close(con);
		return pro;
	}
	public int updateUseProductList(int pno, String ustatus, int cno) {
		Connection con = getConnection();
		
		int result = new ProductDao().updateUseProductLists(con, pno, ustatus);
		
		int uproLength = new ProductDao().getUseProductListCount(con, pno, cno);
		
		if(result == uproLength) {
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		return result;
	}
		
		
		
	public int updateUseProductStatus(int upno, String status) {
		Connection con = getConnection();
		int result = new ProductDao().updateUseProductStatus(con, status, upno);
		if(result>0) {
			//System.out.println("제품리스트 성공");
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		System.out.println("uproresult : " + result);
		return result;
	}
	public int productTotalCount(int cno) {
		Connection con = getConnection();
		int productTotalCount = new ProductDao().productTotalCount(con, cno);
		close(con);
		return productTotalCount;
	}
	public int saleProductCount(int cno, String status) {
		Connection con = getConnection();
		int saleProductCount = new ProductDao().saleProductCount(con, cno, status);
		close(con);
		return saleProductCount;
	}
	public int updateProductStatus(int pno, String status, int cno) {
		Connection con = getConnection();
		int result = new ProductDao().updateProductStatus(con, status, pno);
		
		
		if(result>0) {
			//System.out.println("상품업뎃 성공 ");
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return result;
	}
	public int updateTotalUseProductStatus(int pno, String ustatus) {
		Connection con = getConnection();
		int result = new ProductDao().updateTotalUseProductStatus(con, ustatus, pno);
		if(result>0) {
			//System.out.println("제품 리스트 업뎃 성공 ");
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		//System.out.println("uproresult : " + result);
		return result;
	}
	public ArrayList<Product> searchProduct(int value, int cno, String searchProName, String searchStatus, PageInfo pi) {
		Connection con = getConnection();
		ArrayList<Product> proList= new ProductDao().searchProduct(con, value, cno, searchProName, searchStatus,pi);
		close(con);
		return proList;
	}
	public int getListCountJustStatus(int cno, String searchStatus) {
		Connection con = getConnection();
	    int listCount = new ProductDao().getListCountJustStatus(con, cno, searchStatus);
	    close(con);
	    return listCount;
	}
	public int getListCountNameStatus(int cno, String searchProName, String searchStatus) {
		Connection con = getConnection();
		int listCount = new ProductDao().getListCountNameStatus(con, cno, searchProName, searchStatus);
		close(con);
		return listCount;
	}
	public int getListJustName(int cno, String searchProName) {
		Connection con = getConnection();
		int listCount = new ProductDao().getListJustName(con, cno, searchProName);
		close(con);
		return listCount;
	}
	//검샌한 제품 리스트 카운트
	public int getUseProductSearchListCount(int pNo, String ustatus, Date startDate, Date endDate) {
		Connection con = getConnection();
		int listCount = new ProductDao().getUseProductSearchListCount(con, pNo, ustatus, startDate, endDate);
		close(con);
		return listCount;
	}
	public ArrayList<UseProduct> searchUseProduct(int pNo, String ustatus, Date startDate, Date endDate, PageInfo pi) {
		Connection con = getConnection();
		ArrayList<UseProduct> useProList = new ProductDao().searchUseProduct(con, pNo, ustatus, startDate, endDate, pi);
		close(con);
		return useProList;
	}
	public int getUseProductSearchTotalListCount(int pNo, Date startDate, Date endDate) {
		Connection con = getConnection();
		int listCount = new ProductDao().getUseProductSearchTotalListCount(con, pNo, startDate, endDate);
		close(con);
		return listCount;
	}
	public ArrayList<UseProduct> searchUseProductTotal(int pNo, Date startDate, Date endDate, PageInfo pi) {
		Connection con = getConnection();
		ArrayList<UseProduct> useProList = new ProductDao().searchUseProductTotal(con, pNo, startDate, endDate, pi);
		close(con);
		return useProList;
	}
}