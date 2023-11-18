package com.pet.faq.model.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Faq {

	private String faqNo;
	private String faqCategory;
	private String faqTitle;
	private int faqHits;
	private String faqContent;

}
