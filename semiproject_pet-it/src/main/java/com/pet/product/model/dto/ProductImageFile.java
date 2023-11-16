package com.pet.product.model.dto;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ProductImageFile {
	private String productFileNo;
	private String productNo;
	private String productFileOriName;
	private String productFileRename;
	private Date productFileEnrollDate;
	private String productFileMainImage;
	private String productFileDetailImage;
}
