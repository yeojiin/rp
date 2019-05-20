<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.redding.member.model.vo.Member, com.kh.redding.product.model.vo.*"%>
<%
	Member loginUser = (Member) session.getAttribute("loginUser");
	ArrayList<UseProduct> useProList = (ArrayList<UseProduct>)request.getAttribute("useProList"); 
	Product pro = (Product) request.getAttribute("pro");
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int startRow = pi.getStartRow();
	int endRow = pi.getEndRow();

%>
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
   href="${pageContext.request.contextPath}/css/company/c_productDetail.css"> 
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
      
         <div class="col-sm-2 sidenav1 visible-md visible-lg visible-sm">
            
         </div>
         
         
         <div class="col-sm-8 text-left">
         <%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>
         
            <div class="contentsArea" id="productInsertArea">
               <form action="<%=request.getContextPath() %>/updateProduct.pr" method="post" id ="updatePro">
                     
                  <div id="PIHeader">
                     <h3>상품상세 페이지</h3>
                  </div>
                  <div id="PISection">
                       <table id="PITable">
                          <tr>
                             <th width="15%">상품명</th>
                             <th width="15%">등록일</th>
                             <th width="15%">가격(원)</th>
                             <th width="20%">판매여부</th>
                          </tr>
                          <tr>
                          	<td>
                          		<input type="text" name="proName" id="proName" value="<%=pro.getpName()%>" readonly>
	                             <input type="hidden" value="<%=loginUser.getMno()%>" id="cNo" name="cNo">
	                             <input type="hidden" value="<%=pro.getpNo()%>" id="pNo" name="pNo">
                          	</td>
                          	<td>
                          		<input type="text" name="proEnrollDate" id="proEnrollDate" value="<%=pro.getpEnrollDate()%>" readonly>
                          	</td>
                          	<td>
                          		<input type="number" name="proPrice" id="proPrice" value="<%=pro.getPrice()%>" step="5000" min="0">
                          	</td>
                          	<td>
                          		<%-- <input type="text" name="" id="" value="<%=pro.getProStatus()%>"> --%>
                          		<input type="radio" name="proStatus" id="proStatusYes" value="판매">
                                <label for="proStatusYes">판매함</label>
                                <input type="radio" name="proStatus" id="proStatusNo" value="판매안함">
                                <label for="proStatusNo">판매안함</label>
                          	</td>
                       	</tr>
                       	<tr>
                          	<td colspan="5">
                          		<textarea name="proContent" id="proContent"><%=pro.getpContent()%></textarea>
                          	</td>                          	
                          </tr>
                          
                       </table>
                  
                  </div>
                     <div id="PIfooter">
                        <div id="PIBtns">
                           <div id="PIInsertBtn">수정하기</div>
                           <div id="PIResetBtn">이전으로</div>
                        </div>
                     </div>
               </form>
               <div id="selectArea">
               <div id="productSearchTBArea">
                  <table id="productSearchTB">
                     <tr>
                        <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>                        
                        <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                     </tr>
                     <tr>
                        <td>
                           <label>상품 구분</label>
                        </td>
                        <td>
                           <input type="radio" name="productSearchAbountSale" id="productSearchAllAboutSale" value="sale1">
                           <label for="productSearchAllAboutSale">전체 상품</label>
                           <input type="radio" name="productSearchAbountSale" id="productSearchSale" value="sale2">
                           <label for="productSearchSale">판매 상품</label>
                           <input type="radio" name="productSearchAbountSale" id="productSearchNoSale" value="sale3">
                           <label for="productSearchNoSale">판매하지 않는 상품</label>
                        </td>
                     </tr>
                     <tr>
                        <td>
                           <label>예약가능일</label>
                        </td>
                        <td>
                           <input type="date" name="startDate" value="">
                           <label> ~ </label>
                           <input type="date" name="endDate" value="">
                        </td>
                     </tr>
                     <tr>
                        <td colspan="2">
                           <div id="searchBtn">검색하기</div>
                        </td>
                     </tr>
                  </table>
               </div>
               <br><br>
               </div>
               <table id="selectTable">
               		<tr>
               			<th width="3%"></th>
               			<th width="3%">No.</th>
               			<th width="10%">예약가능날짜</th>
               			<th width="10%">예약시작시간</th>
               			<th width="10%">예약종료시간</th>
               			<th width="5%">수량</th>
               			<th width="5%">판매여부</th>
               			<th width="5%"></th>
               		</tr>
               		<% for(UseProduct uproList : useProList){ %>
                        <tr>
                        <!-- ajax로 행 처리하기 처리할때 아래와 같이 체크박스와 버튼 도 같이 나와야 한다. -->
                           <td><input type="checkbox" name="proCheck" id="proCheck"></td>
                           <td><%=startRow %>
                              <input type="hidden" name="proNum" id="proNum" value="<%=uproList.getUpNo()%>">
                           </td>
                           <td><%=uproList.getUseDate()%></td>
                           <td><%=uproList.getUseStartTime()%></td>
                           <td><%=uproList.getUseEndTime()%></td>
                           <td><%=uproList.getuNum()%></td>
                           <td><%=uproList.getUstatus()%></td>
                           <td>
                                 <div id="productDetailBtn" class="productDetail">상세보기</div>
                           </td>
                        </tr>
                        <%                        
                           startRow = startRow+1;
                           %>
                     <% } %>
                     <tr>
                     	<td colspan="8">
                     		<div id="sellStatusBtns">
	                     		<div id="productSellYesBtn">판매하기</div>
	                     		<div id="productSellNoBtn">판매취소</div>
                     		</div>
                     	</td>
                     </tr>
               </table>
              <div class="paginArea" align = "center">
               <button onclick="location.href='<%=request.getContextPath()%>/proDetail.pr?currentPage=1&pno=<%=pro.getpNo()%>'"> << </button>
               <%if(currentPage<=1){ %>         
                  <button disabled> < </button>
               <%} else{%>
                  <button onclick="location.href='<%=request.getContextPath() %>/proDetail.pr?currentPage=<%=currentPage - 1 %>&pno=<%=pro.getpNo()%>'"> < </button>
               <%} %>
               
               
               <%for(int p=startPage ; p<=endPage ; p++){ 
                  if(p == currentPage){%>
                     <button disabled> <%=p %> </button>
                  <%}else{ %>
                     <button onclick="location.href='<%=request.getContextPath()%>/proDetail.pr?currentPage=<%=p%>&pno=<%=pro.getpNo()%>'"> <%=p %> </button>
                  <%} %>
               
               <%} %>
               
               
               <%if(currentPage >= maxPage){ %>
                  <button disabled> > </button>
               <%}else{ %>
                  <button onclick="location.href='<%=request.getContextPath()%>/proDetail.pr?currentPage=<%=currentPage + 1%>&pno=<%=pro.getpNo()%>'"> > </button>
               <%} %>         
               
               <button onclick="location.href='<%=request.getContextPath()%>/proDetail.pr?currentPage=<%=maxPage%>&pno=<%=pro.getpNo()%>'"> >> </button>
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
   		  var pstatus = '<%=pro.getProStatus()%>';
    	  
   		  /* console.log(pstatus);
   		  console.log(typeof(pstatus)); */
   		  
    	  $("input[name=proStatus]").each(function(){
    		  var proStatus = $(this).val();
    		  /* console.log(proStatus);
    		  console.log(typeof(proStatus)); */
    		  if(proStatus==pstatus){
    			  $(this).attr("checked",true);
    		  }
    	  });
   		  
   		  $(".productDetail").click(function(){
   			  var upno = $(this).parent().parent().children().eq(1).children().eq(0).val();
   			  /* console.log(upno); */
   			  location.href="<%=request.getContextPath()%>/uproDetail.pr?upno="+upno;
   		  });
   		  
   		  $("#PIInsertBtn").click(function(){
				$("#updatePro").submit();
   		  });
   		  
   		  $("#PIResetBtn").click(function(){
   			  location.href="<%=request.getContextPath()%>/selectProList.pr";
    	  });
   			  
   		  $("#productSellYesBtn").click(function(){
   			var upnoArr = [];
   			var answer = "Y";
			  $("input[name=proCheck]").each(function(){
				  var upno = $(this).parent().parent().children().eq(1).children().eq(0).val();
				  if($(this).is(":checked")){
					  console.log("upno : " + upno);
					  upnoArr += upno +", ";
				  }
			  });
			  console.log(upnoArr);
			  
			  $.ajax({
				  url:"uproListUstatusY.pr",
				  type:"post",
				  data:{upnoArr:upnoArr,answer:answer},
				  success:function(data){
					  //alert("성공");
					  location.href="proDetail.pr?pno=<%=pro.getpNo()%>";
				  },
				  error:function(){
					  //alert("실패");
				  }
			  });
   		  });
   		  
   		$("#productSellNoBtn").click(function(){
 			  var upnoArr = [];
 			  var answer = "N";
 			  $("input[name=proCheck]").each(function(){
 				  var upno = $(this).parent().parent().children().eq(1).children().eq(0).val();
 				  if($(this).is(":checked")){
 					  console.log("upno : " + upno);
 					  upnoArr += upno +", ";
 				  }
 			  });
			  console.log(upnoArr);
			  
			  $.ajax({
				  url:"uproListUstatusY.pr",
				  type:"post",
				  data:{upnoArr:upnoArr,answer:answer},
				  success:function(data){
					  //alert("성공");
					  location.href="proDetail.pr?pno=<%=pro.getpNo()%>";
				  },
				  error:function(){
					  //alert("실패");
				  }
			  });
 		  });
  		 		  
        
      });
   </script>
</body>
</html>