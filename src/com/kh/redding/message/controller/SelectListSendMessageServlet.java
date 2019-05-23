package com.kh.redding.message.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.redding.message.model.service.MessageService;
import com.kh.redding.message.model.vo.Message;

@WebServlet("/sendList.mes")
public class SelectListSendMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public SelectListSendMessageServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("모든 업체들에게 보낸 쪽지 전체 리스트 조회 서블릿");
		int wtype = 10;
		int listCount = Integer.parseInt(request.getParameter("value"));
		System.out.println("listCount : " + listCount);
		//System.out.println("wt : " + wtype);
		
		ArrayList<Message> sendList = new MessageService().selectListMes(wtype);
		
		//System.out.println("sendList : " + sendList);
		
		response.setContentType("application/json");
		new Gson().toJson(sendList, response.getWriter());
		
		/*String page = "";
		
		if(sendList != null) {
			page = "views/admin/a_SendMessage.jsp";
			request.setAttribute("sendList", sendList);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "보낸 쪽지 목록 조회에 실패하셨습니다.");
		}
		request.getRequestDispatcher(page).forward(request, response);*/
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
