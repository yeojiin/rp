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
   href="${pageContext.request.contextPath}/css/company/c_calculateManager.css"> 
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
      
         <div class="col-sm-2 sidenav1"></div>
         
         
         <div class="col-sm-8 text-left">
         <%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>
         
            <div class="contentsArea">
            
            	<br><br><br>
					
				<label class="subSubTitle">정산 대기 리스트</label>
				<br><br>
				<table class="calculateStandByList">
					<thead>
						<tr>
							<td>No</td>
							<td>상품</td>
							<td>판매액</td>
							<td>지급예정액</td>
							<td>지급예정날짜</td>
							<td>지급보류여부</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>5</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td><button class="hold">보류</button></td>
						</tr>
						<tr>
							<td>4</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td><button class="normal">정상</button></td>
						</tr>
						<tr>
							<td>3</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td><button class="hold">보류</button></td>
						</tr>
						<tr>
							<td>2</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td><button class="normal">정상</button></td>
						</tr>
						<tr>
							<td>1</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td><button class="normal">정상</button></td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="6"><br>
								<button class="paging"><<</button>
								<button class="paging"><</button>
								<button class="paging">1</button>
								<button class="paging">2</button>
								<button class="paging">3</button>
								<button class="paging">4</button>
								<button class="paging">5</button>
								<button class="paging">></button>
								<button class="paging">>></button>
							</td>
						</tr>
					</tfoot>
				</table>
				
				<br><br><br>
					
				<label class="subSubTitle">정산 완료 리스트</label>
				<br><br>
				<table class="calculateStandByList">
					<thead>
						<tr>
							<td>No</td>
							<td>상품</td>
							<td>판매액</td>
							<td>지급완료액</td>
							<td>지급완료날짜</td>
							<td></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>5</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>4</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>3</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>2</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>1</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="6"><br>
								<button class="paging"><<</button>
								<button class="paging"><</button>
								<button class="paging">1</button>
								<button class="paging">2</button>
								<button class="paging">3</button>
								<button class="paging">4</button>
								<button class="paging">5</button>
								<button class="paging">></button>
								<button class="paging">>></button>
							</td>
						</tr>
					</tfoot>
				</table>
				
				<br><br><br>
					
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
   
   </script>
</body>
</html>