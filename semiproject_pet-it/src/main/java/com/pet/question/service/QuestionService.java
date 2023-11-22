package com.pet.question.service;

import static com.pet.common.JDBCTemplate.close;
import static com.pet.common.JDBCTemplate.commit;
import static com.pet.common.JDBCTemplate.getConnection;
import static com.pet.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.pet.question.model.dao.QuestionDao;
import com.pet.question.model.dto.Question;


public class QuestionService {

	private QuestionDao dao = new QuestionDao();
	
	//전체게시글 
	public List<Question> selectQuestion(int cPage, int numPerpage){
		Connection conn = getConnection();
		List<Question> result = dao.selectQuestion(conn, cPage, numPerpage);
		close(conn);
		return result;
	}
	
	public int selectQuestionCount() {
		Connection conn = getConnection();
		int result=dao.selectQuestionCount(conn);
		close(conn);
		return result;
		
	}
	
	public Question selectQuestionByNo(String questionNo) {
		Connection conn = getConnection();
		Question q = dao.selectQuestionByNo(conn, questionNo);
		close(conn);
		return q;
	}
	
	public int insertQuestion(Question q) {
		Connection conn = getConnection();
		int result = dao.insertQuestion(conn, q);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public int selectQuestionCountByCategory(String category) {
		Connection conn = getConnection();
		int result = dao.selectQuestionCountByCategory(conn,category);
		if (result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	
	public List<Question> selectQuestionCategory(int cPage, int numPerpage, String category){
		Connection conn = getConnection();
		List<Question> result = dao.selectQuestionCategory(conn, cPage, numPerpage, category);
		close(conn);
		return result;
		
	}
	
	//로그인 했을 때 본인 게시글 보이게 하는 service
	public List<Question> selectQuestion(int cPage, int numPerpage, String memberId) {
		Connection conn = getConnection();
		List<Question> result = dao.selectQuestion(conn, cPage, numPerpage, memberId);
		close(conn);
		return result;
	}
	
	//검색창
	public List<Question> searchQuestion(int cPage, int numPerpage, String key, String keyword){
		Connection conn = getConnection();
		List<Question> resultList = null;
		if(key.equals("question_title")) {
			resultList = dao.questionSearchTitle(conn, cPage, numPerpage, keyword);
		}else {
			resultList = dao.questionSearchContent(conn, cPage, numPerpage, keyword);
		}
		close(conn);
		return resultList;
	}
	
	
	
	

}
