package com.pet.product.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ProductOption {
	private String productOptionNo;
	private String productNo;
	private String productOptionName;
	private int productOptionPrice;
}
