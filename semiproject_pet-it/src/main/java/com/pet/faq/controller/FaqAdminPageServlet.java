package com.pet.faq.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pet.faq.model.dto.Faq;
import com.pet.faq.service.FaqService;

/**
 * Servlet implementation class faqAdminPageServlet
 */
@WebServlet("/faqadminpage.do")
public class FaqAdminPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FaqAdminPageServlet() {
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
		String board_category = request.getParameter("board_category");
		
		
		Faq q = Faq.builder()
				.faqTitle(title)
				.faqCategory(board_category)
				.faqContent(content)
				.build();
		System.out.println(q);
		int insertFaq = new FaqService().insertFaq(q);
		System.out.println(insertFaq);
		if(insertFaq==0) {
			System.out.println("작성실패");
			
		}else {
			System.out.println("작성성공");
			response.sendRedirect(request.getContextPath()+"/faqList.do"); 
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

