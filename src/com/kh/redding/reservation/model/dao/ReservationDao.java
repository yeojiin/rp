package com.kh.redding.reservation.model.dao;

import static com.kh.redding.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.kh.redding.reservation.model.vo.Reservation;


public class ReservationDao {
	Properties prop = new Properties();	
	
	public ReservationDao() {
		String fileName = ReservationDao.class.getResource("/sql/reservation/reservation-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		}
	
	public ArrayList<Reservation> selectReservation(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectReservation");
		ArrayList<Reservation> list = null;
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<Reservation>();
			
			while(rset.next()) {
				Reservation res = new Reservation();
				
				res.setUserName(rset.getString("MNAME"));
				res.setUserPhone(rset.getString("PHONE"));
				res.setRapplyDate(rset.getString(3));
				res.setStatus(rset.getString("RSTATUS"));
				res.setStartDate(rset.getString("USE_START_TIME"));
				res.setEndDate(rset.getString("USE_END_TIME"));
				res.setProductName(rset.getString("UPNAME"));
				res.setCompletedDate(rset.getDate("RCOMPLETED_DATE"));
				res.setResNo(rset.getInt("RESNO"));
				list.add(res);				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		
		
		
		
		return list;
	}

	public int updateReservation(Connection con, int resNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateReservation");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, resNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	
	
	//위시리스트 예약
	public ArrayList<HashMap<String, Object>> reserveWishList(int userNum, int[] resList, Connection con) {
		/*for(int i=0; i<resList.length; i++) {
			System.out.println("resList: " + resList[i]);
		}
		System.out.println("userNum: " +userNum);*/
		
		PreparedStatement pstmt = null;
		ArrayList<HashMap<String,Object>> list = null;
		HashMap<String, Object> hmap = null;
		ResultSet rset = null;
		
		
		
		/*코드 작성????????어렵다 어려워*/
		
		
		return list;
	}

}
