package com.pet.product.service;


import static com.pet.common.JDBCTemplate.close;
import static com.pet.common.JDBCTemplate.commit;
import static com.pet.common.JDBCTemplate.getConnection;
import static com.pet.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import com.pet.product.model.dao.ProductDao;
import com.pet.product.model.dto.Product;
import com.pet.product.model.dto.ProductImageFile;
import com.pet.product.model.dto.ProductOption;

public class ProductService {

	private ProductDao dao = new ProductDao();
	public int insertProduct(Product item, String oriname, String rename, Map<String,String> options) {
		Connection conn = getConnection();
		int result = dao.insertProduct(conn,item);
		int fileUploadResult = 0;
		int optionResult = 0;
		if(result>0) {
			 fileUploadResult = dao.insertMainImageFile(conn, oriname, rename);
			 if(item.getProductOptionStatus().equals("Y")) {
				 optionResult = dao.insertOption(conn, options);
			 }
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
		List<ProductOption> options = dao.selecOptionByProductNo(conn,productNo);
		for(ProductOption po : options) {
			System.out.println(po);
		}
		product.setProductOption(options);
		close(conn);
		
		return product;
	}
	
	public List<ProductImageFile> selectMainImageFileAll(){
		Connection conn = getConnection();
		List<ProductImageFile> files = dao.selectMainImageFileAll(conn);
		close(conn);
		
		return files;
	}
	
	public ProductImageFile selectMainImageFile(String productNo) {
		Connection conn = getConnection();
		ProductImageFile file = dao.selectMainImageFile(conn,productNo);
		close(conn);
		
		return file;
	}
}

