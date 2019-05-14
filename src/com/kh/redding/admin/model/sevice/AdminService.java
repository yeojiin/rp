package com.kh.redding.admin.model.sevice;

import static com.kh.redding.common.JDBCTemplate.close;
import static com.kh.redding.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.redding.admin.model.dao.AdminDao;
import com.kh.redding.member.model.vo.Member;

public class AdminService {
	
	public ArrayList<Member> selectList() {
		
		Connection con = getConnection();
		
		ArrayList<Member> list = new AdminDao().selectList(con);
		
		close(con);
		
		return list;
	}

}
