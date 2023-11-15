package com.pet.cart.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.pet.cart.model.dto.Cart;
import com.pet.util.DBUtil;

public class CartDao {

	// 장바구니에 db정보 추가
	public void insertCart(Cart cart) {
		try (Connection connection = DBUtil.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(
						"INSERT INTO cart (member_id, product_no, cart_product_count, cart_no, enroll_date) "
								+ "VALUES (?, ?, ?, ?, ?)")) {

			preparedStatement.setString(1, cart.getMemberId());
			preparedStatement.setString(2, cart.getProductNo());
			preparedStatement.setInt(3, cart.getCartProductCount());
			preparedStatement.setString(4, cart.getCartNo());
			preparedStatement.setDate(5, cart.getEnrollDate());

			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace(); 
		}
	}

	// 상품 리스트
	public List<Cart> getAllCartsByMemberId(String memberId) {
		List<Cart> carts = new ArrayList<>();

		try (Connection connection = DBUtil.getConnection();
				PreparedStatement preparedStatement = connection
						.prepareStatement("SELECT * FROM cart WHERE member_id = ?")) {

			preparedStatement.setString(1, memberId);

			try (ResultSet resultSet = preparedStatement.executeQuery()) {
				while (resultSet.next()) {
					Cart cart = Cart.builder().memberId(resultSet.getString("member_id"))
							.productNo(resultSet.getString("product_no"))
							.cartProductCount(resultSet.getInt("cart_product_count"))
							.cartNo(resultSet.getString("cart_no")).enrollDate(resultSet.getDate("enroll_date"))
							.build();

					carts.add(cart);
				}
			}

		} catch (SQLException e) {
			e.printStackTrace(); // 예외처리
		}

		return carts;
	}

	// 필요한거 추가할 것
}
