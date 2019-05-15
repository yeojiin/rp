package com.kh.redding.wishlist.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.redding.member.model.vo.Member;
import com.kh.redding.wishlist.model.service.WishListService;

/**
 * Servlet implementation class DeleteWishList
 */
@WebServlet("/delete.wi")
public class DeleteWishList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteWishList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] list = request.getParameter("deleteList").split(",");
		
		//받아 온 리스트를 , 단위로 쪼갠 뒤 배열에 넣기
		ArrayList<String> deleteList = new ArrayList<String>();
		for(int i=0; i<list.length; i++) {
			deleteList.add(list[i]);
		}
		//System.out.println(deleteList);
		
		//세션으로 로그인 정보 받아오기
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		int num = loginUser.getMno();
		//System.out.println("회원번호:"+num);
		
		
		int result = new WishListService().deleteWishList(deleteList, num);
		
		String page = "";
		if(result>0) {
			response.sendRedirect("/redding/showList.wi");
		}else {
			page="views/common/errorPage.jsp";
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response); 
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
