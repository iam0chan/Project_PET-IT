<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
	*{
		margin: 0;
		padding: 0;
		border:1px solid red;
	}
	body{
		display:flex;
		justify-content:center;
		align-items:center;
	}
	.wrapper{
		width:630px;
		height:430px;
		display:flex;
		flex-direction:column;
		align-items:center;
		justify-content:center;
	}
	
	.wrapper>h1{
		margin-bottom:15px;
	}
	
	.image-container{
		display:flex;
		flex-direction:column;
		justify-content:center;
		align-items:center;
	}
	
	img{
		margin-bottom:10px;
	}
	.file-container{
		margin-bottom:10px;
	}
	
</style>
</head>
<body>
	<div class="wrapper">
        <h1>대표이미지등록</h1>
        <div class="image-container">
            <div class="image-content">
                <img class="image-box" src="mainImg-sample.png" style="width:230px; height:260px;">
            </div>
            <form action="#" method="post">
            <div class="file-container">
                <input type="file" name = "upfile" id="file">
            </div>
            <div>
            	<input type="submit" id="enroll-btn" class="btn btn-outline-success" value="등록">
            </div>
            </form>
        </div>
    </div>


    <script>
        const fileDOM = document.querySelector('#file');
        const preview = document.querySelector('.image-box');
       	const btn = document.querySelector("#enroll-btn");

        fileDOM.addEventListener('change', () => {
            const reader = new FileReader(); //FileReader객체생성
            reader.onload = (e) => {
            	/* console.log(e.target.result); */
                preview.src = e.target.result;
            };
            /* console.log(fileDOM.files[0]); */
            reader.readAsDataURL(fileDOM.files[0]);
        });
        
        btn.addEventListener('click',()=>	{
        	opener.document.querySelector("#image-box").src = document.querySelector(".image-box").src;
        	opener.document.querySelector("#imageId").value = document.querySelector(".image-box").src;
        	/* input hidden 태그를 이용해서 src값 저장해서 form태그로 서버에 전송 */
        	window.close();
        });

    </script>
</body>
</html>