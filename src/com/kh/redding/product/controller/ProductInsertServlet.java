package com.kh.redding.product.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.redding.company.model.vo.Company;
import com.kh.redding.product.model.service.ProductService;
import com.kh.redding.product.model.vo.Product;
import com.kh.redding.product.model.vo.UseProduct;


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
         String uNum1 = request.getParameter("productAmount");
         System.out.println("uNum1 : " + uNum1);
         String uNum2 = request.getParameter("proAmount");
         System.out.println("uNum2 : " + uNum2);
         int uNum = 0;
         if(!uNum1.equals("기타")) {
            uNum = Integer.parseInt(uNum1);
         }else {
            uNum = Integer.parseInt(uNum2);
         }
         System.out.println("uNum : " + uNum);
         
         int price = Integer.parseInt(request.getParameter("piPrice"));
         System.out.println("price : " + price);
         
         //상품등록일은 임의 수정이 아닌 현재 날짜가 들어가야 한다.
         Date pEnrollDate = new Date(new GregorianCalendar().getTimeInMillis());
         System.out.println("penrollDate : " + pEnrollDate);
         
         String pContent = request.getParameter("info");
         System.out.println("pcontent : " + pContent);
         
         //세션으로 업체의 로그인정보를 가져왓음
         
         int cNo = Integer.parseInt(request.getParameter("cNo"));
         System.out.println("cno : " + cNo);
         
         Company com = new ProductService().selectCompanyOne(cNo);
         
         System.out.println("com : " + com);
         
         
         String datePattern = "yyyy-MM-dd";
         
         //상품시작 기간 
         String inputStartDate = request.getParameter("proStartDay");
         Date proStartDay = null;
         if(inputStartDate != "") {
        	 //판매시작 날짜가 존재할 경우
        	 proStartDay = Date.valueOf(inputStartDate);
         }else {
        	 //판매시작 날짜가 null일 경우
        	 proStartDay = new Date(new GregorianCalendar().getTimeInMillis());
         }
         //판매시작날짜를 다시 String으로 넣어줌
         inputStartDate = proStartDay+"";
         System.out.println("startDate : " + inputStartDate);
         
         //상품종료 기간
         String inputEndDate = request.getParameter("proEndDay");
         Date proEndDay = null;
         if(inputEndDate != "") {
        	 //판매종료 날짜가 존재할 경우
        	 proEndDay = Date.valueOf(inputEndDate);
         }else {
        	 //판매종료 날짜가 null일 경우
        	 proEndDay = new Date(new GregorianCalendar().getTimeInMillis());
         }
         //판매종료날짜를 다시 String으로 넣어줌
         inputEndDate = proEndDay+"";
         System.out.println("endDate : " + inputEndDate);
         
         
         //날짜형식을 지정해주기 위해 SimpleDateFormat 이용 
         SimpleDateFormat sdf = new SimpleDateFormat(datePattern);

                
         ArrayList<String> useDates = new ArrayList<String>();
         
         java.util.Date startDay = proStartDay;
         
         /*new java.sql.Date(new java.util.Date().getTime());
         new java.util.Date(new java.util.Date(12345L).getTime());*/
         
         while(startDay.compareTo(proEndDay) <= 0) {
        	 useDates.add(sdf.format(startDay));
        	 Calendar cal = Calendar.getInstance();
        	 cal.setTime(startDay);
        	 
        	 cal.add(Calendar.DAY_OF_MONTH, 1);
        	 startDay = cal.getTime();
        	 
        	 //System.out.println("useDate : " + useDate);
        	 //System.out.println("cal " + cal.getTime()) ;
         }
         
         for(String date : useDates) {
        	 System.out.println("date : " + date);
         }
         
         String dayWeek = com.getHoliday();
         String[] dayWeeks = dayWeek.split(",");
         int dayOfWeek = 99;
         /*switch(dayWeeks) {
         
         }*/
         
         
         String openTimes = com.getOpenTime();   //업체영업시작시간
         String closeTimes = com.getEndTime();   //업체영업종료시간
         
         String[] comStart = openTimes.split(":");   //시간만 받아오기 위한 쪼개기
         int openTime = Integer.parseInt(comStart[0]);   //for문을 돌리기 위한 int변환
         String start = null;
         String[] comClose = closeTimes.split(":");    //시간만 받아오기 위한 쪼개기
         int closeTime = Integer.parseInt(comClose[0]);   //for문을 돌리기 위한 int변환
         String end = null;
         
         
         
         
         //인서트(삽입)
         //insert할 때 product랑 use_product랑 동시에 insert해주어야 한다.
         Product pro = new Product();
         pro.setpName(pName);
         pro.setpContent(pContent);
         pro.setPrice(price);
         pro.setpEnrollDate(pEnrollDate);
         pro.setProStatus(proStatus);
         pro.setcNo(cNo);
         
         ArrayList<UseProduct> uProList = new ArrayList<UseProduct>();
         
         for(int i=openTime ; i<closeTime ; i++) {
    		 start = i +":00";
    		 end = (i+1) + ":00";
    		 UseProduct upro = new UseProduct();
    		 upro.setUpName(pro.getpName());
    		 upro.setUseDate(pro.getpEnrollDate());
    		 upro.setUseStartTime(start);
    		 upro.setUseEndTime(end);
    		 upro.setuNum(uNum);
    		 
    		 
    		 uProList.add(upro);
    	 }
         
         int result = new ProductService().insertUseProduct(pro,uProList);
         
         //System.out.println("servlet result : " + result);
         
         String page = "";
         
         if(result > 0) {
        	 //상품, 제품등록 성공시 
        	 page = "/views/company/c_ProductManagement.jsp";
         }else {
        	 //에러
        	 page = "";
         }
         request.getRequestDispatcher(page).forward(request, response);
         
      }

      protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         doGet(request, response);
      }

   }