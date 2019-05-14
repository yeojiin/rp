package com.kh.redding.product.model.dao;

import static com.kh.redding.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.redding.company.model.vo.Company;
import com.kh.redding.product.model.vo.PageInfo;
import com.kh.redding.product.model.vo.Product;

public class ProductDao {
	   private Properties prop = new Properties();
	   
	   public ProductDao() {
		   String fileName = ProductDao.class.getResource("/sql/product/product-query.properties").getPath();
		   
		   try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	   }
	   
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

	   public int insertProduct(Connection con, Product pro, Company com) {
		   //조회해온 업체의 영업시간과 종료시간
	      PreparedStatement pstmt = null;
	      int result = 0;
	      
	      String query = prop.getProperty("insertProduct");
	      
	      try {
	         pstmt = con.prepareStatement(query);
	         
	         pstmt.setString(1, pro.getPname());
	         pstmt.setInt(2, pro.getPrice());
	         pstmt.setDate(3, pro.getPenroll_date());
	         pstmt.setInt(4, pro.getCno());
	         
	         result = pstmt.executeUpdate();
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(pstmt);
	      }
	      System.out.println("insertProduct result : " + result);
	      return result;
	   }

	   public Company selectCompanyOne(Connection con, int cno) {
	      //cno일치 하는 컴파니 찾아오기
	      PreparedStatement pstmt = null;
	      ResultSet rset = null;
	      Company com = null;
	      
	      String query = prop.getProperty("selectCompanyOne");
	      
	      //System.out.println("selectCompanyOne query : " + query);
	      
	      //System.out.println("selectCompanyOne cno : " +cno);
	      
	      //System.out.println("selectCompanyOne con : " +con);
	      
	      
	      try {
	         pstmt = con.prepareStatement(query);
	         
	         pstmt.setInt(1, cno);
	         
	         rset = pstmt.executeQuery();
	         
	         if(rset.next()) {
	        	//System.out.println("rset : " + rset);
	            com = new Company();
	            
	            com.setCNO(rset.getInt("CNO"));
	            com.setCom_Rep_Num(rset.getInt("COM_REP_NUM"));
	            com.setRepName(rset.getString("REP_NAME"));
	            com.setComAddress(rset.getString("COM_ADDRESS"));
	            com.setComUrl(rset.getString("COM_URL"));
	            com.setOpenTime(rset.getString("OPEN_TIMES"));
	            com.setEndTime(rset.getString("CLOSE_TIMES"));
	            com.setAccountCode(rset.getInt("ACCOUNT_CODE"));
	            com.setAccountNum(rset.getString("ACCOUNT_NUM"));
	            com.setAccountName(rset.getString("ACCOUNT_NAME"));
	            com.setComType(rset.getString("COM_TYPE"));
	            com.setComLike(rset.getInt("COM_LIKE"));
	            com.setHoliday(rset.getString("HOLIDAY"));	            
	            
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(pstmt);
	         close(rset);
	      }
	            
	      //System.out.println("com : " +com);
	      return com;
	   }

	}