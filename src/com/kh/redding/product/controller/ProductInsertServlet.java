package com.kh.redding.product.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
      String upName1 = request.getParameter("picSelect");
      System.out.println("proName1 : " + upName1);
      String upName2 = request.getParameter("pmiSelect");
      System.out.println("proName2 : " + upName2);
      String upName3 = request.getParameter("etc");
      System.out.println("proName3 : " + upName3);
      String upName = ""; //최종 상품명      
      if(upName2 == "") {
         //두번 째 선택값이 널인경우
         upName = upName1;
      }else {
         //두 번째 선택값이 널이 아닌 경우
         if(upName3 != null) {
            /*기타선택경우*/
            upName = upName1 + "-" + upName3;
         }else {
            /*기타 선택이 아닌 경우*/
            upName = upName1 + "-" +  upName2;
         }
      }
      System.out.println("upName : " + upName);
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
      
      
      
      /*인서트(삽입)*/
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doGet(request, response);
   }

}