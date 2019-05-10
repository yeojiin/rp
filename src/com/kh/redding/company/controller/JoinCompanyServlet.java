package com.kh.redding.company.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.redding.company.model.service.CompanyService;
import com.kh.redding.company.model.vo.Company;
import com.kh.redding.member.model.vo.Member;

@WebServlet("/companyjoin.me")
public class JoinCompanyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public JoinCompanyServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("comid");
		String reg_num = request.getParameter("reg_num");
		String userPwd = request.getParameter("userPwd");
		String company_type = request.getParameter("company_type");
		String name = request.getParameter("name");
		String tel1 = request.getParameter("phone1");
		String tel2 = request.getParameter("phone2");
		String tel3 = request.getParameter("phone3");
		String rep_name = request.getParameter("rep_name");
		
		String phone = tel1 + "-" + tel2 + "-" + tel3;
		
		String postcode = request.getParameter("postcode");
		String address1 = request.getParameter("address");
		String address2 = request.getParameter("detailAddress");
		String address3 = request.getParameter("extraAddress");
		
		String totalAddress = postcode + "|" + address1 + "|" + address2 + "|" + address3;
		
		int accountcode = Integer.parseInt(request.getParameter("accountcode"));
		String account_num = request.getParameter("account_num");
		String account_name = request.getParameter("account_name");
		String email = request.getParameter("email");
		String email_check = request.getParameter("email_check");
	
		String url = request.getParameter("homepage");
		String startime = request.getParameter("strartime");
		String endtime = request.getParameter("endtime");
		
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
		
		Date start = null;
		Date end = null;
		try {
			start = (Date)sdf.parse(startime);
			end = (Date)sdf.parse(endtime);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		System.out.println("userid :" + userId);
		System.out.println("reg_num :" + reg_num);
		System.out.println("password :" + userPwd);
		System.out.println("company_type :" + company_type);
		System.out.println("name :" + name);
		System.out.println("phone :" + phone);
		System.out.println("totalAddress :" + totalAddress);
		System.out.println("accountcode :" + accountcode);
		System.out.println("account_num :" + account_num);
		System.out.println("account_name :" + account_name);
		System.out.println("email :" + email);
		System.out.println("email_check :" + email_check);
		System.out.println("url :" + url);
		System.out.println("opentime :" + start);
		System.out.println("endTime :" + end);
		
		String emailstatus = "";
		if (email_check.equals("인증안됨")) {
			emailstatus = "N";
		}else {
			emailstatus = "Y";
		}
		
		Member joinMember = new Member();
		Company joinCompany = new Company();
		
		joinMember.setMemberId(userId);
		joinMember.setMemberPwd(userPwd);
		joinMember.setMemberName(name);
		joinMember.setPhone(phone);
		joinMember.setEmail(email);
		joinMember.setEmailCheck(emailstatus);
		
		joinCompany.setAccountCode(accountcode);
		joinCompany.setAccountName(account_name);
		joinCompany.setAccountNum(account_num);
		joinCompany.setComType(company_type);
		joinCompany.setCom_Rep_Num(reg_num);
		joinCompany.setRepName(rep_name);
		joinCompany.setComAddress(totalAddress);
		joinCompany.setComUrl(url);
		joinCompany.setOpenTime(start);
		joinCompany.setEndTime(end);
		
		int result = new CompanyService().insertCompany(joinMember,joinCompany);
		
		String page = "";
		if (result > 0) {
			page = request.getContextPath()+"/views/common/login.jsp";
			
			response.sendRedirect(page);
		}else {
			page = "/views/common/errorPage.jsp";
			
			request.setAttribute("msg", "회원가입 실패");
			
			request.getRequestDispatcher(page).forward(request, response);
			
		}
		
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
