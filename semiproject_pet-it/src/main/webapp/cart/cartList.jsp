<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/header.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>장바구니</title>
<style>
body {
	text-align: center;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 20px;
}

th, td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: center;
}

th {
	background-color: #f2f2f2;
}

img {
	max-width: 100px;
	max-height: 100px;
}

div button {
	background-color: light gray;
	color: black;
	padding: 5px;
	cursor: pointer;
	border-radius: 10px;
	border: 1px solid gray;
}

div button:hover {
	background-color: #04aa6d;
	color: #ffffff;
	border: 1px solid gray;
}

.quantity-container {
	display: flex;
	align-items: center;
}

.quantity-input {
	width: 40px;
	text-align: center;
	margin: 0 5px;
}
</style>
</head>
<body>

	<h3>장바구니</h3>

	<h6>
		회원님은 <strong>[silver]</strong>등급입니다.
	</h6>

	<table>
		<thead>
			<tr>
				<th>선택</th>
				<th>이미지</th>
				<th>상품정보</th>
				<th>판매가</th>
				<th>수량</th>
				<th>적립금</th>
				<th>배송비</th>
				<th>합계</th>
				<th>선택</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><input type="checkbox"></td>
				<td><img src="<%=request.getContextPath()%>/images/cat_chu.jpg"></td>
				<td>츄르를 손쉽게 먹이는 마법의 스푼</td>
				<td>10,000원</td>
				<td><input type="number" value="1" min="1"></td>
				<td>10원</td>
				<td>2,500원</td>
				<td>12,500원</td>
				<td>
					<button onclick="productOrder()">주문</button>

					<button onclick="addToWishlist()">찜</button>
				</td>
			</tr>
			<!-- 상품 추후에 추가하자 -->
		</tbody>
	</table>

	<div>
		<button onclick="deleteSelectedProduct()">선택 상품 삭제</button>
		<button onclick="productOrder()">전체 상품 주문</button>
		<button onclick="continueShopping()">쇼핑 계속하기</button>
	</div>



	<!-- 내용은 추후에 추가하자 -->

	<script>
		function deleteSelectedProduct() {
			alert("선택한 상품이 삭제되었습니다.");
		}

		/* 	function continueShopping() {
				// 쇼핑 계속하기 로직 추가-> 상품페이지로 이동
				alert("즐거운 쇼핑하세요 !");
			} */

		function increaseQuantity() {
			// 수량 증가
			var quantityInput = document.getElementById('quantity-input');
			quantityInput.value = parseInt(quantityInput.value) + 1;
		}

		function decreaseQuantity() {
			// 수량 감소
			var quantityInput = document.getElementById('quantity-input');
			if (parseInt(quantityInput.value) > 1) {
				quantityInput.value = parseInt(quantityInput.value) - 1;
			}
		}
	</script>
	<tr>
		<td colspan="7" style="text-align: center;">총 상품금액</td>

		<td>0000원 +</td>
		<td></td>
	</tr>
	<tr>
		<td colspan="7" style="text-align: right;">배송비</td>
		<td>2,500원</td>
		<td></td>
	</tr>
	<tr>
		<td colspan="7" style="text-align: right; font-weight: bold;">=
			결제예정금액</td>
		<td style="font-weight: bold;">0000원</td>
		<td></td>
	</tr>


</body>
</html>





<%@ include file="/views/footer.jsp"%>