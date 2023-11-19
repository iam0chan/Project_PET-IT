package com.pet.product.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.pet.product.model.dto.Product;
import com.pet.product.model.dto.ProductImageFile;
import com.pet.product.service.ProductService;


@WebServlet("/productorderInfoSubmit.do")
public class ProductorderInfoSubmitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String productNo = request.getParameter("productNo");
		String orderPrice = request.getParameter("orderPrice");
		String orderAmount = request.getParameter("orderAmount");
		
		System.out.println(productNo+" "+orderPrice+" "+orderAmount);
		//가격정보 전달 확인
		
		
		
		
		/*
		 * String productNo = request.getParameter("pNo"); int purchasePrice =
		 * Integer.parseInt(request.getParameter("pPrice")); int purchaseAmount =
		 * Integer.parseInt(request.getParameter("pAmount"));
		 * 
		 * System.out.println(productNo+" "+purchasePrice+" "+purchaseAmount);
		 * 
		 * Product product = new ProductService().selectProductByNo(productNo);
		 * ProductImageFile file = new ProductService().selectMainImageFile(productNo);
		 * Map<String,Object> data = new HashMap<>(); if(product!=null) {
		 * data.put("product", product); data.put("img", file); data.put("price",
		 * purchasePrice); data.put("amount", purchaseAmount); } Gson gson = new Gson();
		 * 
		 * response.setContentType("applicaion/json;charset=utf-8");
		 * gson.toJson(data,response.getWriter());
		 */
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
