package com.kh.redding.reservation.model.service;

import static com.kh.redding.common.JDBCTemplate.close;
import static com.kh.redding.common.JDBCTemplate.commit;
import static com.kh.redding.common.JDBCTemplate.getConnection;
import static com.kh.redding.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.redding.reservation.model.dao.ReservationDao;
import com.kh.redding.reservation.model.vo.Reservation;

public class ReservationService {

	public ArrayList<Reservation> selectReservation() {
		Connection con = getConnection();
		
		ArrayList<Reservation> list = new ReservationDao().selectReservation(con);
		
		
		close(con);
		
		return list;
	}

	public int updateReservation(int resNo) {
		Connection con = getConnection();
		
		int result = new ReservationDao().updateReservation(con, resNo);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		return result;
	}


	public ArrayList<Reservation> memberSelectReservation(int pno) {
		Connection con = getConnection();
		
		ArrayList<Reservation> reslist = new ReservationDao().memberSelectReservation(con,pno);
		
		close(con);
			
		return reslist;
	}

	public ArrayList<Reservation> memberSelectReservation(int pno, String date) {
		Connection con = getConnection();
		
		ArrayList<Reservation> reslist = new ReservationDao().memberSelectReservation(con,pno,date);
		
		close(con);
		
		return reslist;
	}

  
  
	//위시리스트 예약(정연)
	public ArrayList<HashMap<String, Object>> reserveWishList(int userNum, int[] resList) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list = new ReservationDao().reserveWishList(userNum, resList, con);
		
		close(con);
		
		return list;
	}
  
}
