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

import com.pet.member.dao.MemberDao;

/**
 * Servlet implementation class MemberIdMailServlet
 */
@WebServlet("/findId/mailCheck.do")
public class MemberIdMailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberIdMailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDao dao = new MemberDao();
    	
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
	    
	    String emailCode = null;
	    String title = "pet-it 인증코드"; //제목
	    String memberEmail = request.getParameter("memberEmail"); //입력받은이메일주소
	    
	    try {
	    // 인증코드 생성
	    emailCode = dao.makeAuthenticationCode();
	    
	    // 세션에 저장
	    HttpSession httpSession = request.getSession();
	    httpSession.setAttribute("emailCode", emailCode);

	    // 이메일 전송
	    Message message = new MimeMessage(session);
	    message.setFrom(new InternetAddress("petittttttt1@gmail.com", "pet-it", "utf-8"));
	    message.addRecipient(Message.RecipientType.TO, new InternetAddress(memberEmail));
	    message.setSubject(title);
	    message.setContent(emailCode, "text/html; charset=utf-8");
	    
	    Transport.send(message);
			    
	    }catch(Exception e) {
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
