package com.pet.member.ajax;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.pet.member.dao.MemberDao;
import com.pet.member.service.MemberService;

/**
 * Servlet implementation class MemberIdCheck
 */
@WebServlet("/idFind/idCheck.do")
public class MemberIdCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberIdCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json;charset=UTF-8");
		
		String memberId=null;
	    String memberName = request.getParameter("memberName");
    	String memberEmail = request.getParameter("memberEmail");
    	int result=0;
    	
	    try {
	        // 이름과 이메일이 데이터베이스에 일치하는지 확인
	    	memberId=new MemberService().findIdEmail(memberName, memberEmail);
	        if (memberId!=null) {
	            // 세션에 저장
	            HttpSession httpSession = request.getSession();
	            httpSession.setAttribute("memberId", memberId);
	            
	            result=1;
	            
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
