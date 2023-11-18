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
   
   .field_info {
   		width:460px;
   		height:200px;
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
			<a href="<%=request.getContextPath()%>/find/id.do">아이디 찾기</a>
		</li>
		<li>
			<a href="<%=request.getContextPath()%>/find/pw.do">비밀번호 찾기</a	>
		</li>
	</ul>
	<form action="<%=request.getContextPath()%>/mail.do" method="get" onsubmit="">								
			<div class="field_info">
					<div class="field_idnav"><span>회원님의 아이디는[__________]입니다.</span></div>
			</div>
			<br><br>
  		  <button type="button" id="clsoe" class="btn btn-outline-primary" style="width:460px; height:40px;"><span>로그인</span></button>
		</form>
</div>
<script>
	
	
</script>

<%@ include file ="/views/footer.jsp" %>