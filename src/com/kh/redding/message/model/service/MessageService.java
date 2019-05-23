package com.kh.redding.message.model.service;

import static com.kh.redding.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.redding.company.model.vo.Company;
import com.kh.redding.member.model.vo.Member;
import com.kh.redding.message.model.dao.MessageDao;
import com.kh.redding.message.model.vo.Message;
import com.kh.redding.product.model.vo.PageInfo;

public class MessageService {
   //쪽지 보내기를 위한 업체 번호 받아오기 - 수민
   public Member selectCompanyOne(int cno) {
      Connection con = getConnection();
      Member company = new MessageDao().selectCompanyOne(con, cno);
      close(con);
      return company;
   }
   //새로 쪽지 보내기 - 수민
   public int insertMesToCompany(Message mes) {
      Connection con = getConnection();
      int result = new MessageDao().insertMesToCompany(con, mes);
      
      if(result>0) {
         commit(con);
      }else {
         rollback(con);
      }
      
      return result;
   }
   
   //보낸 쪽지 전체 리스트 조회용 메소드 - 수민
   public ArrayList<Message> selectListMes(PageInfo pi, int wtype) {
      Connection con = getConnection();
      ArrayList<Message> mesList = new MessageDao().selectListMes(con, wtype, pi);
      //System.out.println("mesList : " + mesList);
      close(con);
      return mesList;
   }
   //listCount 확인용 메소드
   public HashMap<String, Object> selectListCount() {
      Connection con = getConnection();
      HashMap<String, Object> hmap = new MessageDao().selectListCount(con);
      
      close(con);
      return hmap;
   }
   //업체전체 이름을 위한 메소드
   public ArrayList<Member> selectCompany() {
      Connection con = getConnection();
      ArrayList<Member> cnames = new MessageDao().selectCompany(con);
      close(con);
      return cnames;
   }

}