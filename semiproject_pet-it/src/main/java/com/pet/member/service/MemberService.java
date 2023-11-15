package com.pet.member.service;

import static com.pet.common.JDBCTemplate.close;
import static com.pet.common.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.pet.member.dao.MemberDao;
import com.pet.member.dto.Member;

public class MemberService {

private MemberDao dao = new MemberDao();
	
	public Member selectMemberByIdAndPw(String userId, String password) {
		Connection conn = getConnection();
		Member m = dao.selectMemberByIdAndPw(conn, userId, password);
		close(conn);
		return m;

	}
}
