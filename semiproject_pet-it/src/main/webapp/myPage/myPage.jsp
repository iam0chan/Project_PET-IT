<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../views/header.jsp"%>
<style>
.title {
	color: #000;
	box-sizing: border-box;
	font-family: 'Roboto', 'Noto Sans KR', sans-serif;
	letter-spacing: -.5px;
	font-weight: 300;
	font-size: 17px;
	padding: 11px 21px;
	margin: 0;
	border-bottom: 1px solid #e8e8e8;
	background: #f6f6f6;
}

.state {
	font-size: 16px;
	color: #000;
	box-sizing: border-box;
	font-family: 'Roboto', 'Noto Sans KR', sans-serif;
	letter-spacing: -.5px;
	font-weight: 300;
	margin: 0;
	overflow: hidden;
	padding: 19px 0;
}

.xans-myshop=orderstate.order li{
float: left;
width: 25%;
padding: 0 0 4px;
margin: 0 -1px 0 0;
border-right: 1px dotted #c9c7ca;
test-align: center;

}


    
    
/* .xans-myshop-orderstate{
border: 1px solid #777;
}
 */
.description {
	color: #333;
	box-sizing: border-box;
	font-family: 'Roboto', 'Noto Sans KR', sans-serif;
	letter-spacing: -.5px;
	font-weight: 300;
	margin: 0;
	display: table-cell;
	padding: 0 30px;
	width: auto;
	line-height: 1.5em;
	vertical-align: middle;
	font-size: 18px;
	text-align: center;
}
</style>
<div class="description">
	<strong
		style="font-size: 20px; margin-bottom: 18px !important; margin-top: 6px; font-weight: 400 !important;">pet-it을
		이용해주셔서 감사합니다.</strong>
</div>
<div class="xans-element- xans-myshop xans-myshop-orderstate ">
	<div class="title">
		<h3>주문처리 현황</h3>
	</div>

	<div class="state">
		<ul class="order">
			<li><strong>입금 전</strong> <!-- 관리자 페이지에서 배송 현황 넘기기 --> <a
				href="/" class="count"> <span
					id="xans_myshop_orderstate_shppied_before">0</span>
			</a></li>
			<li><strong>배송 준비중</strong> <a href="/" class="count"></a> <span
				id="xans_myshop_orderstate_shppied_standby">0</span> </a></li>
			<li><strong>배송중</strong> <a href="/" class="count"></a> <span
				id="xans_myshop_orderstate_shppied_begin">0</span> </a></li>
			<li><strong>배송 완료</strong> <a href="/" class="count"></a> <span
				id="xans_myshop_orderstate_shppied_complate">0</span> </a></li>
		</ul>





		</ul>
	</div>