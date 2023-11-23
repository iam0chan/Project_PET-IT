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
		box-shadow:0px 1px 0px 0px;
		width:70%;
		
		align-items:center;
		justify-content:center;
	}
	input,span {
		margin:auto;
		
	}
	input{
		
	}
	.mb-3{
		width:90%;
		margin-left:40px;
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
      
      <div style="margin-top:50px; width:70%; text-align:center; box-shadow:0px 1px 0px 0px;">
      	<h4><span style="color:#03F8B9; font-weight:bolder;"><%=ol.get(0).getOrderId()%></span>님의 주문/결제 내역</h4>
      	<p>*주문자 정보만 수정 가능합니다</p>
      </div>
      
<section>
	
		<div class=contentContainer>
			
			<h5>주문자정보</h5>
			<div class="orderInfo" style="vertical-align:middle; ">
				<div class="mb-3 row">
				  <label for="orderNo" class="col-sm-2 col-form-label">주문번호</label>
				  <div class="col-sm-7">
				    <input type="text" readonly class="form-control-plaintext" id="orderNo" value="<%=ol.get(0).getOrderNo()%>">
				  </div>
				</div>
				<div class="mb-3 row">
				  <label for="orderId" class="col-sm-2 col-form-label">주문자ID</label>
				  <div class="col-sm-7">
				    <input type="text" readonly class="form-control-plaintext" id="orderId" value="<%=ol.get(0).getOrderId() %>">
				  </div>
				</div>
				<div class="mb-3 row">
				  <label for="orderName" class="col-sm-2 col-form-label">주문자명</label>
				  <div class="col-sm-7">
				    <input type="text" class="form-control" id="orderName" value="<%=ol.get(0).getOrderName() %>">
				  </div>
				</div>
				<div class="mb-3 row">
				  <label for="orderPhone" class="col-sm-2 col-form-label">주문자 연락처</label>
				  <div class="col-sm-7">
				    <input type="text" class="form-control" id="orderPhone" value="<%=ol.get(0).getOrderPhone() %>">
				  </div>
				</div>
				
					<div class="mb-3 row">
					  <label for="orderAddr" class="col-sm-2 col-form-label">주문자 주소</label>
					  <div class="col-sm-7">
					    <input type="text" class="form-control" id="orderZipcode" value="<%=ol.get(0).getOrderZipcode()%>">
					    <input type="text" class="form-control" id="orderAddr" value="<%=ol.get(0).getOrderAddr()%>">
					    <input type="text" class="form-control" id="orderDefAddr" value="<%=ol.get(0).getOrderDefAddr()%>">
					  </div>
					</div>
					
				<div class="mb-3 row">
				  <label for="orderEmail" class="col-sm-2 col-form-label">주문자 email</label>
				  <div class="col-sm-7">
				    <input type="text" class="form-control" id="orderEmail" value="<%=ol.get(0).getOrderEmail() %>">
				  </div>
				</div>
				<div class="mb-3 row">
				  <label for="orderReq" class="col-sm-2 col-form-label">배송요청사항</label>
				  <div class="col-sm-7">
				    <input type="text" class="form-control" id="deliveryReq" value="<%=ol.get(0).getDeliveryReq()==null?"없음":ol.get(0).getDeliveryReq()%>">
				  </div>
				</div>
				<div class="mb-3 row">
			
			<div style="height:30px"></div>
			
			<h5>상품정보</h5>
			<%if(!odl.isEmpty()){ %>
				<%for(OrderDetail od : odl){ %>
			<div class="productInfo" style="vertical-align:middle; text-align: center;">
				<div class="input-group mb-3">
				  <span class="input-group-text" id="orderNo">상품번호</span>
				  <input type="text" class="form-control" value="<%=od.getProductNo() %>"  aria-label="orderNo" aria-describedby="orderNo" readonly>
				</div>
				<div class="input-group mb-3">
				  <span class="input-group-text" id="orderNo">상품명</span>
				  <input type="text" class="form-control" value="<%=od.getProductName() %>"  aria-label="orderNo" aria-describedby="orderNo" readonly>
				</div>
				<div class="input-group mb-3">
				  <span class="input-group-text" id="orderNo">상품옵션명</span>
				  <input type="text" class="form-control" value="<%=od.getProductOption() %>"  aria-label="orderNo" aria-describedby="orderNo" readonly>
				</div>
				<div class="input-group mb-3">
				  <span class="input-group-text" id="orderNo">상품개별가</span>
				  <input type="text" class="form-control" value="<%=od.getDetailPrice() %>" aria-label="orderNo" aria-describedby="orderNo" readonly>
				</div>
				<div class="input-group mb-3">
				  <span class="input-group-text" id="orderNo">상품수량</span>
				  <input type="text" class="form-control" value="<%=od.getDetailCount() %>개" aria-label="orderNo" aria-describedby="orderNo" readonly>
				</div>
			</div>
			
			<div style="height:30px"></div>
				<%} %>
			<%} %>
			<h5>결제정보</h5>
			<div class="paymentInfo" style="vertical-align:middle; text-align: center;">
				<div class="input-group mb-3">
				  <span class="input-group-text" id="orderNo">총 합계금액</span>
				  <input type="text" class="form-control" value="<%=pl.get(0).getPaid_amount() %>원"  aria-label="orderNo" aria-describedby="orderNo" readonly>
				</div>
				<div class="input-group mb-3">
				  <span class="input-group-text" id="orderNo">결제수단</span>
				  <input type="text" class="form-control" value="<%=(pl.get(0).getPay_method().equals("point"))?"kakaopay":"card"%>"  aria-label="orderNo" aria-describedby="orderNo" readonly>
				</div>
				<div class="input-group mb-3">
				  <span class="input-group-text" id="orderNo">결제번호</span>
				  <input type="text" class="form-control" value="<%=pl.get(0).getImp_uid() %>"   aria-label="orderNo" aria-describedby="orderNo" readonly>
				</div>
				<div class="input-group mb-3">
				  <span class="input-group-text" id="orderNo">승인번호</span>
				  <input type="text" class="form-control" value="<%=pl.get(0).getApply_num()==0?"없음":pl.get(0).getApply_num()%>"  aria-label="orderNo" aria-describedby="orderNo" readonly>
				</div>
			</div>
		</div>
	
</section>
	<div style="margin:50 50 50 0; text-align:center; width:70%">
		<button class="btn btn-outline-success backList">주문 목록으로</button>
		<input type="submit" class="btn btn-outline-success orderEdit" value="주문 정보 수정 저장">
		<button class="btn btn-outline-success orderDelete">주문 정보 삭제/환불</button>
	</div>
	
	
	<!-- 수정된 주문자정보 전송 -->
	<form id="orderForm" action="<%=request.getContextPath()%>/adminOrderUpdate.do" method="POST">
		<input type="hidden" name="orderNo" value="">
		<input type="hidden" name="orderName" value="">
		<input type="hidden" name="orderZipcode" value="">
		<input type="hidden" name="orderAddr" value="">
		<input type="hidden" name="orderDefAddr" value="">
		<input type="hidden" name="orderPhone" value="">
		<input type="hidden" name="orderEmail" value="">
		<input type="hidden" name="deliveryReq" value="">
	</form>
	<form id="deleteForm" action="<%=request.getContextPath()%>/adminOrderDelete" method="POST">
		<input type="hidden" name="orderNo" value="">
	</form>
<script>

	//input태그 수정 내용 실시간으로 적용
 	$(document).ready(function() {
	    $("input").on("change", function() {
	      var userInput = $(this).val();
	      $(this).attr("value", userInput);
	    });
	});

	//목록으로
	$('.backList').click(function(){
		location.href='<%=request.getContextPath()%>/adminOrder.do';
	});
	
	//form태그 정보 전송
	
	
	$(".orderEdit").click(function() {
		$('input[name=orderNo]').val($("#orderNo").val());
		$('input[name=orderName]').val($("#orderName").val());
		$('input[name=orderZipcode]').val($("#orderZipcode").val());
		$('input[name=orderAddr]').val($("#orderAddr").val());
		$('input[name=orderDefAddr]').val($("#orderDefAddr").val());
		$('input[name=orderPhone]').val($("#orderPhone").val());
		$('input[name=orderEmail]').val($("#orderEmail").val());
		$('input[name=deliveryReq]').val($("#deliveryReq").val());
	    $("#orderForm").submit();
    });
	
	$(".orderDelete").click(function(){
		
	});
</script>		