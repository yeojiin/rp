package com.kh.redding.message.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.redding.message.model.service.MessageService;
import com.kh.redding.message.model.vo.Message;

@WebServlet("/receiveList.mes")
public class SelectListReceiveMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public SelectListReceiveMessageServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("모든 업체들에게 받은 쪽지 전체 리스트 조회 서블릿");
		
		int wtype = 20;
		//System.out.println("wt : " + wtype);
		
		ArrayList<Message> receiveList = new MessageService().selectListMes(wtype);
		
		//System.out.println("receiveList : " + receiveList);
		
		String page = "";
		
		if(receiveList != null) {
			page = "views/admin/a_Message.jsp";
			request.setAttribute("receiveList", receiveList);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "보낸 쪽지 목록 조회에 실패하셨습니다.");
		}
		request.getRequestDispatcher(page).forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
