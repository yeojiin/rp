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
   height: auto;
   }

   .sidenav1 {
      padding-top: 20px;
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
      
         <div class="col-sm-2 sidenav1 visible-md visible-lg visible-sm">
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
                     <tr>
                     	<td>
                     		<input type="checkbox" name="receiveMeessage" id="receiveMeessage">
                     	</td>
                     	<td>2</td>
                     	<td>3</td>
                     	<td>
                     		<p id="messageContent"></p>
                     		<p></p>
                     	</td>
                     	<td>5</td>
                     	<td>6</td>
                     </tr>
                     <tr>
                     	<td>
                     		<input type="checkbox" name="receiveMeessage" id="receiveMeessage">
                     	</td>
                     	<td>2</td>
                     	<td>3</td>
                     	<td>4</td>
                     	<td>5</td>
                     	<td>6</td>
                     </tr>
                  </table>
                  
                  <div id="RMPagingArea">
                     <!-- 페이징버튼 -->
                  </div>
               </div>
               
               <div id="myModal" class="modal">
 
				      <!-- Modal content -->
				      <div class="modal-content">
				        	<span class="close">&times;</span> 
				        	<form action="" method="post">
				        		<div id="receiveArea">
							        <h3>받은 쪽지</h3>
							        <!-- 고객의 문의에 대한 답변 -->
							        <div class="modalContent">
							        	<label>발신인 </label> <input type="text" class="receiveMessage" name="receiveId" id="receiveId" value="해당쪽지의 수신인을 getAttribute(admin)로 가져오시오"readonly>
							        	<label>수신날짜 </label> <input type="text" class="receiveMessage" name="receiveDay" id="receiveDay" value="받은 쪽지 날짜"readonly>
							        	<textarea class="receiveMessage" name="receiveContent" id="receiveContent"readonly>
							        		관리자의 쪽지 내용을 ajax로 서블릿에서 가져온다
							     
							        	</textarea>
							        </div>
				        		</div>
				        		<div id="sendArea">
				        			<h3>답장 보내기</h3>
				        			<input type="text" class="sendMessage" name="sendId" id="sendId" value="해당쪽지의 발신인을 '본인' 로 가져오시오"readonly>
							        	<input type="text" class="receiveMessage" name="sendDay" id="sendDay" value="오늘 날짜"readonly>
							        	<textarea class="sendMessage" name="sendContent" id="sendContent">
							        		
							        		쪽지 내용에 대한 답변 작성
							     
							        	</textarea>
				        		</div>
						        <div id="sendBtn" align="center">보내기</div>
				        		
				        	</form>                                                              
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
                        <tr>
                     	<td>
                     		<input type="checkbox" name="sendMessage" id="sendMessage">
                     	</td>
                     	<td>2</td>
                     	<td>3</td>
                     	<td>4</td>
                     	<td>5</td>
                     	<td>6</td>
                     </tr>
                     <tr>
                     	<td>
                     		<input type="checkbox" name="sendMessage" id="sendMessage">
                     	</td>
                     	<td>2</td>
                     	<td>3</td>
                     	<td>4</td>
                     	<td>5</td>
                     	<td>6</td>
                     </tr>
                     </table>
                  </div>
                  <div id="SMPagingArea">
                  </div>
               </div>
               <div id="topBtn">▲</div>
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
		
		/* ajax로 해야 됨 */
		var totalContent = "우는 품고 끓는 거선의 있는 것은 바로 인류의 청춘이 운다. 뜨거운지라, 이상 하여도 곳으로 관현악이며, 가치를 그러므로 사막이다. 꾸며 풀이 얼마나 보는 보내는 청춘 것이다.천지는 노래하며 고행을 가는 피다. 뜨거운지라, 가슴이 않는 예가 칼이다. 공자는 따뜻한 새 간에 가치를 들어 피가 가장 설산에서 보라. 내는 같이, 싹이 아름다우냐? 얼음과 가지에 꽃이 그들의 인생을 광야에서 그리하였는가? 몸이 너의 때까지 이것을 뼈 그들의 천하를 약동하다. 산야에 심장은 거친 무엇을 끓는 구하지 것이다. 커다란 같이, 보는 못할 아름답고 보이는 영원히 너의 때문이다. 천고에 자신과 우리의 우리의 풀이 이것이다. 타오르고 고동을 그러므로 구하지 약동하다. 놀이 그것을 그들은 앞이 이상의 이상이 길지 부패뿐이다.";		
		var sampleContent = totalContent.substr(0,30) + "...";
		$("#messageContent").text(sampleContent);
		
		$("#RMDeleteBtn").click(function(){
			/* 체크된 메세지들을 삭제 */
			var resultRM = window.confirm('해당 메세지들을 삭제하시겠습니까?');
			
			if(resultRM==true){
				alert('삭제되었습니다');
			}else{
				alert('삭제가 취소되었습니다.');
			}
		});
		$("#SMDeleteBtn").click(function(){
			/* 체크된 메세지들을 삭제 */
			var resultSM = window.confirm('해당 메세지들을 삭제하시겠습니까?');
			
			if(resultSM==true){
				alert('삭제되었습니다');
			}else{
				alert('삭제가 취소되었습니다.');
			}
		});
   	});
   </script>
</body>
</html>