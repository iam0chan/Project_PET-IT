package com.pet.member.dao;

import static com.pet.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.pet.member.dao.MemberDao;
import com.pet.member.dto.Member;

public class MemberDao {
	
	private Properties sql = new Properties();
	{	
		String path = MemberDao.class.getResource("/sql/member/member_sql.properties").getPath();
		try(FileReader fr = new FileReader(path);) {
			sql.load(fr);
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public Member selectMemberByIdAndPw(Connection conn, String memberId, String memberPw) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member m = null;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectMemberByIdAndPw"));
			pstmt.setString(1, memberId);
			pstmt.setString(2, memberPw);
			rs=pstmt.executeQuery();
			if(rs.next()) m=getMember(rs);
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return m;
	}
	
	private Member getMember(ResultSet rs) throws SQLException{
		return Member.builder()
				.memberId(rs.getString("member_id"))
				.memberPw(rs.getString("member_pw"))
				.memberName(rs.getString("member_name"))
				.memberEmail(rs.getString("member_email"))
				.memberPhone(rs.getString("member_phone"))
				.memberZipCode(rs.getString("member_zip_code"))
				.memberAddr(rs.getString("member_Addr"))
				.memberDetailAddr(rs.getString("member_detail_addr"))
				.memberDate(rs.getDate("member_date"))
				.memberStatus(rs.getString("member_status"))
				.memberErmsid(rs.getString("member_terms"))
				.memberAccept(rs.getString("member_accept"))
				.build();
	}
}
