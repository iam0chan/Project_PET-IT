<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="/views/header.jsp" %>
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
   
   .field_name{
   		margin-bottom: 20px;
   }
   
   
   .field_info input{
   		width:460px;
   		height:60px;
   }
   
   .id_btn{
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
				<div class="field_name">	
					<span>
						<input type="text" placeholder="아이디를 입력해주세요" name="memberName" id="memberName">
					</span>
				</div>
				<div>
					<button type="button" class="id_btn btn btn-outline-primary"><span>확인</span></button>
				</div>
			</div>
			<br>
			<div class="field">
				<p style="font-size: 14px; margin:0;">정보보호를위해 '로봇이 아닙니다.'를 눌러 진행해주세요</p>
			</div>  
			<div class="google_recaptcha">
				<div class="g-recaptcha" data-sitekey="6LfacRIpAAAAAMukAVLPDf5l4oaO-YWzOatMIywW"></div>
				<script src='https://www.google.com/recaptcha/api.js'></script>
			</div>
		</form>
</div>
<script>
	
	
</script>

<%@ include file ="/views/footer.jsp" %>