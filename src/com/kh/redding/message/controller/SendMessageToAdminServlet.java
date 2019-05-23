package com.kh.redding.message.controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/toAdmin.mes")
public class SendMessageToAdminServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    public SendMessageToAdminServlet() {
        super();
    }

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      System.out.println("관리자에게 메세지 보내기-쪽지 insert 서블릿");
      
   }
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doGet(request, response);
   }

}