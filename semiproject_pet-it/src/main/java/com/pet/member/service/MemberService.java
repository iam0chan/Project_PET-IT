package com.pet.member.service;

import static com.pet.common.JDBCTemplate.*;
import static com.pet.common.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.pet.member.dao.MemberDao;
import com.pet.member.dto.Member;

public class MemberService {


private MemberDao dao = new MemberDao();
   
   public Member selectMemberByIdAndPw(String memberId, String memberPw) {
      Connection conn = getConnection();
      Member m = dao.selectMemberByIdAndPw(conn, memberId, memberPw);
      close(conn);
      return m;
   }

   public int insertMember(Member m) {
      Connection conn = getConnection();
      int result=dao.insertMember(conn, m);
      if(result>0) commit(conn);
      else rollback(conn);
      close(conn);
      
      return result;
   }
}