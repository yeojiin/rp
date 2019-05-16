package com.kh.redding.reservation.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.redding.reservation.model.dao.ReservationDao;
import com.kh.redding.reservation.model.vo.Reservation;

import static com.kh.redding.common.JDBCTemplate.*;

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

}
