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
         String proStatus = request.getParameter("proStatus");
         String pName1 = request.getParameter("picSelect");
         String pName2 = request.getParameter("pmiSelect");
         String pName3 = request.getParameter("etc");
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
         String uNum1 = request.getParameter("productAmount");
         String uNum2 = request.getParameter("proAmount");
         int uNum = 0;
         if(!uNum1.equals("기타")) {
            uNum = Integer.parseInt(uNum1);
         }else {
            uNum = Integer.parseInt(uNum2);
         }
         
         int price = Integer.parseInt(request.getParameter("piPrice"));
         
         //상품등록일은 임의 수정이 아닌 현재 날짜가 들어가야 한다.
         Date pEnrollDate = new Date(new GregorianCalendar().getTimeInMillis());
         
         String pContent = request.getParameter("info");
         
         int cNo = Integer.parseInt(request.getParameter("cNo"));
         
         Company com = new ProductService().selectCompanyOne(cNo);

         //날짜 지정 포맷
         String datePattern = "yyyy-MM-dd";
         
         //상품판매시작 기간 
         String inputStartDate = request.getParameter("proStartDay");
         
         Date proStartDay = null;
         if(inputStartDate != "") {
            //판매시작 날짜가 존재할 경우 java.sql.Date 타입에 넣어준다.
            proStartDay = Date.valueOf(inputStartDate);
         }else {
            //판매시작 날짜가 null일 경우 현재날짜를 java.sql.Date 타입에 넣어준다.
            proStartDay = new Date(new GregorianCalendar().getTimeInMillis());
         }
         //판매시작날짜를 다시 String으로 넣어줌
         inputStartDate = proStartDay+"";
         
         //상품종료 기간
         String inputEndDate = request.getParameter("proEndDay");
         Date proEndDay = null;
         if(inputEndDate != "") {
            //판매종료 날짜가 존재할 경우  java.sql.Date 타입에 넣어준다.
            proEndDay = Date.valueOf(inputEndDate);
         }else {
            //판매종료 날짜가 null일 경우 현재날짜를 java.sql.Date 타입에 넣어준다.
            proEndDay = new Date(new GregorianCalendar().getTimeInMillis());
         }
         //판매종료날짜를 다시 String으로 넣어줌
         inputEndDate = proEndDay+"";
         
         //날짜형식을 지정해주기 위해 SimpleDateFormat 이용 
         //위에서 지정해준 yyyy-mm-dd 형식으로 !
         SimpleDateFormat sdf = new SimpleDateFormat(datePattern);

         //판매시작날짜와 판매 종료날짜 사이에 있는 모든 날짜들을 제너릭이 String인 ArrayList에 담아주기 위해 ArrayList<String>을 생성해준다.
         ArrayList<String> useDates = new ArrayList<String>();
         
         //sql에서 util.Date 타입으로 변환해주는 건 따로 형변환 필요 없음
         //두 날짜 사이에 있는 날짜들을 데려오기 위해선 java.util.Date 타입으로 변환해주어야 한다.
         //Calendar에 있는 getTime()메소드를 사용하기 위함!!!
         java.util.Date startDay = proStartDay;
         
         ArrayList<String> days = new ArrayList<String>();
         
         while(startDay.compareTo(proEndDay) <= 0) {
            //ArrayList<String> 에 java.util.Date타입인 startDay 객체를 날짜포맷을 지정해주어서 넣어준다.            
            useDates.add(sdf.format(startDay));
            
            //캘린더클래스의 인스턴스가져오는 메소드를 사용해서 객체를 생성해준다.
            Calendar cal = Calendar.getInstance();

            //생성한 객체를 사용해 날짜를 넣어준다.
            cal.setTime(startDay);
            int day = cal.get(Calendar.DAY_OF_WEEK);
            
            days.add(day+"");
            //캘린더에 해당 월을 가져와서 넣어준다. 하루씩 증가
            cal.add(Calendar.DAY_OF_MONTH, 1);
            //java.util.Date 타입인 startDay에 캘린더에 저장된 날짜들을 가져와 대입해준다.
            startDay = cal.getTime();
         }
         //휴무일
         String dayWeek = com.getHoliday();
         String[] dayWeeks = null;
         int[] dayOfWeek=null;
         int[] checkList =new int[days.size()];
         if(dayWeek==null) {
        	 dayWeeks = new String[] {"하","하","하","하","하","하","하"};
        	 dayOfWeek = new int[dayWeeks.length];
         }else {
        	 dayWeeks = dayWeek.split(",");
        	 dayOfWeek = new int[dayWeeks.length];
         }
         for(int i=0 ; i<dayWeeks.length ; i++) {
        	 
        	 switch(dayWeeks[i]) {
        	 case "일" : dayOfWeek[i] = 1 ; break;
        	 case "월" : dayOfWeek[i] = 2 ; break;
        	 case "화" : dayOfWeek[i] = 3 ; break;
        	 case "수" : dayOfWeek[i] = 4 ; break;
        	 case "목" : dayOfWeek[i] = 5 ; break;
        	 case "금" : dayOfWeek[i] = 6 ; break;
        	 case "토" : dayOfWeek[i] = 7 ; break;
        	 default : dayOfWeek[i] = 99;break;
        	 }
         }
         
         ArrayList<String> useDate = new ArrayList<String>();
         
         checkList = new int[days.size()];
         for(int i=0 ; i<days.size() ; i++) {
            for(int j=0 ; j<dayOfWeek.length ; j++) {
               if(Integer.parseInt(days.get(i)) == dayOfWeek[j]) {
                  checkList[i] = 0;
                  break;
               }else if(Integer.parseInt(days.get(i)) != dayOfWeek[j]) {
//                  System.out.println("휴무일 아닐때 days.get["+j+"]: " + Integer.parseInt(days.get(j)));
//                  System.out.println("인서트 ㅇㅇ");
//                  System.out.println("휴무일이랑 일치하는 요일인덱스 : " + days);
//                  System.out.println("휴무일인덱스 : "+dayOfWeek);
                  /*check = 1;*/
                  checkList[i] = 1;
               }
            }
         }
         for(int i=0 ; i<checkList.length; i++) {
            if(checkList[i]==1) {
               useDate.add(useDates.get(i));
            }
         }
         
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
         int k = 0;
         for(int i=0 ; i<useDate.size() ; i++) {
            for(int j=openTime ; j<closeTime ; j++) {
               UseProduct upro = new UseProduct();
               upro.setUseDate(Date.valueOf(useDate.get(i)));;
               upro.setuNum(uNum);

               k = j+1;
               if(j<10) {
                  start = "0" + j + ":00";
                  if(k<10) {
                     end = "0"+ k + ":00";
                  }
                   end = k + ":00";
               }else {
                  
                  start = j +":00";
                  end = k + ":00";
                  
               }
               upro.setUseStartTime(start);
               upro.setUseEndTime(end);
               uProList.add(upro);
            }
         }
         
         //휴무일까지 받아옴
         int result = new ProductService().insertUseProduct(pro,uProList, useDate);
         
         String page = "";
         
         if(result > 0) {
            //상품, 제품등록 성공시 
            page = request.getContextPath() + "/selectProList.pr?mno="+cNo;
            response.sendRedirect(page);
         }else {
            //에러
            page = "views/common/errorPage.jsp";
            request.setAttribute("msg", "상품등록에 실패하셨습니다.");
            request.getRequestDispatcher(page).forward(request, response);
         }
         /* util.Date타입을 sql.Date타입으로 변환시 필요
          * new java.sql.Date(new java.util.Date().getTime());
         new java.util.Date(new java.util.Date(12345L).getTime());*/
      }

      protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         doGet(request, response);
      }

   }