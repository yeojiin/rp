package com.kh.redding.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.redding.admin.model.sevice.AdminService;
import com.kh.redding.member.model.service.MemberService;
import com.kh.redding.member.model.vo.Member;

/**
 * Servlet implementation class SelectMemberListServlet
 */
@WebServlet("/selectList.me")
public class SelectMemberListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SelectMemberListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 페이징 추가
		int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;
		
		// 페이지 수 처리용 변수
		currentPage = 1;
		
		if(request.getParameter("currentPae") != null) {
			
		}
		
		ArrayList<Member> list = new AdminService().selectList();
		
		System.out.println("memberlist : " + list);
		
		String page = "";
		if(list != null) {
			page = "views/admin/a_TotalMember.jsp";
			request.setAttribute("list", list);
		} else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "전체 회원 조회 실패!");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
