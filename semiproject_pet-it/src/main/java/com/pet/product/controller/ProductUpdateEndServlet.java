package com.pet.product.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
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
import com.pet.product.model.dto.ProductImageFile;
import com.pet.product.model.dto.ProductOption;
import com.pet.product.service.ProductService;

@WebServlet("/product/productUpdateEnd.do")
public class ProductUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (!ServletFileUpload.isMultipartContent(request)) {
			throw new IllegalAccessError("수정실패!");
		} else {
			String path = getServletContext().getRealPath("/upload/");
			MultipartRequest mr = new MultipartRequest(request, path, 1024 * 1024 * 100, "UTF-8",
					new DefaultFileRenamePolicy());

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

			System.out.println("상품 번호 : " + productNo);
			System.out.println("상품 이름 : " + productName);
			System.out.println("상품 가격 : " + productPrice);
			System.out.println("상품 설명 : " + productSummary);
			System.out.println("상품 재고 : " + productStock);
			System.out.println("대표이미지 : " + oriname);
			System.out.println("대표이미지 수정이름 : " + rename);
			System.out.println("1차 카테고리 : " + type);
			System.out.println("2차 카테고리 : " + category);
			System.out.println("내용 : " + productContent);

			String optionStatus = "N";
			Map<String, String> options = new HashMap<>();
			if (optionNames.length != 0 && optionPrice.length != 0) {
				for (int i = 0; i < optionNames.length; i++) {
					options.put(optionNames[i], optionPrice[i]);
				}
				optionStatus = "Y"; // 입력된값이 존재할 경우 optionStatus = Y;
			}

			for (Map.Entry<String, String> entry : options.entrySet()) {
				System.out.println("key: " + entry.getKey() + " " + "value: " + entry.getValue());
			}

			
			List<ProductOption> originalOptions = new ProductService().selectProductOptionsByNo(productNo);
			if(!originalOptions.isEmpty()) {
				 int insertOption = new
				 ProductService().insertProductOption(productNo,options);
				 
			}else {
				for(ProductOption po : originalOptions) {
					for(Map.Entry<String, String> entry : options.entrySet()) {
						
					}
				}
			}
			
//			OPTION 존재 여부 판단(존재 시 업데이트, 존재하지 않을 시 새로운 OPTION 추가)
			/*
			 * Map<String, Map> updateOption = new HashMap<>(); // 기존 옵션 이름이 같을 시 업데이트 할 옵션값
			 * Map<String, String> newOptions = new HashMap<>(); // 존재하는 값에 새로운 업데이트 할 값
			 * List<ProductOption> originalOptions = new
			 * ProductService().selectProductOptionsByNo(productNo); // 기존에 존재하는 // 옵션들 불러오기
			 * for (ProductOption po : originalOptions) {
			 * System.out.println("확인확인확인확인확인확인확인확인확인확인확인확인확인 "+po); for (Map.Entry<String,
			 * String> entry : options.entrySet()) { if
			 * (po.getProductOptionName().equals(entry.getKey())) { // 기존 존재 옵션과 새로 들어온 옵션
			 * System.out.println(po.getProductOptionName()+" ++++ "+entry.getKey()); if
			 * (po.getProductOptionPrice() != Integer.parseInt(entry.getValue())) {
			 * newOptions.put(po.getProductOptionName(), entry.getValue());
			 * updateOption.put(po.getProductOptionNo(), newOptions); } } else {
			 * newOptions.put(entry.getKey(), entry.getValue()); } } }
			 */

//			PRODUCT UPDATE 정보
			Product item = Product.builder().productNo(productNo).productName(productName).productPrice(productPrice)
					.productInfo(productSummary).productStock(productStock).cateogryNo(category).typeNo(type)
					.productOptionStatus(optionStatus).productDiscount(discount).prouctPoint(500)
					.productContent(productContent).build();

			int updateResult = new ProductService().updateProduct(item, newOptions, updateOption);
			boolean delFileCheck = false;
			if (updateResult > 0) {
				ProductImageFile selectImgFile = new ProductService().selectMainImageFile(productNo);

				if (oriname != null && rename != null) {
					if (!selectImgFile.getProductFileOriName().equals(oriname)) {
						int delImgResult = new ProductService().deleteProductImage(productNo);
						if (delImgResult > 0) {
							File delFile = new File("/upload/" + selectImgFile.getProductFileRename());
							if (delFile.exists()) {
								delFile.delete();
								delFileCheck = true;
								if (delFileCheck) {
									int updateMainImg = new ProductService().updateMainImg(productNo, oriname, rename);
								}
							}
						}
					}
				}
			}

			/*
			 * int result = new ProductService().insertProduct(item, oriname, rename,
			 * options);
			 */

			if (updateResult > 0) {
				System.out.println(productNo + " 상품 업데이트성공");

			} else {
				System.out.println("업데이트실패");
			}
			response.sendRedirect(request.getContextPath() + "/productList.do?type=all");

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
