<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/header.jsp" %>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');

	* {
	font-family: 'Noto Sans KR', sans-serif;
	}
	.quote_btn-container{
		width:534.475px;
		height:80px;
	}
	
	button {
		border-radius: 3px;
		align-self: center;
		display: flex;
    	justify-content: center;
    	align-items: center;
	}
	.navbar {
		height:130px;
	}
    .footer_section{
    	height:130px;
    }
	body {
        box-sizing: border-box;
        line-height:40px;
    }
    .enroll_title{
    	text-align:center;
    	margin-top: 50px;
    	font-size: 26px;
    	font-weight: bold;
    }
    .enroll_line{
    	text-align:right;
    	font-size: 12px;
    	border-bottom: 2px solid;
    	width:600px;
    }
    
    .enroll:not(.enroll_line) {
    	text-align:left;
        width: 650px;
       	padding: 20px;
	    margin: 0px auto;
	    background: white;

	}
	
	#en_container{
		margin-bottom:40px;
	}
	
		
	.enroll div{
		margin-bottom: 20px;
	}
	
	.checkbox-group div{
		margin-bottom: 7px;
	}
	
	.description{
		margin:0;
		height:30px;
	}
	
    
    .field.adress{
    	/* height:250px; */
    }
    
    .nn{
    	color:red;
    }
    .field{
    	display:flex;
    	height:65px;
    	padding-left:20px;
    }
    .field b{
    	width:120px;
    	font-size:14px;
    }
    
    .field input{
    	width: 330px;
    	height: 40px;
    	margin-bottom: 20px;
    	margin-right: 10px;
    	
    }
    
    .field input:not(.btn){
    	border:1px lightgray solid;
    	border-radius: 0.25rem;
    }
    
    #enroll_form input[type="submit"] {
    	text-align: center;
    }
    
    .checkbox-item {
    	width:400px;
    }
    
    .submit {
    	width: 610px;
    	text-align: center;
    }
    
    .submit input{
    	width: 240px;
    	height: 56px;
    }
    
    .modal {
    	width:360px;
   	    height:178px;
    	margin-bottom:0px;
    	position: fixed;
	  	top: 40%;
  		left: 40%;
  		
    }
    .modal-open .modal{
    	overflow-y:clip;
    }
    
    .du_btn{
    	 position: relative;
    }
    
    #mail_du, #id_du{
    	width: 105px;
    	height:38px;
    	position: absolute;
    	top: 0;	
    }
    
    
    .modal *{
     	width:100%;
     	height:100%;
     	text-align:center;
    }
    
    .addr {
    	display:none;
    }
    .checkbox-items{
    	width:400px;
    }
    
    .checkbox-group{
    	display:flex;
    	height:250px;
    }
    
    .addr_table{
    	height:100%;
    	display:flex;
    	flex-direction: column; 
    }
    
    .addr.detail_title{
    	height:20px;
    	margin:0;
    	font-size:12px;
    	flex:auto;
    }
</style>
<div class="enroll_title">회원가입</div>
<div class="enroll" id="en_container">
<div class="enroll_line"><span class="nn">*</span>필수입력사항</div>
	<form id="enroll_form" action="<%=request.getContextPath()%>/member/enrollMemberEnd.do" method="post" >							
			<div class="field id">
					<b>아이디<span class="nn">*</span></b>
				<span>
					<input type="text" placeholder="  아이디를 입력해주세요" name="memberId" id="memberId" oninput="validateId()">
				</span>
				<div class="du_btn">
					<button type="button" id="id_du" class="modal_open btn btn-outline-primary"><span id="id_du_span" style="font-size:14px;">중복확인</span></button>
				</div>
			</div>
			
				<!-- 아이디 중복확인 모달-->
				<div class="modal fade" id="idcheck_modal">
				<div class="modal-dialog">
				<div class="modal-content">
					<!-- body -->
					<div class="modal-body"></div>
					<!-- Footer -->
					<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
					</div>	
			 	</div>
				</div>
				</div>
				
				<!-- 이용약관 동의(필수) 약관보기 -->
				<div class="modal fade" id="terms_modal">
				<div class="modal-dialog">
				<div class="modal-content">
					<!-- body -->
					<div class="modal-body"></div>
					<!-- Footer -->
					<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
					</div>
				</div>	
				</div>
				</div>
				
				<!-- 이용약관 동의(필수) 약관보기 -->
				<div class="modal fade" id="terms_modal2">
				<div class="modal-dialog">
				<div class="modal-content">
					<!-- body -->
					<div class="modal-body"></div>
					<!-- Footer -->
					<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
					</div>
				</div>	
				</div>
				</div>
				
				<!-- 이용약관 동의(필수) 약관보기 -->
				<div class="modal fade" id="terms_modal3">
				<div class="modal-dialog">
				<div class="modal-content">
					<!-- body -->
					<div class="modal-body"></div>
					<!-- Footer -->
					<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
					</div>
				</div>	
				</div>
				</div>
				
			<div class="field pw">
				<b>비밀번호<span class="nn">*</span></b>
				<span>
					<input type="password" placeholder="  비밀번호를 입력해주세요" name="memberPw" id="memberPw" oninput="validatePw()">
				</span>
			</div>
			<div class="field pwc" style="height:20px; display:none;">테스트</div>
			<div class="field pw2">
				<b>비밀번호확인<span class="nn">*</span></b>
				<span>	
					<input type="password" placeholder="  비밀번호를 다시 입력해주세요" id="memberPw2" >
				</span>
			</div>
			<div class="field pw2c" style="height:20px; display:none;" >테스트</div>
			<div class="field name">
				<b>이름<span class="nn">*</span></b>
				<span>
				<input type="text" placeholder="  이름을 입력해주세요"  name="memberName" id="memberName" >
				</span>
			</div>
			<div class="field email">
				<b>이메일<span class="nn">*</span></b>
				<span>	
					<input type="email" placeholder="  pet@it.com" name="memberEmail" id="memberEmail" oninput="validateEmail()">
				</span>
				<div class="du_btn">
					<button type="button" id="mail_du" class="modal_open btn btn-outline-primary"><span id="mail_du_span" style="font-size:14px;">중복확인</span></button>
				</div>
			</div>
			<div class="field phone">
				<b>휴대폰</b>
				<span>	
					<input type="text" placeholder="  숫자만 입력해주세요" name="memberPhone" id="memberPhone">
				</span>
			</div>
			<div class="field adress">
				<b>주소<span class="nn">*</span></b>	
					<input type="button" class="btn btn-outline-primary" onclick="execDaumPostcode()" value="주소 검색" id="addr_btn"><br>
					<div class="addr_table">
						<input type="text" class="addr" id="memberZipCode" name="memberZipCode" placeholder="우편번호">
						<input type="text" class="addr" id="memberAddr" name="memberAddr" placeholder="주소"><br>
						<div class="addr detail_title">상세주소</div>
						<input type="text" class="addr" id="memberDetailAddr" name="memberDetailAddr" placeholder="상세주소">
					</div>
			</div>
	<div style="width:600px; height:1.7px; border:1px solid; margin-top:20px;"></div>
	<div class="checkbox-group" style="padding-left: 20px;">
	<div style="width:120px; height:200px;">
   	<label><b style="font-size:14px;">이용약관동의</b></label>	
	</div>
    <!-- 첫 번째 동의 항목 -->
    <div class="checkbox-items">
    <div class="checkbox-item">
        <label for="TermsAgreeAll" style="margin:0;">
            <input id="TermsAgreeAll" type="checkbox" class="checkbox-input" value="Y" name="memberTersm">
            <span><b>전체 동의합니다.</b></span>        
        </label>
        <p class="description" style="font-size:11px">(선택항목에 동의하지 않은 경우도 회원가입 및 일반적인 서비스를 이용할 수 있습니다.)</p>
    </div>
	<div>
		<input id="terms1" type="checkbox" value="Y">
		<span>이용약관 동의(필수)<span class="nn">*</span></span>
		<a href="#" id=te1>
			약관보기 >
		</a>
	</div>
    <div>
		<input type="checkbox" id="terms2" value="Y">
		<span>개인정보 수집,이용 동의(필수)<span class="nn">*</span></span>
		<a href="#" id=te2>
			약관보기 >
		</a>
	</div>
	<div>
		<input name="memberAccept" type="checkbox" value="Y">
		<span>개인정보 수집,이용 동의(선택)</span>
		<a href="#" id=te3>
			약관보기 >
		</a>
	</div>
    </div>
    </div>
    <div class="submit">
	<input class="submit btn btn-primary btn-sm" type="submit" value="가입하기" style="font-size:16px; font-weight:bold;">
    </div>
    <script>
    //약관동의 전체동의 스크립트
    $(document).ready(function() {
        $('#TermsAgreeAll').change(function() {
            var isChecked = $(this).prop('checked');
            $('.checkbox-group input[type="checkbox"]').prop('checked', isChecked);
        });
    });
   /*  var id_ck = 0;
	var memberId=$("memberId").val(); */
	
	//비밀번호 체크 스크립트
	$("#memberPw").keyup(e=>{
		const memberPw=e.target.value;
		if(userId.length>=4){
			$.get("<%=request.getContextPath()%>/pwCheck.do?memberPw="+memberPw,
					data=>{
						console.log(data);
					})
			
		}
	});
	
	
	
	//필수약관 동의체크 스크립트
	$(document).ready(function(){
          $(".submit").click(function(){    
              if($("#terms1").is(":checked") == false){
                  alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다.");
                  return;
              }else if($("#terms2").is(":checked") == false){
                  alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다..");
                  return;
              }else{
                  $("#enroll_form").submit();
              }
          });    
      });
		
	
	/* memberId중복확인 모달창 스크립트 */
	$(document).ready(function() {
		$("#id_du").click(function(){
			const memberId = $('#memberId').val();
			console.log(memberId);
			$.ajax({
				type:"POST",
				url: "<%=request.getContextPath()%>/memberCheck.do",
				data:{memberId:memberId},
				success:function(result){
					console.log(result);
					if(result=='0'){  // id가 checkMessage인 것에 아래 텍스트 출력
						$('.modal-body').html('중복된 아이디입니다');
					} else if(result=='-1'){
						$('.modal-body').html('아이디가 입력되지않았습니다');
					}else if(result=='-2'){
						$('.modal-body').html('아이디는 6~10글자이내로 입력해주세요');
					} else if(result=='1'){
						$('.modal-body').html('사용가능한 아이디입니다');
					}
				$("#idcheck_modal").modal("show");
				}
			})
			})
		});
	
	/* memberEmail중복확인 모달창 스크립트 */
	$(document).ready(function() {
		$("#mail_du").click(function(){
			const memberEmail = $('#memberEmail').val();
			$.ajax({
				type:"POST",
				url: "<%=request.getContextPath()%>/memberEmailCheck.do",
				data:{memberEmail:memberEmail},
				success:function(result){
					console.log(result);
					if(result=='0'){  // id가 checkMessage인 것에 아래 텍스트 출력
						$('.modal-body').html('중복된 이메일입니다');
					} else if(result=='-1'){
						$('.modal-body').html('이메일이 입력되지않았습니다');
					} else if(result=='-2'){
						$('.modal-body').html('이메일형식에 @가없습니다');
					} else if(result=='1'){
						$('.modal-body').html('사용가능한 이메일입니다');
					}
				$("#idcheck_modal").modal("show");
				}
			})
			})
		});
	
	//약관동의 모달창 스크립트
	 $(document).ready(function() {
       $("#te1").click(function() {
    	   //이용약관 동의(필수)
           // 선언된 텍스트를 가져와서 모달 창의 body에 넣음
           $('.modal-body').html('이용약관 동의(필수)');
           // 모달 창을 띄움
           $("#terms_modal").modal("show");
       });
       
       $("#te2").click(function() {
   			// 개인정보 수집,이용 동의(필수)
           // 선언된 텍스트를 가져와서 모달 창의 body에 넣음
           $('.modal-body').html('개인정보 수집,이용 동의(필수)');
           // 모달 창을 띄움
           $("#terms_modal2").modal("show");
       });
       
       $("#te3").click(function() {
		   // 개인정보 수집,이용 동의(선택)
           // 선언된 텍스트를 가져와서 모달 창의 body에 넣음
           $('.modal-body').html('개인정보 수집,이용 동의(선택)');
           // 모달 창을 띄움
           $("#terms_modal3").modal("show");
       });
   });
    </script>
</form>
</div>

<script>
	$('form').submit(function(event){
		$.post('<%=request.getContextPath()%>/member/enrollMemberEnd.do')		
	});
	
	/* function validateInput(){
		const inputElement = $('#memberId');
		const 
		
	} */
	
	/* var allowedRegex = /^[0-9a-zA-Z!@#$%^&*()-_+=<>?/,.:;{}[\] ]*$/; */
	
	//memberId 정규식
	function validateId() {
	    var inputId = document.getElementById("memberId");

	    // 정규표현식: 숫자, 영어소문자 허용
	    var allowedRegexId = /^[0-9a-z ]*$/;

	    if (!allowedRegexId.test(inputId.value)) {
	        // 입력이 허용된 문자가 아닌 경우 입력을 막음
	        inputId.value = inputId.value.replace(/[^0-9a-z ]/g, '');
	    }
	}
	
	/* //memberPw 정규식
	function validatePw() {
	    var inputPw = document.getElementById("memberPw");

	    // 정규표현식: 숫자, 영문, 특수문자 허용
	    var allowedRegexPw = /^[0-9a-zA-Z!@#$%^&*()-_+=<>?/ ]*$/;
	    if (!allowedRegexPw.test(inputPw.value)) {
	        // 입력이 허용된 문자가 아닌 경우 입력을 막음
//	        inputElement.value = inputElement.value.replace(/^[0-9a-zA-Z!@#$%^&*()-_+=<>?/,.:;{}[\]/g, '');
	    	inputPw.value = inputPw.value.replace(/^[0-9a-zA-Z!@#$%^&*()-_+=<>?/ ]/g, '');
	    }
	} */
	
	/* //memberEmail 정규식
	function validateEmail() {
	    var inputElement = document.getElementById("memberEmail");

	    // 정규표현식: 숫자, 영문, 특수문자 허용
//	    var allowedRegexEm = /^[0-9a-zA-Z!@#$%^&*()-_+=<>?/,.:;{}[\] ]*$/;
	    var allowedRegexEm = /^[0-9a-z ]*$/;
	    if (!allowedRegex.test(inputElement.value)) {
	        // 입력이 허용된 문자가 아닌 경우 입력을 막음
//	        inputElement.value = inputElement.value.replace(/^[0-9a-zA-Z!@#$%^&*()-_+=<>?/,.:;{}[\]/g, '');
	    	inputElement.value = inputElement.value.replace(/[^0-9a-z ]/g@., '');
	    }
	} 
	
	
    /* const fn_membervalidate=()=>{
    	const memberId=$("#memberId").val().trim();
    	if(memberId.length<6 || memberId.length>10){
    		alert("아이디는 영어,숫자포함 6~10글자 이내로 입력하세요");
 	 	  	return false;
    	} */
    /* } */
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function execDaumPostcode() {
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
                    document.getElementById("memberDetailAddr").value = extraAddr;
                
                } else {
                    document.getElementById("memberDetailAddr").value = '';
                }
                $("#addr_btn").hide();
                $(".addr").show();
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('memberZipCode').value = data.zonecode;
                document.getElementById("memberAddr").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("memberDetailAddr").focus();
          		
                //높이조절
                var fieldAddress = document.querySelector(".field.adress");
                fieldAddress.style.height = "250px";
            }
        }).open();
    }
</script>
<%@ include file="/views/footer.jsp" %>