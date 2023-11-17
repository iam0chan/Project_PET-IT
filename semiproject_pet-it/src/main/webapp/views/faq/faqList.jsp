<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.pet.faq.model.dto.Faq"%>
<%
List<Faq> faqs = (List<Faq>) request.getAttribute("faqs");
%>
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
			<span class="categoryBar"> <select id="selectCategory"
				name="selectCategory">
					<option value="전체" <%=request.getParameter("faqs")!=null&&request.getParameter("faqs").equals("전체")?"selected":"" %>>전체</option>
					<option value="자주하는질문" <%=request.getParameter("faqs")!=null&&request.getParameter("faqs").equals("자주하는질문")?"selected":"" %>>자주하는질문</option>
					<option value="회원서비스" <%=request.getParameter("faqs")!=null&&request.getParameter("faqs").equals("회원서비스")?"selected":"" %>>회원서비스</option>
					<option value="주문/결제" <%=request.getParameter("faqs")!=null&&request.getParameter("faqs").equals("주문/결제")?"selected":"" %>>주문/결제</option>
					<option value="배송" <%=request.getParameter("faqs")!=null&&request.getParameter("faqs").equals("배송")?"selected":"" %>>배송</option>
					<option value="취소/반품/교환" <%=request.getParameter("faqs")!=null&&request.getParameter("faqs").equals("취소/반품/교환")?"selected":"" %>>취소/반품/교환</option>
					
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
				<%
				if (faqs != null && !faqs.isEmpty()) {
					for (Faq f : faqs) {
				%>
				<tr class="item">
					<td><%=f.getFaqNo()%></td>
					<td><%=f.getFaqCategory()%></td>
					<td><span class='title'><%=f.getFaqTitle()%></span></td>
					<td><%=f.getFaqHits()%></td>
				</tr>
				<!-- 아코디언효과를 넣은 리뷰내용 -->
				<tr class="hide">
					<td colspan="5">
						<p>
							<%=f.getFaqContent()%>
						</p>
					</td>
				</tr>
				<%
				}
				}
				%>
			</tbody>

		</table>
	</div>

	<div class="pageBar">
		<div><%=request.getAttribute("pageBar")%></div>

	</div>

	<div class="boardsearchAll">
		<form action='<%=request.getContextPath()%>/searchMenu.do' method="post" > 
			<select id="searchKey" name="searchKey">
				<option value="subject">제목</option>
				<option value="subject">내용</option>
			</select>
		<input type="search" id="searchMenu" >
			<input type="submit" name="selectSearch" value="검색">
		
		</form>

		<!-- <fieldset class="boardSearch">
			<form>
				<select id="searchKey" name="searchKey">
					<option value="subject">제목</option>
					<option value="subject">내용</option>
				</select> <input id="search" name="search" placeholder="입력하세요">
				<button class="btn btn-primary btn-sm">
					<a href="#none">SEARCH</a>
				</button>
			</form>
		</fieldset> -->
		
		
		
	</div>
	<br>






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
		
		const selectCategory = document.getElementById("selectCategory");
		console.log(selectCategory)
		selectCategory.addEventListener("change",function(e){
		location.replace("<%=request.getContextPath()%>/faqinquiry.do?faqs="+ e.target.value);
		});

			
		
	</script>






</body>
</html>

<%@ include file="/views/footer.jsp"%>