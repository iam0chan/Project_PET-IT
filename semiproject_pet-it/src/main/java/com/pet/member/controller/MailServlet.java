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

import com.pet.member.dao.MemberDao;


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
			String authenCode = null;
			
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
			String receiver = request.getParameter("memberEmail"); // 메일 받을 주소
			String title = "pet-it 인증코드";
//			String content = "인증코드 : "+authenCode;
			Message message = new MimeMessage(session);
			try {				
				authenCode = "인증번호는 : "+dao.makeAuthenticationCode();
				message.setFrom(new InternetAddress("petittttttt1@gmail.com", "pet-it", "utf-8"));
				message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiver));
				message.setSubject(title);
				message.setContent(authenCode, "text/html; charset=utf-8");
				
				Transport.send(message);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			response.sendRedirect(request.getContextPath()+"/views/member/findId.jsp");
			
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
