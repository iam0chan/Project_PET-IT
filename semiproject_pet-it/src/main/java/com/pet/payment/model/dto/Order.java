package com.pet.payment.model.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Order {
	private long orderNo;
	private String orderName;
	private String orderZipcode;
	private String orderAddr;
	private String orderDefAddr;
	private String orderPhone;
	private String orderEmail;
	private int orderTotalPrice;
	private String deliveryReq;
}
