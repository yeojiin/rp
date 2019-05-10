package com.kh.redding.company.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.redding.company.model.service.CompanyService;

/**
 * Servlet implementation class IdCheckServlet
 */
@WebServlet("/idcheck.me")
public class IdCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public IdCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String UserId = request.getParameter("UserId");
		
		System.out.println(UserId + "넘어옴");
		
		int result = new CompanyService().registerCheck(UserId);
		//int result = 1;
		System.out.println(result);
		PrintWriter out = response.getWriter();
		
		if (result > 0) {
			out.append("fail");
		}else {
			System.out.println("test");
			out.append("success");
		}
	
		out.flush();
		out.close();
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
