package com.pet.mypage.service;
import static com.pet.common.JDBCTemplate.close;
import static com.pet.common.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.pet.member.dto.Member;
import com.pet.mypage.model.dao.MyPageDao;

public class MyInfoService {
private MyPageDao dao=new MyPageDao();
	

  public Member selectMemberByIdAndPw(String memberId,String memberPw) {
  Connection conn=getConnection(); Member
  m=dao.selectMemberByIdAndPw(conn,memberId,memberPw); close(conn); return m; }
 
	/*
	 * public int insertMember(Member m) { Connection conn = getConnection(); int
	 * result=dao.insertMember(conn,m); if(result>0) commit(conn); else
	 * rollback(conn); close(conn); return result;
	 * 
	 * }
	 */

	public Member selectMemberById(String memberId) {
		Connection conn=getConnection();
		Member m =dao.selectMemberById(conn, memberId);
		close(conn);
		return m;
	}

}
