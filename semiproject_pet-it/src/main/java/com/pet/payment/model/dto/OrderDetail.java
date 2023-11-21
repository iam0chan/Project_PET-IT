package com.pet.payment.model.dto;

import java.io.Serializable;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class OrderDetail implements Serializable {
	private long orderNo;
	private String productNo;
	private String productName;
	private String productOption;
	private int detailPrice;
	private int detailCount;
	private String productImg;
}
