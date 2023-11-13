<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/product/product_review_write.css"/>
<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bootstrap.css" />
</head>
<body>
	<div class="wrapper">
	<div id="image-container">
		<img src="" alt="후기이미지">
	</div>
	<form class="mb-3" name="myform" id="myform" method="post" enctype="multipart/form-data">
	<input type="file" name="reviewImg" id="file"/><br>
	<fieldset>
		<span class="text-bold">별점을 선택해주세요</span>
		<input type="radio" name="reviewStar" value="5" id="rate1"><label
			for="rate1">★</label>
		<input type="radio" name="reviewStar" value="4" id="rate2"><label
			for="rate2">★</label>
		<input type="radio" name="reviewStar" value="3" id="rate3"><label
			for="rate3">★</label>
		<input type="radio" name="reviewStar" value="2" id="rate4"><label
			for="rate4">★</label>
		<input type="radio" name="reviewStar" value="1" id="rate5"><label
			for="rate5">★</label>
	</fieldset>
	<div class="content-container">
		<textarea class="col-auto form-control" type="text" id="reviewContents"
				  placeholder="좋은 수강평을 남겨주세요!!! - PET-IT -"></textarea>
	</div>
	<div class="review-btn-container">
		<button id="review-enroll" class="btn btn-outline-success">후기등록</button>
	</div>
	</div>
</form>
<script>
	const file = document.querySelector("input[name=reviewImg]");
	const img = document.querySelector("#image-container>img");
	file.addEventListener("change",()=>{
		const reader = new FileReader();
		reader.onload = e =>{
			img.src = e.target.result;
		};
		reader.readAsDataURL(file.files[0]);
	});
</script>
</body>
</html>