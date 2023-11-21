package com.pet.notice.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pet.notice.model.dto.Notice;
import com.pet.notice.service.NoticeService;

/**
 * Servlet implementation class NoticeInquiryServlet
 */
@WebServlet("/noticeinquiry.do")
public class NoticeInquiryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeInquiryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String category =  request.getParameter("notices");
		System.out.print(category);
		int cPage,numPerpage=10; 
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		List<Notice> notices;
		int totalData;
		if(category.equals("전체")) {
			notices=new NoticeService().selectNotice(cPage, numPerpage);
			totalData=new NoticeService().selectNoticeCount();  
		}else {
			notices=new NoticeService().selectNoticeCategory(cPage, numPerpage,category);
			totalData=new NoticeService().selectNoticeCountByCategory(category);  
		}
		
		int totalPage=(int)Math.ceil((double)totalData/numPerpage);
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1; 
		int pageEnd=pageNo+pageBarSize-1; 
		
		
		StringBuffer pageBar=new StringBuffer(); 
		
		if(pageNo==1) {
			pageBar.append("<span>[이전]</span>"); 
											
		}else {
			pageBar.append("<a href='"+request.getRequestURI()+"?cPage="+(pageNo-1)+"&notices="+(category)+"'>");
			pageBar.append("[이전]</a>"); 
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(cPage==pageNo) {
				pageBar.append("<span>"+pageNo+"</span>"); 
			}else {
				pageBar.append("<a href='"+request.getRequestURI()+"?cPage="+pageNo+"&notices="+(category)+"'>");
				pageBar.append(pageNo);
				pageBar.append("</a>"); 
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar.append("<span>[다음]</span>"); 
		}else {
			pageBar.append("<a href='"+request.getRequestURI()+"?cPage="+pageNo+"&notices"+(category)+"'>");
			pageBar.append("[다음]");
			pageBar.append("</a>"); 
		}
		
		request.setAttribute("notices", notices); 
		request.setAttribute("pageBar", pageBar); 
		request.getRequestDispatcher("/views/notice/noticeList.jsp").forward(request, response); 
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
