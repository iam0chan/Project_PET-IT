<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.pet.product.model.dto.*"%>
<%@ include file="/views/header.jsp" %>
<%
	Product p = (Product)request.getAttribute("product");
	ProductImageFile img = (ProductImageFile)request.getAttribute("ImageFile");
	int totalPrice = (int)(request.getAttribute("totalPrice"));
	int purchaseAmount = (int)(request.getAttribute("purchaseAmount"));
%>

<div>
<h1>테스트페이지</h1>

<h1><%= p.getProductName()%></h1>
<h1><%= p.getProductNo()%></h1>
<h1><%= p.getProductPrice()%></h1>
<h1><%= totalPrice%></h1>
<h1><%= purchaseAmount%></h1>
<img src="<%=request.getContextPath()%>/upload/<%=img.getProductFileRename()%>"/>
</div>
<%@ include file="/views/footer.jsp" %>