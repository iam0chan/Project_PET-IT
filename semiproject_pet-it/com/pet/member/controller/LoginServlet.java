package com.pet.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pet.member.dto.Member;
import com.pet.member.service.MemberService;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(name="login", urlPatterns="/login.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId=request.getParameter("memberId");
		String memberPw=request.getParameter("memberPw");
		 		
		Member m = new MemberService().selectMemberByIdAndPw(memberId, memberPw);
		
		if(m!=null) {
		HttpSession session = request.getSession();
		// 로그인 정보 저장
		session.setAttribute("loginMember", m);
		// 이전페이지 URI 저장
		 String originalURI = request.getParameter("oriURI");
         
         if (originalURI != null && !originalURI.isEmpty()) {
             response.sendRedirect(originalURI);
         } else {
             // 이전 페이지 URI가 없을 경우 기본적으로 설정할 페이지
             response.sendRedirect(request.getContextPath() + "/processLogin");
         }
		}else {
			request.setAttribute("msg", "아이디, 패스워드를 확인해주세요.");
			request.setAttribute("loc", "/views/member/login.jsp");
			request.getRequestDispatcher("/views/member/loginErr.jsp").forward(request, response);
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
