package com.pet.cart.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.pet.cart.model.service.CartService;

@WebServlet("/cart/cartDelete.do")
public class CartDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CartDeleteServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String delCartStr = request.getParameter("delCart");
		boolean responseVal = false;
		if (delCartStr != null && !delCartStr.equals("")) {
			List<Integer> delCart = new Gson().fromJson(delCartStr, List.class);
			int result = new CartService().deleteCart(delCart);
			response.setContentType("application/json;charset=utf-8");
			responseVal = result != 0;
		}
		new Gson().toJson(responseVal, response.getWriter());

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
