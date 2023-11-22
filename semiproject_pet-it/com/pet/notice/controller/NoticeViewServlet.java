package com.pet.notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pet.notice.model.dto.Notice;
import com.pet.notice.service.NoticeService;

/**
 * Servlet implementation class NoticeViewServlet
 */
@WebServlet("/noticeView.do")
public class NoticeViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//클라이언트가 보낸 번호에 해당하는 notice를 가져와서 보내는 서블릿
		String no=request.getParameter("no");
		
		Cookie[] cookies=request.getCookies();
		String readNotice="";
		boolean readResult= false; //읽지 않은 것 
		for(Cookie c : cookies) {
			String name = c.getName();
			if(name.equals("readNotice")) {
				readNotice=c.getValue();
				if(readNotice.contains("|"+no+"|")) { //이전에 읽었다는 것 
					readResult=true;
				}
				break;
			}
		}
		
		
		if(!readResult) {
		Cookie c = new Cookie("readNotice","readNotice"+"|"+no+"|");
		c.setMaxAge(60*60*24);
		response.addCookie(c);
		}
		//여기까지가 읽었는지 안읽었는지 클라이언트측에 저장시키고 끝남 
		
		
		//여기서 업데이트 실행됨 , 위에 결과를 가지고 업데이트 결정
		Notice n=new NoticeService().selectNoticeByNo(no,readResult); //no만 보내는 게 아니라 readResult 같이 보냄
		
		request.setAttribute("notice",n);
		
		request.getRequestDispatcher("/views/notice/noticeView.jsp")
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
