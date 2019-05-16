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
 * Servlet implementation class ChangeMemberPasswrodServlet
 */
@WebServlet("/changePassword.me")
public class ChangeMemberPasswrodServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public ChangeMemberPasswrodServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String password = request.getParameter("pwd");
		String changepassword = request.getParameter("changepwd");
		String memberId = request.getParameter("memberId");
		
		int result = new CompanyService().UpdateMemberPasword(password, changepassword , memberId);
		
		PrintWriter out = response.getWriter();
		
		if (result > 0) {
			out.append("success");
		}else {
			out.append("fail");
		}
	
		out.flush();
		out.close();

	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
