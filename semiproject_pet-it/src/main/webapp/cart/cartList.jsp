<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../views/header.jsp"%>

<style>
.mainTitle {
	font-size: 44px;
	line-height: 54px;
	font-weight: 200;
	margin-bottom: 10px !important;
}

img {
	margin: content-box;
	overflow: clip;
}

section {
	padding-top: 80px;
	margin: 0 auto;
	display: flex;
	flex-direction: column;
	align-items: center;
	text-align: center;
	width: 1200px;
}

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

ul.mileage {
	color: #333;
	line-height: 1.5em;
	text-align: center;
	box-sizing: border-box;
	font-family: 'Roboto', 'Noto Sans KR', sans-serif;
	letter-spacing: -.5px;
	font-weight: 300;
	margin: 6px auto;
	padding: 0;
	border-top: 1px solid #e8e8e8;
	width: 400px;
	font-size: 20px;
}

ul>li {
	color: #333;
	line-height: 1.5em;
	font-size: 20px;
	box-sizing: border-box;
	font-family: 'Roboto', 'Noto Sans KR', sans-serif;
	letter-spacing: -.5px;
	font-weight: 300;
	padding: 0;
	list-style: none;
	float: left;
	margin: 15px 40px 0 0;
}

img {
	display: block;
	width: 80%;
	height: 80px;
	margin: auto;
}

.cart {
	width: 80%;
	margin: auto;
	padding: 30px;
}

.cart ul {
	background-color: whitesmoke;
	padding: 30px;
	margin-bottom: 50px;
	border: whitesmoke solid 1px;
	border-radius: 5px;
	font-size: 13px;
	font-weight: 300;
}

.cart ul :first-child {
	color: limegreen;
}

table {
	border-top: solid 1.5px black;
	border-collapse: collapse;
	width: 100%;
	font-size: 14px;
}

thead {
	text-align: center;
	font-weight: bold;
}

tbody {
	font-size: 12px;
}

td {
	padding: 15px 0px;
	border-bottom: 1px solid lightgrey;
}

.cart__list__detail :nth-child(3) {
	vertical-align: top;
}

.cart__list__detail :nth-child(3) a {
	font-size: 12px;
}

.cart__list__detail :nth-child(3) p {
	margin-top: 6px;
	font-weight: bold;
}

.cart__list__smartstore {
	font-size: 12px;
	color: gray;
}

.cart__list__option {
	vertical-align: top;
	padding: 20px;
}

.cart__list__option p {
	margin-bottom: 25px;
	position: relative;
}

.cart__list__option p::after {
	content: "";
	width: 90%;
	height: 1px;
	background-color: lightgrey;
	left: 0px;
	top: 25px;
	position: absolute;
}

.cart__list__optionbtn {
	background-color: white;
	font-size: 10px;
	border: lightgrey solid 1px;
	padding: 7px;
}

.cart__list__detail :nth-child(4), .cart__list__detail :nth-child(5),
	.cart__list__detail :nth-child(6) {
	border-left: 2px solid whitesmoke;
}

.cart__list__detail :nth-child(5), .cart__list__detail :nth-child(6) {
	text-align: center;
}

.cart__list__detail :nth-child(5) button {
	background-color: limegreen;
	color: white;
	border: none;
	border-radius: 5px;
	padding: 4px 8px;
	font-size: 12px;
	margin-top: 5px;
}

.price {
	font-weight: bold;
}

.cart__mainbtns {
	width: 420px;
	height: 200px;
	padding-top: 40px;
	display: block;
	margin: auto;
}

.cart__bigorderbtn {
	width: 200px;
	height: 50px;
	font-size: 16px;
	margin: auto;
	border-radius: 5px;
}

.cart__bigorderbtn.left {
	background-color: white;
	border: 1px lightgray solid;
}

.cart__bigorderbtn.right {
	background-color: white;
	color: #000000;
	border: 1px #04aa6d solid;
	transition: background-color 0.3s;
}

.cart__bigorderbtn.right:hover {
	background-color: #04aa6d;
	color: #ffffff;
	border: 1px lightgray solid;
}
</style>

<section>
	<div class="titleArea">
		<h2>장바구니</h2>
	</div>
	<div class="information">
		<div class="description">
			<div class="member ">
				<b><strong><p align="center">
							<strong
								style="font-size: 20px; margin-bottom: 18px !important; margin-top: 6px; font-weight: 400 !important;">김도영</strong>
							님은, <strong>[Silver]</strong> 회원이십니다.
						</p></strong></b>
			</div>
			<ul class="mileage" style="width: 400px; font-size: 20px;">
				<li><a href="" style="color: #04aa6d;">가용적립금 : <strong>2,000원</strong></a></li>
				<li style="margin: 15px auto 10px 96px !important; float: right;"><a
					href="" style="color: #04aa6d;">쿠폰 : <strong>2개</strong></a></li>
			</ul>

		</div>
	</div>
	<table class="cart__list">
		<form>
			<thead>
				<tr>
					<td><input type="checkbox"></td>
					<td>이미지</td>
					<td colspan="2">상품정보</td>
					<td>판매가</td>
					<td>수량</td>
					<td>적립금</td>
					<td>배송비</td>
					<td>합계</td>
					<td>선택</td>
				</tr>
			</thead>
			<tbody>
				<tr class="cart__list__detail">
					<td><input type="checkbox"></td>
					<td><img src="../img/" alt="dog_feed"></td>
					<!-- 상품 리스트로 이동하게끔 주소 넣기 -->
					<td><a href="#" style="color: #04aa6d;">pet-it</a>
						<p>너무 맛있어서 주인도 탐내는 유기농 사료</p></td>
					<td><span class="price">30,000원</span><span
						style="text-decoration: line-through; color: lightgray;">32,000원</span>
					</td>
					<td style="width: 15%;">무료</td>

				</tr>
				<tr class="cart__list__detail">
					<td style="width: 2%;"><input type="checkbox"></td>
					<td style="width: 13%;"><img src="../img/" alt="cat_chu">
					</td>
					<td style="width: 27%;"><a href="#" style="color: #04aa6d;">pet-it</a>
						<p>츄르릅 츄르</p>
					<td><sapn class="price">8,000원</sapn><span
						style="text-decoration: line-through; color: lightgray;">8,500원</span>
					</td>


					<td style="width: 15%;">무료</td>
				</tr>
			</tbody>
			<tfoot>

				<tr>
					<td colspan="3"><input type="checkbox">
						<button class="cart__list__optionbtn">선택상품 삭제</button></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</tfoot>
		</form>
	</table>
	<div class="cart__mainbtns">
		<button class="cart__bigorderbtn left">쇼핑 계속하기</button>
		<button class="cart__bigorderbtn right">주문하기</button>
	</div>
</section>

<%@ include file="../views/footer.jsp"%>
