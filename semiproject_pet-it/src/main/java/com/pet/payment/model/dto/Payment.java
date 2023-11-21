package com.pet.payment.model.dto;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Payment {
	private String imp_uid;
    private long merchant_uid;
    private String name;   //상품명
    private int paid_amount;
    private int apply_num;
    private String pay_method;
    private Date paid_at;
    
}
