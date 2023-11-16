package com.pet.product.controller;

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

@WebServlet("/productListServlet.do")
public class ProductListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		/* String names = request.getParameter("imageId"); */
		/*
		 * for(String n : names) { System.out.println(n); }
		 */
		/*
		 * System.out.println(names); response.getWriter().append('o');
		 */
		int cPage;
		response.sendRedirect(request.getContextPath()+"/product/productlist.jsp");
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage = 1;
		}
		int pageBarSize = 5;
		int numPerpage = 9;
		int totalData = new ProductService().getProductCount();
		int totalPage = (int)Math.ceil((double)totalData/numPerpage);
		int pageNo = ((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd = pageNo*pageBarSize+1;
		
		List<Product> products = new ArrayList<>();
		products = new ProductService().selectProductListAll(cPage,numPerpage);
		List<ProductImageFile> files = new ProductService().selectMainImageFileAll();
		for(ProductImageFile f : files) {
			System.out.println(f);
		}
		
		StringBuilder pageBar = new StringBuilder();
		
		pageBar.append("<ul class='pagination justify-content-center'>");
		
//		String pageBar = "<ul class='pagination justify-content-center'>";
		
		if(pageNo==1) {
//			pageBar += "<li calss = 'page-item disabled'><a class='page-link' href='#'>이전</a></li>";
			pageBar.append("<li class='page-item disabled'><a class='page-link' href='#'>이전</a></li>");
		}else {
//			pageBar += "<li calss = 'page-item'><a class='page-link' href='"+request.getRequestURI()+"?cPage="+(pageNo-1)+"'>이전</a></li>";
			pageBar.append("<li calss = 'page-item'><a class='page-link' href='"+request.getRequestURI()+"?cPage="+(pageNo-1)+"'>이전</a></li>");
		}
		
		while(!(pageNo>pageEnd || pageNo>totalPage)) {
			if(pageNo==cPage) {
//				pageBar+="<li class='page-item active'><a class='page-link' href='#'>"+pageNo+"</a></li>";
				pageBar.append("<li class='page-item active'><a class='page-link' href='#'>"+pageNo+"</a></li>");
			}else {
//				pageBar+="<li class='page-item'><a class='page-link' href='"+request.getRequestURI()+"?cPage="+pageNo+"'>"+pageNo+"</a></li>";
				pageBar.append("<li class='page-item'><a class='page-link' href='"+request.getRequestURI()+"?cPage="+pageNo+"'>"+pageNo+"</a></li>");
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
//			pageBar+="<li class='page-item disabled'><a class='page-link' href='#'>다음</a></li>";
			pageBar.append("<li class='page-item disabled'><a class='page-link' href='#'>다음</a></li>");
		}else {
//			pageBar+="<li class='page-item'><a class='page-link' href='"+request.getRequestURI()+"?cPage="+pageNo+"'>다음</a></li>";
			pageBar.append("<li class='page-item'><a class='page-link' href='"+request.getRequestURI()+"?cPage="+pageNo+"'>다음</a></li>");
		}
		
//		pageBar+="</ul>";
		pageBar.append("</ul>");
		
			
		if(!products.isEmpty()) {
			request.setAttribute("products", products);
			request.setAttribute("pageBar", pageBar);	
			request.setAttribute("files", files);
		}
		
		request.getRequestDispatcher("/product/productlist.jsp").forward(request, response);
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
