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
    
    .findPw{
    text-align:center;
  	width: 700px;
    border: 1px solid #000;
    margin: auto;
    height:500px;
    }

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
   
   .findPw{
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
   
   .field_pw #newPw{
   		border-width: 1px 1px 0px 1px;
   }
   
   .field_pw2 #newPw2{
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

<div class="findPw">
	<ul class="title">
		<li>
			<a href="<%=request.getContextPath()%>/findId.do">아이디 찾기</a>
		</li>
		<li>
			<a href="<%=request.getContextPath()%>/findPw.do">비밀번호 찾기</a>
		</li>
	</ul>
	<form action="<%=request.getContextPath()%>/newPwSave.do" method="get">								
			<span>회원님의 비밀번호를 변경해주세요</span>
			<div class="field_pw">
				<div class="field_pw1">
					<span>
						<input type="password" placeholder="  새비밀번호를 입력해주세요" name="newPw" id="newPw" style="width:460px; height:50px;">
					</span>
				</div>
				<div class="field_pw2">
					<span>
						<input type="password" placeholder="  새비밀번호를 다시 입력해주세요" name="newPw2" id="newPw2" style="width:460px; height:50px;">
					</span>
				</div>
			</div>
			<br>
		  <br><br>
  		  <button type="button" id="memberEmail_check" class="btn btn-outline-primary newPw_save" style="width:460px; height:40px;">비밀번호변경</button>
	</form>
	
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
</div>
<script>
const newPw = $('#newPw').val();
const newPw2 = $('#newPw2').val();

$(document).ready(function() {
    $(".newPw_save").click(function(){
    	$.ajax({
			type:"POST",
			url: "<%=request.getContextPath()%>/newPwCheck.do",
			data:{newPw:newPw},
			success:function(result){
				console.log(result);
				if(result=='0'){  // id가 checkMessage인 것에 아래 텍스트 출력
					$('.modal-body').html('새비밀번호를 입력해주세요');
				} else if(result=='-1'){
					$('.modal-body').html('새비밀번호 확인을 입력해주세요');
				}else if(result=='-2'){
					$('.modal-body').html('비밀번호는 8~12자이내로 입력해주세요');
				} else if(result=='1'){
					$('.modal-body').html('비밀번호가 변경되었습니다');
				}
			$("#idcheck_modal").modal("show");
			}
		})
		})
	});
      
    });
  });
</script>

<%@ include file ="/views/footer.jsp" %>