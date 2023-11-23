package com.pet.cart.model.dto;

import com.pet.product.model.dto.Product;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data 
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Cart {
	private String cartNo;
	private Product p;
	private String productNo;
	private String memberId;
	private int cartProductCount;
	private String productName;
	private int productPrice;
	private String productInfo;
	private int productPoint;
	private String productContent;
	private String productImg;
	// 상품옵션 추가
	private String optionName;
    private int optionValue;
	
	
	// 여러 제품 정보를 갖는 리스트
	//private List<Product> products = new ArrayList<>();
}