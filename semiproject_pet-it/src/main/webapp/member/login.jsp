<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../views/header.jsp"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<style>
	body {
        box-sizing: border-box;
    }
    
	section {
        text-align:center;
        width: 350px;
	    max-width: 1000px;
	    height: 600px;
	    padding: 20px;
	    margin: 0px auto;
	    background: white;
    }
    .form-group {
        margin-bottom: 10px;
    }

    .input-field {
        width: 100%;
        padding: 10px;
    }

    .btn {
        width: 100%;
        height: 35px;
    }

    .find-member {
        margin-top:0px;
    }

    .find-member a {
        margin-right: 15px;
    }
    
    
    hr{
    	margin-bottom : 20px;
    }
</style>

<section id=container>
		<div class="login-container">
        <h2>로그인</h2>
        <form id="loginFrm" action="<%=request.getContextPath()%>/login.do" method="post">
            <div class="form-group">
                <input type="text" name="userId" placeholder="아이디" class="form-control" style="width:300px;">
            </div>
            <div class="form-group">
                <input type="password" name="password" placeholder="비밀번호" class="form-control" style="width:300px;">
            </div>
            <input type="submit" class="btn btn-primary btn-sm" style="width:300px; height:35px;" value="로그인">
        </form>
        <input type="button" class="btn btn-outline-primary" style="width:300px; height:35px" onclick="location.assign('<%=request.getContextPath()%>/enrollView.do');"
        	value="회원가입">
        <div class="find-member">
            <a class="forgot-id" href="<%=request.getContextPath()%>/find/id.do">아이디 찾기</a>
            <a class="forgot-pw" href="<%=request.getContextPath()%>/find/pw.do">비밀번호 찾기</a>
        </div>
        <hr>
        <div class="sns-login">
            <h4 style="font-size:18px">SNS간편 로그인</h4>
            <a href="javascript:kakaoLogin()"><img src="../img/kakao_login.png" style="width: 300px"></a>
            <div id="naver_id_login"><img src="../img/naver_login.png" style="width: 300px; height:45px"></div>
            <!-- <span class="btn btn-success" style="width:300px; height:45px">네이버 로그인</span> -->
        </div>
    </div>
</section>

<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">
/* 카카오 로그인 */
Kakao.init('6014fee111349e7f74291c3efcd85575');
function kakaoLogin() {
    Kakao.Auth.login({
        success: function (response) {
            Kakao.API.request({
                url: '/v2/user/me',
                success: function (response) {
                    alert(JSON.stringify(response))
                },
                fail: function (error) {
                    alert(JSON.stringify(error))
                },
            })
        },
        fail: function (error) {
            alert(JSON.stringify(error))
        },
    })
}

/* 네이버 로그인 */
	var naver_id_login = new naver_id_login("fR0lnpixp0NakyK32xPp", "http://localhost:9090/semiproject_pet-it/views/index.jsp");
	var state = naver_id_login.getUniqState();
	naver_id_login.setButton("white", 2,40);
	naver_id_login.setDomain(".service.com");
	naver_id_login.setState(state);
	naver_id_login.setPopup();
	naver_id_login.init_naver_id_login();
</script>
<%@ include file="../views/footer.jsp"%>