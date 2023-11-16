<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/views/header.jsp"%>    
<!DOCTYPE html>
<html lang="ko"> <!-- 'en'을 'ko'로 변경하여 언어를 한국어로 설정 -->
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>faq 관리자 작성페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.ckeditor.com/ckeditor5/40.0.0/classic/ckeditor.js"></script>

    <style>
        * {
            letter-spacing: -.5px;
            font-weight: 300;
        }   
        .titleArea {
            padding-top: 80px;
            margin: 0 auto;
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
        }

        .container.mt-3 { /* .container mt-3를 .container.mt-3로 수정 */
            display:flex;
            flex-direction: column;
            justify-content: center;
            width:100%;
        }

        .faq-content {
            display: flex;
            justify-content: center;
        }

        .ck.ck-editor {
            width: 100%;
            max-width: 1000px;
            margin: 0 auto;
        }

        .ck-editor__editable {
            height: 50vh;
        } 

        #submitBtn {
            text-align: center;
        }
    </style>

</head>
<body>
    <section class="container mt-3">
        <div class="space">
            <div class="titleArea">
                <h2>faq 작성</h2>
            </div>
            <div class="container mt-3">
              <form id="faqform" action="<%=request.getContextPath() %>/faqadminpage.do" method="post">
	               <div class="row">
	                    <div class="col-lg-2"></div>
	                    <div class="col-lg-8">
	                    		<input type="hidden" value="" name="content" id="content">
	                            <table class="table table-bordered">
	                                <thead>
	                                    <tr>
	                                        <th style="text-align: center; background-color: #F2F2F2;">제목</th>
	                                        <th>
	                                            <select id="board_category" name="board_category">
	                                                <option value="자주하는질문">자주하는질문</option>
	                                                <option value="회원서비스">회원서비스</option>
	                                                <option value="주문/결제">주문/결제</option>
	                                                <option value="배송">배송</option>
	                                                <option value="취소/반품/교환">취소/반품/교환</option>
	                                            </select>
	                                            <input id="faq-title" name="title" style="width: 400px;" type="text">
	                                            
	                                        </th>
	                                    </tr>
	                                </thead>
	                            </table>
	                    </div>
	                    <div class="col-lg-2"></div>
	                 </div>
	                 <div class="row">
	                    	<div id="editor"></div>
	                 </div>
	                <div id="submitBtn" class="row">
	                	<div class="col-5"></div>
	                	<div class="col-1">
	                		<button type="button" class="Btn" onclick="test();" >작성완료</button>
	                	</div>
	                    <!-- <input class="Btn" type="submit" value="작성완료" /> -->
	                    <div class="col-1">
	                    	<input class="Btn" type="reset"  value="작성취소" />
	                    </div>
	                    <div class="col-5"></div>
		            </div>
		     	</form>
             </div>
        </div>
     </section>
        </body>
        <script>
            var editor;
            ClassicEditor
                .create(document.querySelector('#editor'), {
                    ckfinder: {
                        uploadUrl: '<%=request.getContextPath()%>/image/upload'
                    }
                })
                .then(e => {
                    editor = e;
                    console.log('Editor was initialized');
                })
                .catch(error => {
                    console.error(error);
                });

            function test(){    
                const editorData = editor.getData();
                $("#content").attr("value", editorData);
                console.log($("#content").val());
                $("#faqform").submit();
            }
        </script>
    </html>
    <%@ include file="/views/footer.jsp"%>
