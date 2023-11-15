package com.pet.cart.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pet.cart.model.dao.CartDao;
import com.pet.cart.model.dto.Cart;

/**
 * Servlet implementation class CartPageServlet
 */
@WebServlet("/CartPageServlet")
public class CartPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CartPageServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 멤버아이디
		String memberId = "MemberId";
		List<Cart> cartItems = new CartDao().getAllCartsByMemberId(memberId);
		request.setAttribute("cartItems", cartItems);

		request.getRequestDispatcher("/cart/cartList.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
