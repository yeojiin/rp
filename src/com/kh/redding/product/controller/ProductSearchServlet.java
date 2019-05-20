package com.kh.redding.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.redding.member.model.vo.Member;
import com.kh.redding.product.model.service.ProductService;
import com.kh.redding.product.model.vo.Product;
@WebServlet("/searchPro.pr")
public class ProductSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ProductSearchServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("상품검색 서블릿");
		
		Member member = (Member)request.getSession().getAttribute("loginUser");
		int cno = member.getMno();
		
		String searchProName = request.getParameter("proName");
		System.out.println("searchProName : " + searchProName);
		
		String searchStatus = request.getParameter("prostatus");
		System.out.println("searchStatus : " + searchStatus);
		
		ArrayList<Product> proList = new ArrayList<Product>();
		Product pro = new ProductService().selectProductOne(1);
		proList.add(pro);
		
		//new Gson().toJson(pi, response.getWriter());
		new Gson().toJson(proList, response.getWriter());
		/*String proQuery = "SELECT PNO, PNAME, PCONTENT, PRICE, PENROLL_DATE, CNO, PMODIFY_DATE, PRO_STATUS FROM PRODUCT";
		if(searchProName=="") {
			System.out.println("이름 없음");
			proQuery = proQuery;
			if(searchStatus==null) {
				System.out.println("판매여부 없음");
				proQuery = proQuery;	//전체 검색
				
			}else {
				System.out.println("판매여부 있음");
				proQuery+="WHERE PRO_STAUTS = ?";	//상품명 X 판매여부에 따라서만 검색
			}
		}else {
			proQuery += "WHERE PNAME LIKE '%'||?||'%'";
			System.out.println("이름 있음");
			if(searchStatus==null) {
				System.out.println("판매여부 없음");
				proQuery = proQuery;	//상품명O 판매여부 X
				
			}else {
				System.out.println("판매여부 있음");
				proQuery += "AND PRO_STATUS = ?";	//상품명 X 판매여부에 따라서만 검색
			}
		}
		
		System.out.println("===============================");
		new MakeQuery().searchProduct(proQuery, cno);*/
				
		//ArrayList<Product> proList = new ProductService().select;
		
		/*
		String searchTerm = request.gm : " + searchTerm);
		etParameter("productSearchAboutTerm");
		System.out.println("searchTer
		String startDate = request.getParameter("startDate");
		
		if(startDate=="")
		System.out.println("startDate : " + startDate);
		
		String endDate = request.getParameter("endDate");
		System.out.println("endDate : " + endDate);*/
		
		/*int value = 0;
		if(searchProName=="") {
			System.out.println("이름 없음");
			if(searchStatus==null) {
				System.out.println("판매여부 없음");
				if(searchTerm==null) {
					System.out.println("선택값 없음");
					if(startDate=="") {
						value=10;
						System.out.println("시작 날 업음");
						if(endDate=="") {
							System.out.println("막날 없음");
						}else {
							System.out.println("막날 있음");
						}
					}else {
						System.out.println("시작 날 있음");
					}
				}else {
					System.out.println("선택값 있음");
				}
			}else {
				System.out.println("판매여부 있음");
			}
		}else {
			System.out.println("이름 있음");
		}*/
		/*
		
		if(searchTerm==null) {
			System.out.println("선택값 없음");
		}else {
			System.out.println("선택값 있음");
		}
		
		
		if(startDate=="") {
			System.out.println("시작 날 업음");
		}else {
			System.out.println("시작 날 있음");
		}
		
		
		if(endDate=="") {
			System.out.println("막날 없음");
		}else {
			System.out.println("막날 있음");
		}*/
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
