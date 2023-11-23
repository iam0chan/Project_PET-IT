package com.pet.admin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pet.product.model.dto.Product;
import com.pet.product.model.dto.ProductImageFile;
import com.pet.product.service.ProductService;

/**
 * Servlet implementation class AdminProductList
 */
@WebServlet("/adminProductList.do")
public class AdminProductList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminProductList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String type = "all";
		int cPage;
		
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage = 1;
		}
		int pageBarSize = 5;
		int numPerpage = 9;
		int totalData = new ProductService().getProductCountByType(type); 
		int totalPage = (int)Math.ceil((double)totalData/numPerpage);
		int pageNo = ((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd = pageNo+pageBarSize-1;
		List<Product> products = new ArrayList<>();
		products = new ProductService().selectProductListAll(cPage,numPerpage,type);
		List<ProductImageFile> files = new ProductService().selectMainImageFileAll();
		int check = 0;
		
		StringBuilder pageBar = new StringBuilder();
		
		pageBar.append("<ul class='pagination justify-content-center'>");
		
		if(pageNo==1) {
			pageBar.append("<li class='page-item disabled' ><a class='page-link' href='#'>이전</a></li>");
		}else {
			pageBar.append("<li calss = 'page-item'><a class='page-link' href='"+request.getRequestURI()+"?cPage="+(pageNo-1)+"&type="+type+"'>이전</a></li>");
		}
		
		while(!(pageNo>pageEnd || pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar.append("<li class='page-item active'><a class='page-link' href='#'>"+pageNo+"</a></li>");
			}else {
				pageBar.append("<li class='page-item'><a class='page-link' href='"+request.getRequestURI()+"?cPage="+pageNo+"&type="+type+"'>"+pageNo+"</a></li>");
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar.append("<li class='page-item disabled'><a class='page-link' href='#'>다음</a></li>");
		}else {
			pageBar.append("<li class='page-item'><a class='page-link' href='"+request.getRequestURI()+"?cPage="+pageNo+"&type="+type+"'>다음</a></li>");
		}
		
		pageBar.append("</ul>");
		
		if(!products.isEmpty()) {
			request.setAttribute("products", products);
			request.setAttribute("pageBar", pageBar);	
			request.setAttribute("files", files);
		}
		
		request.getRequestDispatcher("/views/admin/adminProductList.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
