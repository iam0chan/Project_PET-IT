<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/views/header.jsp"%>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>

<style>
	#content-container {
		margin : 0 auto;
		font-family:'G마켓 산스';
		align-items:center;
		width :55%;

	
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
								  <input id="zipcode" type="text" class="form-control" placeholder="우편 번호" >
								  <input id="addrBtn" class="btn btn-outline-success" type="button" onclick="addrBtnAction()" value="주소 검색">
								</div>
							
			      				<div class="input-group input-group col-lg-9">
								  <input id="addr" type="text" class="form-control" placeholder="기본 주소" >
								</div>
			      			
			      				<div class="input-group input-group col-lg-9">
								  <input id="detailAddr" type="text" class="form-control" placeholder="상세 주소">
								  <input id="extraAddr" type="text" class="form-control" placeholder="참조 주소">
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
				      <div class="productDiv" id="productDiv">
					       <div style="width:15%; text-align:center">
					       		<img src="<%=request.getContextPath()%>/img/testimg.jpg" width="100px" height="100px">
					       </div>
					       <div style="width:70%">
					       		<ul id="product-info">
						       		<li style="font-size:1.1rem; font-weight:bolder">사나운 벌꿀오소리</li>
						       		<input type='hidden' id='productName' name='productName' value=''>
						       		<li>수량 : 00개</li>
						       		<input type='hidden' id='productCount' name='productCount' value=''>
						       		<li>총 가격 : 2,500원</li>
						       		<input type='hidden' id='productPrice' name='productPrice' value=''>
					       		</ul>
					       </div>
					       <div style="width:15%; text-align:center">
					       		<a href="#" id="deleteProduct"><img alt="" src="<%=request.getContextPath()%>/img/x-button.png" width="30px" height="30px"></a>
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
				         <div style="width:20%; text-align:center;">
				       		<span style="font-size:1.1rem"><b>쿠폰 할인</b></span>
				      	 </div>
				      	 <div style="width:85%;" class="input-group mb-3">
						 	<input type="text" class="form-control" placeholder="쿠폰 할인액" readonly>
						 	<button class="btn btn-outline-success" id="couponBtn">쿠폰  적용</button>
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
				         <div style="width:20%; text-align:center;">
				       		<span style="font-size:1.1rem;"><b>적립금 적용</b></span>
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
			        <table style="width:95%">
			        	<tr>
				        	<td style="width:5%"></td>
				        	<td style="width:70%"><p><b>상품 금액</b></p></td>
				        	<td style="width:15%; text-align:right"><p>0000원</p></td>
				        </tr>
				        <tr>
				        	<td style="width:5%"></td>
				        	<td style="width:70%"><p><b>배송비</b></p></td>
				        	<td style="width:15%; text-align:right"><p>0000원</p></td>
				        </tr>
				        <tr>
				        	<td style="width:5%"></td>
				        	<td style="width:70%"><p><b>적립금/쿠폰적용</b></p></td>
				        	<td style="width:15%; text-align:right"><p>0000원</p></td>
				        </tr>
				        </tr>
			        </table>
			      </div>
			      <div style="background-color:lightgray; height:50px; item-aligns:center; display:flex;">
			      	<div style="margin-left:60px; width:80%">
			      		<span style="line-height:50px; vertical-align:middle; font-size:1.3rem"><b>최종결제금액</b></span>
			      	</div>
			      	<div style="margin-left:60px; width:20%; text-align:center;">
			      		<span style="line-height:50px; vertical-align:middle; font-size:1.3rem"><b>0000원</b></span>
			      	</div>
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
				      	<div style="margin-left:50px">
			        		<div class="form-check">
							  <input class="form-check-input" name="payment-btn" type="radio" id="card-payment" value="option1" checked>
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
							  <input class="form-check-input" name="payment-btn" type="radio" id="Kakaopay" value="option3">
							  <label class="form-check-label" for="Kakaopay">
							    <img alt="" src="<%=request.getContextPath()%>/img/KakaoPay_badge.png" width="60px" height="25px">&nbsp&nbsp카카오페이
							  </label>
							</div>
						</div>
			        </div>  		        
			      </div>
			    </div>
				    <div class="accordion-item">
					    <h2 class="accordion-header" id="headingSix">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSix" aria-expanded="false" aria-controls="collapseSix">
					        <div class="btn-text"><b>적립혜택</b></div>
					      </button>
					    </h2>
					    <div id="collapseSix" class="accordion-collapse collapse show" aria-labelledby="headingSix">
					      <div class="accordion-body">
				      		<div style="background-color:lightgray; height:50px; item-aligns:center; display:flex;">
						      	<div style="margin-left:60px; width:80%">
						      		<span style="line-height:50px; vertical-align:middle; font-size:1.3rem">회원적립혜택</span>
						      	</div>
						      	<div style="margin-left:60px; width:20%; text-align:center;">
						      		<span style="line-height:50px; vertical-align:middle; font-size:1.3rem">0000원 예정</span>
						      	</div>
						      </div>
				          </div>  		        
				      	</div>
			    	</div>
			      <br>
			      	<div class="d-grid gap-2">
					  <input class="btn btn-primary btn-lg btn-success" type="button" value="결제하기">
					</div>
			  </div>
			</div>
		</form>
	</section>
</div>

<!-- email select에 따른 값 변화주기 jquery -->
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

<!-- 주문상품 삭제버튼 js구현 -->
<script>
	$(function(){
		$('#deleteProduct').click(function(){
			$("#productDiv").hide();
			$("#productName").attr("disabled",true);
			$("#productCount").attr("disabled",true);
			$("#productPrice").attr("disabled",true);
		});	
	});
	
	
	
</script>



<!-- 주소입력창 daum지도주소 api 적용 js --> 	
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function addrBtnAction() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddr").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddr").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("zipcode").value = data.zonecode;
                document.getElementById("addr").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddr").focus();
            }
        }).open();
    }
</script>


   


<%@ include file="/views/footer.jsp"%>