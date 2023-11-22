package com.pet.product.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

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
         throws ServletException, IOException, NullPointerException {
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
         System.out.println(optionNames.length);
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
         System.out.println("확인:" + optionNames.length);
         String optionStatus = "N";
               
         List<ProductOption> newOptions = new ArrayList<>();
         ProductOption newProductOption; 
         if (optionNames.length != 0 && optionPrice.length != 0) {
            for (int i = 0; i < optionNames.length; i++) {
               newProductOption = new ProductOption();
               newProductOption.setProductNo(productNo);
               newProductOption.setProductOptionName(optionNames[i]);
               newProductOption.setProductOptionPrice(Integer.parseInt(optionPrice[i]));
               newOptions.add(newProductOption);
               optionStatus = "Y"; // 입력된값이 존재할 경우 optionStatus = Y;
            }
         }
         for(ProductOption po : newOptions) {
            System.out.println(po);
            
         }

//         PRODUCT UPDATE 정보
         Product item = Product.builder().productNo(productNo).productName(productName).productPrice(productPrice)
               .productInfo(productSummary).productStock(productStock).cateogryNo(category).typeNo(type)
               .productOptionStatus(optionStatus).productDiscount(discount).prouctPoint(500)
               .productContent(productContent).build();

         int updateResult = new ProductService().updateProduct(item);

         int insertOption = 0;
         int updateOption = 0;
         if (updateResult > 0) {
            System.out.println("1)상품 업데이트 성공");
            List<ProductOption> originalOptions = new ProductService().selectProductOptionsByNo(productNo);
            List<ProductOption> deleteOptions = new ArrayList<>();
               
               Iterator<ProductOption> newOpt = newOptions.iterator();
               Iterator<ProductOption> ori = originalOptions.iterator();
               while(ori.hasNext()) {
                  newOpt = newOptions.iterator();
                  ProductOption nowCompareOption = ori.next(); //기존 옵션들
                  ProductOption newOp=null;
                  int count = 0;
                  System.out.println("check3");
                  while(newOpt.hasNext()) {
                     newOp = newOpt.next(); // 기존 DB저장된 옵션
                     if (nowCompareOption.getProductOptionName() != null) {
                        if (nowCompareOption.getProductOptionName().equals(newOp.getProductOptionName())) {
                           System.out.println("check4");
                           nowCompareOption.setProductOptionName(newOp.getProductOptionName());
                           nowCompareOption.setProductOptionPrice(newOp.getProductOptionPrice());
                           count++;
                           newOpt.remove();
                           break;
                        }
                     }
                  }
                  
                  
               }
            if (newOptions.size()!=0) {
               System.out.println("check1");
                  /*
                   * int deleteOptions = new ProductService().deleteProductOption(productNo,
                   * originalOptions);
                   */
                  insertOption = new ProductService().insertNewOption(productNo, newOptions,deleteOptions);
                  
                  if (insertOption > 0) {
                     System.out.println("3)옵션 데이터 삽입 성공");
                  } else {
                     System.out.println("4)여기서 실패...");
                  }
            }
            if(originalOptions.size()!=0) {
               System.out.println("check2");
               updateOption = new ProductService().updateProductOption(productNo, originalOptions, deleteOptions);
               if (updateOption > 0) {
                  System.out.println("3)옵션 업데이트 성공");
               } else {
                  System.out.println("4)여기서 실패...");
               }
            }

            ProductImageFile selectImgFile = new ProductService().selectMainImageFile(productNo);
            boolean delFileCheck = false;
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
         response.sendRedirect(request.getContextPath() + "/productList.do?type=all");

      }
   }


   protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {

      doGet(request, response);
   }

}
