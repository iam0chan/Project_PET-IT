<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.pet.product.model.dto.*, java.util.*"%>
<%@ include file="/views/header.jsp"%>
<%
	Map<String,ProductImageFile> imgData = (Map<String,ProductImageFile>)request.getAttribute("imageData");
	List<Product> newProducts = (List<Product>)request.getAttribute("newProducts");
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
	.row-collection{
		display:flex;
		justify-content:space-evenly;
		flex-wrap: wrap;
		line-height:2.0;
	}
	.img-box{
		margin-top:10px;
		width:300px;
		margin-bottom:10px;
		border: 1px solid #28a745;
		border-radius : 5px;
		text-align:center;
		border-bottom:1px solid #28a745;
	}
	.content{
		width:300px;
		display:flex;
		flex-direction:column;
		flex-wrap:wrap;
		
	}
	
	.content>p:first{
		margin-top:5px;
		height:30px;
	}
</style>
<section class="furniture_section layout_padding">
	<div class="container">
		<div class="heading_container">
			<h2>new 새로운 상품</h2>
		</div>
		<div class="row-collection">
		 <%if(!newProducts.isEmpty()){ %>
			<%for(Product p : newProducts){ %>
			<div class="img-box">
				<img src ="<%=request.getContextPath()%>/upload/<%=imgData.get(p.getProductNo()).getProductFileRename()%>" style="width:295px; height:295px;"/>
				<div class="content">
					<p><%= p.getProductName() %></p>
					<p><%= p.getProductInfo() %></p>
					<p><%= p.getProductPrice()%></p>
				</div>
			</div>
			<%} %>
		<%} %> 
		</div>
	</div>
</section>

<!-- end furniture section -->

<!-- info section -->
<section class="info_section long_section">

	<div class="container">
		<div class="contact_nav">
			<a href=""> <i class="fa fa-phone" aria-hidden="true"></i> <span>
					Call : +01 123455678990 </span>
			</a> <a href=""> <i class="fa fa-envelope" aria-hidden="true"></i> <span>
					Email : demo@gmail.com </span>
			</a> <a href=""> <i class="fa fa-map-marker" aria-hidden="true"></i>
				<span> Location </span>
			</a>
		</div>

		<div class="info_top ">
			<div class="row ">
				<div class="col-sm-6 col-md-4 col-lg-3">
					<div class="info_links">
						<h4>QUICK LINKS</h4>
						<div class="info_links_menu">
							<a class="" href="index.html">Home <span class="sr-only">(current)</span></a>
							<a class="" href="about.html"> About</a> <a class=""
								href="furniture.html">Furniture</a> <a class="" href="blog.html">Blog</a>
							<a class="" href="contact.html">Contact Us</a>
						</div>
					</div>
				</div>
				<div class="col-sm-6 col-md-4 col-lg-3 mx-auto">
					<div class="info_post">
						<h5>INSTAGRAM FEEDS</h5>
						<div class="post_box">
							<div class="img-box">
								<img src="<%=request.getContextPath()%>/images/f1.png" alt="">
							</div>
							<div class="img-box">
								<img src="<%=request.getContextPath()%>/images/f2.png" alt="">
							</div>
							<div class="img-box">
								<img src="<%=request.getContextPath()%>/images/f3.png" alt="">
							</div>
							<div class="img-box">
								<img src="<%=request.getContextPath()%>/images/f4.png" alt="">
							</div>
							<div class="img-box">
								<img src="<%=request.getContextPath()%>/images/f5.png" alt="">
							</div>
							<div class="img-box">
								<img src="<%=request.getContextPath()%>/images/f6.png" alt="">
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="info_form">
						<h4>SIGN UP TO OUR NEWSLETTER</h4>
						<form action="">
							<input type="text" placeholder="Enter Your Email" />
							<button type="submit">Subscribe</button>
						</form>
						<div class="social_box">
							<a href=""> <i class="fa fa-facebook" aria-hidden="true"></i>
							</a> <a href=""> <i class="fa fa-twitter" aria-hidden="true"></i>
							</a> <a href=""> <i class="fa fa-linkedin" aria-hidden="true"></i>
							</a> <a href=""> <i class="fa fa-instagram" aria-hidden="true"></i>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- end info_section -->
<script>
	<%-- window.onload = function(){
		location.href="<%=request.getContextPath()%>/product/mainPage.do"
	} --%>

</script>
<%@ include file="/views/footer.jsp"%>