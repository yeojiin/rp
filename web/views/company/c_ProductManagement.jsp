<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.redding.product.model.vo.*"%>
<%   
	ArrayList<Product> proList = (ArrayList<Product>) request.getAttribute("proList"); 
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();		
         //vo.상품에서 가져올 값  : 즉, 테이블에도 존재해야 함 아니면 count(*) 함수 사용하든가

         int productTotalCount = 400 ;
         int SaleProductCount = 300;
         int NoSaleProductCount = 100;
         int OpenProductCount = 50;
         int CloseProductCount = 1;
         
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR"
   rel="stylesheet">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/css/company/c_nav.css">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/css/common/footer.css">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/css/company/c_main.css">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/css/company/c_ProductManagement.css">   
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
   <!-- 상품관리페이지 -->
   <div>
      <jsp:include page="/views/company/c_nav.jsp"></jsp:include>
   </div>

   <div class="container-fluid text-center">
      <div class="row content">
      
         <div class="col-sm-2 sidenav1 visible-md visible-lg visible-sm">
         	<div id="productUploadBtn">상품 등록</div>
         </div>
         
         
         <div class="col-sm-8 text-left">
         <%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>
            <div class="contentsArea" id="productListContentsArea">
               <!-- 상품목록 밑의 전체~ 상품등록하기 버튼까지 -->
               <div id="PMTotalArea">
	               <div id="productListTitle">
	               		<h2>상품목록</h2>
		               <div id="productListAll">
		               	   <div id="productCountAllTb">
			                  <table id="productCountAll">
			                     <tr>
			                        <td>
			                           <label>전체 : </label>
			                           <input type="text" name="productTotalCount" value="<%=productTotalCount %>건" readonly id="productCountInput" style="width:45px; color:red; border: 0px;">
			                           <label>|</label>&nbsp;&nbsp;&nbsp;
			                        </td>
			                        <td>
			                           <label>판매함 : </label>
			                           <input type="text" name="SaleProductCount" value="<%=SaleProductCount %>건" readonly id="productCountInput" style="width:45px; color:red; border: 0px;">
			                           <label>|</label>&nbsp;&nbsp;&nbsp;
			                        </td>
			                        <td>
			                           <label>판매 안함 : </label>
			                           <input type="text" name="NoSaleProductCount" value="<%=NoSaleProductCount %>건" readonly id="productCountInput" style="width:45px; color:red; border: 0px;">
			                           <label>|</label>&nbsp;&nbsp;&nbsp;
			                        </td><%-- 
			                        <td>
			                           <label>공개함 : </label>
			                           <input type="text" name="OpenProductCount" value="<%=OpenProductCount %>건" readonly id="productCountInput" style="width:45px; color:red; border: 0px;">
			                           <label>|</label>&nbsp;&nbsp;&nbsp;
			                        </td>
			                        <td>
			                           <label>공개 안함 : </label>
			                           <input type="text" name="CloseProductCount" value="<%=CloseProductCount %>건" readonly id="productCountInput" style="width:45px; color:red; border: 0px;">
			                           &nbsp;&nbsp;&nbsp;
			                        </td> --%>
			                     </tr>
			                  </table>
		                  </div>
		               </div>
	               </div>
               
               <!-- 검색분류테이블 -->
               <div id="productSearchTBArea">
                  <table id="productSearchTB">
                     <tr>
                        <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>                        
                        <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                     </tr>
                     <tr>
                        <td>
                           <label>검색 분류</label>
                        </td>
                        <td>
                           <select>                              
                              <option>상품명</option>
                              <option>기간</option>
                           </select>
                           <input type="search" name="productSearchForName" id="productSearchForName">
                        </td>
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
                           <label>상품 등록일</label>
                        </td>
                        <td>
                           <input type="radio" name="productSearchAboutTerm" id="productSearchToday" value="">
                           <label for="productSearchToday">오늘</label>
                           <input type="radio" name="productSearchAboutTerm" id="productSearchOneWeek" value="">
                           <label for="productSearchOneWeek">일주일이내</label>
                           <input type="radio" name="productSearchAboutTerm" id="productSearchOneMonth" value="">
                           <label for="productSearchOneMonth">1개월이내</label>
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
               <!-- 조회결과물 보여주는 목록 -->
               <!-- 페이징 처리 해야 함 -->
               
               <div id="productSearchResultList">
               		
				
			  	<table align="center" id="productSearchResulTB">
                     <tr>
                     	<th width="3%"></th>
                        <th width="5%">No.</th>
                        <th width="15%">상품명</th>
                        <th width="10%">가격</th>
                        <th width="15%">상품등록일</th>
                        <th width="15%">상품수정일</th>
                        <th width="10%">판매 여부</th>
                        <th width="10%"></th>
                     </tr>
                     <% for(Product pro : proList){ %>
                        <tr>
                        <!-- ajax로 행 처리하기 처리할때 아래와 같이 체크박스와 버튼 도 같이 나와야 한다. -->
                           <td><input type="checkbox" name="" id=""></td>
                           <td><%=pro.getpNo() %></td>
                           <td><%=pro.getpName() %></td>
                           <td><%=pro.getPrice() %></td>
                           <td><%=pro.getpEnrollDate() %></td>
                           <%if(pro.getpModifyDate() == null){ %>
                           		<td>-</td>
                           <%}else{ %>
	                           <td><%=pro.getpModifyDate() %></td>
                           		
                           <%} %>
                           <td><%=pro.getProStatus() %></td>
                           <td>
                           		<div id="productDetailBtn" class="productDetail">상세보기</div>
                           </td>
                        </tr>
                     <% } %>
                     <tr>
                     	<td colspan="8">
                     		<div id="PMBtns">
                     			<span id="productDeleteBtn">삭제하기</span>
                     		</div>
                     	</td>
                     </tr>
                  </table>
                  <div class="paginArea" align = "center">
					<button onclick="location.href='<%=request.getContextPath()%>/selectProList.pr?currentPage=1'"> << </button>
					<%if(currentPage<=1){ %>			
						<button disabled> < </button>
					<%} else{%>
						<button onclick="location.href='<%=request.getContextPath() %>/selectProList.pr?currentPage=<%=currentPage - 1 %>'"> < </button>
					<%} %>
					
					
					<%for(int p=startPage ; p<=endPage ; p++){ 
						if(p == currentPage){%>
							<button disabled> <%=p %> </button>
						<%}else{ %>
							<button onclick="location.href='<%=request.getContextPath()%>/selectProList.pr?currentPage=<%=p%>'"> <%=p %> </button>
						<%} %>
					
					<%} %>
					
					
					<%if(currentPage >= maxPage){ %>
						<button disabled> > </button>
					<%}else{ %>
						<button onclick="location.href='<%=request.getContextPath()%>/selectProList.pr?currentPage=<%=currentPage + 1%>'"> > </button>
					<%} %>			
					
					<button onclick="location.href='<%=request.getContextPath()%>/selectProList.pr?currentPage=<%=maxPage%>'"> >> </button>
			
			
				</div>
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
         $("#productUploadBtn").click(function(){
            //상품등록하기 버튼을 눌렀을 때 작동할 함수
            //c_ProductUpload.jsp로 페이지 이동해주기
            location.href="<%=request.getContextPath()%>/views/company/c_ProductInsert.jsp";
         });   
         $(".productDetail").click(function(){
            //결과 조회 목록에서 버튼 클릭시 페이지 이동
            //상세보기 페이지 갓다가 -> 수정페이지 혹은 삭제페이지로 이동하자
            var pNo = $(this).parent().parent().children().eq(1).text();
            console.log("pno: " + pNo);
            /* pNo = Number(pNo);
            console.log("typeof(pno) : " + typeof(pNo)); */
            
            
            location.href="<%=request.getContextPath()%>/proDetail.pr?pno="+pNo;
         });
         $("#productDeleteBtn").click(function(){
        	 var result = window.confirm("정말 삭제 하시겠습니까?");
        	 if(result == true){
        		 alert("해당 상품이 삭제 되었습니다");
        	 }else{
        		 alert("삭제를 취소하셨습니다.");
        	 }
         });
         $("#searchBtn").click(function(){
        	 /* 검색값들을 서블릿으로 넘겨주어야 함 */
        	 var startDate = $("#startDate").text();
        	 var endDate = $("#endDate").text();
        	 
        	 console.log(typeof(startDate));
        	 console.log(endDate);
         });
      });
   </script>
</body>
</html>
   
   