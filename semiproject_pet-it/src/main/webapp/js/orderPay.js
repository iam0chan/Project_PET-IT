//모달창 jquery
	$(document).ready(function(){
		Swal.fire({
		  title: "주소지 입력",
		  text: "기존에 등록된 주소지를 그대로 적용할까요?",
		  icon: "question",
		  showCancelButton: true,
		  confirmButtonColor: "#3085d6",
		  cancelButtonColor: "#d33",
		  confirmButtonText: "Yes"
		}).then((result) => {
		  if (result.isConfirmed) {
		    Swal.fire({
		      title: "주소지 적용",
		      text: "회원정보의 주소지를 불러왔어요!😊",
		      icon: "success"
		    });
		    
		    
		  }
		});	
	});

//배송요청 select에 따른 값 변화주기 jquery
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


//email select에 따른 값 변화주기 jquery
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

//상품수량에 따라 총 가격 변화
	$(document).ready(function(){
	    function calculatePrice() {
	        var price = parseInt($('.price').text());
	        var count = parseInt($('#count').val());
	        var deliveryCost = parseInt($("#delivery-cost").text());
	        var discountPrice = parseInt($("#discountPrice").text());
	        var productPrice = price * count;
	        
	        $('#totalPrice').text(productPrice);
	    	$('#allProductPrice').text(productPrice);
	    	$('#allPayCost').text((productPrice+deliveryCost-discountPrice));
	    }
	    
	    $('#count').on('input', calculatePrice);
	
	    // 페이지 로드 시 총 금액 계산
	    calculatePrice();
	});

//결제정보에 따른 최종결제금액 계산
	


//주문상품 삭제버튼 jquery
	$(function(){
		$('#deleteProduct').click(function(){
			$("#productDiv").hide();
			$("#productName").attr("disabled",true);
			$("#productCount").attr("disabled",true);
			$("#productPrice").attr("disabled",true);
		});	
		
	});



//주문상품이 모두 삭제되면 화면 전환 jquery -> 보류

/*	$("div#productAll > div#productDiv").each(function(){
		if($(this).is(':hidden')){
			var hiddenDivs = $(this).parent().children('div:hidden').length;
			var totalDivs = $(this).parent().children('div').length;
			if(hiddenDivs == totalDivs){
				alert('주문상품이 모두 삭제되어 장바구니로 돌아갑니다');
				window.location.href="<%=request.getContextPath()%>/cart/cartList.jsp"
			}
		}
	});*/


//주소입력창 daum지도주소 api 적용 js

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