package com.pet.question.controller;

import java.io.IOException;
import java.util.List;

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
		request.setCharacterEncoding("utf-8");
		
//		int  replyNo =Integer.parseInt(request.getParameter("replyNo"));
		String questionNo = request.getParameter("questionRef");
//		String replyDate = request.getParameter("replyDate");
		String replyContent = request.getParameter("content");
		
		QuestionComment qc = QuestionComment.builder()
							.questionNo(questionNo)
							.replyContent(replyContent)
							.build();
		System.out.println(qc);
		
		int result = new QuestionService().insertQuestionComment(qc);
	
		System.out.println(result);
		
		
		response.sendRedirect(request.getContextPath()+"/questionView.do?no="+questionNo); 
		
	}
		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
