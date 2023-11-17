package com.pet.product.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.google.gson.Gson;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@WebServlet("/test")
public class TestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String productNo = request.getParameter("productNo");
		int purchasePrice = Integer.parseInt(request.getParameter("purchasePrice"));
		String purchaseAmount = request.getParameter("purchaseAmount");
		String purchaseProductName = request.getParameter("purchaseProductName");
		
		System.out.println("상품 번호 : "+ productNo);
		System.out.println("최종구매가격 : "+ purchasePrice);
		System.out.println("최종구매수량 : "+ purchaseAmount);
		System.out.println("구매옵션이름 : "+ purchaseProductName);
		
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.write("전달성공");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
