<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/views/header.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>마이페이지 메인뷰</title>
<style>
body {
   text-align: center;
}
</style>
<body>
   <section>
      <h5>my page</h5>
      <hr />
      <section class="titles">
         <article class="sytle1">
            <span class="image"> <img
               src="<%=request.getContextPath()%>/images/orderIcon.png">
            </span>

            <h2>
               <a href="<%=request.getContextPath()%>/myPage/myOrder.jsp">주문내역
                  조회</a>
            </h2>

            <div class="content">
               <p>고객님께서 주문하신 상품의 주문내역을 확인하실 수 있습니다.</p>
            </div>
            </a>
         </article>
         <article class="sytle2">
            <span class="image"> <img
               src="<%=request.getContextPath()%>/images/memberInfoIcon.png">
            </span> <a href="/">
               <h2>
                  <a href="<%=request.getContextPath()%>/findPw.do">회원정보</a>
               </h2>
               <div class="content">
                  <p>회원이신 고객님의 개인정보를 관리하는 공간입니다.</p>
               </div>
            </a>
         </article>
         <%-- <article class="sytle3">
            <span class="image"> <img
               src="<%=request.getContextPath()%>/images/wishListIcon.png">
            </span> <a href="/">
               <h2>
                  <a href="<%=request.getContextPath()%>/wishList/wishListPage.jsp">관심
                     상품
               </h2>
               <div class="content">
                  <p>관심상품으로 등록하신 상품의 목록을 보여드립니다.</p>
               </div>
            </a>
         </article>
         <article class="sytle4">
            <span class="image"> <img
               src="<%=request.getContextPath()%>/images/mileageIcon.png">
            </span> <a href="/">
               <h2>
                  <a href="<%=request.getContextPath()%>/myPage/myMileage.jsp">적립금
               </h2>
               <div class="content">
                  <p>적립금은 상품 구매 시 사용하실 수 있습니다.</p>
               </div>
            </a>
         </article>
         <article class="sytle5">
            <span class="image"> <img
               src="<%=request.getContextPath()%>/images/couponIcon.png">
            </span> <a href="/">
               <h2>
                  <a href="<%=request.getContextPath()%>/myPage/myCoupon.jsp">쿠폰
               </h2>
               <div class="content">
                  <p>고객님이 보유하신 쿠폰내역을 보여드립니다.</p>
               </div>
            </a>
         </article> --%>
         <article class="sytle6">
            <span class="image"> <img
               src="<%=request.getContextPath()%>/images/boardIcon.png">
            </span> <a href="/">
               <h2>
                  <a href="<%=request.getContextPath()%>/questionList.do">게시물
                     관리
               </h2>
               <div class="content">
                  <p>고객님께서 작성하신 1:1 문의를 관리하는 공간입니다.</p>
               </div>
            </a>
         </article>
      

			<%-- <article class="sytle3">
				<span class="image"> <img
					src="<%=request.getContextPath()%>/images/wishListIcon.png">
				</span> <a href="/">
					<h2>
						<a href="<%=request.getContextPath()%>/wishList/wishListPage.jsp">관심
							상품
					</h2>
					<div class="content">
						<p>관심상품으로 등록하신 상품의 목록을 보여드립니다.</p>
					</div>
				</a>
			</article>
			<article class="sytle4">
				<span class="image"> <img
					src="<%=request.getContextPath()%>/images/mileageIcon.png">
				</span> <a href="/">
					<h2>
						<a href="<%=request.getContextPath()%>/myPage/myMileage.jsp">적립금
					</h2>
					<div class="content">
						<p>적립금은 상품 구매 시 사용하실 수 있습니다.</p>
					</div>
				</a>
			</article>
			<article class="sytle5">
				<span class="image"> <img
					src="<%=request.getContextPath()%>/images/couponIcon.png">
				</span> <a href="/">
					<h2>
						<a href="<%=request.getContextPath()%>/myPage/myCoupon.jsp">쿠폰
					</h2>
					<div class="content">
						<p>고객님이 보유하신 쿠폰내역을 보여드립니다.</p>
					</div>
				</a>
			</article> --%>
	

      </section>






      <hr />





   </section>







</body>
</html>
<%@ include file="/views/footer.jsp"%>