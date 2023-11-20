package com.pet.cart.model.dto;

import lombok.Builder;
import lombok.Data;

@Data 
@Builder
public class Cart {
	private String cartNo;
	private String productNo;
	private String memberId;
	private int cartProductCount;
	private String productName;
	private int productPrice;
	private String productInfo;
	private int productPoint;
	private String productContent;
	private String productOption;
	
	// 여러 제품 정보를 갖는 리스트
	//private List<Product> products = new ArrayList<>();
}