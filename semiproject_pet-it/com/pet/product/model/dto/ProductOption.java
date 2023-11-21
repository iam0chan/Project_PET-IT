package com.pet.product.model.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ProductOption {
	private String productOptionNo;
	private String productNo;
	private String productOptionName;
	private int productOptionPrice;
}
