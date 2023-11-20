package com.pet.product.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.pet.product.model.dto.Product;


@WebServlet("/product/productUpdateEnd.do")
public class ProductUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(!ServletFileUpload.isMultipartContent(request)) {
			throw new IllegalAccessError("수정실패!");
		}else {
			String path = getServletContext().getRealPath("/upload/");
			MultipartRequest mr = new MultipartRequest(request, path, 1024*1024*100,"UTF-8",new DefaultFileRenamePolicy());
			
			String productNo = mr.getParameter("productNo");
			String productName = mr.getParameter("productName");
			int productPrice = Integer.parseInt(mr.getParameter("productPrice"));
			String productSummary = mr.getParameter("productSummary");
			int productStock = Integer.parseInt(mr.getParameter("productStock"));
			String category = mr.getParameter("1st_category");
			String type = mr.getParameter("2nd_category");
			String productContent = mr.getParameter("content");
			String discount = mr.getParameter("discount");
			String[] optionNames = mr.getParameterValues("optionName");
			String[] optionPrice = mr.getParameterValues("optionPrice");
			String oriname = mr.getOriginalFileName("mainImage");
			String rename = mr.getFilesystemName("mainImage");
			
			String optionStatus = "N";
			Map<String,String> options = new HashMap<>();
			if(optionNames.length!=0 && optionPrice.length!=0) {
				for(int i=0; i<optionNames.length; i++) {
					options.put(optionNames[i], optionPrice[i]);
				}
				optionStatus = "Y"; //입력된값이 존재할 경우 optionStatus = Y;
			}
			
			for(Map.Entry<String, String> entry : options.entrySet()) {
				System.out.println("key: "+entry.getKey()+" "+"value: "+entry.getValue());
			}
			
			System.out.println("상품 번호 : " + productNo);
			System.out.println("상품 이름 : " + productName);
			System.out.println("상품 가격 : " + productPrice);
			System.out.println("상품 설명 : " + productSummary);
			System.out.println("상품 재고 : " + productStock);
			System.out.println("대표이미지 : " + oriname);
			System.out.println("대표이미지 수정이름 : "+rename);
			System.out.println("1차 카테고리 : " + type);
			System.out.println("2차 카테고리 : " + category);
			System.out.println("내용 : " + productContent);
			
			Product item = Product.builder()
					.productName(productName)
					.productPrice(productPrice)
					.productInfo(productSummary)
					.productStock(productStock)
					.cateogryNo(category)
					.typeNo(type)
					.productOptionStatus(optionStatus)
					.productDiscount(discount)
					.prouctPoint(500)
					.productContent(productContent)
					.build();
			
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
