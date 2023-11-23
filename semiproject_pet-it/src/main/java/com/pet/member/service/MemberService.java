package com.pet.member.service;

import static com.pet.common.JDBCTemplate.close;
import static com.pet.common.JDBCTemplate.commit;
import static com.pet.common.JDBCTemplate.getConnection;
import static com.pet.common.JDBCTemplate.rollback;

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
   public String selectMemberByPw(String memberPw) {
	   
	   return memberPw;
   }


   public int insertMember(Member m) {
      Connection conn = getConnection();
      int result=dao.insertMember(conn, m);
      if(result>0) commit(conn);
      else rollback(conn);
      close(conn);
      
      return result;
   }
   
   public int updatePw(String newPw, String memberId) {
	   Connection conn = getConnection();
	      int result=dao.updatePw(conn, newPw, memberId);
	      if(result>0) commit(conn);
	      else rollback(conn);
	      close(conn);
	  
	      return result;
   }
   
   public int memberIdCheck(String memberId) {
	   Connection conn = getConnection();
	   int result = dao.memberIdCheck(conn, memberId);
	   if(result>0) commit(conn);
	   else rollback(conn);
	   close(conn);
	   
	   return result;
   }
   
   public int memberPwCheck(String memberPw) {
	   Connection conn = getConnection();
	   int result = dao.memberIdCheck(conn, memberPw);
	   if(result>0) commit(conn);
	   else rollback(conn);
	   close(conn);
	   
	   return result;
   }
   
   public int memberEmailCheck(String memberEmail) {
	   Connection conn = getConnection();
	   int result = dao.memberEmailCheck(conn, memberEmail);
	   if(result>0) commit(conn);
	   else rollback(conn);
	   close(conn);
	   
	   return result;
   }
   
   
   public String findIdEmail(String memberName, String memberEmail) {
	   Connection conn = getConnection();
	   String memberId = dao.findIdEmail(conn, memberName, memberEmail);
	   if(memberId!=null) commit(conn);
	   else rollback(conn);
	   close(conn);
	   
	   return memberId;
   }
   
   public String findPwCheck(String memberId, String memberEmail) {
	   Connection conn = getConnection();
	   String result = dao.findPwCheck(conn, memberId, memberEmail);
	   if(result!=null) commit(conn);
	   else rollback(conn);
	   close(conn);
	   
	   return result;
   }
   
//   public String newPwCheck(String newPw, String newPw2) {
//	   Connection conn = getConnection();
//	   String result = dao.newPwCheck(conn, newPw, newPw2);
//	   if(result!=null) commit(conn);
//	   else rollback(conn);
//	   close(conn);
//	   
//	   return result;
//   }
   
}