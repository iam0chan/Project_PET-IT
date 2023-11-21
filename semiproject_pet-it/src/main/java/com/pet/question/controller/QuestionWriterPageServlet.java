package com.pet.question.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pet.notice.model.dto.Notice;
import com.pet.notice.service.NoticeService;
import com.pet.question.model.dto.Question;
import com.pet.question.service.QuestionService;

/**
 * Servlet implementation class QuestionWritePageServlet
 */
@WebServlet("/questionwriterpage.do")
public class QuestionWriterPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionWriterPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		
		String content = request.getParameter("content");
		String title = request.getParameter("title");
		String board_category = request.getParameter("selectCategory");
		String loginMember = request.getParameter("loginMember");
		System.out.println(loginMember);
		System.out.println("내가찾는"+title);
		Question q = Question.builder()
				.questionTitle(title)
				.memberId(loginMember)
				.questionCategory(board_category)
				.questionContent(content)
				.build();
		int insertQuestion = new QuestionService().insertQuestion(q);
		System.out.println(insertQuestion);
		if(insertQuestion==0) {
			System.out.println("작성실패~~~!");
		}else {
			System.out.println("작성성공~~~");
			
			response.sendRedirect(request.getContextPath()+"/questionList.do");
		}
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
