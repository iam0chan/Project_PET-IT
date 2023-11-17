package com.pet.product.service;


import static com.pet.common.JDBCTemplate.close;
import static com.pet.common.JDBCTemplate.commit;
import static com.pet.common.JDBCTemplate.getConnection;
import static com.pet.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.pet.product.model.dao.ProductDao;
import com.pet.product.model.dto.Product;
import com.pet.product.model.dto.ProductImageFile;

public class ProductService {
	private ProductDao dao = new ProductDao();
	public int insertProduct(Product item, String oriname, String rename) {
		Connection conn = getConnection();
		int result = dao.insertProduct(conn,item);
		int fileUploadResult = 0;
		if(result>0) {
			 fileUploadResult= dao.insertMainImageFile(conn, oriname, rename);
			 if(fileUploadResult>0) {
				 commit(conn);
			 }
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
	
	public List<ProductImageFile> selectMainImageFileAll(){
		Connection conn = getConnection();
		List<ProductImageFile> files = dao.selectMainImageFileAll(conn);
		close(conn);
		
		return files;
	}
}
