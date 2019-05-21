package com.kh.redding.common;

import java.io.FileNotFoundException;

import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.util.Properties;

import com.kh.redding.board.model.vo.BoardPageInfo;


public class MakeQuery {
	
	public MakeQuery() {}
		
	public void makeQuery(int value, int mno, String firstDate, String lastDate,BoardPageInfo pi) {
		
		Properties prop = new Properties();
		String fileName = MakeQuery.class.getResource("/sql/member/member-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		String query = "";
		int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
		int endRow = startRow + pi.getLimit() - 1;
		
		if(value == 10 || value == 20) {
			query = "SELECT RNUM,PNAME,CNAME,RAPPLY_DATE,PRICE,RSTATUS,RESNO,UPNO FROM ((SELECT ROWNUM RNUM,PNAME,CNAME,RAPPLY_DATE,PRICE,RSTATUS,RESNO,UPNO FROM (SELECT P.PNAME PNAME,M.MNAME CNAME,R.RESNO RESNO ,R.RAPPLY_DATE RAPPLY_DATE,P.PRICE PRICE ,R.RSTATUS RSTATUS,UP.UPNO UPNO FROM RESERVATION R JOIN USE_PRODUCT UP ON(R.UPNO = UP.UPNO) JOIN PRODUCT P ON(UP.PNO = P.PNO) JOIN COMPANY C ON(P.CNO = C.CNO) JOIN MEMBER M ON (C.CNO = M.MNO) WHERE R.MNO= " + mno + " AND R.RSTATUS =" + " " + value + " " + "ORDER BY RAPPLY_DATE DESC))) WHERE RNUM BETWEEN"+ " " + startRow + " AND" +" " + endRow;
		}else if(value == 30) {
			query = "SELECT RNUM,PAYNO,UPNO,APPROVAL,PNAME,RAPPLY,CNAME,PRICE,PAYDIV FROM(SELECT ROWNUM RNUM, PAYNO,UPNO,APPROVAL,PNAME,RAPPLY,CNAME,PRICE,PAYDIV FROM(SELECT PH.PAYNO PAYNO, PH.UPNO UPNO,PH.APPROVAL_DATE APPROVAL,P.PNAME PNAME,RAPPLY_DATE RAPPLY ,M.MNAME CNAME,P.PRICE PRICE,PH.PAY_DIV PAYDIV FROM PAY_HISTORY PH JOIN USE_PRODUCT UP ON (PH.UPNO = UP.UPNO) JOIN PRODUCT P ON (UP.PNO = P.PNO) JOIN RESERVATION R ON (PH.UPNO = R.UPNO AND PH.MNO = R.MNO) JOIN MEMBER M ON(M.MNO = P.CNO) WHERE PH.PAY_DIV = ? AND PH.MNO = " + " " +mno + " " +" ORDER BY PH.APPROVAL_DATE DESC)) WHERE RNUM BETWEEN"+ " " + startRow + " " + " AND" +" "+ endRow;
		}else if(value == 40) {
			query = "SELECT RNUM,PNAME,CNAME,RAPPLY_DATE,PRICE,RSTATUS,RESNO,UPNO FROM ((SELECT ROWNUM RNUM,PNAME,CNAME,RAPPLY_DATE,PRICE,RSTATUS,RESNO,UPNO FROM (SELECT P.PNAME PNAME,M.MNAME CNAME,R.RESNO RESNO ,R.RAPPLY_DATE RAPPLY_DATE,P.PRICE PRICE ,R.RSTATUS RSTATUS,UP.UPNO UPNO FROM RESERVATION R JOIN USE_PRODUCT UP ON(R.UPNO = UP.UPNO) JOIN PRODUCT P ON(UP.PNO = P.PNO) JOIN COMPANY C ON(P.CNO = C.CNO) JOIN MEMBER M ON (C.CNO = M.MNO) WHERE R.MNO=" + " "+ mno + " " +  "AND R.RSTATUS = 10 AND RAPPLY_DATE BETWEEN TO_DATE("+firstDate+") AND TO_DATE("+lastDate+") ORDER BY RAPPLY_DATE DESC))) WHERE RNUM BETWEEN"+ " " + startRow + " " +" AND" +" "+ endRow; 
		}else if(value == 50) {
			query = "SELECT RNUM,PNAME,CNAME,RAPPLY_DATE,PRICE,RSTATUS,RESNO,UPNO FROM ((SELECT ROWNUM RNUM,PNAME,CNAME,RAPPLY_DATE,PRICE,RSTATUS,RESNO,UPNO FROM (SELECT P.PNAME PNAME,M.MNAME CNAME,R.RESNO RESNO ,R.RAPPLY_DATE RAPPLY_DATE,P.PRICE PRICE ,R.RSTATUS RSTATUS,UP.UPNO UPNO FROM RESERVATION R JOIN USE_PRODUCT UP ON(R.UPNO = UP.UPNO) JOIN PRODUCT P ON(UP.PNO = P.PNO) JOIN COMPANY C ON(P.CNO = C.CNO) JOIN MEMBER M ON (C.CNO = M.MNO) WHERE R.MNO=" + " "+ mno + " " +  "AND R.RSTATUS = 20 AND RAPPLY_DATE BETWEEN TO_DATE("+firstDate+") AND TO_DATE("+lastDate+") ORDER BY RAPPLY_DATE DESC))) WHERE RNUM BETWEEN"+ " " + startRow + " " +" AND" +" "+ endRow;
		}else if(value == 60 || value == 70) {
			query = "SELECT RNUM,PAYNO,UPNO,APPROVAL,PNAME,RAPPLY,CNAME,PRICE,PAYDIV FROM(SELECT ROWNUM RNUM, PAYNO,UPNO,APPROVAL,PNAME,RAPPLY,CNAME,PRICE,PAYDIV FROM(SELECT PH.PAYNO PAYNO, PH.UPNO UPNO,PH.APPROVAL_DATE APPROVAL,P.PNAME PNAME,RAPPLY_DATE RAPPLY ,M.MNAME CNAME,P.PRICE PRICE,PH.PAY_DIV PAYDIV FROM PAY_HISTORY PH JOIN USE_PRODUCT UP ON (PH.UPNO = UP.UPNO) JOIN PRODUCT P ON (UP.PNO = P.PNO) JOIN RESERVATION R ON (PH.UPNO = R.UPNO AND PH.MNO = R.MNO) JOIN MEMBER M ON(M.MNO = P.CNO) WHERE PH.PAY_DIV = ? AND PH.MNO = " + " " +mno + " " + "AND APPROVAL_DATE BETWEEN TO_DATE("+firstDate+") AND TO_DATE("+lastDate+")" + " ORDER BY PH.APPROVAL_DATE DESC)) WHERE RNUM BETWEEN"+ " " + startRow + " " + " AND" +" "+ endRow;					
		}
		
		prop.setProperty(prop.getProperty("","dynamicQuery"),query);
		
				
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

	public void makeQueryCount(String firstDate, String lastDate, int value, int mno) {
		Properties prop = new Properties();
		String fileName = MakeQuery.class.getResource("/sql/member/member-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		String query = "";
		
		if(value == 40) {
			query = "SELECT COUNT(*) FROM RESERVATION WHERE MNO = " + " " + mno + "" +" AND RSTATUS = 10 AND RAPPLY_DATE BETWEEN TO_DATE(" + firstDate + ") AND TO_DATE(" + lastDate + ")";
		}else if(value == 50) {
			query = "SELECT COUNT(*) FROM RESERVATION WHERE MNO = " + " " + mno + "" +" AND RSTATUS = 20 AND RAPPLY_DATE BETWEEN TO_DATE(" + firstDate + ") AND TO_DATE(" + lastDate + ")";
		}else if(value == 60 || value==70) {
			query = "SELECT COUNT(*) FROM PAY_HISTORY WHERE MNO = " + " " + mno + "" +" AND PAY_DIV = ? AND APPROVAL_DATE BETWEEN TO_DATE(" + firstDate + ") AND TO_DATE(" + lastDate + ")";
		}
		
		prop.setProperty(prop.getProperty("","countDynamicQuery"),query);
		
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
