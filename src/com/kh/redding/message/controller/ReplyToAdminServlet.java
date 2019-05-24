package com.kh.redding.message.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/replyToAdmin.mes")
public class ReplyToAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ReplyToAdminServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("관리자한테 답장하기 서블릿");
		int code = Integer.parseInt(request.getParameter("code"));
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
