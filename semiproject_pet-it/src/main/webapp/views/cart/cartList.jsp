<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="/views/header.jsp"%>
<%@ page import="java.util.List, com.pet.cart.model.dto.Cart" %>
<%
List<Cart> cart = (List<Cart>) request.getAttribute("cartList");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<title>장바구니</title>
<style>
body {
	text-align: center;
}

section {
	font-size: 16px;
	color: #000;
	box-sizing: border-box;
	letter-spacing: -.5px;
	font-weight: 300;
	padding: 0;
	width: 100%;
	min-width: 1265px;
	max-width: 1000px;
	margin: 0 auto;
	position: relative;
	padding-bottom: 50px;
}

h3 {
	margin-bottom: 10px;
}

table {
	font-size: 16px;
	padding: 0;
	box-sizing: border-box;
	letter-spacing: -.5px;
	font-weight: 300;
	width: 100%;
	border: 0;
	border-spacing: 0;
	border-collapse: collapse;
	position: relative;
	border-bottom: 1px solid #e8e8e8;
	line-height: 1.5;
	border-top: 1px solid #e8e8e8;
	margin: 0;
}

th, td {
	padding: 8px;
	text-align: center;
}

th {
	font-size: 14px;
	border-spacing: 0;
	border-collapse: collapse;
	line-height: 1.5;
	box-sizing: border-box;
	letter-spacing: -.5px;
	margin: 0;
	border: 0;
	word-break: break-all;
	word-wrap: break-word;
	padding: 8px 0 8px;
	border-bottom: 1px solid #e8e8e8;
	color: rgb(94, 94, 94);
	vertical-align: middle;
	font-weight: normal;
	border-left: 0;
}

img {
	max-width: 100px;
	max-height: 100px;
}

div button {
	background-color: light gray;
	color: black;
	padding: 1px;
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

.button {
	font-size: 16px;
	border-spacing: 0;
	border-collapse: collapse;
	line-height: 1.5;
	text-align: center;
	box-sizing: border-box;
	letter-spacing: -.5px;
	font-weight: 300;
	margin: 0;
	border: 0;
	border-top: 1px solid #e8e8e8;
	color: #333;
	vertical-align: middle;
	word-break: keep-all;
	word-wrap: break-word;
	padding: 18px 15px;
	padding-left: 0;
	padding-right: 0;
	border-color: #e8e8e8;
}

td.button>a {
	border-spacing: 0;
	text-decoration: none !important;
	display: inline-block;
	padding: 6px 8px;
	border: 1px solid transparent;
	font-size: 13px;
	line-height: 17px;
	font-weight: normal;
	vertical-align: middle;
	word-spacing: -0.5px;
	letter-spacing: 0;
	text-align: center;
	white-space: nowrap;
	color: #fff;
	background-color: rgb(52, 152, 219);
	border-radius: 3px;
	width: 104px;
	margin: 1px 0;
}

.count {
	font-size: 16px;
	border-spacing: 0;
	border-collapse: collapse;
	line-height: 1.5;
	text-align: center;
	color: #333;
	word-break: keep-all;
	word-wrap: break-word;
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	letter-spacing: -.5px;
	font-weight: 300;
}

.update_cnt {
	display: inline-block;
	padding: 6px 8px;
	border: 1px solid #d1d1d1;
	font-size: 14px;
	line-height: 17px;
	font-weight: normal;
	vertical-align: middle;
	word-spacing: -0.5px;
	letter-spacing: 0;
	text-align: center;
	white-space: nowrap;
	color: #333;
	background-color: #fff;
	border-radius: 3px;
	margin-left: 5px;
}

span.count>span>input {
	width: 40px;
	height: 23px;
	padding: 0 0 0 5px;
	border: 1px solid #d4d4d4;
	border-radius: 3px 0 0 3px;
}

/* .info{
text-align: center;
position: absolute;

background-color: orange;
}
.point{

float:left;
background-color: aqua;

}
.coupon{
float:right;
background-color: green;
}
 */
</style>
</head>
<body>
	<section>
		<h3>장바구니</h3>
		<h6>
			회원님은 <strong>[silver]</strong>등급입니다.
		</h6>
		<hr />
		<div class="info">
			<div class="mileage">가용 적립금</div>
			<div class="coupon">쿠폰</div>
		</div>
		<hr />
		<table>
			<thead>
				<tr>
					<th><input type="checkbox"></th>
					<th>이미지</th>
					<th>상품정보</th>
					<th>판매가</th>
					<th>수량</th>
					<th>합계</th>
					<th></th>
				</tr>
			</thead>
	<%-- 		<tbody>
				<tr>
					<td><input type="checkbox"></td>
					<td><img
						src="<%=request.getContextPath()%>/images/default_product_image.jpg"
						alt="상품 이미지"></td>
					<td class="product-name">
						<h5>상품명</h5>
						<p>상품 설명</p>
					</td>
					<td class="price">100원</td>
					<td class="qua-col first-row">
						<div class="pro-qty">
							<span class="dec qtybtn">-</span> <input name="cartCnt"
								class="cartQty" id="cartQty"
								value="" type="text"
								style="width: 100px;"> <span class="inc qtybtn">+</span>
						</div>
					</td>
					<td class="total">200원</td>
					<td class="button">
						<button onclick="deleteProduct('1')">삭제</button>
					</td>
	<%
		}
		}
		%> --%>
			</tbody>

			<tr>
			<td></td>
			<%if(cart.isEmpty()){ %>
				<td colspan="6">장바구니가 비었습니다.</td>
			</tr>
			<%}else{ %>
				<%for(Cart c : cart){ %>
			<tr>
					<td><input type="checkbox"></td>
					<td><img
						src="<%=request.getContextPath()%>/images/cat_chu.jpg"></td>
					<td class="product-name">
						<h5><%=c.getProductName() %></h5>
						<p><%=c.getProductInfo() %></p>
					</td>

					<td class="price"><%=c.getProductPrice() %>원</td>

					<td class="qua-col first-row">
						<div class="pro-qty">
							<span class="dec qtybtn">-</span> <input name="cartCnt"
								class="cartQty" id="cartQty" value="1" type="text"
								style="width: 100px;"> <span class="inc qtybtn">+</span>
						</div>
					</td>
					<td class="total"><%=c.getProductPrice() %></td>

					<td class="button"><a href="javascript:;" class="btnNormal"
						onclick="BasketNew.moveWish(0);">관심상품등록</a></td>
				</tr>
					<%} %>
				<%} %>
				<%-- <tr>
					<td><input type="checkbox"></td>
					<td><img
						src="<%=request.getContextPath()%>/images/cat_chu.jpg"></td>
					<td class="product-name">
						<h5>냥이 츄르 스푼</h5>
						<p>츄르 먹이기가 쉬워지는 magic~</p>
					</td>

					<td class="price">10,000원</td>

					<td class="qua-col first-row">
						<div class="pro-qty">
							<span class="dec qtybtn">-</span> <input name="cartCnt"
								class="cartQty" id="cartQty" value="1" type="text"
								style="width: 100px;"> <span class="inc qtybtn">+</span>
						</div>
					</td>
					<td class="total">10,000원</td>

					<td class="button"><a href="javascript:;" class="btnNormal"
						onclick="BasketNew.moveWish(0);">관심상품등록</a></td>
				</tr>
				<tr>
					<td><input type="checkbox"></td>
					<td><img src="request.getContextPath()>/images/cat_chu.jpg"></td>
					<td class="product-name">
						<h5>냥이 츄르 스푼</h5>
						<p>츄르 먹이기가 쉬워지는 magic~</p>
					</td>

					<td class="price">10,000원</td>

					<td class="qua-col first-row">
						<div class="pro-qty">
							<span class="dec qtybtn">-</span> <input name="cartCnt"
								class="cartQty" id="cartQty" value="1" type="text"
								style="width: 100px;"> <span class="inc qtybtn">+</span>
						</div>
					</td>
					<td class="total">10,000원</td>

					<td class="button"><a href="javascript:;" class="btnNormal"
						onclick="BasketNew.moveWish(0);">관심상품등록</a></td>
				</tr> --%>
				<!-- 상품 추후에 추가하자 -->
			</tbody>
		</table> 

			<div>
				<button onclick="deleteSelectedProduct()">선택 상품 삭제</button>
				<button onclick="continueShopping()">쇼핑 계속하기</button>
			</div>

			<div class="row justify-content-end" align="right">
				<div class="col-lg-4 mt-5 cart-wrap ftco-animate">
					<div class="cart-total mb-3">
						<h3>장바구니 총 결제 금액</h3>
						<hr>
						<p class="d-flex total-price" style="font-size: 30px;">
							<span>0원</span>
						</p>
					</div>
					<!-- 주문하기 누르면 주문페이지로 이동 -->
					<p>
						<a href="#" class="btn btn-primary py-3 px-4">주문하기</a>
					</p>
				</div>
			</div>
	</section>

	<script>
function deleteSelectedProduct() {
	alert("선택한 상품이 삭제되었습니다.");
}
$(document).ready(function () {
    $('.qtybtn').click(function (e) {
        e.preventDefault();
        var inputField = $(this).siblings('.cartQty');
        var quantity = parseInt(inputField.val());
        var price = parseInt($(this).closest('tr').find('.price').text().replace('원', '').replace(',', '')); // 상품 가격 가져오기
        var totalField = $(this).closest('tr').find('.total');

        if ($(this).hasClass('inc')) {
            // 수량 증가 버튼이 클릭된 경우
            inputField.val(quantity + 1);
        } else if ($(this).hasClass('dec') && quantity > 1) {
            // 수량 감소 버튼이 클릭된 경우 (수량은 1 미만으로 떨어지지 않도록)
            inputField.val(quantity - 1);
        }

        // 총 금액 계산 및 업데이트
        var totalPrice = price * parseInt(inputField.val());
        totalField.text(addCommas(totalPrice) + '원');

        // 전체 총 금액 계산 및 업데이트
        updateTotalPrice();
    });

    // 숫자에 천 단위로 콤마 추가하는 함수
    function addCommas(num) {
        return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }

    function updateTotalPrice() {
        let totalAcount = 0;
        $.each($(".total"), (i, e) => {
            const oriprice = parseInt($(e).text().replace(",", ""));
            totalAcount += oriprice;
        });

        $(".total-price>span:last-child").text(addCommas(totalAcount) + '원');
    }
    
});

</script>




	<%@ include file="/views/footer.jsp"%>