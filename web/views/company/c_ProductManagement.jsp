<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%   
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
   height: 920px;
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
   <!-- 상품관리페이지 -->
   <div>
      <jsp:include page="/views/company/c_nav.jsp"></jsp:include>
   </div>

   <div class="container-fluid text-center">
      <div class="row content">
      
         <div class="col-sm-2 sidenav1">
         </div>
         
         
         <div class="col-sm-8 text-left">
         <%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>
         
            <div class="contentsArea" id="productListContentsArea">
               <!-- 상품목록 밑의 전체~ 상품등록하기 버튼까지 -->
               <div id="productListTitle"><h2>상품목록</h2></div>
               <div id="productListAll">
                  <table id="productCountAll">
                     <tr>
                        <td>
                           <label>전체 : </label>&nbsp;&nbsp;&nbsp;
                           <input type="text" name="productTotalCount" value="<%=productTotalCount %>건" readonly id="productCountInput" style="width:45px; color:red; border: 0px;">
                           <label>|</label>&nbsp;&nbsp;&nbsp;
                        </td>
                        <td>
                           <label>판매함 : </label>&nbsp;&nbsp;&nbsp;
                           <input type="text" name="SaleProductCount" value="<%=SaleProductCount %>건" readonly id="productCountInput" style="width:45px; color:red; border: 0px;">
                           <label>|</label>&nbsp;&nbsp;&nbsp;
                        </td>
                        <td>
                           <label>판매 안함 : </label>&nbsp;&nbsp;&nbsp;
                           <input type="text" name="NoSaleProductCount" value="<%=NoSaleProductCount %>건" readonly id="productCountInput" style="width:45px; color:red; border: 0px;">
                           <label>|</label>&nbsp;&nbsp;&nbsp;
                        </td>
                        <td>
                           <label>공개함 : </label>&nbsp;&nbsp;&nbsp;
                           <input type="text" name="OpenProductCount" value="<%=OpenProductCount %>건" readonly id="productCountInput" style="width:45px; color:red; border: 0px;">
                           <label>|</label>&nbsp;&nbsp;&nbsp;
                        </td>
                        <td>
                           <label>공개 안함 : </label>&nbsp;&nbsp;&nbsp;
                           <input type="text" name="CloseProductCount" value="<%=CloseProductCount %>건" readonly id="productCountInput" style="width:45px; color:red; border: 0px;">
                           &nbsp;&nbsp;&nbsp;
                        </td>
                        <td>
                           <div id="productUploadBtn">상품등록하기</div>                           
                        </td>
                     </tr>
                  </table>
               </div>
                  <br>
               
               <!-- 검색분류테이블 -->
               <div id="productSearchTable">
                  <table id="productSearchTB" border="1">
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
                           <label>판매 상태</label>
                        </td>
                        <td>
                           <input type="radio" name="productSearchAboutOpen" id="productSearchAllAboutOpen" value="open1">
                           <label for="productSearchAllAboutOpen">전체 상품</label>
                           <input type="radio" name="productSearchAboutOpen" id="productSearchOpen" value="open2">
                           <label for="productSearchOpen">공개 상품</label>
                           <input type="radio" name="productSearchAboutOpen" id="productSearchClose" value="open3">
                           <label for="productSearchClose">공개하지 않는 상품</label>
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
                           <input type="date" name="productSearchStartDate" value="">
                           <label> ~ </label>
                           <input type="date" name="productSearchEndDate" value="">
                        </td>
                     </tr>
                  </table>
               </div>
               <br><br>
               <!-- 조회결과물 보여주는 목록 -->
               <!-- 페이징 처리 해야 함 -->
               <div id="productSearchResultList">
                  <table align="center" id="productSearchResulTB" border="1">
                     <tr>
                        <th>No.</th>
                        <th>상품명</th>
                        <th>상품등록일</th>
                        <th>판매 여부</th>
                        <th>수정/삭제</th>
                     </tr>
                     <%-- <% for(CompanyProduct cp : list){ %> --%>
                        <tr>
                           <%-- <td><%= cp.get %></td>
                           <td><%= cp.get %></td>
                           <td><%= cp.get %></td> --%>
                           <td><div id="productUpdateOrDeleteBtn">수정/삭제하기</div></td>
                           <td></td>
                        </tr>
                     <%-- <% } %> --%>
                  </table>
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
            location.href="c_ProductInsert.jsp";
         });   
         $("#productUpdateOrDeleteBtn").click(function(){
            //결과 조회 목록에서 버튼 클릭시 페이지 이동
            //상세보기 페이지 갓다가 -> 수정페이지 혹은 삭제페이지로 이동하자
            location.href="c_ProductDetail.jsp";
         });
      });
   </script>
</body>
</html>
   
   