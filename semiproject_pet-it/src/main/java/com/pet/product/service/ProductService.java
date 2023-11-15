package com.pet.product.service;

import java.sql.Connection;
import java.util.List;

import com.pet.common.JDBCTemplate;
import com.pet.product.model.dao.ProductDao;
import com.pet.product.model.dto.Product;
import static com.pet.common.JDBCTemplate.*;
public class ProductService {
	private ProductDao dao = new ProductDao();
	public int insertProduct(Product item) {
		Connection conn = getConnection();
		int result = dao.insertProduct(conn,item);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public List<Product> selectProductListAll(int cPage, int numPerpage){
		Connection conn = getConnection();
		List<Product> result = dao.selectProductListAll(conn, cPage, numPerpage);
		close(conn);
		
		return result;
	}
	
	public int getProductCount() {
		Connection conn = getConnection();
		int count = dao.getProductCount(conn);
		
		return count;
	}
	
	public Product selectProductByNo(String productNo) {
		Connection conn = getConnection();
		Product product = dao.selectProductByNo(conn,productNo);
		close(conn);
		
		return product;
	}
}
