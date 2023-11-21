package com.pet.notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pet.notice.model.dto.Notice;
import com.pet.notice.service.NoticeService;

/**
 * Servlet implementation class NoticeAdminPageServlet
 */
@WebServlet("/noticeadminpage.do")
public class NoticeAdminPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeAdminPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		
		String content = request.getParameter("content");
		String title = request.getParameter("title");
		String board_category = request.getParameter("selectCategory");
		
		Notice n = Notice.builder()
				.noticeTitle(title)
				.noticeCategory(board_category)
				.noticeContent(content)
				.build();
		int insertNotice = new NoticeService().insertNotice(n);
		System.out.println(insertNotice);
		if(insertNotice==0) {
			System.out.println("작성실패~!");
		}else {
			System.out.println("작성성공!!!!!");
			
			response.sendRedirect(request.getContextPath()+"/noticeList.do");
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
