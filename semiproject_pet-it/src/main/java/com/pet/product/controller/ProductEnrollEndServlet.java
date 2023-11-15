package com.pet.product.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.pet.product.model.dto.Product;
import com.pet.product.service.ProductService;

@WebServlet("/product/productEnrollEnd.do")
public class ProductEnrollEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* request.setCharacterEncoding("utf-8"); */
		if (!ServletFileUpload.isMultipartContent(request)) {
			throw new IllegalArgumentException("안돼!");
		} else {
			String path = getServletContext().getRealPath("/upload/");
			MultipartRequest mr = new MultipartRequest(request, path, 1024 * 1024 * 100, "UTF-8", new DefaultFileRenamePolicy());
			String re = mr.getFilesystemName("mainImage");
			String ori = mr.getOriginalFileName("mainImage");
			String productName = mr.getParameter("productName");
			int productPrice = Integer.parseInt(mr.getParameter("productPrice"));
			String productSummary = mr.getParameter("productSummary");
			String mainImage = mr.getParameter("mainImage");
			int productStock = Integer.parseInt(mr.getParameter("productStock"));
			String category = mr.getParameter("1st_category");
			String type = mr.getParameter("2nd_category");
			String productContent = mr.getParameter("content");
			String[] optionNames = mr.getParameterValues("optionName");
			String[] optionPrice = (mr.getParameterValues("optionPrice"));

			System.out.println("상품 이름 : " + productName);
			System.out.println("상품 가격 : " + productPrice);
			System.out.println("상품 설명 : " + productSummary);
			System.out.println("상품 재고 : " + productStock);
			System.out.println("대표이미지 : " + ori);
			System.out.println("대표이미지 수정이름 : "+re);
			System.out.println("1차 카테고리 : " + type);
			System.out.println("2차 카테고리 : " + category);
			System.out.println("내용 : " + productContent);
			Product item = Product.builder()
					.productName(productName)
					.productPrice(productPrice)
					.productInfo(productSummary)
					.productStock(productStock)
					.cateogryNo(category)
					.typeNo(type)
					.productDiscount("0.1")
					.prouctPoint(500)
					.productContent(productContent)
					.build();
			
			int result = new ProductService().insertProduct(item);
			if(result>0) {
				System.out.println("입력성공");
			}else {
				System.out.println("입력실패");
			}
			/*
			 * Map<String,String> option = new HashMap<>(); for (String n : optionNames) {
			 * System.out.println("옵션상품명:"+n); } for (String p : optionPrice) {
			 * System.out.println("옵션가격:"+p); }
			 */
			PrintWriter out = response.getWriter();
			out.print(productContent);
			response.sendRedirect(request.getContextPath()+"/productList.do");
		}

		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
