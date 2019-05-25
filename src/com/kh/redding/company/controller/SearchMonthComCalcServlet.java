package com.kh.redding.company.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.redding.company.model.service.CompanyService;
import com.kh.redding.wishlist.model.service.WishListService;

/**
 * Servlet implementation class SearchMonthComCalcServlet
 */
@WebServlet("/searchMonCalc.co")
public class SearchMonthComCalcServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchMonthComCalcServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int month = Integer.parseInt(request.getParameter("month"));
		int mno = Integer.parseInt(request.getParameter("mno"));

		
		ArrayList<HashMap<String, Object>> list = new CompanyService().searchMonCalc(mno, month);

		if(list != null) {
			response.setContentType("application/json");
			new Gson().toJson(list, response.getWriter());
		}

		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
