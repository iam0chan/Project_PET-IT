<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
<!-- jQuery -->
<script src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<!-- PortOne SDK -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>

<!-- Sweet alert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!-- <!-- coupon modal -->
<script>
	$(function(){
		$("#couponBtn").click(function(){
			$(".modal").fadeIn();
		});
		$(".modal-close").click(function(){
			$(".modal").fadeOut();
		});
		$(".modal-insert").click(function(){
			$(".modal").fadeOut();
		});
		
	});
</script> -->


<!-- 배송요청 select에 따른 값 변화주기 jquery -->
<script>
    $(function() {
        $('#selectAddr').change(function() {
            if ($('#selectAddr').val() == 'directly') {
                $('#textDelivery').attr("disabled", false);
                $('#textDelivery').val("");
                $('#textDelivery').focus();
            } else {
                $('#textDelivery').val($('#selectAddr').val());
            }
        })
    });
</script>


<!-- email select에 따른 값 변화주기 jquery -->
<script>
    $(function() {
        $('#selectEmail').change(function() {
            if ($('#selectEmail').val() == 'directly') {
                $('#textEmail').attr("disabled", false);
                $('#textEmail').val("");
                $('#textEmail').focus();
            } else {
                $('#textEmail').val($('#selectEmail').val());
            }
        })
    });
</script>

<!-- 상품수량에 따라 총 가격 변화 -->
<script>
	$(document).ready(function(){
	    function calculateTotalPrice() {
	        var price = parseInt($('.price').text());
	        var count = $('#count').val();
	        var totalPrice = price * count;
	        $('#totalPrice').text(totalPrice);
	    }
	    
	    $('#count').on('input', calculateTotalPrice);
	
	    // 페이지 로드 시 총 금액 계산
	    calculateTotalPrice();
	});
</script>

<!-- 결제정보 자동으로 변화되어 표시되게 -->
<script>
	$(document).ready(function(){
	    function calculateTotalPrice() {
	        var price = parseInt($('.price').text());
	        var count = $('#count').val();
	        var totalPrice = price * count;
	        $('#allProductPrice').text(totalPrice);
	    }
	    
	    $('#count').on('input', calculateTotalPrice);
	
	    // 페이지 로드 시 총 금액 계산
	    calculateTotalPrice();
	});

</script>

<!-- 결제정보에 따른 최종결제금액 계산 -->
<script>
$(document).ready(function(){ 
    function calculateTotalCost() {
        var productPrice = parseInt($('#allProductPrice').text());
        var deliveryCost = parseInt($('#delivery-cost').text());
        var discountPrice = parseInt($('#discountPrice').text());
        var totalCost = productPrice + deliveryCost - discountPrice;
        $('#allPayCost').text(totalCost.toLocaleString('ko-KR'));
    }

    // 해당 값들이 변경되면 자동으로 총 금액을 다시 계산
    $('#allProductPrice, #delivery-cost, #discountPrice').change(calculateTotalCost);

    // 페이지가 로드될 때 총 금액을 계산
    calculateTotalCost();
});

</script>


<!-- 주문상품 삭제버튼 jquery -->
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


<!-- 주문상품이 모두 삭제되면 화면 전환 jquery -->
<script>
	$("div#productAll > div#productDiv").each(function(){
		if($(this).is(':hidden')){
			var hiddenDivs = $(this).parent().children('div:hidden').length;
			var totalDivs = $(this).parent().children('div').length;
			if(hiddenDivs == totalDivs){
				alert('주문상품이 모두 삭제되어 장바구니로 돌아갑니다');
				window.location.href="<%=request.getContextPath()%>/cart/cartList.jsp"
			}
		}
	})
</script>

<!-- 결제방법 선택에 따른 결제버튼 전환 -->
<script>
	var IMP = window.IMP;
	IMP.init("imp58177585");
	$("#paymentBtn").on("click",function(){
		/* var checked = $("#card-payment").is(":checked"); */
		/* var checked = $('input[name=payment-btn]:checked').val(); */
		if($("#card-payment").is(":checked")){
			payment_card();	
		}else{
			payment_kakao();
		}
		/* $("#formData").submit(); */
	});
	
	function payment_kakao(){
		IMP.request_pay({						//결제창 호출 함수 IMP.request_pat({});
			pg : "kakaopay.TC0ONETIME",			//결제사명.PG상점아이디
			pay_method : "card",				//지불방법
			merchant_uid: "2234156",  			//주문번호가 들어가야함.
			name : "강아지간식",					//결제창에 노출될 상품명
			amount:	100,						//결제 금액
			buyer_email : "mkty0328@gmail.com", //주문자 email
			buyer_name : "홍길동",				//주문자 이름
			buyer_tel : "01064269887",			//주문자 전화번호
			buyer_addr : "경기도 안양시 만안구", 		//주문자 주소
			buyer_postcode : "139-91",			//주문자 우편번호
		}, function(rsp){						//callback함수
			if(rsp.success){
				
				$.ajax({
					url : "<%=request.getContextPath()%>/payment.do",
					type : "POST",
					dataType : "json",
					data : {
						imp_uid : rsp.imp_uid,
                        merchant_uid : rsp.merchant_uid,
                        paid_amount : rsp.paid_amount,
                        apply_num : rsp.apply_num,
                        pay_method : rsp.pay_method,
                        paid_at : rsp.paid_at
					},
					success : function(data){
						/* alert("완료 imp_uid : "+rsp.imp_uid+" / merchant_uid(orderKey) : "+rsp.merchant_uid); */
						Swal.fire({
							  title: "결제 완료",
							  text: "주문번호 : "+merchant_uid,
							  icon: "success"
							});
					}
				});
				
			}else{
				Swal.fire({
					  title: "결제 실패",
					  text: rsp.error_msg,
					  icon: "error"
					});
				/* alert("실패 : 코드("+rsp.error_code+") / 메시지("+rsp.error_msg+")"); */
			}
		});
	}
	
	function payment_card(){
		IMP.request_pay({						//결제창 호출 함수 IMP.request_pat({});
			pg : "kcp.AO09C",					//결제사명.PG상점아이디
			pay_method : "card",				//지불방법
			merchant_uid: "9234567",  			//주문번호가 들어가야함.
			name : "강아지간식",					//결제창에 노출될 상품명
			amount:	100,						//결제 금액
			buyer_email : "mkty0328@gmail.com", //주문자 email
			buyer_name : "홍길동",				//주문자 이름
			buyer_tel : "01064269887",			//주문자 전화번호
			buyer_addr : "경기도 안양시 만안구", 		//주문자 주소
			buyer_postcode : "139-91",			//주문자 우편번호
		}, function(rsp){						//callback함수
			if(rsp.success){
				
				$.ajax({
					url : "<%=request.getContextPath()%>/payment.do",
					type : "POST",
					dataType : "json",
					data : {
						imp_uid : rsp.imp_uid,
                        merchant_uid : rsp.merchant_uid,
                        paid_amount : rsp.paid_amount,
                        apply_num : rsp.apply_num,
                        pay_method : rsp.pay_method,
                        paid_at : rsp.paid_at
					},
					success : function(data){
						/* alert("완료 imp_uid : "+rsp.imp_uid+" / merchant_uid(orderKey) : "+rsp.merchant_uid); */
						Swal.fire({
							  title: "결제 완료",
							  text: "주문번호 : "+merchant_uid,
							  icon: "success"
							});
					}
				});
				
			}else{
				Swal.fire({
					  title: "결제 실패",
					  text: rsp.error_msg,
					  icon: "error"
					});
				/* alert("실패 : 코드("+rsp.error_code+") / 메시지("+rsp.error_msg+")"); */
			}
		});
	}
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