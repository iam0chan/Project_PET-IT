<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/header.jsp"%>
<style>
.container {
	width: 100%;
	padding-right: 15px;
	padding-left: 15px;
	margin-right: auto;
	
	margin-left: auto;
}

*, ::after, ::before {
	box-sizing: border-box;
}

div {
	display: block;
}
</style>

<section class="wishList">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="wishList_table">
					<table>
						<thead>
							<tr>
								<th class="product">선택</th>
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
								<td><input type="checkbox" name="productBox"></td>
								<td class="product_item"><img
									src="<%=request.getContextPath()%>/images/cat_chu.jpg"
									alt="고양이 츄르 스푼"></td>
								<td class="product_info"><h5>츄르 스푼으로 츄르를 손쉽게 급여하세요 !</h5></td>

								<td class="product_price">11,000원</td>
								<td class="product_quantity">
									<div class="quantity">
										<div class="pro-qty">
											<span class="dec qtybtn">-</span> <input type="text"
												value="1"> <span class="inc qtybtn">+</span>
										</div>
									</div>
								</td>

								<td class="product_mileage">10원</td>
								<td class="product_shipping_fee">2,500원</td>
								<td class="product_total_Price">13,500원</td>
							</tr>
							<td>
							


							

							</section>



							</section>
							<%@ include file="/views/footer.jsp"%>