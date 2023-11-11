<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 테스트페이지</title>
<!-- jQuery -->
<script src="http://code.jquery.com/jquery-3.7.0.min.js"></script>
<!-- PortOne SDK -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
</head>
<body>
	<div>
		<h2>PortOne 결제 데모</h2>
		<button onclick="payment_kakao();">카카오간편결제</button>
	</div>
	<div>
		<button onclick="payment_card();">일반카드결제</button>
	</div>
	
<script>
	var IMP = window.IMP;
	IMP.init("imp58177585"); 					// IMP.init('가맹점 식별코드'); 함수를 사용해서 초기화
	
	//버튼 클릭하면 실행
	function payment_kakao(){
		IMP.request_pay({						//결제창 호출 함수 IMP.request_pat({});
			pg : "kakaopay.TC0ONETIME",			//결제사명.PG상점아이디
			pay_method : "card",				//지불방법
			merchant_uid: "8544",  			//주문번호가 들어가야함.
			name : "강아지간식",					//결제창에 노출될 상품명
			amount:	10800,						//결제 금액
			buyer_email : "mkty0328@gmail.com", //주문자 email
			buyer_name : "홍길동",				//주문자 이름
			buyer_tel : "01064269887",			//주문자 전화번호
			buyer_addr : "경기도 안양시 만안구", 	//주문자 주소
			buyer_postcode : "139-91",			//주문자 우편번호
		}, function(rsp){						//callback함수
			if(rsp.success){
				alert("완료 imp_uid : "+rsp.imp_uid+" / merchant_uid(orderKey) : "+rsp.merchant_uid);
				
			}else{
				alert("실패 : 코드("+rsp.error_code+") / 메시지("+rsp.error_msg+")");
			}
		});
	}
	
	function payment_card(){
		IMP.request_pay({						//결제창 호출 함수 IMP.request_pat({});
			pg : "kcp.AO09C",					//결제사명.PG상점아이디
			pay_method : "card",				//지불방법
			merchant_uid: "8215434",  			//주문번호가 들어가야함.
			name : "강아지간식",					//결제창에 노출될 상품명
			amount:	100,						//결제 금액
			buyer_email : "mkty0328@gmail.com", //주문자 email
			buyer_name : "홍길동",				//주문자 이름
			buyer_tel : "01064269887",			//주문자 전화번호
			buyer_addr : "경기도 안양시 만안구", 	//주문자 주소
			buyer_postcode : "139-91",			//주문자 우편번호
		}, function(rsp){						//callback함수
			if(rsp.success){
				
				$.ajax({
					url : "<%=request.getContextPath()%>/paydemo.do",
					type : "POST",
					dataType : "json",
					data : {
						imp_uid : rsp.imp_uid,
                        merchant_uid : rsp.merchant_uid,
                        paid_amount : rsp.paid_amount,
                        apply_num : rsp.apply_num
					},
					success : function(data){
						alert("완료 imp_uid : "+rsp.imp_uid+" / merchant_uid(orderKey) : "+rsp.merchant_uid);
					}
				});
				
			}else{
				alert("실패 : 코드("+rsp.error_code+") / 메시지("+rsp.error_msg+")");
			}
		});
	}
</script>	
</body>
</html>