package com.pet.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pet.member.dao.MemberDao;
import com.pet.member.service.MemberService;

/**
 * Servlet implementation class FindPwNewPwSaveServlet
 */
@WebServlet("/newPwCheck.do")
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
		response.setContentType("application/json;charset=UTF-8");
		MemberDao dao = new MemberDao();
	    String newPw = request.getParameter("newPw");
    	String newPw2 = request.getParameter("newPw2");
    	String result=null;
    	
    	try {
	        // 이름과 이메일이 데이터베이스에 일치하는지 확인
	    	String newPwCheck= dao.newPwCheck(newPw, newPw2);
	        if (newPwCheck!=null) {
	            // 세션에 저장
	            HttpSession httpSession = request.getSession();
	            httpSession.setAttribute("newPwCheck", newPwCheck);
	           
	            
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        
	        
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
