<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/header.jsp"%>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');

	* {
	font-family: 'Noto Sans KR', sans-serif;
	}
	body {
    box-sizing: border-box;
    line-height:40px;
    	}
    
    .findId{
    text-align:center;
  	width: 700px;
    border: 1px solid #000;
    margin: auto; /*중앙 정렬*/
    /* padding: 0 20px; */
/*     margin-bottom: 20px; */
    height:500px;
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
   
   .field_info{
   		width:460px;
   		height:50px;
   		border:1px solid;
   		display: inline-block;
   	 	align-items: center; /* 가로 중앙 정렬 */
    	justify-content: center; /* 세로 중앙 정렬 */
   }
  	.field_idnav {
    
    
	}
   
   .google_recaptcha {
   		width:460px;
   }
   
   .google_recaptcha>*{
   		width:100%;
/*    		display:flex; */
   }
   
</style>

<div class="findId">
	<ul class="title">
		<li>
			<a href="<%=request.getContextPath()%>/findId.do">아이디 찾기</a>
		</li>
		<li>
			<a href="<%=request.getContextPath()%>/findPw.do">비밀번호 찾기</a	>
		</li>
	</ul>
	<form action="<%=request.getContextPath()%>/mailPw.do" method="get">								
			<span>이메일로 발송된 회원님의 인증번호를 입력해주세요.</span>
			<br>
					<input type="text" placeholder="인증번호" style="width:460px; height:50px; text-align:center;" name="memberEmail_code" id="memberEmail_code">
					<div class="pwFindView"></div>
		  <br><br>
  		  <button type="button" id="memberEmail_check" class="btn btn-outline-primary" style="width:460px; height:40px;">인증번호확인</button>
  		  <button type="button" id="memberEmail_recheck" class="btn btn-outline-primary" style="width:460px; height:40px; display:none;" onclick="location.reload()">인증다시받기</button>
		  <button type="button" id="memberEmail_login" class="btn btn-outline-primary" style="width:460px; height:40px; display:none;" onclick="location.assign('<%=request.getContextPath()%>/loginView.do');">로그인</button>
	</form>
</div>
<script>
$(document).ready(function() {
    $("#memberEmail_check").click(function(){
      const memberEmailCode = $('#memberEmail_code').val();
      var emailCode = "<%=request.getAttribute("emailCode")%>";
      
      if(memberEmailCode === emailCode){ 
       	location.assign('<%=request.getContextPath()%>/newPw.do');
      } else {
        $('.pwFindView').html('인증번호가 일치하지 않습니다');
        $("#memberEmail_recheck").show();
      }
      $("#memberEmail_check").hide();
      $("#email_nav").hide();
      $("#memberEmail_code").hide();
      $(".idFind_view").show();
    });
  });
</script>

<%@ include file ="/views/footer.jsp" %>