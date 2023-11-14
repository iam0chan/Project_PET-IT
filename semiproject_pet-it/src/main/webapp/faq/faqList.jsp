<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/header.jsp"%>


<title>faq</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<style type="text/css">
.titleArea {
	padding-top: 80px;
	margin: 0 auto;
	display: flex;
	flex-direction: column;
	align-items: center;
	text-align: center;
}

#content-container {
	margin: 0 auto;
}

.boardSort {
	align-items: left;
}

#faqTable {
	width: 1150px;
}

.hide {
	display: none;
}

.item .title {
	cursor: pointer;
}

.recruit a:hover {
	text-decoration: none;
	cursor: pointer;
}

div.col-md-8 {
	right: 35px /* !important */;
}

.recruit .show {
	display: table-row /* !important */;
} /** 애니메이션효과 추가하기(01-20 pm 04:23) */
.boardsearchAll {
	text-align: center;
}

.pageBar {
	text-align: center;
}

#search {
	text-align: center;
	height: 25px;
}

tr.item {
  color: #000; /* 텍스트 색상 */
  background-color: #fff; /* 기본 배경 색상 */
}

tr.item:hover {
  color: #000; /* 마우스를 올렸을 때 텍스트 색상 */
  background-color: #04aa6d; 
}


</style>

<body>
	<div class="titleArea">
		<h2>FAQ</h2>
		<p>무엇이든지 물어보세요!</p>
	</div>
	<div id="content-container">

		<div class="boardSort">
			<p class="boardSort"></p>
			<span class="categoryBar"> 
			 <select id="selectCategory" name="selectCategory">
					<option value selected="selected">전체</option>
					<option value="1">자주하는질문</option>
					<option value="2">회원서비스</option>
					<option value="3">주문/결제</option>
					<option value="4">배송</option>
					<option value="5">취소/반품/교환</option>
			</select>
			</span>
		</div>
		<br>
		<!-- 테이블 시작 -->
		<table id="faqTable" class="table recruit">
			<thead>
				<tr class="fnaTitle">
					<th scope="col" class="active text-center" style="width: 10px;">번호</th>
					<th scope="col" class="active text-center" style="width: 45px;">카테고리</th>
					<th scope="col" class="active text-center" style="width: 200px;">제목</th>
					<th scope="col" class="active text-center" style="width: 30px;">조회수</th>
				</tr>
			</thead>

			<!-- 테이블별 장소 -->
			<tbody class="text-center">
				<tr class="item">
					<td>4</td>
					<td>자주하는질문</td>
					<td><span class='title'><%=request.getAttribute("content") %></span></td>
					<td>58</td>
				</tr>
				<!-- 아코디언효과를 넣은 리뷰내용 -->
				<tr class="hide">
					<td colspan="5">
						<p>
							<a> 당일 발송(출고)을 위한 주문마감 시간은 오후 2시 입니다. (2022년부터)당일 발송(출고)된 상품은 영업일 기준 다음날부터 받아보실 수 있습니다. </a>
						</p>
					</td>
				</tr>
				<tr class="item">
					<td>3</td>
					<td>회원서비스</td>
					<td><span class='title'><%=request.getAttribute("content") %></span></td>
					<td>36</td>
				</tr>
				<tr class="hide">
					<!-- 아코디언효과를 넣은 리뷰내용 -->
					<td colspan="5">
						<p>
							<a> 현재 Pet-it 공식몰에서의 결제방법은 카드이며 카드 결제시 자동으로 부가세 신고가 됩니다. </a>
						</p>
					</td>
				</tr>
				<tr class="item">
					<td>2</td>
					<td>취소/반품/교환</td>
					<td><span class='title'><%=request.getAttribute("content") %></span></td>
					<td>65</td>
				</tr>
				<tr class="hide">
					<!-- 아코디언효과를 넣은 리뷰내용 -->
					<td colspan="5">
						<p>
							<a> 입금완료, 상품준비중 상태인 경우 '[MY페이지 > 주문 내역 조회 > 주문 취소]에서 취소 가능합니다. '배송준비중' '배송대기' 상태인 경우 배송사로 인계되어<br>
								 취소가 불가능하므로, 수령하신 후 반품해 주셔야하며 반품 배송비는 고객님께서 부담하시게 됩니다. </a>
						</p>
					</td>
				</tr>
				<tr class="item">
					<td>1</td>
					<td>배송</td>
					<td><span class='title'><%=request.getAttribute("content") %></span></td>
					<td>33</td>
				</tr>
				<tr class="hide">
					<!-- 아코디언효과를 넣은 리뷰내용 -->
					<td colspan="5">
						<p>
							<a> 월~금요일 오전 11시까지 결제 완료한 상품은 영업일 기준 다음날부터 받아보실 수 있으며, 영업일 기준으로 3일 이내 배송을 원칙으로 하고 있습니다.<br> 
								다만, 도서산간 등 배송 지역과 기상 상태 등에 따라 받으실 수 있는 기간이 더 소요될 수 있으니 배송기간을 고려하여 주문해 주시기 바랍니다. </a>
						</p>
					</td>
				</tr>
			</tbody>

		</table>
	</div>

	<div class="pageBar">
		<div><%=request.getAttribute("pageBar") %></div>
		
	</div>
	


	<div class="boardsearchAll">
		<fieldset class="boardSearch">
			<p>
				<select id="searchKey" name="searchKey">
					<option value="subject">제목</option>
					<option value="subject">내용</option>
				</select> <input id="search" name="search" placeholder="입력하세요">
				<button class="btn btn-primary btn-sm">
					<a href="#none">SEARCH</a>
				</button>
			</p>
		</fieldset>
	</div>





	<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

	<script>
	<!-- show와 hide 클래스를 추가한 아코디언 효과 jquey -->
		$(function() {

			var article = (".recruit .show");

			$(".recruit .item .title").click(function() {

				var myArticle = $(this).parents().next("tr")

				if ($(myArticle).hasClass('hide')) {

					$(article).removeClass('show').addClass('hide')

					$(myArticle).removeClass('hide').addClass('show');

				}

				else {

					$(myArticle).addClass('hide').removeClass('show');

				}

			});

		});
		
	</script>
	

</body>
</html>
<%@ include file="/views/footer.jsp"%>