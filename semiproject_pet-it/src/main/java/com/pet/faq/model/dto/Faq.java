package com.pet.faq.model.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Faq {

	private int faqNo;
	private String faqcategory;
	private String faqTitle;
	private int faqHits;
	private String faqContent;

}
