package com.pet.product.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/product/productEnrollEnd.do")
public class ProductEnrollEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String productName = request.getParameter("productName");
		String productPrice = request.getParameter("productPrice");
		String productSummary = request.getParameter("productSummary");
		String imageId = request.getParameter("imageId");
		String type = request.getParameter("1st_category");
		String category = request.getParameter("2nd_category");
		String[] optionNames = request.getParameterValues("optionName");
		String[] optionPrice = (request.getParameterValues("optionPrice"));
		String productContent = request.getParameter("content");
		
		System.out.println("상품 이름 : "+productName);
		System.out.println("상품 가격 : "+productPrice);
		System.out.println("상품 설명 : "+productSummary);
		System.out.println("이미지 : "+imageId);
		System.out.println("1차 카테고리 : "+type);
		System.out.println("2차 카테고리 : "+category);
		System.out.println("내용 : "+productContent);
		for(String n : optionNames) {
			System.out.println(n);
		}
		for(String p : optionPrice) {
			System.out.println(p);
		}
		PrintWriter out = response.getWriter();
		out.print(productContent);
		response.sendRedirect(request.getContextPath()+"/views/index.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
