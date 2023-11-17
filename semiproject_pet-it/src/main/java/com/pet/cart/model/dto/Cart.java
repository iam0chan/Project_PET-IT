package com.pet.cart.model.dto;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Cart {
	private String memberId;
	private String productNo;
	private int cartProductCount;
	private String cartNo;
	private Date enrollDate;

}
