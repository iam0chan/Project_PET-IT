<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/header.jsp"%>
<%@ page import="com.pet.payment.model.dto.Payment" %>
<% 
	Payment p = (Payment) request.getAttribute("payment");
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
			<div style="width:20%; text-align:center;">
				주문 번호
			</div>
			<div style="width:50%"></div>
			<div id="orderNo" style="width:30%; text-align:center;">
				<%=p.getMerchant_uid()%>
			</div>
		</div>
		<p></p>
		
		<div style="display:flex;">
			<div style="width:20%; text-align:center;">
				주문 상품
			</div>
			<div style="width:50%; display:flex; line-height:1.0; margin-left:20px;">
				<div>
					<img src="<%=request.getContextPath()%>/img/testimg.jpg" width="100px" height="100px">
				</div>
				<div style="width:80%; margin-left:10px">
					<p><b>사나운 오소리</b></p>
					<p>몹시 사나우니까 조심</p>
					<span>00</span><span>개</span>
					<br><br>
					<span>0000</span><span>원</span>
				</div>
			</div>
			<!-- <div style="width:30%; text-align:center;">
				<button class="btn btn-outline-success">상품 상세페이지</button>
			</div> -->
		</div>
		
		<div  style="display:flex; font-size:1.2rem; font-weight:bolder">
			<div style="width:20%; text-align:center;">
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
			<%=p.getPay_method() %>
		</div>
	</div>	
	
	<div  style="display:flex;">
		<div style="width:20%; text-align:center;">
			승인번호
		</div>
		<div style="width:50%"></div>
		<div id="apply-num" style="width:30%; text-align:center;">
			<%=p.getApply_num() %>
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


<script>
	$(".continueBtn").click(function(){
		$(window).prop("location","<%=request.getContextPath()%>/views/product/productlist.jsp")
	});
	
	$(".mypageBtn").click(function(){
		$(window).prop("location","<%=request.getContextPath()%>/views/mypage/mypage.jsp")
	});
</script>




<%@ include file="/views/footer.jsp"%>