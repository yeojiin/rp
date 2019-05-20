package com.kh.redding.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.redding.product.model.vo.Product;
@WebServlet("/searchPro.pr")
public class ProductSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ProductSearchServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("상품검색 서블릿");
		
		String searchProName = request.getParameter("productSearchForName");
		System.out.println("searchProName : " + searchProName);
		if(searchProName=="") {
			System.out.println("이름 없음");
		}else {
			System.out.println("이름 있음");
		}
		
		String searchStatus = request.getParameter("productSearchAbountSale");
		System.out.println("searchStatus : " + searchStatus);
		if(searchStatus==null) {
			System.out.println("판매여부 없음");
		}else {
			System.out.println("판매여부 있음");
			
		}
		String searchTerm = request.getParameter("productSearchAboutTerm");
		System.out.println("searchTerm : " + searchTerm);
		if(searchTerm==null) {
			System.out.println("선택값 없음");
		}else {
			System.out.println("선택값 있음");
		}
		
		String startDate = request.getParameter("startDate");
		System.out.println("startDate : " + startDate);
		if(startDate=="") {
			System.out.println("시작 날 업음");
		}else {
			System.out.println("시작 날 있음");
		}
		
		String endDate = request.getParameter("endDate");
		System.out.println("endDate : " + endDate);
		if(endDate=="") {
			System.out.println("막날 없음");
		}else {
			System.out.println("막날 있음");
		}
		
		System.out.println("===============================");
				
		ArrayList<Product> proList = null;
		
		
		/*String page = "";
		if() {
			page = "views/company/c_ProductManagement.jsp";
			request.setAttribute("proList", proList);
			
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "상품검색에 실패하셨습니다.");
			
		}
		request.getRequestDispatcher(page).forward(request, response);*/
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
