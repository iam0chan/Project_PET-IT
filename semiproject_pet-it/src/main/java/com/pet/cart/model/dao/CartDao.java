package com.pet.cart.model.dao;

import com.pet.cart.model.dto.Cart;

import static com.pet.common.JDBCTemplate.close;
import static com.pet.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

public class CartDao {
	
	private Properties sql = new Properties();
	{
		String path = CartDao.class.getResource("/sql/cart/cart_sql.properties").getPath();
		try (FileReader fr = new FileReader(path)) {
			sql.load(fr);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Cart> selectCart(Connection conn, int cPage, int numPerpage, String member_id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Cart> result = new ArrayList<>();
		try {
			pstmt = conn.prepareCall(sql.getProperty("selectCart"));
			pstmt.setInt(1, (cPage - 1) * numPerpage + 1);
			pstmt.setInt(2, cPage * numPerpage);
			pstmt.setString(3, member_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				result.add(getCart(rs));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}

	public int selectCartCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectCartCount"));
			rs = pstmt.executeQuery();
			if (rs.next())
				result = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}

	public Cart selectCartByNo(Connection conn, int boardNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Cart c = null;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectCartByNo"));
			pstmt.setInt(1, boardNo);
			rs = pstmt.executeQuery();
			if (rs.next())
				c = getCart(rs);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return c;
	}
	
	
	
	
	private Cart getCart(ResultSet rs) throws SQLException {
		return Cart.builder()
				.cartNo(rs.getString("cart_no"))
				.productNo(rs.getString("product_no"))
				.memberId(rs.getString("member_id"))
				.cartProductCount(rs.getInt("cart_product_count"))
				.productName(rs.getString("product_name"))
				.productPrice(rs.getInt("product_price"))
				.productInfo(rs.getString("product_info"))
				.productPoint(rs.getInt("product_point"))
				.productContent(rs.getString("product_content")).build();
	}

/*
	// 장바구니에 DB 정보 추가
	public int insertCart(Connection conn, Cart cart) {
		int result = 0;
		try (PreparedStatement preparedStatement = conn
				.prepareStatement("INSERT INTO cart (member_id, product_no, cart_product_count, cart_no, enroll_date) "
						+ "VALUES (?, ?, ?, ?, ?)")) {

			preparedStatement.setString(1, cart.getMemberId());
			preparedStatement.setString(2, cart.getProductNo());
			preparedStatement.setInt(3, cart.getCartProductCount());
			preparedStatement.setString(4, cart.getCartNo());
			preparedStatement.setDate(5, cart.getEnrollDate());

			result = preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	// 상품 리스트
	public List<Cart> getAllCartsByMemberId(Connection conn, String memberId) {
		List<Cart> carts = new ArrayList<>();
		String sql = "SELECT * FROM cart WHERE member_id = ?";
		try (PreparedStatement preparedStatement = conn.prepareStatement(sql)) {

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
	*/
}
