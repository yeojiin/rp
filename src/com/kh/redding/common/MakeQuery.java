package com.kh.redding.common;

import java.io.FileNotFoundException;

import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.redding.board.model.vo.BoardPageInfo;
import com.kh.redding.member.model.dao.MemberDao;


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
			query = "SELECT RNUM,PNAME,CNAME,RAPPLY_DATE,SUBNO,PRICE,RSTATUS,RESNO,UPNO FROM ((SELECT ROWNUM RNUM,PNAME,SUBNO,CNAME,RAPPLY_DATE,PRICE,RSTATUS,RESNO,UPNO FROM (SELECT P.PNAME PNAME,M.MNAME CNAME,R.RESNO RESNO,R.SUBNO SUBNO ,R.RAPPLY_DATE RAPPLY_DATE,P.PRICE PRICE ,R.RSTATUS RSTATUS,UP.UPNO UPNO FROM RESERVATION R JOIN USE_PRODUCT UP ON(R.UPNO = UP.UPNO) JOIN PRODUCT P ON(UP.PNO = P.PNO) JOIN COMPANY C ON(P.CNO = C.CNO) JOIN MEMBER M ON (C.CNO = M.MNO) WHERE R.MNO= " + mno + " AND R.RSTATUS =" + " " + value + " " + "ORDER BY RAPPLY_DATE DESC))) WHERE RNUM BETWEEN"+ " " + startRow + " AND" +" " + endRow;
		}else if(value == 30) {
			query = "SELECT RNUM,PAYNO,UPNO,APPROVAL,PNAME,RAPPLY,CNAME,FINAL_PRICE,PAYDIV FROM(SELECT ROWNUM RNUM, PAYNO,FINAL_PRICE,UPNO,APPROVAL,PNAME,RAPPLY,CNAME,PAYDIV FROM(SELECT PH.PAYNO PAYNO,FINAL_PRICE, PH.UPNO UPNO,PH.APPROVAL_DATE APPROVAL,P.PNAME PNAME,RAPPLY_DATE RAPPLY ,M.MNAME CNAME,PH.PAY_DIV PAYDIV FROM PAY_HISTORY PH JOIN USE_PRODUCT UP ON (PH.UPNO = UP.UPNO) JOIN PRODUCT P ON (UP.PNO = P.PNO) JOIN RESERVATION R ON (PH.UPNO = R.UPNO AND PH.MNO = R.MNO) JOIN MEMBER M ON(M.MNO = P.CNO) WHERE PH.PAY_DIV = ? AND PH.MNO = " + " " +mno + " " +" ORDER BY PH.APPROVAL_DATE DESC)) WHERE RNUM BETWEEN"+ " " + startRow + " " + " AND" +" "+ endRow;
		}else if(value == 40) {
			query = "SELECT RNUM,PNAME,CNAME,RAPPLY_DATE,SUBNO,PRICE,RSTATUS,RESNO,UPNO FROM ((SELECT ROWNUM RNUM,PNAME,CNAME,SUBNO,RAPPLY_DATE,PRICE,RSTATUS,RESNO,UPNO FROM (SELECT P.PNAME PNAME,M.MNAME CNAME,R.RESNO RESNO,R.SUBNO SUBNO ,R.RAPPLY_DATE RAPPLY_DATE,P.PRICE PRICE ,R.RSTATUS RSTATUS,UP.UPNO UPNO FROM RESERVATION R JOIN USE_PRODUCT UP ON(R.UPNO = UP.UPNO) JOIN PRODUCT P ON(UP.PNO = P.PNO) JOIN COMPANY C ON(P.CNO = C.CNO) JOIN MEMBER M ON (C.CNO = M.MNO) WHERE R.MNO=" + " "+ mno + " " +  "AND R.RSTATUS = 10 AND RAPPLY_DATE BETWEEN TO_DATE("+firstDate+") AND TO_DATE("+lastDate+") ORDER BY RAPPLY_DATE DESC))) WHERE RNUM BETWEEN"+ " " + startRow + " " +" AND" +" "+ endRow; 
		}else if(value == 50) {
			query = "SELECT RNUM,PNAME,CNAME,RAPPLY_DATE,PRICE,SUBNO,RSTATUS,RESNO,UPNO FROM ((SELECT ROWNUM RNUM,PNAME,CNAME,RAPPLY_DATE,PRICE,RSTATUS,RESNO,UPNO,SUBNO FROM (SELECT P.PNAME PNAME,M.MNAME CNAME,R.RESNO RESNO ,R.RAPPLY_DATE RAPPLY_DATE,P.PRICE PRICE,R.SUBNO SUBNO,R.RSTATUS RSTATUS,UP.UPNO UPNO FROM RESERVATION R JOIN USE_PRODUCT UP ON(R.UPNO = UP.UPNO) JOIN PRODUCT P ON(UP.PNO = P.PNO) JOIN COMPANY C ON(P.CNO = C.CNO) JOIN MEMBER M ON (C.CNO = M.MNO) WHERE R.MNO=" + " "+ mno + " " +  "AND R.RSTATUS = 20 AND RAPPLY_DATE BETWEEN TO_DATE("+firstDate+") AND TO_DATE("+lastDate+") ORDER BY RAPPLY_DATE DESC))) WHERE RNUM BETWEEN"+ " " + startRow + " " +" AND" +" "+ endRow;
		}else if(value == 60 || value == 70) {
			query = "SELECT RNUM,PAYNO,UPNO,APPROVAL,PNAME,RAPPLY,CNAME,FINAL_PRICE,PAYDIV FROM(SELECT ROWNUM RNUM,PAYNO,UPNO,FINAL_PRICE,APPROVAL,PNAME,RAPPLY,CNAME,PAYDIV FROM(SELECT PH.PAYNO PAYNO, PH.UPNO UPNO,FINAL_PRICE,PH.APPROVAL_DATE APPROVAL,P.PNAME PNAME,RAPPLY_DATE RAPPLY ,M.MNAME CNAME,PH.PAY_DIV PAYDIV FROM PAY_HISTORY PH JOIN USE_PRODUCT UP ON (PH.UPNO = UP.UPNO) JOIN PRODUCT P ON (UP.PNO = P.PNO) JOIN RESERVATION R ON (PH.UPNO = R.UPNO AND PH.MNO = R.MNO) JOIN MEMBER M ON(M.MNO = P.CNO) WHERE PH.PAY_DIV = ? AND PH.MNO = " + " " +mno + " " + "AND APPROVAL_DATE BETWEEN TO_DATE("+firstDate+") AND TO_DATE("+lastDate+")" + " ORDER BY PH.APPROVAL_DATE DESC)) WHERE RNUM BETWEEN"+ " " + startRow + " " + " AND" +" "+ endRow;					
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

	public void searchProduct(int value, int cno) {
		Properties prop = new Properties();
		String fileName = MakeQuery.class.getResource("/sql/product/product-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e1) {
			e1.printStackTrace();
		}


		String query = "";

		if(value == 10) {
			query = "SELECT RNUM, PNO, PNAME, PCONTENT, PRICE, PENROLL_DATE, CNO, PMODIFY_DATE, PRO_STATUS FROM( SELECT ROWNUM RNUM, PNO, PNAME, PCONTENT, PRICE, PENROLL_DATE, CNO, PMODIFY_DATE, PRO_STATUS FROM( SELECT P.PNO, P.PNAME, P.PCONTENT, P.PRICE, P.PENROLL_DATE, P.CNO, P.PMODIFY_DATE, P.PRO_STATUS FROM PRODUCT P JOIN COMPANY C ON(P.CNO = C.CNO) JOIN MEMBER M ON (M.MNO = C.CNO) WHERE P.CNO = ? ORDER BY P.PNO DESC ) )";// WHERE RNUM BETWEEN ? AND ?
		}else if(value == 20) {
			query = "SELECT RNUM, PNO, PNAME, PCONTENT, PRICE, PENROLL_DATE, CNO, PMODIFY_DATE, PRO_STATUS FROM( SELECT ROWNUM RNUM, PNO, PNAME, PCONTENT, PRICE, PENROLL_DATE, CNO, PMODIFY_DATE, PRO_STATUS FROM( SELECT P.PNO, P.PNAME, P.PCONTENT, P.PRICE, P.PENROLL_DATE, P.CNO, P.PMODIFY_DATE, P.PRO_STATUS FROM PRODUCT P JOIN COMPANY C ON(P.CNO = C.CNO) JOIN MEMBER M ON (M.MNO = C.CNO) WHERE P.CNO = ? AND PRO_STATUS =? ORDER BY P.PNO DESC ) ) ";//WHERE RNUM BETWEEN ? AND ?
		}else if(value == 30) {
			query = "SELECT RNUM, PNO, PNAME, PCONTENT, PRICE, PENROLL_DATE, CNO, PMODIFY_DATE, PRO_STATUS FROM( SELECT ROWNUM RNUM, PNO, PNAME, PCONTENT, PRICE, PENROLL_DATE, CNO, PMODIFY_DATE, PRO_STATUS FROM( SELECT P.PNO, P.PNAME, P.PCONTENT, P.PRICE, P.PENROLL_DATE, P.CNO, P.PMODIFY_DATE, P.PRO_STATUS FROM PRODUCT P JOIN COMPANY C ON(P.CNO = C.CNO) JOIN MEMBER M ON (M.MNO = C.CNO) WHERE P.CNO = ? AND PNAME LIKE '%'||?||'%' ORDER BY P.PNO DESC ) ) ";//WHERE RNUM BETWEEN ? AND ?
		}else if(value == 40) {
			query = "SELECT RNUM, PNO, PNAME, PCONTENT, PRICE, PENROLL_DATE, CNO, PMODIFY_DATE, PRO_STATUS FROM( SELECT ROWNUM RNUM, PNO, PNAME, PCONTENT, PRICE, PENROLL_DATE, CNO, PMODIFY_DATE, PRO_STATUS FROM( SELECT P.PNO, P.PNAME, P.PCONTENT, P.PRICE, P.PENROLL_DATE, P.CNO, P.PMODIFY_DATE, P.PRO_STATUS FROM PRODUCT P JOIN COMPANY C ON(P.CNO = C.CNO) JOIN MEMBER M ON (M.MNO = C.CNO) WHERE P.CNO = ? AND PNAME LIKE '%'||?||'%' AND PRO_STATUS=? ORDER BY P.PNO DESC ) ) ";//WHERE RNUM BETWEEN ? AND ?
		}


		prop.setProperty(prop.getProperty("","searchProduct"),query);

		FileOutputStream fos = null;
		OutputStreamWriter osw = null;

		try {

			fos = new FileOutputStream(fileName);
			osw = new OutputStreamWriter(fos, "UTF-8");

			prop.store(osw, "");
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}finally {
			try {
				fos.close();
				osw.close();
			} catch (IOException e) {
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
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}finally {
			try {
				fos.close();
				osw.close();
			} catch (IOException e) {

				e.printStackTrace();
			}

		}
	}

	public void makeSearchCompanyListQuery(ArrayList searchConditionList) {
		Properties prop = new Properties();
		String fileName = MemberDao.class.getResource("/sql/admin/admin-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
		String companyName = searchConditionList.get(0).toString();
		String companyCategory = searchConditionList.get(1).toString();
		String companyEnrollDate = searchConditionList.get(2).toString();
		String companyStatus = searchConditionList.get(3).toString();

		String query = "";

		if(companyName != null) {
			query = "SELECT RNUM, MNO, MID, MPWD, MNAME, NICK_NAME, EMAIL, EMAIL_CHECK, PHONE, EMERGEN_CON, GENDER, ENROLL_DATE, STATUS, MODIFY_DATE, MNOTI_TYPE, OUT_DATE, WEDDING_DATE, MTYPE, COM_TYPE FROM(SELECT ROWNUM RNUM, MNO, MID, MPWD, MNAME, NICK_NAME, EMAIL, EMAIL_CHECK, PHONE, EMERGEN_CON, GENDER, ENROLL_DATE, STATUS, MODIFY_DATE, MNOTI_TYPE, OUT_DATE, WEDDING_DATE, MTYPE, COM_TYPE FROM (SELECT M.MNO, M.MID, M.MPWD, M.MNAME, M.NICK_NAME, M.EMAIL, M.EMAIL_CHECK, M.PHONE, M.EMERGEN_CON, M.GENDER, M.ENROLL_DATE, M.STATUS, M.MODIFY_DATE, M.MNOTI_TYPE, M.OUT_DATE, M.WEDDING_DATE, M.MTYPE, C.COM_TYPE FROM MEMBER M JOIN COMPANY C ON(M.MNO = C.CNO) WHERE M.MTYPE=20 AND MNAME LIKE '%'||?||'%' ORDER BY M.MNO DESC) ORDER BY RNUM ASC)";
		}
		
		prop.setProperty(prop.getProperty("","selectSearchCompanyList"),query);
		
		FileOutputStream fos = null;
		OutputStreamWriter osw = null;

		try {

			fos = new FileOutputStream(fileName);
			osw = new OutputStreamWriter(fos, "UTF-8");

			prop.store(osw, "");
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}finally {
			try {
				fos.close();
				osw.close();
			} catch (IOException e) {

				e.printStackTrace();
			}

		}

	}


}
