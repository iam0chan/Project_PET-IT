package com.pet.payment.model.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class OrderDetail {
	private long orderNo;
	private String productNo;
	private String productName;
	private int detailPrice;
	private int detailCount;
	private String productImg;
}
