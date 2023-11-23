<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/header.jsp"%>



<style>
* {
	margin: 0;
	padding: 0;
}

.event-container {
	display: flex;
	flex-direction: column;
	align-items: center;
	line-height: 1;
	padding-top: 80px;
}

.header-container, .item-container {
	width: 1200px;
}

.header-title {
	margin-bottom: 30px;
	align-items: center;
}

.sub-title {
	margin-bottom: 30px;
	align-items: center;
}

.header-container {
	display: flex;
	flex-direction: column;
	align-items: center;
	margin-bottom: 20px;
}

.item-content {
	margin-bottom: 30px;
	align-items: center;
}

.title-container>.container {
	display: flex;
	width: 1200px;
	/* background-color: yellow; */
	flex-wrap: wrap;
	justify-content: space-evenly;
	margin-bottom: 20px;
}

.title-container>.container>.card {
	width: 29%;
	height: 430px;
	/* border: 1px solid red; */
	margin-bottom: 42px;
	boder-radius: 5px;
}

.form-outline input {
	width: 250px;
}

.item-img {
	height: 350px;
}

.item-img>img {
	width: 100%;
	height: 100%;
}

.item-content {
	display: flex;
	flex-direction: column;
	justify-content: center;
	height: 30%;
}

.eventImg {
	width: 320px;
	height: 340px;
}

.boardsearchAll {
	text-align: center;
}

.item-content {
	line-height: 10px;
}

.item-img {
	margin-bottom: 10px;
	text-align: center;
}
</style>

<div class="event-container">
	<div class="header-container">
		<div class="header-title">
			<h2>이벤트</h2>
		</div>
		<div class="sub-title">
			<p>이벤트 업데이트 중 입니다. 빠른시일내에 돌아오겠습니다.</p>
		</div>
	</div>
</div>
<div class="title-container">
	<div class="container">
		<div class="card">
			<div class="item-img">
				<a href="<%=request.getContextPath()%>/event.do"> <img
					class="eventImg"
					src="<%=request.getContextPath()%>/img/shuuuuuuu.jpg">
				</a>
			</div>
			<div class="item-content">
				<p>귀여운 슈 보고가세요</p>
				<br>
				<p>이름 : 슈</p>
			</div>
		</div>
	</div>
</div>
















<%@ include file="/views/footer.jsp"%>