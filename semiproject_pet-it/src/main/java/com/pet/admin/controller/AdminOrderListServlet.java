package com.pet.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pet.admin.service.AdminService;
import com.pet.payment.model.dto.Order;


/**
 * Servlet implementation class AdminDataServlet
 */
@WebServlet("/adminOrder.do")
public class AdminOrderListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminOrderListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
int cPage,numPerpage=10;
		
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		List<Order> result = new AdminService().selectOrderList(cPage,numPerpage);
		int totalData = new AdminService().selectOrderCount();
		int totalPage = (int)Math.ceil((double)totalData/numPerpage);
		int pageBarSize=3;
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
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("orders", result);		
		
		request.getRequestDispatcher("/views/admin/adminOrderList.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
