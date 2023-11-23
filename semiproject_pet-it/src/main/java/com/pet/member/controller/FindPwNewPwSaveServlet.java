package com.pet.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pet.member.service.MemberService;

/**
 * Servlet implementation class FindPwNewPwSaveServlet
 */

@WebServlet(name="FindPwNewSaveServlet",
			urlPatterns="/newPwCheck.do")
public class FindPwNewPwSaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindPwNewPwSaveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/plain; charset=UTF-8");
		
		MemberService ms = new MemberService();
	    String newPw = request.getParameter("newPw");
    	String memberId = request.getParameter("memberId");
    	String result=null;
    	int result2=0;
		
		 if (newPw == null) {
	            result = "-1";
	        } else if (memberId == null) {
	            result = "-2";
	        }else{
	        	result2 = ms.updatePw(newPw,memberId);
	            if(result2>0) {
	            	result = "1";
	            }
	        }
			
	     
		 response.getWriter().write(result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
