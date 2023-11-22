<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.text.DecimalFormat, 
				java.sql.*, java.util.*, 
				com.pet.payment.model.dto.OrderDetail,
				com.pet.payment.model.dto.Payment,
				com.pet.payment.model.dto.Order"
%>
<% 
	List<OrderDetail> odl = (List<OrderDetail>) request.getAttribute("odl"); 
	List<Payment> pl = (List<Payment>) request.getAttribute("pl");
	List<Order> ol = (List<Order>) request.getAttribute("ol");
%>
<%@ include file="adminSideBar.jsp" %>
<style>
	section{
		width : 100%;
		margin-top : 50px;
	}
	.orderInfo, .productInfo, .paymentInfo{
		box-shadow:2px 3px 5px 0px;
	}
	input,span {
		margin:auto;
	}
	
	
</style>


<link rel="icon" href="<%=request.getContextPath()%>/img/favicon-16x16.png" type="image/png" />
<!-- content start --> 
    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h3>주문 관리 페이지</h3>
        <div class="btn-toolbar mb-2 mb-md-0">
          <div class="btn-group me-2">
          </div>
        </div>
      </div>
      
      <div style="margin-top:50px">
      	<h4><%=ol.get(0).getOrderId()%>님의 주문/결제 내역</h4>
      </div>
      
<section>
	<div class=contentContainer>
		
		<div class="orderInfo" style="vertical-align:middle; text-align: center;">
			<div class="input-group mb-3">
			  <span class="input-group-text" id="orderNo">주문번호</span>
			  <input type="text" class="form-control" value="<%=ol.get(0).getOrderNo()%>"  aria-label="orderNo" aria-describedby="orderNo" readonly>
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text" id="orderNo">주문자ID</span>
			  <input type="text" class="form-control" value="<%=ol.get(0).getOrderId() %>"  aria-label="orderNo" aria-describedby="orderNo" readonly>
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text" id="orderNo">주문자명</span>
			  <input type="text" class="form-control" value="<%=ol.get(0).getOrderName() %>" aria-label="orderNo" aria-describedby="orderNo">
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text" id="orderNo">주문자 연락처</span>
			  <input type="text" class="form-control" value="<%=ol.get(0).getOrderPhone() %>"  aria-label="orderNo" aria-describedby="orderNo">
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text" id="orderNo">주문자 주소</span>
			  <input type="text" class="form-control" 
			  value="<%=ol.get(0).getOrderZipcode()+ol.get(0).getOrderAddr()+ol.get(0).getOrderDefAddr()%>"  
			  aria-label="orderNo" aria-describedby="orderNo">
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text" id="orderNo">주문자 email</span>
			  <input type="text" class="form-control" value="<%=ol.get(0).getOrderEmail()%>"  aria-label="orderNo" aria-describedby="orderNo">
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text" id="orderNo">배송요청사항</span>
			  <input type="text" class="form-control" value="<%=ol.get(0).getDeliveryReq()%>" aria-label="orderNo" aria-describedby="orderNo">
			</div>
		</div>
		
		<div style="width:10px"></div>
		
		<div class="productInfo" style="vertical-align:middle; text-align: center;">
			<div class="input-group mb-3">
			  <span class="input-group-text" id="orderNo">상품번호</span>
			  <input type="text" class="form-control" value="<%=odl.get(0).getProductNo() %>"  aria-label="orderNo" aria-describedby="orderNo" readonly>
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text" id="orderNo">상품명</span>
			  <input type="text" class="form-control" value="<%=odl.get(0).getProductName() %>"  aria-label="orderNo" aria-describedby="orderNo" readonly>
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text" id="orderNo">상품옵션명</span>
			  <input type="text" class="form-control" value="<%=odl.get(0).getProductOption() %>"  aria-label="orderNo" aria-describedby="orderNo" readonly>
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text" id="orderNo">상품개별가</span>
			  <input type="text" class="form-control" value="<%=odl.get(0).getDetailPrice() %>" aria-label="orderNo" aria-describedby="orderNo" >
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text" id="orderNo">상품수량</span>
			  <input type="text" class="form-control" value="<%=odl.get(0).getDetailCount() %>" aria-label="orderNo" aria-describedby="orderNo" >
			</div>
		</div>
		
		<div style="width:10px"></div>
		
		<div class="paymentInfo" style="vertical-align:middle; text-align: center;">
			<div class="input-group mb-3">
			  <span class="input-group-text" id="orderNo">총 합계금액</span>
			  <input type="text" class="form-control" value="<%=pl.get(0).getPaid_amount() %>"  aria-label="orderNo" aria-describedby="orderNo" readonly>
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text" id="orderNo">결제수단</span>
			  <input type="text" class="form-control" value="<%=pl.get(0).getPay_method() %>"  aria-label="orderNo" aria-describedby="orderNo" readonly>
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text" id="orderNo">결제번호</span>
			  <input type="text" class="form-control" value="<%=pl.get(0).getImp_uid() %>"   aria-label="orderNo" aria-describedby="orderNo" readonly>
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text" id="orderNo">승인번호</span>
			  <input type="text" class="form-control" value="<%=pl.get(0).getApply_num()%>"  aria-label="orderNo" aria-describedby="orderNo" readonly>
			</div>
		</div>
	</div>

</section>
	<div>
		<button class="btn btn-outline-success"></button>
		<button class="btn btn-outline-success"></button>
	</div>	