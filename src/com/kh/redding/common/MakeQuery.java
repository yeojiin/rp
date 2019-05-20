package com.kh.redding.common;

import java.io.FileNotFoundException;

import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.util.Properties;


public class MakeQuery {
	private Properties prop = new Properties();
	String fileName = MakeQuery.class.getResource("/sql/member/member-query.properties").getPath();
	public MakeQuery() {
				
		try {
			prop.load(new FileReader(fileName));
					
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
		
	public void makeQuery(int value) {
		String query = "";
		
		if(value == 10) {
			query += "SELECT RNUM,PNAME,CNAME,RAPPLY_DATE,PRICE,RSTATUS FROM ((SELECT ROWNUM RNUM,PNAME,CNAME,RAPPLY_DATE,PRICE,RSTATUS FROM (SELECT P.PNAME PNAME,M.MNAME CNAME ,R.RAPPLY_DATE RAPPLY_DATE,P.PRICE PRICE ,R.RSTATUS RSTATUS FROM RESERVATION R JOIN USE_PRODUCT UP ON(R.UPNO = UP.UPNO) JOIN PRODUCT P ON(UP.PNO = P.PNO) JOIN COMPANY C ON(P.CNO = C.CNO) JOIN MEMBER M ON (C.CNO = M.MNO) WHERE R.MNO=? AND R.RSTATUS = 10 ORDER BY RAPPLY_DATE DESC))) WHERE RNUM BETWEEN ? AND ?";
		}else if(value == 20) {
			
		}else if(value == 30) {
			
		}
		
		prop.setProperty(prop.getProperty("dynamicQuery", "dynamicQuery"),query);
		System.out.println(prop.getProperty("dynamicQuery"));
		
		FileOutputStream fos = null;
		OutputStreamWriter osw = null;
		
		try {
			
			fos = new FileOutputStream(fileName);
			osw = new OutputStreamWriter(fos, "UTF-8");
			
			prop.store(osw, "");
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				fos.close();
				osw.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}	
				
	}
	
}
