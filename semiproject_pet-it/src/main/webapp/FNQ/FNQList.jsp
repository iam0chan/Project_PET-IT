<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../views/header.jsp"%>


<title>FNQ</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style type="text/css">

    
    .titleArea{
    
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
	
     #fnaTable {
    	 width:1150px; 
     }   

    .hide {
    	display:none;
    	}  

    .item .title {
    	cursor:pointer;
    	}
    
    .recruit a:hover {
    	text-decoration: none; cursor:pointer; 
    	}
    
     div.col-md-8 {
       right : 35px /* !important */;
    }
    
    .recruit .show  { 
    
       display:table-row /* !important */;
       
             
     } /** 애니메이션효과 추가하기(01-20 pm 04:23) */
  


</style>

<body>
   <div class="titleArea">
			<h2>FNQ</h2>
			<p>무엇이든지 물어보세요!</p>
		</div>
      <!-- 테이블 시작 -->
      <table id="fnaTable" class="table recruit" >
         <thead>
            <tr class="fnaTitle">
               <th scope="col" class="active text-center" style="width:90px;">번호</th>
               <th scope="col" class="active text-center" style="width:150px;">카테고리</th>
               <th scope="col" class="active text-center" style="width:150px;">제목</th>
               <th scope="col" class="active text-center" style="width:150px;">작성일</th>
                <th scope="col" class="active text-center" style="width:150px;">조회수</th>
            </tr>
         </thead>
         
          <div id="content-container">

		<div class="boardSort">
			<p class="boardSort"></p>
			<span class="categoryBar"> <!-- 카테고리 선택 메뉴바 --> 
			<select id="selectCategory" name="selectCategory">
					<option value selected="selected">전체</option>
					<option value="1">공지사항</option>
					<option value="2">이용안내</option>
			</select>
			</span>

		</div>
         
        
         
         
         
         
         <!-- 테이블별 장소 -->
         <tbody class="text-center">
            <tr class="item">
               <td>4</td>
               <td><span class='title'>상암월드컵경기장</span></td>
               <td>평점</td>
               <td>2019-12-09</td>
            </tr>
            <!-- 아코디언효과를 넣은 리뷰내용 -->
            <tr class="hide">  
                <td colspan="4">  
                  <p>
                     <a>
                        상암월드컵 경기장은 서울특별시 상암동에 위치하고 있으며, 2002년 월드컵을 계기로 건설이 되었으며, 매해 이곳에서는
                        작게는 수천명에서 크게는 몇십만명에 사람들이 오고있다. 이곳에서 2002년 월드컵의 주역들이 4강신화를 이룩했으며, 아직도
                        이곳에서는 그때의 열기가 느껴지는듯 하다. 어렸을적 일이라 자세하게 기억은 나지 않으나, 이 곳에 올때마다 왠지 그때의 열기가 
                        전해져 마음속을 두근거리게 만든다.
                     </a>         
                  </p>
               </td>
            </tr>
            <tr class="item">
               <td>3</td>
               <td><span class='title'>잠실종합운동장</span></td>
               <td></td>
               <td>2019-12-09</td>
            </tr>
            <tr class="hide">
                <!-- 아코디언효과를 넣은 리뷰내용 -->
               <td colspan="4">
                  <p>
                     <a>
                        상암월드컵 경기장은 서울특별시 상암동에 위치하고 있으며, 2002년 월드컵을 계기로 건설이 되었으며, 매해 이곳에서는
                        작게는 수천명에서 크게는 몇십만명에 사람들이 오고있다. 이곳에서 2002년 월드컵의 주역들이 4강신화를 이룩했으며, 아직도
                        이곳에서는 그때의 열기가 느껴지는듯 하다. 어렸을적 일이라 자세하게 기억은 나지 않으나, 이 곳에 올때마다 왠지 그때의 열기가 
                        전해져 마음속을 두근거리게 만든다.
                     </a>         
                  </p>
               </td>
            </tr>
            <tr class="item">
               <td>2</td>
               <td><span class='title'>올림픽공원</span></td>
               <td></td>
               <td>2019-12-08</td>
            </tr>
            <tr class="hide">
            <!-- 아코디언효과를 넣은 리뷰내용 -->
               <td colspan="4">
                  <p>
                     <a>
                        상암월드컵 경기장은 서울특별시 상암동에 위치하고 있으며, 2002년 월드컵을 계기로 건설이 되었으며, 매해 이곳에서는
                        작게는 수천명에서 크게는 몇십만명에 사람들이 오고있다. 이곳에서 2002년 월드컵의 주역들이 4강신화를 이룩했으며, 아직도
                        이곳에서는 그때의 열기가 느껴지는듯 하다. 어렸을적 일이라 자세하게 기억은 나지 않으나, 이 곳에 올때마다 왠지 그때의 열기가 
                        전해져 마음속을 두근거리게 만든다.
                     </a>         
                  </p>
               </td>
            </tr>
            <tr class="item">
               <td>1</td>
               <td><span class='title'>경복궁</span></td>
               <td></td>
               <td>2019-12-08</td>
            </tr>
            <tr class="hide">
            <!-- 아코디언효과를 넣은 리뷰내용 -->
               <td colspan="4">
                  <p>
                     <a>
                        상암월드컵 경기장은 서울특별시 상암동에 위치하고 있으며, 2002년 월드컵을 계기로 건설이 되었으며, 매해 이곳에서는
                        작게는 수천명에서 크게는 몇십만명에 사람들이 오고있다. 이곳에서 2002년 월드컵의 주역들이 4강신화를 이룩했으며, 아직도
                        이곳에서는 그때의 열기가 느껴지는듯 하다. 어렸을적 일이라 자세하게 기억은 나지 않으나, 이 곳에 올때마다 왠지 그때의 열기가 
                        전해져 마음속을 두근거리게 만든다.
                     </a>         
                  </p>
               </td>
            </tr>
         </tbody>
         <tfoot>
            <tr>
               <td class="text-center" colspan="4">
                  <ul class="pagination">
                     <li><a href="#"> &lt;</a></li>
                     <li><a href="#">1</a></li>
                     <li><a href="#">2</a></li>
                     <li><a href="#">3</a></li>
                     <li><a href="#">4</a></li>
                     <li><a href="#">5</a></li>
                     <li><a href="#">&gt;</a></li>
                  </ul>
               </td>
            </tr>
         </tfoot>
      </table>
   </div>
       </div>
       <div role="tabpanel" class="tab-pane" id="like-list">
          <!-- 찜 목록 -->
       </div>
       <div role="tabpanel" class="tab-pane" id="qna-answer">
          <!-- 문의 및 답변 -->
       </div>
       <div role="tabpanel" class="tab-pane" id="settings">
          <!-- 회원정보 수정 -->
       </div>
       <div role="tabpanel" class="tab-pane" id="quit-member">
          <!-- 회원 탈퇴 -->
       </div>
     </div>

   </div>
  <script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

  <script>
   <!-- show와 hide 클래스를 추가한 아코디언 효과 jquey -->
    $(function(){  

        var article = (".recruit .show");  

        $(".recruit .item .title").click(function() {  

            var myArticle =$(this).parents().next("tr")  

            if($(myArticle).hasClass('hide')) {  

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
<%@ include file="../views/footer.jsp"%>