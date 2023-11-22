package com.pet.faq.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pet.faq.model.dto.Faq;
import com.pet.faq.service.FaqService;

/**
 * Servlet implementation class FaqHitsServlet
 */
@WebServlet("/faqhits.do")
public class FaqHitsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FaqHitsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		String no=request.getParameter("no");
		
		Cookie[] cookies=request.getCookies();
		String readFaq="";
		boolean readResult= false; 
		for(Cookie c : cookies) {
			String name = c.getName();
			if(name.equals("readFaq")) {
				readFaq=c.getValue();
				if(readFaq.contains("|"+no+"|")) { 
					readResult=true;
				}
				break;
			}
		}
		
		
		if(!readResult) {
		Cookie c = new Cookie("readFaq","readFaq"+"|"+no+"|");
		c.setMaxAge(60*60*24);
		response.addCookie(c);
		}
	
		Faq f=new FaqService().selectFaqByNo(no,readResult); 
		
		request.setAttribute("faqs",f);
		
		request.getRequestDispatcher("/views/faq/faqView.jsp")
		.forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
