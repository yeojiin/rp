<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
   href="${pageContext.request.contextPath}/css/company/c_messageManager.css"> 
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
            <div id="sendMessageBtn">쪽지 보내기</div>
         </div>
         
         
         <div class="col-sm-8 text-left">
         <%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>
         
            <div class="contentsArea" id="MMcontentArea">
            
               <div id="receiveMessageArea">
                  <!-- 받은 쪾지 관리 -->
                  <div id="RMHeader">
                     <h3>받은 쪽지 목록</h3>
                     <div id="RMBtnsArea" style="float:right;">
                        <div id="RMDeleteBtn">삭제</div>
                        <div id="RMReplyBtn">답장</div>
                     </div>
                  </div>
                  <table id="RMTable">
                     <!-- 받은 쪽지 조회 전체 결과 테이블 -->
                     <tr>
                        <th width="30">체크</th>
                        <th width="50">No.</th>
                        <th width="80">보낸 사람</th>
                        <th>내용</th>
                        <th width="120">날짜</th>
                        <th width="100">읽기-버튼영역</th>                     
                     </tr>
                     <!-- 다음 행부터는 자바스크립트로 ajax 처리 -->
                     <!-- radio 버튼도 함께 보내줘야 한다.
                     읽기 버튼도 함께 보내줘야 한다 -->
                  </table>
                  
                  <div id="RMPagingArea">
                     <!-- 페이징버튼 -->
                  </div>
               </div>
               
               
               <div id="myModal" class="modal">
 
				      <!-- Modal content -->
				      <div class="modal-content">
				        	<span class="close">&times;</span>                                                               
					        <h3>답장하기</h3>
					        <!-- 고객의 문의에 대한 답변 -->
					        <div id="modalContent">
					        	<input type="text" class="replyArea" name="reply" id="reply" value="해당쪽지의 수신인을 getAttribute(admin)로 가져오시오">
					        	<input type="text" class="replyArea" name="replyTitle" id="replyTitle" value="'Re ) 관리자가 보낸 쪽지 제목'을 작성하세요">
					        	<textarea id="replyContent" class="replyArea" name="replyContent", id="replyContent">
					        		관리자의 쪽지 내용을 ajax로 서블릿에서 가져온다
					        		--------------------------
					        		쪽지 내용에 대한 답변 작성
					     
					        		</textarea>
					        </div>
					        <div id="sendBtn" align="center">보내기</div>
				      </div>
				 
				  </div>
               
               
               <div id="sendMessageArea">
                  <!-- 예약자 정보 조회 -->   
                  <div id="SMHeader">
                     <h3>보낸 쪽지 목록</h3>
                     <div id="SMDeleteBtn">삭제</div>
                  </div>
                  <div id="SMSelectListArea">
                     <table id="SMTable">
                        <tr>
                        	<th width="30">체크</th>
	                        <th width="50">No.</th>
	                        <th width="80">받는 사람</th>
	                        <th>내용</th>
	                        <th width="120">날짜</th>
                       		<th width="100">읽기-버튼영역</th> 
                        </tr>
                        <!-- 자바스크립트로 전체리스트조회 결과 테이블 보여주고 input에서 search한 결과를 ajax로 변경해서 보여준다 -->
                     </table>
                  </div>
                  <div id="SMPagingArea">
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
   		//답장하기 눌렀을 때 나오는 모달창
   		var modal = document.getElementById('myModal');		
		var span = document.getElementsByClassName("close")[0];                                          
   		$("#RMReplyBtn").click(function(){
   			modal.style.display="block";
   		});
		span.onclick = function() {
		    modal.style.display = "none";
		}
		window.onclick = function(event) {
		    if (event.target == modal) {
		        modal.style.display = "none";
		    }
		}
   		
		$("#sendMessageBtn").click(function(){
			location.href="<%=request.getContextPath()%>/views/company/c_sendMessage.jsp";
		});
		$("#sendBtn").click(function(){
   			location.href="<%=request.getContextPath()%>/views/company/c_messageManager.jsp";
   		});
   	});
   </script>
</body>
</html>