package com.pet.payment.model.dto;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Payment {
	private String imp_uid;
    private String merchant_uid;
    private int paid_amount;
    private String apply_num;
    private String pay_method;
    private Date paid_at;
    
}
