package com.pet.question.service;

import static com.pet.common.JDBCTemplate.*;

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
	
	
	
	
	
	
	
	
	
	
	
	
	

}
