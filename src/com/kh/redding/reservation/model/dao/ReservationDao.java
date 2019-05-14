package com.kh.redding.reservation.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;
import static com.kh.redding.common.JDBCTemplate.*;

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
				res.setRapplyDate(rset.getDate("RAPPLY_DATE"));
				res.setStatus(rset.getString("RSTATUS"));
				res.setStartDate(rset.getString("USE_START_TIME"));
				res.setEndDate(rset.getString("USE_END_TIME"));
				res.setProductName(rset.getString("UPNAME"));
				res.setCompletedDate(rset.getDate("RCOMPLETED_DATE"));

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

}
