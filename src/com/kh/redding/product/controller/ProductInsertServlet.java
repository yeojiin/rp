package com.kh.redding.product.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.redding.product.model.service.ProductService;
import com.kh.redding.product.model.vo.Product;

@WebServlet("/insert.pr")
public class ProductInsertServlet extends HttpServlet {
	   private static final long serialVersionUID = 1L;
	       
	    public ProductInsertServlet() {
	        super();
	    }
	   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      System.out.println("상품등록 서블릿");
	      String proStatus = request.getParameter("proStatus");
	      System.out.println("proStatus : " + proStatus);
	      String pName1 = request.getParameter("picSelect");
	      System.out.println("pName1 : " + pName1);
	      String pName2 = request.getParameter("pmiSelect");
	      System.out.println("pName2 : " + pName2);
	      String pName3 = request.getParameter("etc");
	      System.out.println("pName3 : " + pName3);
	      String pName = ""; //최종 상품명      
	      if(pName2 == "") {
	         //두번 째 선택값이 널인경우
	         pName = pName1;
	      }else {
	         //두 번째 선택값이 널이 아닌 경우
	         if(pName3 != null) {
	            /*기타선택경우*/
	            pName = pName1 + "-" + pName3;
	         }else {
	            /*기타 선택이 아닌 경우*/
	            pName = pName1 + "-" +  pName2;
	         }
	      }
	      System.out.println("pName : " + pName);
	      String unum1 = request.getParameter("productAmount");
	      System.out.println("unum1 : " + unum1);
	      String unum2 = request.getParameter("proAmount");
	      System.out.println("unum2 : " + unum2);
	      int unum = 0;
	      if(!unum1.equals("기타")) {
	         unum = Integer.parseInt(unum1);
	      }else {
	         unum = Integer.parseInt(unum2);
	      }
	      System.out.println("unum : " + unum);
	      
	      int price = Integer.parseInt(request.getParameter("piPrice"));
	      System.out.println("price : " + price);
	      
	      //상품등록일은 임의 수정이 아닌 현재 날짜가 들어가야 한다.
	      Date penrollDate = new Date(new GregorianCalendar().getTimeInMillis());
	      System.out.println("penrollDate : " + penrollDate);
	      
	      String pcontent = request.getParameter("info");
	      System.out.println("pcontent : " + pcontent);
	      
	      //세션으로 업체의 로그인정보를 가져왓음
	      
	      int cno = Integer.parseInt(request.getParameter("cNo"));
	      System.out.println("cno : " + cno);
	      
	      
	      //인서트(삽입)
	      //insert할 때 product랑 use_product랑 동시에 insert해주어야 한다.
	      Product pro = new Product();
	      pro.setPname(pName);
	      pro.setPrice(price);
	      pro.setPenroll_date(penrollDate);
	      pro.setCno(cno);
	      
	      int resultPro = new ProductService().insertProduct(pro, cno);
	      
	      
	      
	      
	   }

	   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      doGet(request, response);
	   }

	}