package com.pet.cart.model.service;

import static com.pet.common.JDBCTemplate.close;
import static com.pet.common.JDBCTemplate.commit;
import static com.pet.common.JDBCTemplate.getConnection;
import static com.pet.common.JDBCTemplate.rollback;

import java.sql.Connection;

import java.util.List;

import com.pet.cart.model.dao.CartDao;
import com.pet.cart.model.dto.*;


public class CartService {
	private CartDao dao = new CartDao();

	public List<Cart> selectCart(int cPage, int numPerpage, String member_id) {
		Connection conn = getConnection();
		List<Cart> result = dao.selectCart(conn, cPage, numPerpage, member_id);
		close(conn);
		return result;
	}
	public int selectCartCount() {
		Connection conn = getConnection();
		int result = dao.selectCartCount(conn);
		close(conn);
		return result;
	}

	public int insertCart(Cart c) {
		Connection conn=getConnection();
		int result=dao.insertCart(conn,c);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	

	/*
	 * private CartDao cartDao;
	 * 
	 * public CartService() { this.cartDao = new CartDao(); }
	 * 
	 * // 장바구니 아이템 추가 public int addToCart(Cart cart) { Connection conn
	 * =getConnection(); int result=cartDao.insertCart(conn,cart); if(result>0)
	 * commit(conn); else rollback(conn); close(conn); return result; }
	 * 
	 * // 멤버 아이디 public List<Cart> getAllCartsByMemberId(String memberId) {
	 * Connection conn =getConnection(); List<Cart>
	 * carts=cartDao.getAllCartsByMemberId(conn,memberId); close(conn); return
	 * carts; }
	 */
}
