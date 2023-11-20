package com.pet.question.model.dao;

import static com.pet.common.JDBCTemplate.close;

import java.io.Closeable;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.pet.question.model.dto.Question;

public class QuestionDao {

	private Properties sql = new Properties();
	
	{
        String path = QuestionDao.class.getResource("/sql/question/question_sql.properties").getPath();
        System.out.println(path);
        try (FileReader fr = new FileReader(path)) {
            sql.load(fr);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
	
	public List<Question> selectQuestion(Connection conn, int cPage, int numPerpage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Question> result=new ArrayList<>();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectQuestion"));
			pstmt.setInt(1, (cPage-1)*numPerpage+1);
			pstmt.setInt(2, cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				result.add(getQuestion(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
	}		
	
	public int selectQuestionCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectQuestionCount"));
			rs=pstmt.executeQuery();
			if(rs.next()) result=rs.getInt(1);
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
	}
	
	public Question selectQuestionByNo(Connection conn, String questionNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Question q = null;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectQuestionByNo"));
			pstmt.setString(1, questionNo);
			rs=pstmt.executeQuery();
			if(rs.next()) q=getQuestion(rs);
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return q;
	}
	
	public int insertQuestion(Connection conn, Question q) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("insertQuestion"));
			pstmt.setString(1, q.getQuestionTitle());
			pstmt.setString(2, q.getQuestionCategory());
			pstmt.setString(3, q.getQuestionContent());
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	private Question getQuestion (ResultSet rs) throws SQLException{
		return Question.builder()
				.questionNo(rs.getString("QUESTION_NO"))
				.memberId(rs.getString("MEMBER_ID"))
				.questionDate(rs.getDate("NOTICE_DATE"))
				.questionTitle(rs.getString("NOTICE_TITLE"))
				.questionCategory(rs.getString("NOTICE_CATEGORY"))
				.questionContent(rs.getString("NOTICE_CONTENT"))
				.build();
		
		
	}
	
	
	
	

}
