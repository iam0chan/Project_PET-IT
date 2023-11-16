<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- header -->
<%@ include file="/views/header.jsp"%>

<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
<!-- PortOne SDK -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<!-- Sweet alert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!-- daum address api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- jQuery -->
<script src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<!-- css -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/orderPay/orderPay.css"/>


<div id="content-container">
	<section id="header-section">
		<div id="title-container">
			<div id="title-text">
				<h1><b> 주문 /결제 페이지 </b></h1>
			</div>
		</div>
	</section>
	
	<section id="body-section">
	
	<!-- -----------------주문자정보 입력폼 start--------------- -->
		<form action="<%=request.getContextPath()%>/payment.do" id="formData">
			
			<div class="accordion" id="accordion-container">
			  <div class="accordion-item">
			    <h2 class="accordion-header" id="headingOne">
			      <button class="accordion-button " type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
			        <div class="btn-text"><b>배송지 입력</b></div>
			      </button>
			    </h2>
			    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne">
			      
			      <div class="accordion-body">
		      		<table id="addr-form">
			      		<tr>
				      		<td style="font-size:1.15rem; text-align:center;">받는 사람 <strong>*</strong></td>
				      		<td>
					      		<div class="input-group input-group col-lg-3">
								  <input type="text" name="orderName" class="form-control" placeholder="받는 사람">
								</div>
							</td>
						</tr>
						<tr style="height:10px"></tr>
						<tr rowspan=3>
							<td style="font-size:1.15rem; text-align:center; width:20%">주소 <strong>*</strong></td>
							<td>	
								<div class="input-group input-group col-lg-5">
								  <input id="zipcode" name="orderZipcode" type="text" class="form-control" placeholder="우편 번호" >
								  <input id="addrBtn" class="btn btn-outline-success" type="button" onclick="addrBtnAction()" value="주소 검색">
								</div>
							
			      				<div class="input-group input-group col-lg-10">
								  <input id="addr" name="orderAddr" type="text" class="form-control" placeholder="기본 주소" >
								</div>
			      			
			      				<div class="input-group input-group col-lg-10">
								  <input id="detailAddr" name="orderDefAddr" type="text" class="form-control" placeholder="상세 주소">
								  <input id="extraAddr" type="text" class="form-control" placeholder="참조 주소">
								</div>
			      			</td>
						</tr>
						<tr style="height:10px"></tr>
			      		<tr>
			      			<td style="font-size:1.15rem; text-align:center;">휴대 전화 <strong>*</strong></td>
			      			<td>
			      				<div class="input-group input-group col-lg-7">
								  <input type="text" name="orderPhone" class="form-control" placeholder="휴대번화 번호 '-'제외하고 입력">
								</div>
			      			</td>
			      		</tr>
			      		<tr style="height:10px"></tr>
			      		<tr>
			      			<td style="font-size:1.15rem; text-align:center;">이메일</td>
			      			<td>
			      				<div class="input-group col-lg-9">
		   						    <input type="text" class="form-control" name="emailHead" placeholder="이메일" aria-label="Username">
								  	<span class="input-group-text">@</span>
								  	<input type="text" class="form-control" name="emailTail" id="textEmail" placeholder="이메일 선택">
									<select class="form-select" id="selectEmail">
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
			      		<tr style="height:10px"></tr>
			      		<tr>
			      			<td style="font-size:1.15rem; text-align:center;">배송요청사항</td>
			      			<td>
			      				<div class="input-group input-group col-lg-10">
			      					<input type="text" class="form-control" name="textDelivery" id="textDelivery" placeholder="배송요청사항 선택">
				      				<select class="form-select" id="selectAddr">
									  	 <option disabled selected>배송요청사항 선택</option>
									 	 <option value="문앞에 놔주세요" selected>문앞에 놔주세요</option>
										 <option value="경비실에 보관해주세요">경비실에 보관해주세요</option>
										 <option value="배송 전 연락바랍니다">배송 전 연락바랍니다</option>
										 <option value="directly" id="textDelivery">직접 입력하기</option>
									</select>	 
								</div>
			      			</td>
			      		</tr>
					</table>
					<br>
					<div style="text-align:right; width:90%"><p>*항목은 필수 입력사항입니다.</p></div>        
			      </div>
			    </div>
			  </div>
		  
		<!-- -----------------주문자정보 입력폼 end--------------- -->
		
		<!-- ----------------상품정보 start -------------------- -->	  
			  <div class="accordion-item">
			    <h2 class="accordion-header" id="headingTwo">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
			        <div class="btn-text"><b>주문 상품</b></div>
			      </button>
			    </h2>
			    <div id="collapseTwo" class="accordion-collapse collapse show" aria-labelledby="headingTwo">
			      <div class="accordion-body" id="productAll">
				      <div class="productDiv" id="productDiv">
					       <div style="width:15%; text-align:center">
					       		<img src="<%=request.getContextPath()%>/img/testimg.jpg" width="120px" height="120px">
					       </div>
					       <div style="width:70%">
					       		<ul id="product-info">
						       		<li style="font-size:1.1rem; font-weight:bolder">사나운 벌꿀오소리</li>
						       		<input type='hidden' id='productName' name='productName' value=''>
						       		<li><p><p></li>
						       		<input type='hidden' id='productName' name='productPrice' value=''>
								    <li><p><span>상품 가격 :&nbsp</span><span class="price">2500</span>원<p></li>
						       		<li style="display:flex; text-align:center;">
									    <p>상품수량 : &nbsp</p>
							       		<input type="number" min="1" id="count" name="productCount" class="form-control productCount" value=1 style="font-size:13px; width:60px; height:25px;">
								    	<span>개</span>
								    </li>
						       		<li><p><span>합계 가격 :&nbsp</span><span id="totalPrice">0</span>원</p></li>
						       		<input type='hidden' id='productPrice' name='productTotalPrice' value=''>
					       		</ul>
					       </div>
					       <div style="width:15%; text-align:center">
					       		<a href="#" id="deleteProduct"><img alt="" src="<%=request.getContextPath()%>/img/x-button.png" width="30px" height="30px"></a>
					       </div>
				       </div>
			      </div>
			    </div>
			  </div>
		<!-- ----------------상품정보 end -------------------- -->
		
		<!-- ----------------쿠폰/적립금 start -------------------- -->
			  <div class="accordion-item">
			    <h2 class="accordion-header" id="headingThree">
			      <button class="accordion-button collapsed " type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="true" aria-controls="collapseThree">
			        <div class="btn-text"><b>할인 / 부가결제</b></div>
			      </button>
			    </h2>
			    <div id="collapseThree" class="accordion-collapse collapse show" aria-labelledby="headingThree">
			      <div class="accordion-body">
			      	<div class="couponDiv">
				         <div class="couponTitle"style="width:20%; text-align:center;">
				       		<span style="font-size:1.1rem"><b>쿠폰 할인</b></span>
				      	 </div>
				      	 <div style="width:85%;" class="input-group mb-3">
						 	<select class="form-select form-select" name="couponValue" aria-label=".form-select-sm example">
							  <option selected>쿠폰을 선택하세요</option>
							  <option value="1">One</option>
							  <option value="2">Two</option>
							  <option value="3">Three</option>
							</select>
						 </div>
				    	<div style="width:5%; text-align:left;"></div>
			      	</div>
			      	<div class="discountDiv">
				         <div style="width:20%; text-align:center;">
				       		<span style="font-size:1.1rem;"><b>적립금 적용</b></span>
				      	 </div>
				      	 <div style="width:85%;" class="input-group mb-3">
						 	<input type="text" class="form-control" name="pointUse" placeholder="사용금액 입력">
						 	<button class="btn btn-outline-success" id="pointBtn" type="button">적립금 사용</button>
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
		  <!-- ----------------쿠폰/적립금 end -------------------- -->
			  
		<!-- ----------------total price start -------------------- -->
			  <div class="accordion-item">
			    <h2 class="accordion-header" id="headingFour">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="true" aria-controls="collapseFour">
			        <div class="btn-text"><b>결제 정보</b></div>
			      </button>
			    </h2>
			    <div id="collapseFour" class="accordion-collapse collapse show" aria-labelledby="headingFour">
			      <div class="accordion-body">
			        <table style="width:95%">
			        	<tr>
				        	<td style="width:5%"></td>
				        	<td style="width:70%"><p><b>총 상품 금액</b></p></td>
				        	<td style="width:15%; text-align:right"><p><span id="allProductPrice">0</span>원</p></td>
				        </tr>
				        <tr>
				        	<td style="width:5%"></td>
				        	<td style="width:70%"><p><b>배송비</b></p></td>
				        	<td style="width:15%; text-align:right"><p><span id="delivery-cost">2500</span>원</p></td>
				        </tr>
				        <tr>
				        	<td style="width:5%"></td>
				        	<td style="width:70%"><p><b>적립금/쿠폰적용</b></p></td>
				        	<td style="width:15%; text-align:right"><p><span id="discountPrice">0</span>원</p></td>
				        </tr>
				        </tr>
			        </table>
			      </div>
			      <div style="background-color:lightgray; height:50px; item-aligns:center; display:flex;">
			      	<div style="margin-left:60px; width:70%">
			      		<span style="line-height:50px; vertical-align:middle; font-size:1.3rem"><b>최종결제금액</b></span>
			      	</div>
			      	<div style="margin-left:60px; width:20%; text-align:center;">
			      		<input type="hidden" name="finalPrice" value="">
			      		<p style="line-height:50px; vertical-align:middle; font-size:1.3rem; font-weight:bolder"><span id="allPayCost"></span>원</p>
			      	</div>
			      </div>
			    </div>
			  </div>
		  <!-- ----------------total price end -------------------- -->
		  
		  <!-- ----------------payment choice start -------------------- -->
			  <div class="accordion-item">
			    <h2 class="accordion-header" id="headingFive">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFive" aria-expanded="true" aria-controls="collapseFive">
			        <div class="btn-text"><b>결제방법 선택</b></div>
			      </button>
			    </h2>
			    <div id="collapseFive" class="accordion-collapse collapse show" aria-labelledby="headingFive">
			      <div class="accordion-body">
				      	<div style="margin-left:50px">
			        		<div class="form-check">
							  <input class="form-check-input" name="payment-btn" type="radio" id="card-payment" value="card" checked>
							  <label class="form-check-label" for="card-payment">
							    <img alt="" src="<%=request.getContextPath()%>/img/card_payment.png">&nbsp&nbsp신용카드 결제
							  </label>
							</div>
							<br>
 							<%--<div class="form-check">
							  <input class="form-check-input" name="payment-btn" type="radio" id="Npay" value="option2">
							  <label class="form-check-label" for="Npay">
							    <img alt="" src="<%=request.getContextPath()%>/img/Npay_badge.png">&nbsp&nbsp네이버페이
							  </label>
							</div> --%>
							<br>
							<div class="form-check">
							  <input class="form-check-input" name="payment-btn" type="radio" id="kakaopay" value="kakaopay">
							  <label class="form-check-label" for="kakaopay">
							    <img alt="" src="<%=request.getContextPath()%>/img/KakaoPay_badge.png" width="60px" height="25px">&nbsp&nbsp카카오페이
							  </label>
							</div>
						</div>
			        </div>  		        
			      </div>
			    </div>
			<!-- ----------------payment choice end -------------------- -->
			
			<!-- ----------------point start -------------------- -->        
				    <div class="accordion-item">
					    <h2 class="accordion-header" id="headingSix">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSix" aria-expanded="false" aria-controls="collapseSix">
					        <div class="btn-text"><b>적립혜택</b></div>
					      </button>
					    </h2>
					    <div id="collapseSix" class="accordion-collapse collapse show" aria-labelledby="headingSix">
					      <div class="accordion-body">
				      		<div style="background-color:lightgray; height:50px; item-aligns:center; display:flex;">
						      	<div style="margin-left:30px; width:70%">
						      		<span style="line-height:50px; vertical-align:middle; font-size:1.0rem">회원적립혜택</span>
						      	</div>
						      	<div style="margin-right:60px; width:30%; text-align:center;">
						      		<span style="line-height:50px; vertical-align:middle; font-size:1.0rem">0000원 예정</span>
						      	</div>
						      </div>
				          </div>  		        
				      	</div>
			    	</div>
				</form>
	    	<!-- ----------------point end -------------------- -->
	    	
			      <br>
			      	<div class="d-grid gap-2">
					  <input id="paymentBtn" class="btn btn-primary btn-lg btn-success" type="button" value="결제하기">
					</div>
			  </div>
			</div>
	</section>
</div>


<!-- js -->
<script src="<%=request.getContextPath()%>/js/orderPay.js"></script>

<!-- footer -->
<%@ include file="/views/footer.jsp"%>