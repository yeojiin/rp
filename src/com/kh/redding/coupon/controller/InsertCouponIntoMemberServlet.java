package com.kh.redding.coupon.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.redding.coupon.model.service.CouponService;

@WebServlet("/insertCoupon.me")
public class InsertCouponIntoMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public InsertCouponIntoMemberServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String couponCode = request.getParameter("couponCode");
		String mno = request.getParameter("mno");
		
		//System.out.println(couponCode);
		//System.out.println(mno);
		
		int result = new CouponService().insertCouponIntoMember(couponCode, mno);
		
		int result2 = new CouponService().checkInsertCouponIntoMember(couponCode, mno);
		
		if(result2 > 0) {
			response.setContentType("application/json");
			new Gson().toJson(couponCode, response.getWriter());
		}else {
			System.out.println("이미 발급이 완료된 쿠폰입니다.");
		}
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
