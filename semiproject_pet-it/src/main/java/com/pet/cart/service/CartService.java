package com.pet.cart.service;

import java.util.List;

import com.pet.cart.model.dao.CartDao;
import com.pet.cart.model.dto.Cart;

public class CartService {

	private CartDao CartDao;

	public CartService() {
		this.CartDao = new CartDao();
	}

	// 장바구니 아이템 추가
	public void addToCart(Cart cart) {
		CartDao.insertCart(cart);
	}

	// 멤버 아이디
	public List<Cart> getAllCartsByMemberId(String memberId) {
		return CartDao.getAllCartsByMemberId(memberId);
	}

}
