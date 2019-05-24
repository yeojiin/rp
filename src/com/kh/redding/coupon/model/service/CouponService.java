package com.kh.redding.coupon.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.redding.attachment.model.vo.Attachment;
import com.kh.redding.coupon.model.dao.CouponDao;
import com.kh.redding.coupon.model.vo.Coupon;

import static com.kh.redding.common.JDBCTemplate.*;


public class CouponService {
	
	// 쿠폰 목록 조회용 메소드
	public ArrayList<HashMap<String, Object>> selectCouponList() {
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> list = new CouponDao().selectCouponList(con);
		close(con);
		return list;
	}

	// 쿠폰 생성용 메소드
	public int insertCoupon(Coupon coupon, Attachment attachment) {
		
		Connection con = getConnection();
		int result = new CouponDao().insertCoupon(con, coupon, attachment);
		
		if(result > 0) {
			int couponCode = new CouponDao().selectCurrval(con);
			attachment.setCouponCode(couponCode);
		}
		int result2 = new CouponDao().insertAttachment(con, attachment);
		if(result2 > 0) {
			commit(con);
			result = 1;
		}else {
			rollback(con);
			result = 0;
		}
		
		close(con);
		
		return result;
	}

	// 쿠폰 업데이트용 메소드 (발급가능상태 만들기)
	public int updateCouponListY() {
		Connection con = getConnection();
		int result = new CouponDao().updateCouponY(con);
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return result;
	}
	
	// 쿠폰 업데이트용 메소드 (발급불가능상태 만들기)
	public int updateCouponListN() {
		Connection con = getConnection();
		int result = new CouponDao().updateCouponN(con);
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return result;
	}

}
