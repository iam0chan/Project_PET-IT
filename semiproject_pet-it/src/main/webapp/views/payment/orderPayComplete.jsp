<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/header.jsp"%>
<%@ page import="com.pet.payment.model.dto.Payment, 
				com.pet.payment.model.dto.Order, 
				com.pet.payment.model.dto.OrderDetail,
				java.util.List" 
%>
<% 
	Payment p = (Payment) request.getAttribute("payment");
	OrderDetail od = (OrderDetail) request.getAttribute("orderDetail");
	List<OrderDetail> ol = (List<OrderDetail>) request.getAttribute("orderList");
%>
<style>
	section {
		margin : 0 auto;
		font-family:'G마켓 산스';
		align-items:center;
		width :40%;
	}
	
	.title-container {
		font-family:'G마켓 산스';
        display: flex;
        align-items: center;
        margin-top : 80px;
        margin-bottom: 20px;
        /* background-color : #F0FFF0; */
        height : 100px;
    }
        
    .title-text {
    	display : flex;
    	text-align : center;
    	align-items : center;
    	margin : 0 auto;
    	font-size : 1.5rem;
    }
    
    section{
    	background-color:#F0FFF0;
    }
      
</style>	

	
	<div class="title-container">
		<div class="title-text">
			<h1><B> 결제 완료 </B></h1>
		</div>
	</div>
	
<section>
	
	<div class="pay-container">
		<div id="titleDiv" style="display:flex;">
			<div style="width:20%; text-align:center;  margin-left:10px">
				주문 번호
			</div>
			<div style="width:50%"></div>
			<div id="orderNo" style="width:30%; text-align:center;">
				<%=p.getMerchant_uid()%>
			</div>
		</div>
		<p></p>
		
<%if(!ol.isEmpty()){ %>
		<%for(OrderDetail odl : ol){ %>
		<div style="display:flex;">
			<div style="width:20%; text-align:center; margin-left:10px">
				주문 상품
			</div>
			<div style="width:60%; display:flex; line-height:1.0; margin-left:20px;">
				<div>
					<img src="<%=odl.getProductImg() %>" width="100px" height="100px">
				</div>
				<div style="width:75%; margin-left:20px">
					<p><b><%=odl.getProductName() %></b></p>
					<p><%=odl.getProductOption() %></p>
					<span><%=odl.getDetailCount() %></span><span>개</span>
					<br><br>
					<span><%=odl.getDetailPrice() %></span><span>원</span>
				</div>
			</div>
				<div style="width:30%; text-align:center; margin-right:20px;">
					<span>배송비</span><span>2500원</span>
				</div>
		</div>
		<br>
		
	<%} %>
				
<%} %>

		<div  style="display:flex; font-size:1.2rem; font-weight:bolder">
			<div style="width:20%; text-align:center; margin-left:20px">
				총 결제금액
			</div>
			<div style="width:50%"></div>
			<div id="paid-amount" style="width:30%; text-align:center;">
				<%=p.getPaid_amount()%><span>원</span>
			</div>
		</div>	
	</div>
	
	<div  style="display:flex;">
		<div style="width:20%; text-align:center;">
			결제수단
		</div>
		<div style="width:50%"></div>
		<div id="pay-method" style="width:30%; text-align:center;">
			<%=p.getPay_method().equals("point")?"KakaoPay":"Card" %>
		</div>
	</div>	
	
	<div  style="display:flex;">
		<div style="width:20%; text-align:center;">
			승인번호
		</div>
		<div style="width:50%"></div>
		<div id="apply-num" style="width:30%; text-align:center;">
			<%=p.getApply_num()==0?"없음":p.getApply_num() %>
		</div>
	</div>
</section>
	
	<div style="text-align:center">
		<button class="btn btn-outline-success continueBtn">계속 쇼핑하기</button>
		<button class="btn btn-outline-success mypageBtn">마이 페이지</button>	
	</div>
	
<!-- <script>
/* SessionStorage에서 데이터를 가져옴
var jsonString = sessionStorage.getItem('data');
console.log(jsonString); */

var data= JSON.parse(sessionStorage.getItem("data"));
console.log(data);
console.log(data.merchant_uid);
$("#orderNo").append($('<span>').text(data.merchant_uid));
$('#paid-amount').append($('<span>').text(data.paid_amount)).append($('<span>').text('원'));
$('#pay-method').append($('<span>').text(data.pay_method));
$('#apply-num').append($('<span>').text(data.apply_num));
</script> -->

<!-- Sweet alert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
	$(document).ready(function(){
		Swal.fire({
			  position: "top-center",
			  icon: "success",
			  title: "구입해주셔서 감사합니다😊",
			  showConfirmButton: false,
			  timer: 2000
			});
	});
	
	$(".continueBtn").click(function(){
		$(window).prop("location","<%=request.getContextPath()%>/productList.do?type=all")
	});
	
	$(".mypageBtn").click(function(){
		$(window).prop("location","<%=request.getContextPath()%>/views/myPage/mypageView.jsp")
	});
</script>




<%@ include file="/views/footer.jsp"%>