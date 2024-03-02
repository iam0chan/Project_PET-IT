package com.pet.cart.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.pet.cart.model.dto.Cart;
import com.pet.cart.model.service.CartService;

@WebServlet("/cart/cartinsert.do")
public class CartInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CartInsertServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 사용자가 선택한 상품 정보를 받아오기
		String productNo = request.getParameter("productNo");
		String memberId = request.getParameter("memberId");
		int orderAmount = Integer.parseInt(request.getParameter("orderAmount"));
		int optionPrice = Integer.parseInt(request.getParameter("optionPrice"));
		String optionName = request.getParameter("optionName");
		// Cart 객체를 생성하여 정보 설정
		Cart cart = Cart.builder().productNo(productNo).memberId(memberId).cartProductCount(orderAmount)
				.optionName(optionName).optionValue(optionPrice).build();

		int result = new CartService().insertCart(cart);
		System.out.println(result);

		response.setContentType("application/json;charset=utf-8");
		new Gson().toJson(result == 1, response.getWriter());

	}
}