<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/header.jsp" %>


<style>
	#content-container {
		margin : 0 auto;
		font-family:'G마켓 산스';
		align-items:center;
		width :65%;

	
	#title-container {
        display: flex;
        align-items: center;
        margin-top : 80px;
        margin-bottom: 20px;
        /* background-color : #F0FFF0; */
        height : 100px;
    }
        
    #title-text {
    	display : flex;
    	text-align : center;
    	align-items : center;
    	/* border : 1px solid red; */
    	margin : 0 auto;
    	font-size : 1.5rem;
    }
    .btn-text{
    	font-size:1.5rem; 
    	color:black;
    	
    }
    
    
    .accordion-body{
    	
    	background-color : #F2F2F2;
	    
    }
 
	#product-info>li{
		 list-style-type : none
	}

    .productDiv{
    	
    	display:flex;
    	align-items : center;
    }
    .couponDiv,.discountDiv{
    	
    	display:flex;
    	align-items : center;
    }
    
    
</style>

<div id="content-container">
	<section id="header-section">
		<div id="title-container">
			<div id="title-text">
				<h1><b> 주문 /결제 페이지 </b></h1>
			</div>
		</div>
	</section>
	
	<section id="body-section">
	
		<form action="#">
			
			<div class="accordion" id="accordion-container">
			  <div class="accordion-item">
			    <h2 class="accordion-header" id="headingOne">
			      <button class="accordion-button " type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
			        <div class="btn-text"><b>배송지 입력</b></div>
			      </button>
			    </h2>
			    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne">
			      
			      <div class="accordion-body">
		      		<table id="addr-form" style="width:100%">
			      		<tr>
				      		<td style="font-size:1.15rem; text-align:center;">받는 사람 <strong>*</strong></td>
				      		<td>
					      		<div class="input-group input-group col-lg-3">
								  <input type="text" class="form-control" placeholder="받는 사람">
								</div>
							</td>
						</tr>
						<tr style="height:10px"></tr>
						<tr rowspan=3>
							<td style="font-size:1.15rem; text-align:center; width:20%">주소 <strong>*</strong></td>
							<td>	
								<div class="input-group input-group col-lg-4">
								  <input type="text" class="form-control" placeholder="우편 번호">
								  <button class="btn btn-outline-secondary" type="button" id="addrBtn">주소 검색</button>
								</div>
							
			      				<div class="input-group input-group col-lg-9">
								  <input type="text" class="form-control" placeholder="기본 주소">
								</div>
			      			
			      				<div class="input-group input-group col-lg-9">
								  <input type="text" class="form-control" placeholder="상세 주소">
								</div>
			      			</td>
						</tr>
						<tr style="height:10px"></tr>
			      		<tr>
			      			<td style="font-size:1.15rem; text-align:center;">휴대 전화 <strong>*</strong></td>
			      			<td>
			      				<div class="input-group input-group col-lg-5">
								  <input type="text" class="form-control" placeholder="휴대번화 번호 '-'제외하고 입력">
								</div>
			      			</td>
			      		</tr>
			      		<tr style="height:10px"></tr>
			      		<tr>
			      			<td style="font-size:1.15rem; text-align:center;">이메일</td>
			      			<td>
			      				<div class="input-group col-lg-9">
		   						    <input type="text" class="form-control" placeholder="이메일" aria-label="Username">
								  	<span class="input-group-text">@</span>
								  	<input type="text" class="form-control" id="textEmail" placeholder="이메일 선택">
									<select class="form-select" id="select">
									  	 <option disabled selected>이메일 선택</option>
									 	 <option value="naver.com" id="naver.com" selected>naver.com</option>
										 <option value="hanmail.net" id="hanmail.net">hanmail.net</option>
										 <option value="hotmail.com" id="hotmail.com">hotmail.com</option>
										 <option value="nate.com" id="nate.com">nate.com</option>
										 <option value="gmail.com" id="gmail.com">gmail.com</option>
										 <option value="directly" id="textEmail">직접 입력하기</option>
									</select>	 
								</div>
			      			</td>
			      		</tr>
					</table>
					<br>
					<div style="text-align:right; width:75%"><p>*항목은 필수 입력사항입니다.</p></div>        
			      </div>
			    </div>
			  </div>
			  <div class="accordion-item">
			    <h2 class="accordion-header" id="headingTwo">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
			        <div class="btn-text"><b>주문 상품</b></div>
			      </button>
			    </h2>
			    <div id="collapseTwo" class="accordion-collapse collapse show" aria-labelledby="headingTwo">
			      <div class="accordion-body">
				      <div class="productDiv">
					       <div style="width:15%; text-align:center">
					       		<img src="<%=request.getContextPath()%>/img/testimg.jpg" width="100px" height="100px">
					       </div>
					       <div style="width:70%">
					       		<ul id="product-info">
						       		<li style="font-size:1.1rem;font-weight:bolder">사나운 벌꿀오소리</li>
						       		<li>수량 : 00개</li>
						       		<li>총 가격 : 2,500원</li>
					       		</ul>
					       </div>
					       <div style="width:15%; text-align:center">
					       		<a href="#"><img alt="" src="<%=request.getContextPath()%>/img/x-button.png" width="30px" height="30px"></a>
					       </div>
				       </div>
				       <br>
				       <div class="productDiv">
					       <div style="width:15%; text-align:center">
					       		<img src="<%=request.getContextPath()%>/img/testimg.jpg" width="100px" height="100px">
					       </div>
					       <div style="width:70%">
					       		<ul id="product-info">
						       		<li style="font-size:1.1rem;font-weight:bolder">귀여운 벌꿀오소리</li>
						       		<li>수량 : 00개</li>
						       		<li>총 가격 : 2,500원</li>
					       		</ul>
					       </div>
					       <div style="width:15%; text-align:center">
					       		<a href="#"><img alt="" src="<%=request.getContextPath()%>/img/x-button.png" width="30px" height="30px"></a>
					       </div>
				       </div>
			      </div>
			    </div>
			  </div>
			  <div class="accordion-item">
			    <h2 class="accordion-header" id="headingThree">
			      <button class="accordion-button collapsed " type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="true" aria-controls="collapseThree">
			        <div class="btn-text"><b>할인 / 부가결제</b></div>
			      </button>
			    </h2>
			    <div id="collapseThree" class="accordion-collapse collapse show" aria-labelledby="headingThree">
			      <div class="accordion-body">
			      	<div class="couponDiv">
				         <div style="width:20%; text-align:left;">
				       		<span style="font-size:1.1rem"><b>쿠폰 할인</b></span>
				      	 </div>
				      	 <div style="width:85%;" class="input-group mb-3">
						 	<input type="text" class="form-control" placeholder="쿠폰 할인액" readonly>
						 	<button class="btn btn-outline-success">쿠폰  적용</button>
						 </div>
				      	 <div style="width:5%; text-align:left"></div>
			      	</div>
			      	<div class="discountDiv">
				         <div style="width:20%; text-align:left;">
				      	 </div>
				      	 <div style="width:85%; text-align:right">
						 	<p>현재 보유쿠폰 : 00개<p>
						 </div>
				      	 <div style="width:5%; text-align:left">
				      	 </div>
			      	</div> 
			      	<div class="discountDiv">
				         <div style="width:20%; text-align:left;">
				       		<span style="font-size:1.1rem"><b>적립금 적용</b></span>
				      	 </div>
				      	 <div style="width:85%;" class="input-group mb-3">
						 	<input type="text" class="form-control" placeholder="사용금액 입력">
						 	<button class="btn btn-outline-success">적립금 사용</button>
						 </div>
				      	 <div style="width:5%; text-align:left"></div>
			      	</div> 
			      	<div class="discountDiv">
				         <div style="width:20%; text-align:left;">
				      	 </div>
				      	 <div style="width:85%; text-align:right">
						 	<p>적립금은 2000원 이상부터 적용가능<p>
						 </div>
				      	 <div style="width:5%; text-align:left">
				      	 </div>
			      	</div>
				      	 
			      </div>
			    </div>
			  </div>
			  <div class="accordion-item">
			    <h2 class="accordion-header" id="headingFour">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="true" aria-controls="collapseFour">
			        <div class="btn-text"><b>결제 정보</b></div>
			      </button>
			    </h2>
			    <div id="collapseFour" class="accordion-collapse collapse show" aria-labelledby="headingFour">
			      <div class="accordion-body">
			        <p>테스트3<p>
			      </div>
			    </div>
			  </div>
			  <div class="accordion-item">
			    <h2 class="accordion-header" id="headingFive">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFive" aria-expanded="true" aria-controls="collapseFive">
			        <div class="btn-text"><b>결제방법 선택</b></div>
			      </button>
			    </h2>
			    <div id="collapseFive" class="accordion-collapse collapse show" aria-labelledby="headingFive">
			      <div class="accordion-body">
			        <p>테스트3<p>
			      </div>
			    </div>
			  </div>
			</div>
		</form>
	</section>
</div>

<script>
    $(function() {
        $('#select').change(function() {
            if ($('#select').val() == 'directly') {
                $('#textEmail').attr("disabled", false);
                $('#textEmail').val("");
                $('#textEmail').focus();
            } else {
                $('#textEmail').val($('#select').val());
            }
        })
    });
</script> 	

   
 
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>


<%@ include file="/views/footer.jsp"%>