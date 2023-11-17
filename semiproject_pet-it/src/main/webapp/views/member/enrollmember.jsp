<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/header.jsp" %>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');

	* {
	font-family: 'Noto Sans KR', sans-serif;
	}
	
	body {
        box-sizing: border-box;
        line-height:40px;
    }
    .enroll_title{
    	text-align:center;
    	margin-top: 50px;
    }
    
    .enroll{
    	text-align:left;
        width: 600px;
       	padding: 20px;
	    margin: 0px auto;
	    background: white;
	    border:1px solid lightgray;
	}
	
	.enroll div{
		margin-bottom: 20px;
	}
	.enroll input[type="text"],[type="password"],[type="email"]{
		width:300px;
	}
	/* section {
        text-align:center;
        width: 350px;
	    max-width: 1000px;
	    height: 600px;
	    padding: 20px;
	    margin: 0px auto;
	    background: white;
    } */
    .enroll .field{
    	
    }
    
    .field_addr input[type="text"]{
    	width: 300px;
    }
    .field_id{
    	display:flex;
    }
    
    .field input {
    	width: 300px;
    	height: 30px;
    	margin-bottom: 20px;
    }
    
    .checkbox-group {
    	width:580px;
    	border:1px solid;
    }
    
    .submit {
    	width: 300px;
    	align-self: center;
    }
    
    .modal {
    	width:360px;
   	    height:178px;
    	margin-bottom:0px;
    	position: fixed;
	  	top: 50%;
  		left: 50%;
    }
    
    .modal *{
     	width:100%;
     	height:100%;
    }
</style>
<div class="enroll_title"><h2>회원가입</h2></div>
<br>
<div class="enroll">
	<form action="<%=request.getContextPath()%>/member/enrollMemberEnd.do" method="post" onsubmit="return fn_membervalidate();">								
			<div class="field_id">	
				<div>
					<b>아이디</b>
				</div>
				<span>
					<input type="text" placeholder="아이디를 입력해주세요" name="memberId" id="memberId" >
				</span>
				<div>
					<button type="button" id="id_du"><span id="id_du_span">중복확인</span></button>
				</div>
			</div>
				<!-- 아이디 중복확인 -->
				<div class="modal fade">
				<div class="modal-dialog">
				<div class="modal-content">
					<!-- body -->
					<div class="modal-body">
					이 아이디는 사용가능해용ㅋ
					</div>
					<!-- Footer -->
					<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
					</div>	
			 	</div>
				</div>
				</div>
			<div class="field_pw">
				<b>패스워드</b>
				<span>
					<input type="password" placeholder="비밀번호를 입력해주세요" name="memberPw" id="memberPw" >
				</span>
			</div>
			<div class="field_pw2">
				<b>패스워드확인</b>
				<span>	
					<input type="password" placeholder="비밀번호를 한번 더 입력해주세요" id="memberPw2" >
				</span>
			</div>
			<div class="field_name">
				<b>이름</b>
				<span>	
				<input type="text" placeholder="이름을 입력해주세요"  name="memberName" id="memberName" >
				</span>
			</div>
			<div class="field_email">
				<b>이메일</b>
				<span>	
					<input type="email" placeholder="abc@xyz.com" name="memberEmail" id="memberEmail">
				</span>
			</div>
			<div class="field_phone">
				<b>휴대폰</b>
				<span>	
					<input type="text" placeholder="숫자만 입력해주세요" name="memberPhone" id="memberPhone">
				</span>
			</div>
			<div class="field_addr">
				<b>주소</b>	
					<input type="button" onclick="execDaumPostcode()" value="주소 검색"><br>
					<input type="text" id="memberZipCode" name="memberZipCode" placeholder="우편번호">
					<input type="text" id="memberAddr" name="memberAddr" placeholder="주소"><br>
					<input type="text" id="memberDetailAddr" name="memberDetailAddr" placeholder="상세주소">
			</div>
	
	<div class="checkbox-group">
    <!-- 첫 번째 동의 항목 -->
    <div class="checkbox-item">
        <label for="TermsAgreeAll">
            <input id="TermsAgreeAll" type="checkbox" class="checkbox-input" value="Y" name="memberTersm">
            <span>전체 동의합니다.</span>
        </label>
        <span class="description" style="font-size:12px">(선택항목에 동의하지 않은 경우도 회원가입 및 일반적인 서비스를 이용할 수 있습니다.)</span>
    </div>
	<div>
		<input type="checkbox" value="Y">
		<span>이용약관 동의(필수)</span>
		<a>약관보기</a>
	</div>
    <div>
		<input type="checkbox" value="Y">
		<span>개인정보 수집,이용 동의(필수)</span>
		<a>약관보기</a>
	</div>
	<div>
		<input name="memberAccept" type="checkbox" value="Y">
		<span>개인정보 수집,이용 동의(선택)</span>
		<a>약관보기</a>
	</div>
    </div>
	<input class="submit" type="submit" value="가입하기">
    <script>
    $(document).ready(function() {
        $('#TermsAgreeAll').change(function() {
            var isChecked = $(this).prop('checked');
            $('.checkbox-group input[type="checkbox"]').prop('checked', isChecked);
        });
    });
    var id_ck = 0;
	var memberId=$("memberId").val();
    
	<%-- $("#id_du").click(e=>{
		if($('[name="memberId"]').val() == 0){
			alert("아이디를 입력해주세요.");
		}else{
    	$.ajax({
    		url:"<%=request.getContextPath()%>/ajax/enrollmember.do",
    		type:"GET",
    		success:data=>{
    			function(data){
    				console.log("")
    			}
    		},
    		error:(r,e)=>{
    			console.log(r);
    			console.log(r.status);
    			console.log(e);
    		}
    	})
   	 });
	} --%>
	/* 모달창 스크립트 */
	$(function(){
		$("#id_du").click(function(){
			$('div.modal').modal({remote : 'modalLayer.jsp'
				});
			})
		})
    </script>
</form>
</div>
<script>
	$('form').submit(function(event){
		$.post('<%=request.getContextPath()%>/member/enrollMemberEnd.do')		
	});
	
    const fn_membervalidate=()=>{
    	const memberId=$("#memberId").val().trim();
    	if(memberId.length<6 || memberId.length>10){
    		alert("아이디는 영어,숫자포함 6~10글자 이내로 입력하세요");
 	 	  	return false;
    	}
    	
    	
    }
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
                
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('memberZipCode').value = data.zonecode;
                document.getElementById("memberAddr").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("memberDetailAddr").focus();
            }
        }).open();
    }
</script>
<%@ include file="/views/footer.jsp" %>