package com.pet.payment.model.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Payment {
	private String imp_uid;
    private int merchant_uid;
    private int paid_amount;
    private int apply_num;
    private String pay_method;
    private Date paid_at;
    private String apply_num;

}
