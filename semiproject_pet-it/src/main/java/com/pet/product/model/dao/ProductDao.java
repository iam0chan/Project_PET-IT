package com.pet.product.model.dao;


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

import com.pet.product.model.dto.Product;
import com.pet.product.model.dto.ProductImageFile;

public class ProductDao {

	private Properties sql = new Properties();
	{
		String path = ProductDao.class.getResource("/sql/product/product_sql.properties").getPath(); 
		System.out.println(path);
		try (FileReader fr = new FileReader(path)){
			sql.load(fr);
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertProduct(Connection conn, Product item) {
		PreparedStatement pstmt = null;
		int result = 0;
		/*
		 * PRODUCT_NO, CATEGORY_NO, TYPE_NO, PRODUCT_NAME, 
		 * PRODUCT_PRICE, PRODUCT_STOCK, PRODUCT_TOTAL_SALES,
		 * PRODUCT_INFO, PRODUCT_ENROLL_DATE, PRODUCT_ENROLL_STATUS,
		 * PRODUCT_OPTION_STATUS, PRODUCT_DISCOUNT, PRODUCT_POINT,
		 * PRODUCT_CONTENT
		 */
		System.out.println(item.toString());
		try {
			pstmt = conn.prepareStatement(sql.getProperty("insertProduct"));
			pstmt.setString(1, item.getCateogryNo());
			pstmt.setString(2, item.getTypeNo());
			pstmt.setString(3, item.getProductName());
			pstmt.setInt(4, item.getProductPrice());
			pstmt.setInt(5, item.getProductStock());
			pstmt.setString(6, item.getProductInfo());
			pstmt.setString(7,item.getProductDiscount());
			pstmt.setInt(8,item.getProuctPoint());
			pstmt.setString(9, item.getProductContent());
			
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);			
		}
		return result;
	
	}
	
	public List<Product> selectProductListAll(Connection conn,  int cPage, int numPerpage){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Product> result = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectProductListAll"));
			pstmt.setInt(1, (cPage-1)*numPerpage+1);
			pstmt.setInt(2, cPage*numPerpage);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				result.add(getProduct(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return result; 
	}
	
	public int getProductCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("getProductCount"));
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt("count");
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public Product selectProductByNo(Connection conn, String ProductNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Product product = null;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectProductByNo"));
			pstmt.setString(1, ProductNo);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				product = getProduct(rs);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		System.out.println(product.toString());
		return product;
	}
	
	public int insertMainImageFile(Connection conn, String oriname, String rename) {
		/*
		 * PRODUCT_FILE_NO
		 * PRODUCT_NO(FK)
		 * PRODUCT_FILE_ORINAME
		 * PRODUCT_FILE_RENAME
		 * PRODUCT_FILE_ENROLL_DATE
		 * PRODUCT_FILE_MAIN_IMAGE
		 * PRODUCT_FILE_DETAIL_IMAGE
		 */
		PreparedStatement pstmt = null;
		int fileUploadResult = 0;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("insertMainImageFile"));
			pstmt.setString(1, oriname);
			pstmt.setString(2, rename);
			
			fileUploadResult = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return fileUploadResult;
	}
	
	public List<ProductImageFile> selectMainImageFileAll(Connection conn){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ProductImageFile> files = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectMainImageFileAll"));
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				files.add(getMainImageFile(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return files;		
	}
	
	
	/* Product-Table
	 * PRODUCT_NO, CATEGORY_NO, TYPE_NO, PRODUCT_NAME, 
	 * PRODUCT_PRICE, PRODUCT_STOCK, PRODUCT_TOTAL_SALES,
	 * PRODUCT_INFO, PRODUCT_ENROLL_DATE, PRODUCT_ENROLL_STATUS,
	 * PRODUCT_OPTION_STATUS, PRODUCT_DISCOUNT, PRODUCT_POINT,
	 * PRODUCT_CONTENT
	 */
	private Product getProduct(ResultSet rs) throws SQLException{
		return Product.builder()
				.productNo(rs.getString("product_no"))
				.cateogryNo(rs.getString("category_no"))
				.typeNo(rs.getString("type_no"))
				.productName(rs.getString("product_name"))
				.productPrice(rs.getInt("product_price"))
				.productStock(rs.getInt("product_stock"))
				.productTotalSales(rs.getInt("product_total_sales"))
				.productInfo(rs.getString("product_info"))
				.productEnrollDate(rs.getDate("product_enroll_date"))
				.productEnrollStatus(rs.getString("product_enroll_status"))
				.productOptionStatus(rs.getString("product_option_status"))
				.productDiscount(rs.getString("product_discount"))
				.prouctPoint(rs.getInt("product_point"))
				.productContent(rs.getString("product_content")).build();
				
	}
	
	private ProductImageFile getMainImageFile(ResultSet rs) throws SQLException {
		return ProductImageFile.builder()
				.productFileNo(rs.getString("product_file_no"))
				.productNo(rs.getString("product_no"))
				.productFileOriName(rs.getString("product_file_oriname"))
				.productFileRename(rs.getString("product_file_rename"))
				.productFileEnrollDate(rs.getDate("product_file_enroll_date"))
				.productFileMainImage(rs.getString("product_file_main_Image"))
				.build();
	}
	

}
