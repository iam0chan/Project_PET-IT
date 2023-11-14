package com.pet.faq.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pet.faq.model.dto.Faq;
import com.pet.faq.service.FaqService;


/**
 * Servlet implementation class faqListServlet
 */
@WebServlet("/faqList.do")
public class FaqListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FaqListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cPage,numPerpage=5; //cPage: 현재 페이지 번호 numPerpage=5; : 페이지당 표시되는 항목의 수 ,페이지당 5개의 항목
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		List<Faq> faqs=new FaqService().selectFaq(cPage, numPerpage);
		
		int totalData=new FaqService().selectFaqCount();  // 전체 게시물 수를 가져옴
		int totalPage=(int)Math.ceil((double)totalData/numPerpage); //전체 페이지 수 계산
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1; // 현재 페이지바의 시작 페이지 번호 계산
		int pageEnd=pageNo+pageBarSize-1; // 현재 페이지바의 끝 페이지 번호 계산
		
		// 페이지바를 생성할 StringBuffer
		StringBuffer pageBar=new StringBuffer(); //stringBuffer : 문자열을 처리하는 데 사용되는 클래스 중 하나임 , 
												//문자열을 효율적으로 조작할 수 있으며, 문자열의 내용을 변경하거나 추가할 수 있다
		
		if(pageNo==1) {
			pageBar.append("<span>[이전]</span>"); //append : 문자열 추가
												// 현재 페이지바가 1페이지일 때 "이전" 링크 없이 표시
		}else {
			pageBar.append("<a href='"+request.getRequestURI()+"?cPage="+(pageNo-1)+"'>");
			pageBar.append("[이전]</a>"); // 이전 페이지로 이동할 링크를 생성
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(cPage==pageNo) {
				pageBar.append("<span>"+pageNo+"</span>"); // 현재 페이지에 해당하는 번호를 강조하여 표시
			}else {
				pageBar.append("<a href='"+request.getRequestURI()+"?cPage="+pageNo+"'>");
				pageBar.append(pageNo);
				pageBar.append("</a>"); // 다른 페이지로 이동할 링크를 생성
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar.append("<span>[다음]</span>"); // 마지막 페이지바일 때 "다음" 링크 없이 표시
		}else {
			pageBar.append("<a href='"+request.getRequestURI()+"?cPage="+pageNo+"'>");
			pageBar.append("[다음]");
			pageBar.append("</a>"); // 다음 페이지로 이동할 링크를 생성
		}
		
		request.setAttribute("faqs", faqs); // 게시물 목록을 request에 저장
		request.setAttribute("pageBar", pageBar); // pageBar라는 이름의 속성을 request 객체에 설정하고, 그 값을 pageBar로 지정
		request.getRequestDispatcher("/faq/faqList.jsp").forward(request, response); // JSP 페이지로 포워딩
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
