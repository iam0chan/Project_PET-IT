package com.pet.member.service;

import static com.pet.common.JDBCTemplate.close;
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
}
