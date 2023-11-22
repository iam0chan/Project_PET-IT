<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.pet.product.model.dto.*, java.util.*"%>
<%@ include file="/views/header.jsp"%>
<%
Map<String, ProductImageFile> imgData = (Map<String, ProductImageFile>) request.getAttribute("imageData");
List<Product> newProducts = (List<Product>) request.getAttribute("newProducts");
%>
<!-- slider section -->
<section class="slider_section long_section">
	<div id="customCarousel" class="carousel slide" data-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="<%=request.getContextPath()%>/img/banner2-1.jpg"
					width="1783" height="498" alt="">
			</div>
			<div class="carousel-item">
				<img src="<%=request.getContextPath()%>/img/banner3.jpg" alt="">
			</div>
			<div class="carousel-item">
				<img src="<%=request.getContextPath()%>/img/banner1.jpg" alt="">
			</div>
		</div>
		<ol class="carousel-indicators">
			<li data-target="#customCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#customCarousel" data-slide-to="1"></li>
			<li data-target="#customCarousel" data-slide-to="2"></li>
		</ol>
	</div>
</section>
<!-- end slider section -->
</div>

<!-- furniture section -->
<style>
.row-collection {
	display: flex;
	justify-content: space-evenly;
	flex-wrap: wrap;
	line-height: 2.0;
}

.img-box {
	margin-top: 10px;
	width: 300px;
	margin-bottom: 10px;
	border: 1px solid rgb(219, 219, 217);
	border-radius: 5px;
	text-align: center;
}

.heading_container {
	margin-bottom: 30px;
	align-items:center !important;
}
.heading_container>div{
	width:300px;
	border-bottom: 10px solid #28a745 !important;
	
}

.content {
	width: 300px;
	display: flex;
	flex-direction: column;
	flex-wrap: wrap;
}

.content>p:first {
	margin-top: 5px;
	height: 30px;
}

.wrapper {
	display: flex;
	justify-contetn: center;
}

.title {
	text-align: center;
	width: 100%;
	margin-bottom: 20px;
}

/* section.info_section {
	padding-bottom: 0 !important;
} */
.container {
	display: flex;
	flex-direction: column;
	align-items: space-between;
}
</style>
<section class="furniture_section layout_padding">
	<div class="container">
		<div class="heading_container">
			<h2 style="text-align: center;">new 새로운 상품</h2>
			<div></div>
		</div>
		<div class="row-collection">
			<%
			if (!newProducts.isEmpty()) {
			%>
			<%
			for (Product p : newProducts) {
			%>
			<div class="img-box">
				<input type="hidden" id="productNo" value="<%=p.getProductNo()%>" />
				<img
					src="<%=request.getContextPath()%>/upload/<%=imgData.get(p.getProductNo()).getProductFileRename()%>"
					style="width: 291px; height: 291px;" />
				<div class="content">
					<span style="font-weight: bold;"><%=p.getProductName()%></span> <span
						style="font-size: 12px;"><%=p.getProductInfo()%></span> <span
						style="font-weight: bolder;"><%=p.getProductPrice()%>원</span>
				</div>
			</div>
			<%
			}
			%>
			<%
			}
			%>
		</div>
		<%-- <div class="img-box">
				<img src="<%=request.getContextPath()%>/upload/dog_toy.png"
					style="width: 295px; height: 295px;" />
				<div class="content">
					<span>asdaasd</span>
					<span>asdaasd</span>
					<span>asdaasd</span>
				</div>
			</div>
			<div class="img-box">
				<img src="<%=request.getContextPath()%>/upload/dog_toy.png"
					style="width: 295px; height: 295px;" />
				<div class="content">
					<p></p>
					<p></p>
					<p></p>
				</div>
			</div>
			<div class="img-box">
				<img src="<%=request.getContextPath()%>/upload/dog_toy.png"
					style="width: 295px; height: 295px;" />
				<div class="content">
					<p></p>
					<p></p>
					<p></p>
				</div>
			</div>
			<div class="img-box">
				<img src="<%=request.getContextPath()%>/upload/dog_toy.png"
					style="width: 295px; height: 295px;" />
				<div class="content">
					<p></p>
					<p></p>
					<p></p>
				</div>
			</div>
			<div class="img-box">
				<img src="<%=request.getContextPath()%>/upload/dog_toy.png"
					style="width: 295px; height: 295px;" />
				<div class="content">
					<p></p>
					<p></p>
					<p></p>
				</div>
			</div>
			<div class="img-box">
				<img src="<%=request.getContextPath()%>/upload/dog_toy.png"
					style="width: 295px; height: 295px;" />
				<div class="content">
					<p></p>
					<p></p>
					<p></p>
				</div>
			</div> --%>

	</div>


</section>

<!-- end furniture section -->

<!-- info section -->
<section class="info_section long_section">
	<div class="wrapper">
		<div class="title">
			<h1 style="font-size: 60px;">PET-IT</h1>
		</div>
	</div>
	<div class="container">
		<div class="contact_nav">
			<a id="center-instruction"> <i class="fa fa-phone"
				aria-hidden="true"></i> <span> Call : +01 123455678990 </span>
			</a> <a href=""> <i class="fa fa-envelope" aria-hidden="true"></i> <span>
					Email : petittttttt1@gmail.com </span>
			</a> <a id="location"> <i class="fa fa-map-marker" aria-hidden="true"></i>
				<span> Location </span>
			</a>
		</div>


	</div>
</section>
<script>
	$("#location").on("click",function(){
		open("https://map.naver.com/p/entry/place/38301833?c=16.88,0,0,0,dh","_blank","width=800px height=600px top=100 left=40");
	})
	
	$(".img-box").mouseenter(function(){
		$(this).css("cursor","pointer");
		$(this).css("border","3px solid #28a745");
		$(this).on("click",function(){
			const productNo = $("#productNo").val();
			location.href="<%=request.getContextPath()%>/product/productview.do?productNo="+productNo;
		})
	})
	
	$(".img-box").mouseleave(function(){
		$(this).css("border","1px solid rgb(219, 219, 217)");
	})
</script>
<%@ include file="/views/footer.jsp"%>