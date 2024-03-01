package com.pet.cart.model.dao;

import com.pet.cart.model.dto.Cart;
import com.pet.product.model.dto.Product;

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
			pstmt.setString(1, member_id);
			pstmt.setInt(2, (cPage - 1) * numPerpage + 1);
			pstmt.setInt(3, cPage * numPerpage);
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
		return Cart.builder().cartNo(rs.getString("cart_no")).productNo(rs.getString("product_no"))
				.memberId(rs.getString("member_id")).cartProductCount(rs.getInt("cart_product_count"))
				.productName(rs.getString("product_name")).productPrice(rs.getInt("product_price"))
				.productInfo(rs.getString("product_info")).productPoint(rs.getInt("product_point"))
				.productContent(rs.getString("product_content")).productImg(rs.getString("PRODUCT_FILE_RENAME"))
				.build();
	}

	public int insertCart(Connection conn, Cart c) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("insertCart"));
			pstmt.setString(1, c.getMemberId());
			pstmt.setString(2, c.getProductNo());
			pstmt.setInt(3, c.getCartProductCount());
			pstmt.setString(4, c.getOptionName());
			pstmt.setInt(5, c.getOptionValue());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteCart(Connection conn, String where) {
		PreparedStatement pstmt = null;
		String query = sql.getProperty("deleteCart").replace("#WHERE", where);
		int result = 0;
		try {
			pstmt = conn.prepareStatement(query);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

}
