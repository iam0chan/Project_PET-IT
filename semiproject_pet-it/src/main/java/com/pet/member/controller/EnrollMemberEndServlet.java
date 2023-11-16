package com.pet.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pet.member.dto.Member;
import com.pet.member.service.MemberService;

/**
 * Servlet implementation class EnrollMemberEndServlet
 */
@WebServlet("/member/enrollMemberEnd.do")
public class EnrollMemberEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EnrollMemberEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//로딩처리속도 조절
		//Thread t = new Thread(()->{
		//	try {
		//		Thread.sleep(3000);
		//	}catch(InterruptedException e) {
		//		e.printStackTrace();
		//}
		//	});
		//t.run();
		
		request.setCharacterEncoding("UTF-8");
		
		String memberId=request.getParameter("memberId");
		String memberPw=request.getParameter("memberPw");
		String memberName=request.getParameter("memberName");
		String memberEmail=request.getParameter("memberEmail");
		String memberPhone=request.getParameter("memberPhone");
		String memberZipCode=request.getParameter("memberZipCode");
		String memberAddr=request.getParameter("memberAddr");
		String memberDetailAddr=request.getParameter("memberDetailAddr");
		String memberTersm=request.getParameter("memberTersm");
		String memberAccept=request.getParameter("memberAccept");

		Member m = Member.builder()
						 .memberId(memberId)
						 .memberPw(memberPw)
						 .memberName(memberName)
						 .memberEmail(memberEmail)
						 .memberPhone(memberPhone)
						 .memberZipCode(memberZipCode)
						 .memberAddr(memberAddr)
						 .memberDetailAddr(memberDetailAddr)
						 .memberTersm(memberTersm)
						 .memberAccept(memberAccept)
						 .build();
		
		int result = new MemberService().insertMember(m);
		String msg, loc;
		if(result>0) {
			msg=m.getMemberName()+"님 회원가입이 완료되었습니다";
			loc="/";
		}else {
			msg="회원가입에 실패했습니다";
			loc="/enrollView.do";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
	
		request.getRequestDispatcher("/member/loginErr.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
