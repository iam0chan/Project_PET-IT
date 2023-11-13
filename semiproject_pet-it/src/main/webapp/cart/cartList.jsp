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
		<table border="0" summary
			class="xans-element- xans-order xans-order-normnormal xans-record-">

			<!-- 메뉴바 크기 조정 -->
			<colgroup>
				<col style="width: 27px">
				<col style="width: 92px">
				<col style="width: auto">
				<col style="width: 98px">
				<col style="width: 75px">
				<col style="width: 98px">
				<col style="width: 98px">
				<col style="width: 85px">
				<col style="width: 98px">
				<col style="width: 110px">
			</colgroup>
			<!-- 장바구니 메뉴 바 생성 -->
			<thead>
				<tr>
					<th scope="col"><input type="checkbox"
						onclick="Basket.setCheckBasketList('basket_product_normal_type_normal', this);">
					</th>
					<th scope="col">이미지</th>
					<th scope="col">상품정보</th>
					<th scope="col">판매가</th>
					<th scope="col">수량</th>
					<th scope="col" class="mileage">적립금</th>
					<th scope="col">배송 구분</th>
					<th scope="col">배송비</th>
					<th scope="col">합계</th>
					<th scope="col">선택</th>
				</tr>
			</thead>
			<tfoot class="right">
				<tr>
					<td colspan="10">상품구매금액 <strong>10,000<span
							class="displaynone"></span></strong> <span>원</span> + 배송비 : <span
						id="normal_normal_ship_fee">2,500</span> <span
						id="normal_normal_benefit_price_area" class="displaynone">
							- 상품 할인 금액 <span id="normal_normal_benefir_price">0</span>
					</span> = 합계 : <strong class="txtEm gIndent10"> <span
							id="normal_normal_ship_fee_sum" class="txt18">4,700</span> 원
					</strong> <span class="displaynone"> </span>
					</td>
				</tr>
			</tfoot>
			<tbody class="xans-element- xans-order xans-order-list center">
				<tr class="xans-record-">
					<td><input type="checkbox" id="basket_chk_id_0"
						name="basket_product_normal_type_normal"></td>
					<td class="thumb gClearLine"><strong class="thumb gClearLine">
							<a href=""> <img src="" alt="dog_feed"></a></td>
					<td class="left gClearLine"><strong class="name"> <a
							href="" class="ec-procuct-name">주인도 탐내는 유기농 사료</a>
					</strong>
					<td class="right">
						<!-- line-throught 이용해서 할인 금액 넣기 -->
						<div id="product_price_div0" class>
							<strong>30,000원</strong>
							<p class="displaynone"></p>
						</div>

					</td>
					<td>
						<!-- 수량 증감 버튼 생성 --> <span class> <span class="ec-base-qty">
								<input id="quantity_id_0" name="quantity_name=0" size="2"
								value="1" type="text"> <a href="javascript:;" class="up"
								onclick="Basket.addQuantityShortcut('quantity_id_0', 0);"> <img
									src="//img.echosting.cafe24.com/skin/base/common/btn_quantity_up.gif"
									alt="수량증가">
							</a> <a href="javascript:;" class="down"
								onclick="Basket.outQuantityShortcut('quantity_id_0', 0);"> <img
									src="//img.echosting.cafe24.com/skin/base/common/btn_quantity_down.gif"
									alt="수량감소">
							</a>
						</span> <a href="javascript:;" class="btnNormal gBlank5"
							onclick="Basket.modifyQuantity()">변경</a>
					</span> <span class="displaynone">1</span>
					</td>
					<td><span id="product_mileage0" class="txtInfo0"> <input
							id="product_mileage_cash" name="product_miileage_cash" value="60"
							type="hidden"> 30원<br>
					</span></td>
					<td>
						<div class="txtInfo">
							기본배송<br>
						</div>
					</td>
					<td rowspan="1" class>
						<p class>
							2,500원 <span class="displaynone"><br></span>
					<td class="right"><strong> <span
							id="sum_price_front0">32,500</span>원
					</strong>
						<div class="displaynone"></div></td>
					<td class="button"><a href="javascript:;" class="btnSubmit "
						onclick="Basket.orderBasketItem(0);">주문하기</a><br> <a
						href="javascript:;" class="btnNormal"
						onclick="BasketNew.moveWish(0);">관심상품등록</a> <br><a href="javascript:;"
						class="btnNormal" onclick="Basket.deleteBasketItem(0);"> <i
							class="icoDelete">  </i> 삭제 </span> </span>
					</a></td>
				</tr>
			</tbody>
		</table>
	</div>