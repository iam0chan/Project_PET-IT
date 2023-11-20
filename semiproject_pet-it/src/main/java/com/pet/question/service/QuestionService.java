package com.pet.question.service;

import static com.pet.common.JDBCTemplate.close;
import static com.pet.common.JDBCTemplate.getConnection;
import static com.pet.common.JDBCTemplate.commit;
import static com.pet.common.JDBCTemplate.rollback;
import java.sql.Connection;
import java.util.List;

import com.pet.question.model.dao.QuestionDao;
import com.pet.question.model.dto.Question;


public class QuestionService {

	private QuestionDao dao = new QuestionDao();
	
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
	
	
	
	
	
	
	
	
	

}
