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
   href="${pageContext.request.contextPath}/css/company/c_productUpdate.css"> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
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
      
         <div class="col-sm-2 sidenav1">
            
         </div>
         
         
         <div class="col-sm-8 text-left">
         <%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>
         
            <div class="contentsArea" id="productInsertArea">
            	<form action="" method="post">
               
                  <div id="PUHeader">
                     <h3>상품수정 페이지</h3>
                  </div>
                  <div id="PUSection">
                       <table id="PUTable">
                          <tr>
                             <th width="10%">&nbsp;</th>
                             <th width="15%" >&nbsp;</th>
                             <th width="5%">&nbsp;</th>
                             <th width="10%">&nbsp;</th>
                             <th width="15%">&nbsp;</th>
                             <th width="10%">&nbsp;</th>
                             <th width="20%">&nbsp;</th>
                          </tr>
                          <tr>
                             <td>
                                <label>구분</label>
                             </td>
                             <td>
                                <select id="PUCategorySelect" name="pucSelect">
                                   <option value="rehearsal">리허설</option>
                                   <option value="total">리허설 + 본식</option>
                                   <option value="wedding">본식</option>
                                </select>
                             </td>
                             <td id="space">
                                <label>-</label>
                             </td>
                             <td id="space">
                                <label>담당자</label>
                             </td>
                             <td>
                                <select id="PUManagerSelect" name="pmiSelect">
                                   <option value="1">원장</option>
                                   <option value="2">부원장</option>
                                   <option value="3">팀장</option>
                                   <option value="4">스탭</option>
                                   <option value="5">기타</option>
                                </select>
                             </td>
                             <td id="space">
                                <label>수량</label>
                             </td>
                             <td>
                                <select id="productAmount">
                                   
                                </select>
                             </td>
                          </tr>
                          <tr>
                             <td>
                              <label>가격</label>
                             </td>
                             <td colspan="6">
                                <input type="text" name="puPrice" id="puPrice">
                             </td>
                          </tr>
                          <tr>
                             <td>
                                <label>휴무일</label>
                             </td>
                             <td colspan="6">
                                <div id="PURestDayCheck">
                                   <input class="restDayCheck" type="checkbox" name="restDay" id="monday" value="">
                                   <label for="monday">월</label>
                                   <input type="checkbox" name="restDay" id="thuesday" value="">
                                   <label for="thuesday">화</label>
                                   <input type="checkbox" name="restDay" id="wednesday" value="">
                                   <label for="wednesday">수</label>
                                   <input type="checkbox" name="restDay" id="thursday" value="">
                                   <label for="thursday">목</label>
                                   <input type="checkbox" name="restDay" id="friday" value="">
                                   <label for="friday">금</label>
                                   <input type="checkbox" name="restDay" id="saturday" value="">
                                   <label for="saturday">토</label>
                                   <input type="checkbox" name="restDay" id="sunday" value="">
                                   <label for="sunday">일</label>
                                </div>
                             </td>
                          </tr>
                          <tr>
                             <td>
                                <label>예약 가능 날짜</label>
                             </td>
                             <td colspan="7">
                                <div id="PUCalendar">캘린더 영역</div>
                             </td>
                          </tr>
                          <tr>
                             <td>
                                <label>예약 시작 시간</label>
                             </td>
                             <td>
                                <input type="time" name="startTime" id="startTime">
                             </td>
                             <td id="space">
                                <label> - </label>
                             </td>
                             <td id="space">
                                <label>예약 종료시간</label>
                             </td>
                             <td>
                                <input type="time" name="endTime" id="endTime">
                             </td>
                             <td colspan="2"></td>
                          </tr>
                          <tr>
                             <td>
                                <label>상품 설명</label>
                             </td>
                             <td colspan="6">
                                <textarea cols="120" rows="23" name="info" id="info">상품설명</textarea>
                             </td>
                          </tr>
                       </table>
                  
                  </div>
                     <div id="PUfooter">
                        <div id="PUBtns">
                           <span id="PUInsertBtn">수정하기</span>
                           <span id="PUDeleteBtn">삭제하기</span>
                           <span id="PUResetBtn">취소하기</span>
                        </div>
                     </div>
               </form>
              
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
			$("#PUInsertBtn").click(function(){
				alert("상품을 수정하셨습니다.");
				location.href="<%=request.getContextPath()%>/views/company/c_ProductManagement.jsp";
				/* 서블릿을 통해 전체상품의 수량을 증가 시켜준다. */
			});
			$("#PUResetBtn").click(function(){
				alert("상품수정을 취소하셨습니다.");
				location.href="<%=request.getContextPath()%>/views/company/c_ProductManagement.jsp";
			});
			$("#PUDeleteBtn").click(function(){
				alert("상품을 삭제하셨습니다.");
				location.href="<%=request.getContextPath()%>/views/company/c_ProductManagement.jsp";
			});
	   });

   </script>
</body>
</html>