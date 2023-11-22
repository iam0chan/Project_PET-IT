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


@WebServlet("/product/productSearch.do")
public class ProductSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String keyword = request.getParameter("keyword");
		System.out.println(keyword);
		int cPage;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e){
			cPage = 1;
		}
		int pageBarSize = 5;
		int numPerPage = 9;
		int totalData = new ProductService().selectProductCountByKeyword(keyword);
		int totalPage = (int)Math.ceil((double)totalData/numPerPage);
		int pageNo = ((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd = pageNo+pageBarSize-1;
		
		List<Product> products = new ArrayList<>();
		products = new ProductService().selectProductListByKeyword(cPage,numPerPage,keyword);
		List<ProductImageFile> files = new ProductService().selectMainImageFileAll();
		System.out.println(totalData);
		System.out.println("검색 데이터수: "+products.size());
		
		StringBuilder pageBar = new StringBuilder();
		
		pageBar.append("<ul class='pagination justify-content-center'>");
		
		if(pageNo==1) {
			pageBar.append("<li class='page-item disabled' ><a class='page-link' href='#'>이전</a></li>");
		}else {
			pageBar.append("<li calss = 'page-item'><a class='page-link' href='"+request.getRequestURI()+"?cPage="+(pageNo-1)+"&keyword="+keyword+"'>이전</a></li>");
		}
		
		while(!(pageNo>pageEnd || pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar.append("<li class='page-item active'><a class='page-link' href='#'>"+pageNo+"</a></li>");
			}else {
				pageBar.append("<li class='page-item'><a class='page-link' href='"+request.getRequestURI()+"?cPage="+pageNo+"&keyword="+keyword+"'>"+pageNo+"</a></li>");
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar.append("<li class='page-item disabled'><a class='page-link' href='#'>다음</a></li>");
		}else {
			pageBar.append("<li class='page-item'><a class='page-link' href='"+request.getRequestURI()+"?cPage="+pageNo+"&keyword="+keyword+"'>다음</a></li>");
		}
		
		pageBar.append("</ul>");
		
			
		if(!products.isEmpty()) {
			request.setAttribute("products", products);
			request.setAttribute("pageBar", pageBar);	
			request.setAttribute("files", files);
		}
		
		request.getRequestDispatcher("/views/product/productlist.jsp").forward(request, response);

		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
