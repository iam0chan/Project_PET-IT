package com.pet.member.controller;

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

import com.google.gson.Gson;
import com.pet.member.dao.MemberDao;
import com.pet.member.service.MemberService;


/**
 * Servlet implementation class MailServlet
 */
@WebServlet("/mail.do")
public class MailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    MemberDao dao = new MemberDao();
	    String emailCode = null;

	    Properties props = new Properties();
	    props.put("mail.smtp.host", "smtp.gmail.com");
	    props.put("mail.smtp.port", "587");
	    props.put("mail.smtp.auth", "true");
	    props.put("mail.smtp.starttls.enable", "true");
	    props.put("mail.smtp.ssl.trust", "smtp.gmail.com");

	    Session session = Session.getInstance(props, new Authenticator() {
	        @Override
	        protected PasswordAuthentication getPasswordAuthentication() {
	            return new PasswordAuthentication("petittttttt1@gmail.com", "yrdq fhre xkwc zulq");
	        }
	    });
	    
	    String memberName = request.getParameter("memberName");
	    String memberEmail = request.getParameter("memberEmail"); // 메일 받을 주소
	    
	   	String memberId=null;
	    
	    try {
	        // 이름과 이메일이 데이터베이스에 일치하는지 확인후 memberId가져오기
	    	memberId=new MemberService().findIdEmail(memberName, memberEmail);
	        if (memberId!=null) {
	            // 일치하면 인증 코드 생성
	            emailCode = dao.makeAuthenticationCode();
	            
	            // 세션에 저장
	            HttpSession httpSession = request.getSession();
	            httpSession.setAttribute("emailCode", emailCode);
	            httpSession.setAttribute("memberName", memberName);
	            httpSession.setAttribute("memberEmail", memberEmail);
	            request.setAttribute("emailCode", emailCode);
	            request.setAttribute("memberId", memberId);
	            
	            // 이메일 전송
	            String title = "pet-it 인증코드";
	            Message message = new MimeMessage(session);
	            message.setFrom(new InternetAddress("petittttttt1@gmail.com", "pet-it", "utf-8"));
	            message.addRecipient(Message.RecipientType.TO, new InternetAddress(memberEmail));
	            message.setSubject(title);
	            message.setContent(emailCode, "text/html; charset=utf-8");

	            Transport.send(message);
	            
//	            Gson gson = new Gson();
//	            
//	            response.setContentType("application/json;charset=utf-8");
	            
	            
	            
	            // 이메일 전송 후 페이지 이동
	            request.getRequestDispatcher("/views/member/findIdEmail.jsp").forward(request, response);
	            
	        	} else {
	            // 이름과 이메일이 일치하지 않을 경우 처리
//	            response.sendRedirect(request.getContextPath() + "/views/member/findIdFail.jsp");
	            response.getWriter().write("fail");
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        // 예외 처리에 따른 로직 추가
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
