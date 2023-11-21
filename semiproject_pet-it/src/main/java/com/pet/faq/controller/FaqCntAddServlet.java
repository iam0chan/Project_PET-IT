package com.pet.faq.controller;

import java.io.IOException;
import java.io.PrintWriter;

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
@WebServlet("/faqcntadd.do")
public class FaqCntAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		String faqno = request.getParameter("faqno");
		System.out.println("/faqcntadd.do 실행:"+faqno);
		int result = new FaqService().updatefaqcnt(faqno);
		System.out.println("result:"+result);
		if(result==0) {
			System.out.println("작성실패");
	
		}else {
			System.out.println("작성성공");
		}
//		response.sendRedirect("/semiproject_pet-it/faqList.do");
		Faq faq = new FaqService().selectFaqByNo(faqno, false);
		PrintWriter out = response.getWriter();
		out.println(faq.getFaqHits());
   	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
