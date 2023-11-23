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
 * Servlet implementation class noticeListServlet
 */
@WebServlet("/noticeList.do")
public class NoticeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//noticeList 메인 서블릿 
		//DB에 저장된 전체 notice데이터 가져오기 -> 전체 데이터 가져오려면 페이징 처리를 해야함 
		  int cPage,numPerpage=10; 
		  try {
		  cPage=Integer.parseInt(request.getParameter("cPage"));
		  }catch (NumberFormatException e) {
			  cPage=1; 			  
		  }
		 List <Notice> notices = new NoticeService().selectNotice(cPage,numPerpage);
		 for (Notice notice : notices) {
			 System.out.println(notice);
		}
		 int totalData=new NoticeService().selectNoticeCount();
		 int totalPage=(int)Math.ceil((double)totalData/numPerpage);
		 int pageBarSize=5;
			int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
			int pageEnd=pageNo+pageBarSize-1;
			
			String pageBar="<ul class='pagination justify-content-center'>";
			
			if(pageNo==1) {
				pageBar+="<li class='page-item disabled'><a class='page-link' href='#'>이전</a></li>";
			}else {
				pageBar+="<li class='page-item'><a class='page-link' href='"+request.getRequestURI()
							+"?cPage="+(pageNo-1)+"'>이전</a></li>";
			}
			while(!(pageNo>pageEnd||pageNo>totalPage)) {
				if(pageNo==cPage) {
					pageBar+="<li class='page-item active'><a class='page-link' href='#'>"+pageNo+"</a></li>";
				}else {
					pageBar+="<li class='page-item'><a class='page-link' href='"+request.getRequestURI()
							+"?cPage="+pageNo+"'>"+pageNo+"</a></li> ";
				}
				pageNo++;
			}
			
			if(pageNo>totalPage) {
				pageBar+="<li class='page-item disabled'><a class='page-link' href='#'>다음</a></li>";
			}else {
				pageBar+="<li class='page-item'><a class='page-link' href='"+request.getRequestURI()
						+"?cPage="+pageNo+"'>다음</a></li>";
			}
			pageBar+="</ul>";
			
			request.setAttribute("notices",notices);
			request.setAttribute("pageBar", pageBar);
			
			request.getRequestDispatcher("/views/notice/noticeList.jsp")
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
