<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
        <meta charset="UTF-8"> 
        <title>Practical Exam - Accordion</title>
        <link rel="stylesheet" href="./accordion_2.css">
        <script src="./accordion_2.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" >
    </head>
    
    <style>
    html, body{
	    font-family: Arial, Helvetica, sans-serif;
	    margin:0
	}
	
	.panel-faq-container{
	    /* border: 1px solid red; */
	    margin-bottom: -14px;
	}
	
	.panel-faq-title{
	    color:aqua;
	    cursor: pointer;
	}
	
	.panel-faq-answer{
	
	    height: 0;
	    overflow: hidden;
	    transition: all 0.35s;
	}
	
	#btn-all-close{
	    margin-bottom: 10px;
	    border: none;
	    cursor:pointer;
	    padding:10px 25px;
	    float: right;
	    background-color: cornflowerblue;
	    color: blue;
	
	}
	
	#btn-all-close:hover{
	    background-color: aquamarine;
	    color: aliceblue;
	    transition: all .35s;
	
	}
	
	.active{
	    display: block;
	    height: 300px;
	
	}
    </style>

    <body>

        <div class="container">
            <h3 style="text-align: center; padding-top:50px;">
                FAQ
                <small class="text-muted">
                    with faded secondary text
                </small>
            </h3>
            <br>

            <button id="btn-all-close">
                FAQ All Close
            </button>

            <table class="table table-bordered table-striped table-dark table-hover">
                <thead class="thead-light text-center">
                    <tr>
                        <th>No</th>
                        <th>FAQ Title</th>
                        <th>Category</th>
                        <th>Date</th>
                        <th>Hit</th>
                    </tr>

                </thead>

                <tbody class="text-center">
                    <tr>
                        <td>1</td>
                        <td class="text-left" width="50%">
                            <div class="panel-faq-container">
                                <p class="panel-faq-title">
                                    What is Lorem Ipsum?
                                </p>
                                <div class="panel-faq-answer">
                                    <p>Answer (1) ↓</p>
                                    <p> Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
                                </div>
                            </div>
                        </td>
                        <td>이용안내</td>
                        <td>2023.02.01</td>
                        <td>84</td>
                    </tr>

                    <tr>
                        <td>2</td>
                        <td class="text-left" width="50%">
                            <div class="panel-faq-container">
                                <p class="panel-faq-title">
                                    What is Lorem Ipsum?
                                </p>
                                <div class="panel-faq-answer">
                                    <p>Answer (2) ↓</p>
                                    <p> Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
                                </div>
                            </div>
                        </td>
                        <td>이용안내</td>
                        <td>2023.02.01</td>
                        <td>84</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td class="text-left" width="50%">
                            <div class="panel-faq-container">
                                <p class="panel-faq-title">
                                    What is Lorem Ipsum?
                                </p>
                                <div class="panel-faq-answer">
                                    <p>Answer (3) ↓</p>
                                    <p> Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
                                </div>
                            </div>
                        </td>
                        <td>이용안내</td>
                        <td>2023.02.01</td>
                        <td>84</td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td class="text-left" width="50%">
                            <div class="panel-faq-container">
                                <p class="panel-faq-title">
                                    What is Lorem Ipsum?
                                </p>
                                <div class="panel-faq-answer">
                                    <p>Answer (4) ↓</p>
                                    <p> Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
                                </div>
                            </div>
                        </td>
                        <td>이용안내</td>
                        <td>2023.02.01</td>
                        <td>84</td>
                    </tr>
                    <tr>
                        <td>5</td>
                        <td class="text-left" width="50%">
                            <div class="panel-faq-container">
                                <p class="panel-faq-title">
                                    What is Lorem Ipsum?
                                </p>
                                <div class="panel-faq-answer">
                                    <p>Answer (5) ↓</p>
                                    <p> Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
                                </div>
                            </div>
                        </td>
                        <td>이용안내</td>
                        <td>2023.02.01</td>
                        <td>84</td>
                    </tr>
                    <tr class="bg-info">
                       <td class="text-left" colspan="4">자주 묻는 질문 총 합계</td>
                       <td>182</td> 
                    </tr>
                </tbody>
                <caption>
                    FAQ List of Articles
                </caption>
            </table>
        </div>

    </body>
    
    <script>
	    window.onload = () => {
	        
	        const panelFaqContainer = document.querySelectorAll('.panel-faq-container');
	        console.log(panelFaqContainer);
	
	
	        let panelFaqAnswer=document.querySelectorAll('.panel-faq-answer');
	        console.log(panelFaqAnswer);
	
	        const btnAllClose=document.getElementById("btn-all-close");
	        console.log(btnAllClose);
	
	
	        for(let i=0;i<panelFaqContainer.length;i++){
	            panelFaqContainer[i].addEventListener('click', function(){
	                console.log("클릭중.."+i);
	                panelFaqAnswer[i].classList.add('active');
	            });
	        }
	
	
            for(let i=0;i<panelFaqAnswer.length;i++){
		        btnAllClose.addEventListener('click', function(){
		            console.log("버튼 클릭..");
	                panelFaqAnswer[i].classList.remove('active');
		        });
            }        
	
	    }
    </script>
</html>