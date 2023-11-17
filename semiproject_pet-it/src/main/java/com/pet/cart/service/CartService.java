package com.pet.cart.service;

import static com.pet.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.pet.cart.model.dao.CartDao;
import com.pet.cart.model.dto.Cart;
public class CartService {

	private CartDao cartDao;

	public CartService() {
		this.cartDao = new CartDao();
	}

	// 장바구니 아이템 추가
	public int addToCart(Cart cart) {
		Connection conn =getConnection();
		int result=cartDao.insertCart(conn,cart);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	// 멤버 아이디
	public List<Cart> getAllCartsByMemberId(String memberId) {
		Connection conn =getConnection();
		List<Cart> carts=cartDao.getAllCartsByMemberId(conn,memberId); 
		close(conn);
		return carts;
	}

}
