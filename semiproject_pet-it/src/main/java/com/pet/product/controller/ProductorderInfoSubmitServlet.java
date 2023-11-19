package com.pet.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pet.product.model.dto.Product;
import com.pet.product.model.dto.ProductOption;
import com.pet.product.service.ProductService;


@WebServlet("/productorderInfoSubmit.do")
public class ProductorderInfoSubmitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String productNo = request.getParameter("productNo");
		String orderPrice = request.getParameter("orderPrice");
		String orderAmount = request.getParameter("orderAmount");
		String optionName = request.getParameter("optionName");
		String optionPrice = request.getParameter("optionPrice");
		
		/*
		 * ProductOption po = new ProductService().getOptionName(productNo,
		 * optionPrice);
		 */
		
		/* Product product = new ProductService().selectProductByNo(productNo); */
		
				
		System.out.println("orderPay 전달 : "+productNo+" "+orderPrice+" "+orderAmount+" "+optionName+" "+optionPrice);
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
