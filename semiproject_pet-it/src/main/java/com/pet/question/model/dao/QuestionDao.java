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

import javax.sql.RowSetInternal;

import com.pet.notice.model.dto.Notice;
import com.pet.question.model.dto.Question;
import com.pet.question.model.dto.QuestionComment;

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
	
	//전체 게시글 
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
			pstmt=conn.prepareStatement(sql.getProperty("selectQuestionByNO"));
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
			pstmt.setString(1, q.getMemberId());
			pstmt.setString(2, q.getQuestionTitle());
			pstmt.setString(3, q.getQuestionCategory());
			pstmt.setString(4, q.getQuestionContent());
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	public int selectQuestionCountByCategory(Connection conn, String category) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int result = 0;
        try {
            pstmt = conn.prepareStatement(sql.getProperty("selectQuestionCountByCategory"));
            pstmt.setString(1, category);
            rs = pstmt.executeQuery();
            if (rs.next()) result = rs.getInt(1);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rs);
            close(pstmt);
        }
        return result;
    }
    
    public List<Question> selectQuestionCategory(Connection conn, int cPage, int numPerpage, String category){
    	PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<Question> result = new ArrayList<>();

        try {
            pstmt = conn.prepareCall(sql.getProperty("selectQuestionCategory"));
            pstmt.setString(1, category);
            pstmt.setInt(2, (cPage - 1) * numPerpage + 1);
            pstmt.setInt(3, cPage * numPerpage);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                result.add(getQuestion(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rs);
            close(pstmt);
        }
        return result;
    }
	
  //로그인 했을 때 본인 게시글 보이게 하는 dao
    public List<Question> selectQuestion(Connection conn, int cPage, int numPerpage, String memberId) {
    	PreparedStatement pstmt = null;
    	ResultSet rs = null;
    	List<Question> result=new ArrayList<>();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectQuestionByUserId"));
			pstmt.setString(1, memberId);
			pstmt.setInt(2, (cPage-1)*numPerpage+1);
			pstmt.setInt(3, cPage*numPerpage);
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
	
	//제목으로 검색 
    public List<Question> questionSearchTitle (Connection conn, int cPage, int numPerpage, String keyword){
    	PreparedStatement pstmt = null; 
    	ResultSet rs = null; 
    	List<Question> result = new ArrayList<>();
    	
    	 try {
	            pstmt = conn.prepareCall(sql.getProperty("questionSearchTitle"));
	            pstmt.setString(1, keyword);
	            pstmt.setInt(2, (cPage - 1) * numPerpage + 1);
	            pstmt.setInt(3, cPage * numPerpage);
	            rs = pstmt.executeQuery();
	            while (rs.next()) {
	                result.add(getQuestion(rs));
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            close(rs);
	            close(pstmt);
	        }
	        return result;
    }
	
	
	//내용으로 검색 
    public List <Question> questionSearchContent (Connection conn, int cPage, int numPerpage, String keyword){
    	PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<Question> result = new ArrayList<>();

        try {
            pstmt = conn.prepareCall(sql.getProperty("questionSearchContent"));
            pstmt.setString(1, keyword);
            pstmt.setInt(2, (cPage - 1) * numPerpage + 1);
            pstmt.setInt(3, cPage * numPerpage);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                result.add(getQuestion(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rs);
            close(pstmt);
        }
        return result;
    	
    }
	
	
	
	private Question getQuestion (ResultSet rs) throws SQLException{
		return Question.builder()
				.questionNo(rs.getString("QUESTION_NO"))
				.memberId(rs.getString("MEMBER_ID"))
				.questionDate(rs.getDate("QUESTION_DATE"))
				.questionTitle(rs.getString("QUESTION_TITLE"))
				.questionCategory(rs.getString("QUESTION_CATEGORY"))
				.questionContent(rs.getString("QUESTION_CONTENT"))
				.build();
		
		
	}

	public int insertQuestionComment(Connection conn, QuestionComment qc) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("insertQuestionComment"));
			pstmt.setInt(1, 1);
			pstmt.setString(2, qc.getReplyContent());
			result=pstmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
		
	}

	
	
	
	

}
