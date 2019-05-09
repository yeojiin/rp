<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR"
   rel="stylesheet">
<!-- 글꼴 -->
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/css/common/footer.css">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/css/company/c_nav.css">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/css/company/c_main.css">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/css/company/c_customerManager.css"> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<style>
   .row.content {
   height: 1500px;
   }

   .sidenav1 {
      padding-top: 20px;
      background:MistyRose;
      height: 100%;
   }
   
   @media screen and (max-width: 767px) {
      .sidenav {
         height: auto;
         padding: 15px;
      }
      .row.content {
         height: auto;
      }
   }
</style>
</head>
<body>

   <!-- 업체 나브 -->
   <div>
      <jsp:include page="/views/company/c_nav.jsp"></jsp:include>
   </div>

   <div class="container-fluid text-center">
      <div class="row content">
      
         <div class="col-sm-2 sidenav1">
            <ul>
               <li id=""><h4>고객 문의 관리</h4></li>
               <li id=""><h4>예약 현황</h4></li>
               <li id=""><h4>예약자 정보 조회</h4></li>
            </ul>
         </div>
         
         
         <div class="col-sm-8 text-left">
         <%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>
         
            <div class="contentsArea" id="CMContentArea">
            
            
               <div id="customerManagerQNAArea">
                  <!-- 고객문의 관리 -->
                  <h3>고객 문의 목록</h3>
                  <table id="CMQTable">
                     <!-- 문의 조회 전체 결과 테이블 -->
                     <tr>
                        <th>No.</th>
                        <th>상품</th>
                        <th>작성자</th>
                        <th>내용</th>
                        <th>날짜</th>
                        <th><div id="replyQNABtn">답변하기</div></th>                     
                     </tr>
                     <!-- 다음 행부터는 자바스크립트로 ajax 처리 -->
                  </table>
                  
                  <div id="myModal" class="modal">
 
				      <!-- Modal content -->
				      <div class="modal-content">
				        	<span class="close">&times;</span>                                                               
					        <h3>답변하기</h3>
					        <!-- 고객의 문의에 대한 답변 -->
					        <div id="modalContent">
					        	<input type="text" class="replyQNAArea" name="replyToCustomer" id="replyToCustomer" value="해당쪽지의 수신인을 getAttribute로 가져오시오">
					        	<input type="text" class="replyQNAArea" name="replyQNATitle" id="replyQNATitle" value="'Re ) 고객이 올린 제목'을 작성하세요">
					        	<textarea id="replyQNAContent" class="replyQNAArea" name="replyQNAContent">
					        		여기에 문의에 대한 답변 내용을 작성하세요
					        		고객문의내용을 ajax로 가져오고
					        		그 밑에
					        		--------------------------
					        		문의 내용에 대한 답변 작성
					     
					        		</textarea>
					        <div id="sendReplyBtn" align="center">보내기</div>
					        </div>
				      </div>
				 
				  </div>
				  
				                  	
                  
                  <div id="CMQPagingArea">
                     <!-- 페이징버튼 -->
                  </div>
               </div>
               
               <div id="customerManagerReservation">
                  <!-- 예약 현황 -->
                  <h3>예약 현황</h3>
                  <div id="CMRStatus">
                     <!-- 캘린더 include해서 예약 현황들 보여주기 -->
                  </div>
               </div>
                  
               
               <div id="customerManagerBooker">
                  <!-- 예약자 정보 조회 -->   
                  <div id="CMBHeader">
                     <h3>예약자 정보 조회</h3>
                     <input type="search" name="bookerNickName" placeholder="조회할 회원의 닉네임을 입력해주세요" size="40" id="CMBHeaderInputArea">
                  </div>
                  <div id="CMBSelectListArea">
                     <table id="CMBTable">
                        <tr>
                           <th>No.</th>
                           <th>상품</th>
                           <th>예약자(성별)</th>
                           <th>연락처</th>
                           <th>날짜</th>
                           <th><div id="reserveStatus">진행상황</div></th>
                        </tr>
                        <!-- 자바스크립트로 전체리스트조회 결과 테이블 보여주고 input에서 search한 결과를 ajax로 변경해서 보여준다 -->
                     </table>
                  </div>
                  <div id="CMBPagingArea">
                  </div>
               </div>
            </div>
         
         </div>
         
         
         <div class="col-sm-2 sidenav2"></div>
      </div>
   </div>

   <!-- 커먼 풋터 -->
   <div class="footerArea">
      <jsp:include page="/views/common/footer.jsp"></jsp:include>
   </div>
   <script>
	   $(function(){
			// Get the modal
			var modal = document.getElementById('myModal');
			
			
			// Get the <span> element that closes the modal
			var span = document.getElementsByClassName("close")[0];                                          
			
			// When the user clicks on the button, open the modal 
			$("#replyQNABtn").click(function() {
			    modal.style.display = "block";
			});
			
			// When the user clicks on <span> (x), close the modal
			span.onclick = function() {
			    modal.style.display = "none";
			}
			
			// When the user clicks anywhere outside of the modal, close it
			window.onclick = function(event) {
			    if (event.target == modal) {
			        modal.style.display = "none";
			    }
			}
			$("#sendReplyBtn").click(function(){
				alert("쪽지를 보냈습니다.");
				//제목이랑 내용, 작성자, 날짜를 서블릿으로 넘겨줘서 DB에 저장
				modal.style.display = "none";
				
			});
		   
	   });

   </script>
</body>
</html>