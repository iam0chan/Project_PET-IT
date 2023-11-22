package com.pet.question.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pet.question.model.dto.QuestionComment;
import com.pet.question.service.QuestionService;

/**
 * Servlet implementation class QuestionCommentInsertServlet
 */
@WebServlet("/insertComment.do")
public class QuestionCommentInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionCommentInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		int  replyNo =Integer.parseInt(request.getParameter("replyNo"));
		String questionNo = request.getParameter("questionRef");
//		String replyDate = request.getParameter("replyDate");
		String replyContent = request.getParameter("replyContent");
		
		QuestionComment qc = QuestionComment.builder()
				.replyNo(1)
				.questionNo(questionNo)
				.replyContent(replyContent)
				.build();
		
		int result = new QuestionService().insertQuestionComment(qc);
		
		response.sendRedirect(request.getContextPath()+"/questionView.do?no="+1);
		
	}
		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
