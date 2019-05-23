package com.kh.redding.member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.redding.member.model.service.MemberService;

/**
 * Servlet implementation class MemberSelectDetailComQnaServlet
 */
@WebServlet("/selectDetailComQna.cq")
public class MemberSelectDetailComQnaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberSelectDetailComQnaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cno = Integer.parseInt(request.getParameter("cno"));
		
		
		
		ArrayList<HashMap<String, Object>> blist = new MemberService().selectDetailComQna(cno);
		System.out.println("blist :" + blist);
		
		
		String page = "";
		if(blist != null) {
			page = "views/member/m_ComQnaList.jsp";
			request.setAttribute("blist", blist);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "업체 Qna 목록 조회 실패!");
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
		/*response.setContentType("application/json");
		new Gson().toJson(blist,response.getWriter());*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
