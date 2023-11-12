<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../views/header.jsp" %>


<style>
	#content-container {
		margin : 0 auto;
		font-family:'G마켓 산스';
		align-items:center;
		width :75%;

	
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
   

    
</style>

<div id="content-container">
	<section id="header-section">
		<div id="title-container">
			<div id="title-text">
				<h1> 주문 /결제 페이지 </h1>
			</div>
		</div>
	</section>
	
	<section id="body-section">
	
		<form action="#">
			
			<div class="accordion" id="accordion-container">
			  <div class="accordion-item">
			    <h2 class="accordion-header" id="headingOne">
			      <button class="accordion-button " type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
			        <div class="btn-text">배송지 입력</div>
			      </button>
			    </h2>
			    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne">
			      
			      <div class="accordion-body">
		      		<table id="addr-form" style="width:100%" >
			      		<tr>
				      		<td>받는 사람 <strong>*</strong></td>
				      		<td>
					      		<div class="input-group input-group col-lg-3">
								  <input type="text" class="form-control" placeholder="받는 사람">
								</div>
							</td>
						</tr>
						<tr style="height:10px"></tr>
						<tr rowspan=3>
							<td>주소 <strong>*</strong></td>
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
			      			<td>휴대 전화 <strong>*</strong></td>
			      			<td>
			      				<div class="input-group input-group col-lg-5">
								  <input type="text" class="form-control" placeholder="휴대번화 번호 '-'제외하고 입력">
								</div>
			      			</td>
			      		</tr>
			      		<tr style="height:10px"></tr>
			      		<tr>
			      			<td>이메일</td>
			      			<td>
			      				<div class="input-group input-group col-lg-5">
								  <input type="email" class="form-control" placeholder="이메일">
								</div>
			      			</td>
			      		</tr>

					</table>
					        
			      </div>
			    </div>
			  </div>
			  <div class="accordion-item">
			    <h2 class="accordion-header" id="headingTwo">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
			        <div class="btn-text">주문 상품</div>
			      </button>
			    </h2>
			    <div id="collapseTwo" class="accordion-collapse collapse show" aria-labelledby="headingTwo">
			      <div class="accordion-body">
			        <p>테스트2<p>
			      </div>
			    </div>
			  </div>
			  <div class="accordion-item">
			    <h2 class="accordion-header" id="headingThree">
			      <button class="accordion-button collapsed " type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="true" aria-controls="collapseThree">
			        <div class="btn-text">할인 / 부가결제</div>
			      </button>
			    </h2>
			    <div id="collapseThree" class="accordion-collapse collapse show" aria-labelledby="headingThree">
			      <div class="accordion-body">
			        <p>테스트3<p>
			      </div>
			    </div>
			  </div>
			  <div class="accordion-item">
			    <h2 class="accordion-header" id="headingFour">
			      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="true" aria-controls="collapseFour">
			        <div class="btn-text">결제 정보</div>
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
			        <div class="btn-text">결제방법 선택</div>
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


   
 
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>


<%@ include file="../views/footer.jsp"%>