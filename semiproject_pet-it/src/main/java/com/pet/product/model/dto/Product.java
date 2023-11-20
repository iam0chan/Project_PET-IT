package com.pet.product.model.dto;

import java.sql.Date;
import java.util.List;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Product {

   private String productNo;
   private String cateogryNo; // 대분류
   private String typeNo; //상품타입
   private String productName;
   private int productPrice;
   private int productStock;
   private int productTotalSales;
   private String productInfo;
   private Date productEnrollDate;
   private String productEnrollStatus;
   private String productOptionStatus;
   private String productDiscount;
   private int prouctPoint;
   private String productContent;
   private List<ProductOption> productOption;
}
