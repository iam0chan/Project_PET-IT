package com.pet.mypage.model.dao;

import static com.pet.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import com.pet.product.model.dto.ProductImageFile;

import com.pet.member.dto.Member;

public class MyPageDao {

	private Properties sql = new Properties();
	{
		String path = MyPageDao.class.getResource("/sql/mypage/mypage_sql.properties").getPath();

		try (FileReader fr = new FileReader(path);) {
			sql.load(fr);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public Member selectMemberByIdAndPw(Connection conn, String memberid, String memberpw) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member m = null;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectMemberByIdAndPw"));
			pstmt.setString(1, memberid);
			pstmt.setString(2, memberpw);
			rs = pstmt.executeQuery();
			if (rs.next())
				m = getMember(rs);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return m;
	}

	public int insertMember(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("insertMember"));
			pstmt.setString(1, m.getMemberId());
			pstmt.setString(2, m.getMemberPw());
			pstmt.setString(3, m.getMemberName());
			pstmt.setString(4, m.getMemberEmail());
			pstmt.setString(5, m.getMemberPhone());
			pstmt.setString(6, m.getMemberZipCode());
			pstmt.setString(7, m.getMemberAddr());
			pstmt.setString(8, m.getMemberDetailAddr());
			pstmt.setDate(9, m.getMemberDate());
			pstmt.setString(10, m.getMemberStatus());
			pstmt.setString(11, m.getMemberTersm());
			pstmt.setString(12, m.getMemberAccept());
			pstmt.setString(13, m.getMemberGrade());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public Member selectMemberById(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member m = null;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectMemberById"));
			pstmt.setString(1, memberId);
			rs = pstmt.executeQuery();
			if (rs.next())
				m = getMember(rs);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return m;
	}

	public int updatePassword(Connection conn, String memberId, String newMemberPw) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("updatePassword"));
			pstmt.setString(1, newMemberPw);
			pstmt.setString(2, memberId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public Member getMember(ResultSet rs) throws SQLException {
		return Member.builder()
				.memberId(rs.getString("member_id"))
				.memberPw(rs.getString("member_pw"))
				.memberName(rs.getString("member_name"))
				.memberEmail(rs.getString("member_email"))
				.memberPhone(rs.getString("member_phone"))
				.memberZipCode(rs.getString("member_zip_code"))
				.memberAddr(rs.getString("member_addr"))
				.memberDetailAddr(rs.getString("member_detail_addr"))
				.memberDate(rs.getDate("memberDate"))
				.memberStatus(rs.getString("memberStatus"))
				.memberTersm(rs.getString("memberTersm"))
				.memberAccept(rs.getString("memberAccept"))
				.memberGrade(rs.getString("memberGrade"))
				.build();
	}
}
