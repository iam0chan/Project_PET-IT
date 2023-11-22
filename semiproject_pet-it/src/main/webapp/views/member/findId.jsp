<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="/views/header.jsp" %>
<%String id=(String)session.getAttribute("memberId");%>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');

	* {
	font-family: 'Noto Sans KR', sans-serif;
	}
	body {
    box-sizing: border-box;
    line-height:40px;
    	}
    .quote_btn-container{
		width:534.475px;
		height:80px;
	}
	.navbar {
		height:130px;
	}
    .footer_section{
    	height:130px;
    }	
    
    .findId{
    text-align:center;
  	width: 700px;
    border: 1px solid #000;
    margin: auto; /*중앙 정렬*/
    /* padding: 0 20px; */
/*     margin-bottom: 20px; */
    height:500px;
    background-color: #f7f7f7;
    }
/*     .findId .title{
    	border:1px solid;
    } */
    .title{
    	display:flex;
    	justify-content:space-evenly;
		list-style-position: outside;
		margin-bottom:50px;
		padding:0;
    }
    .title>li{
    	display:flex;
    	justify-content:center;
    	list-style-type:none;

    }
    .title>li,.title>li>a{
    	width:100%;
    	height:70px;
    	display: flex;
        align-items: center; /* 세로 중앙 정렬 추가 */
        justify-content: center;	
   }
   
   .title>li:first-child>a{
   		border-right:1px solid lightgray;
   }
   
   .findId{
   		border-color:lightgray;
   }
   
   .field input{
   		height: 30px;
   }
   
   .g-recaptcha{
   		display:flex;
   		justify-content:center;
   }
   .title{
   		border-bottom: 1px solid lightgray;
   }
   
   .field_name #memberName{
   		border-width: 1px 1px 0px 1px;
   }
   
   .field_email #memberEmail{
   		border-width: 1px 1px 1px 1px;
   }
   
   .field_info input{
   		width:460px;
   		height:60px;
   }
   
   .google_recaptcha {
   		width:460px;
   }
   
   .google_recaptcha>*{
   		width:100%;
/*    		display:flex; */
   }
   .id_btn{
   		width:460px;
   		height:60px;
   }
   
</style>
<div class="findId">
	<ul class="title">
		<li>
			<a href="<%=request.getContextPath()%>/find/id.do">아이디 찾기</a>
		</li>
		<li>
			<a href="<%=request.getContextPath()%>/find/pw.do">비밀번호 찾기</a	>
		</li>
	</ul>							
			<!--  -->
			<div class="field_info st">
				<div class="field_name">	
					<span>
						<input type="text" placeholder="이름을 입력해주세요" name="memberName" id="memberName">
					</span>
				</div>
				<div class="field_email">
					<span>
						<input type="email" placeholder="이메일을 입력해주세요" name="memberEmail" id="memberEmail" >
					</span>
				</div>
				<br><br>
				<div class="field">
					<p style="font-size: 14px">정보보호를위해 '로봇이 아닙니다.'를 눌러 진행해주세요</p>
				</div>  
				<div class="google_recaptcha">
					<div class="g-recaptcha" data-sitekey="6LfacRIpAAAAAMukAVLPDf5l4oaO-YWzOatMIywW"></div>
					<script src='https://www.google.com/recaptcha/api.js'></script>
				</div>
				<div class="btn_house">
	  		  		<input type="button" class="id_btn btn btn-outline-primary" id="btn_st" style="height:40px;" value="인증번호 받기">
				</div>
			</div>
			<!--  -->
			<div class="field_info nd" style="display:none;">
				<span>이메일로 발송된 회원님의 인증번호를 입력해주세요.</span><br>
				<input type="text" placeholder="인증번호" style="width:460px; height:50px; text-align:center;" name="memberEmail_code" id="memberEmail_code">
				<div class="idFindView"></div>
				<br><br>
  		   		<button type="button" id="memberEmail_check" class="btn btn-outline-primary" style="width:460px; height:40px;">인증번호 확인</button>
				<br><br>
				<div class="field">
					<p style="font-size: 14px">정보보호를위해 '로봇이 아닙니다.'를 눌러 진행해주세요</p>
				</div>  
				<div class="google_recaptcha">
					<div class="g-recaptcha" data-sitekey="6LfacRIpAAAAAMukAVLPDf5l4oaO-YWzOatMIywW"></div>
					<script src='https://www.google.com/recaptcha/api.js'></script>
				</div>
				<div class="btn_house">
	  		  		<input type="button" class="id_btn btn btn-outline-primary" id="btn_nd" style="height:40px;" value="인증번호 받기">
				</div>
			</div>
			<!--  -->
			<div class="field_info rd" style="display:none;">
					<div class="field_idnav">테스트트트</div>
					<br><br>
				<div class="field">
					<p style="font-size: 14px">정보보호를위해 '로봇이 아닙니다.'를 눌러 진행해주세요</p>
				</div>  
				<div class="google_recaptcha">
					<div class="g-recaptcha" data-sitekey="6LfacRIpAAAAAMukAVLPDf5l4oaO-YWzOatMIywW"></div>
					<script src='https://www.google.com/recaptcha/api.js'></script>
				</div>
				<div class="btn_house">
	  		  		<input type="button" class="id_btn btn btn-outline-primary" id="btn_rd" style="height:40px;" value="인증번호 받기">
				</div>
			</div>
</div>
<script>

var cPath = "${pageContext.request.contextPath}";
const name = $("#memberName").val();
const email = $("memberEmail").val();
const emailCode = $('#memberEmail_code').val();


$(document).ready(function() {
    $("#btn_st").click(function() {
    	const memberEmailCode = $('#memberEmail_code').val();
    	
    	$.ajax({
            type: "GET",
            url: cPath + "/idFind/idCheck.do",
            data: {
                memberName: "여기에 멤버 이름 값",
                memberEmail: "여기에 멤버 이메일 값",
            },
            success: function(response) {
                if (response && response.memberId) {
                    // memberId가 반환된 경우 성공적인 로직 추가

                    // 세션에서 받아온 memberId
                    const savedMemberId = response.memberId;

                    // 예시: 받아온 memberId를 어딘가에 표시하거나 활용
                    alert("Saved Member ID: " + savedMemberId);

                    // 여기에 추가적인 로직을 추가할 수 있습니다.
                } else if (response && response.error) {
                    // 오류 메시지가 반환된 경우 오류 처리 로직 추가
                    console.error("Error:", response.error);

                    // 예시: 오류 메시지를 어딘가에 표시
                    alert("Error: " + response.error);

                    // 여기에 오류 발생 시 추가적인 처리를 할 수 있습니다.
                } else {
                    console.error("Unexpected response:", response);

                    // 예상치 못한 응답에 대한 처리를 여기에 추가
                }
            },
            error: function(error) {
                console.error("AJAX 요청 실패:", error);
            }
        });
    });

    $("#btn_nd").click(function() {});

    $("#btn_rd").click(function() {});
    
    });
    
</script>














<%@ include file ="/views/footer.jsp" %>