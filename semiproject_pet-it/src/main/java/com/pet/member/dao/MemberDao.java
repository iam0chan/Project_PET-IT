package com.pet.member.dao;

import static com.pet.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import java.util.Random;

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
	
	public int insertMember(Connection conn, Member m) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("insertMember"));
			pstmt.setString(1, m.getMemberId());
			pstmt.setString(2, m.getMemberPw());
			pstmt.setString(3, m.getMemberName());
			pstmt.setString(4, m.getMemberEmail());
			pstmt.setString(5, m.getMemberPhone());
			pstmt.setString(6, m.getMemberZipCode());
			pstmt.setString(7, m.getMemberAddr());
			pstmt.setString(8, m.getMemberDetailAddr());
			pstmt.setString(9, m.getMemberTersm());
			pstmt.setString(10, m.getMemberAccept());
			
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	//랜덤인증코드 생성 메소드
	public String makeAuthenticationCode() throws Exception {
		int pwdLength = 8;
		final char[] pwdTable = { 
                'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 
                'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X',
                'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j',
                'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 
                'w', 'x', 'y', 'z', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0' };
		
		// System.currentTimeMillis(): 중복 방지 처리
		Random ran = new Random(System.currentTimeMillis());
		
		StringBuffer bf = new StringBuffer();
		
		for(int i=0; i<pwdLength; i++) {
			bf.append(pwdTable[ran.nextInt(pwdTable.length)]);
		}
		return bf.toString();
    }

	
	//아이디찾기
	public String findIdEmail(Connection conn, String memberName, String memberEmail) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String memberId = null;
		
		try {
			pstmt=conn.prepareStatement(sql.getProperty("findIdEmail"));
			pstmt.setString(1, memberName);
			pstmt.setString(2, memberEmail);
			rs = pstmt.executeQuery();
			if (rs.next()) {
			   memberId = rs.getString("MEMBER_ID");
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
            close(rs);
            close(pstmt);
        }return memberId;
	}
	
	//비밀번호재설정
	public String findPwCheck(Connection conn, String memberId, String memberEmail) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String result = "";
		
		try {
			pstmt=conn.prepareStatement(sql.getProperty("findPwCheck"));
			pstmt.setString(1, memberId);
			pstmt.setString(2, memberEmail);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getString("MEMBER_STATUS");
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
            close(rs);
            close(pstmt);
        }return result;
	}
	
	
	//회원가입 아이디중복체크
	public int memberIdCheck(Connection conn, String memberId) {
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		int result = 0;
		try {
	        pstmt = conn.prepareStatement(sql.getProperty("memberIdCheck"));
	        pstmt.setString(1, memberId);
	        rs = pstmt.executeQuery();

	        if (rs.next()) {
	            // 중복된 아이디가 존재하는 경우
	            result = 0;
	        } else if (memberId.equals("")) {
	            // memberId가 빈 문자열인 경우
	            result = -1;
	        } else if (memberId.length()<6||memberId.length()>10) {
	        	// memberId의 length제한에 걸린 경우 (6~10)
	        	result = -2;
	        }
	        else {
	            // 중복된 아이디가 존재하지 않는 경우
	            result = 1;
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close(rs);
	        close(pstmt);
	    }
	    return result;
	}
	
	public int memberPwCheck(Connection conn, String memberPw) {
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		int result = 0;
		try {
	        pstmt = conn.prepareStatement(sql.getProperty("memberPwCheck"));
	        pstmt.setString(1, memberPw);
	        rs = pstmt.executeQuery();

	        if (rs.next()) {
	            // 중복된 아이디가 존재하는 경우
	            result = 0;
	        } else if (memberPw.equals("")) {
	            // memberId가 빈 문자열인 경우
	            result = -0;
	        } else if (memberPw.length()<8||memberPw.length()>12) {
	        	// memberId의 length제한에 걸린 경우 (6~10)
	        	result = -1;
	        }
	        else {
	            // 중복된 아이디가 존재하지 않는 경우
	            result = 1;
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close(rs);
	        close(pstmt);
	    }
	    return result;
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
				.memberTersm(rs.getString("member_terms"))
				.memberAccept(rs.getString("member_accept"))
				.build();
	}
}
