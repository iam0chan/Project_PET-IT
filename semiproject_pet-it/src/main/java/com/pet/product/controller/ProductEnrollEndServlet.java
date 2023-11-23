package com.pet.product.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
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
import com.pet.product.service.ProductService;


@WebServlet("/product/productEnrollEnd.do")
public class ProductEnrollEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		/* request.setCharacterEncoding("utf-8"); */
		if (!ServletFileUpload.isMultipartContent(request)) {
			throw new IllegalArgumentException("안돼!");
		} else {
			//file upload 
			String path = getServletContext().getRealPath("/upload/");
			MultipartRequest mr = new MultipartRequest(request, path, 1024 * 1024 * 100, "UTF-8", new DefaultFileRenamePolicy());
			String oriname = mr.getOriginalFileName("mainImage");
			String rename = mr.getFilesystemName("mainImage");
			
			
			//상품정보
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
			
			Map<String,String> options = new HashMap<>(); //옵션맵핑 Map
			String optionStatus = "N"; //옵션입력여부체크변수
			
			//입력된 옵션을 key:value 형식으로 맵핑
			
			if(!optionNames[0].equals("") && !optionPrice[0].equals("")) {
				for(int i=0; i<optionNames.length; i++) {
					options.put(optionNames[i], optionPrice[i]);
				}
				optionStatus = "Y"; //입력된값이 존재할 경우 optionStatus = Y;
			}else {
				options.put("기본", mr.getParameter("productPrice"));
			}
			
			for(Map.Entry<String, String> entry : options.entrySet()) {
				System.out.println("key: "+entry.getKey()+" "+"value: "+entry.getValue());
			}
			
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
			
			int result = new ProductService().insertProduct(item, oriname, rename, options);
			if(result>0) {
				//int fileUploadResult = new ProductService().insertMainImageFile(oriname, rename);
				System.out.println("입력성공");
			}else {
				System.out.println("입력실패");
				
				File delFile = new File("/upload/"+rename);
				if(delFile.exists()) {
					delFile.delete();
				}
			}
			
			//대표이미지 저장시키기, 에디터 저장 이미지 디비에 저장할 수 있는 방법 생각해보기
			
			/*
			 * Map<String,String> option = new HashMap<>(); for (String n : optionNames) {
			 * System.out.println("옵션상품명:"+n); } for (String p : optionPrice) {
			 * System.out.println("옵션가격:"+p); }
			 */
			PrintWriter out = response.getWriter();
			out.print(productContent);
			response.sendRedirect(request.getContextPath()+"/productList.do?type=all");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
