<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.redding.member.model.vo.Member, com.kh.redding.board.model.vo.*"%>

<!DOCTYPE html>
<html>
<head>
<title>REDDING-MyPage</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR"
	rel="stylesheet"><!-- 글꼴 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/member/m_header.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common/footer.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/member/m_myPage.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/member/m_myPage_payment.css">
<style>

.container {
	width:100%;
	color:salmon;
	font-family:'Noto Sans KR', sans-serif;
}

.row.content {
	height: 450px;
}

.sidenav {
	height: 100%;
}

/* On small screens, set height to 'auto' for sidenav and grid */
@media screen and (max-width: 767px) {
	.sidenav {
		height: auto;
		padding: 15px;
	}
	.row.content {
		height: auto;
	}
}
.div1Table2Btn1 {
	width:100%;
	height:100%;
	text-align:center;
	font-family:'Noto Sans KR', sans-serif;
	font-size:17px;
	background:white;
	color:salmon;
	border-bottom:1px solid white;
	border-top:1px solid salmon;
	border-left:1px solid salmon;
	border-right:1px solid salmon;
}
</style>
</head>
<body>

	<!-- 멤버 헤더 (미니메뉴, 로고) -->
	<div class="headerArea">
		<%@include file="/views/member/m_header.jsp"%>
	</div><br>
	
	<div class="div1">
		<table class="div1Table">
			<tr>
				<td style="background:salmon"><img src="<%=request.getContextPath()%>/images/mplogo.png" height="70px"></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</table>
		<table class="div1Table2">
			<tr>
				<td><button class="div1Table2Btn">HOME</button></td>
				<td><button class="div1Table2Btn" onclick="location.href='<%=request.getContextPath() %>/views/member/m_myPage_checkList.jsp'">CHECK LIST</button></td>
				<td><button class="div1Table2Btn1" onclick="location.href='<%=request.getContextPath() %>/views/member/m_myPage_payment.jsp'">결제 내역</button></td>
				<td><button class="div1Table2Btn" onclick="location.href='<%=request.getContextPath() %>/views/member/m_myPage_coupon.jsp'">쿠폰함</button></td>
				<td><button class="div1Table2Btn" onclick="location.href='<%=request.getContextPath() %>/views/member/m_myPage_myWriting.jsp'">내 글 관리</button></td>
				<td><button class="div1Table2Btn" onclick="location.href='<%=request.getContextPath() %>/views/member/m_myPage_personalInformation.jsp'">개인정보 수정</button></td>
			</tr>
		</table>
	</div>

	<!-- 섹션 -->
	<div class="container-fluid text-center">
		<div class="row content">
			
			<!-- 왼쪽 빈공간 -->
			<div class="col-sm-2 sidenav" id="leftNav">
			
			</div>

			<div class="col-sm-10 text-left">
			<%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>
				
				<div class="contents">
				
					<div class="subTitle">
						<%=loginUser.getNickName()%>님의 결제 내역
					</div>
					<br><br>
					

					<div class="paymentCompleted" style="background:white">
						<div class="paymentLabel1">예약대기</div><br><br><br>
						<label id ="resWait" class="paymentLabel2">0</label>
						<label class="paymentLabel3">개</label>
					</div>
					&nbsp;&nbsp;&nbsp;
					<div class="bookingCompleted">

						<div class="paymentLabel1">결제대기</div><br><br><br>
						<label id ="payWait" class="paymentLabel2">0</label>
						<label class="
                          3">개</label>
					</div>
					&nbsp;&nbsp;&nbsp;
					<div class="ongoing">

						<div class="paymentLabel1">결제완료</div><br><br><br>
						<label id ="payFinal" class="paymentLabel2">0</label>
						<label class="paymentLabel3">개</label>
					</div>
					<br><br><br><br> 
					
					<table class="search">
						<tr>
							<td><button class="searchBtn">1개월</button></td>
							<td><button class="searchBtn">3개월</button></td>
							<td><button class="searchBtn">6개월</button></td>
							<td><button class="searchBtn">조건검색</button></td>
							<td><input class= type="text" value="2019.05.09"></td>
							<td> - </td>
							<td><input type="text" value="2019.05.09"></td>
							<td><button class="searchBtn">조회</button></td>
						</tr>
					</table>
										
					<br>					
				
					<table class="paymentList">
						<thead>
							<tr>
								<td>No</td>
								<td>업체명</td>
								<td>상품명</td>
								<td>결제일</td>
								<td>결제금액</td>
								<td>상태</td>
								<td></td>
							</tr>
						</thead>
						<tbody class="infoTable">
							<tr>
								<td>3</td>
								<td>업체3</td>
								<td>상품3</td>
								<td>19/05/09</td>
								<td>350,000</td>
								<td>예약완료</td>
								<td><button class="pay">결제하기</button></td>
							</tr>
							<tr>
								<td>2</td>
								<td>업체2</td>
								<td>상품2</td>
								<td>19/05/08</td>
								<td>690,000</td>
								<td>진행중</td>
								<td><button class="cancellation">예약취소</button></td>
							</tr>
							<tr>
								<td>1</td>
								<td>업체1</td>
								<td>상품1</td>
								<td>19/05/07</td>
								<td>280,000</td>
								<td>결제완료</td>
								<td><button class="review">후기작성</button></td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="7" class="pageBtnArea"><br>
									<button class="paging"><<</button>
									<button class="paging"><</button>
									<button class="paging">1</button>
									<button class="paging">></button>
									<button class="paging">>></button>							
								</td>
							</tr>
						</tfoot>
					</table>
					<br><br>
					
				</div>


			</div>
			
			<!-- 오른쪽 빈공간 -->
			<!-- <div class="col-sm-2 sidenav"></div> -->
			
		</div>

	</div>
	<br>
	
	<!-- 커먼 풋터 -->
	<div class="footerArea">
		<jsp:include page="/views/common/footer.jsp"></jsp:include>
	</div>
	
	<script>
		$(function(){
			
			
			$.ajax({
				url:"<%=request.getContextPath() %>/selectCount.me",
				type:"post",
				data:{mno:<%= loginUser.getMno() %>},
				success:function(data){
					$("#resWait").text(data.resWait);
					$("#payWait").text(data.payWait);
					$("#payFinal").text(data.payFinal);
				
				},
				error:function(data){
					console.log(data);
				}
				
				
			});
				
			$("#resWait").click(function(){
				currentView(1);				
			});
			
			$("#payWait").click(function(){
				currentView(1,20);
			});
			
			$("#payFinal").click(function(){
				currentView(1);
			});
			
			
			
			
			function currentView(currentPage){
				
				$.ajax({
					url:"<%=request.getContextPath() %>/revSelect.me",
					type:"post",
					data:{mno:<%= loginUser.getMno() %>, value:10, currentPage:currentPage},
					success:function(data){
						$(".infoTable").empty();
						console.log(data);
						
						for(var i=0; i<data.list.length; i++){
							var list = data.list[i];
							$infoTr = $("<tr>");
							$noTd = $("<td>").text(list.rnum);
							$pNameTd = $("<td>").text(list.pName);
							$cNameTd = $("<td>").text(list.cName);
							$priceTd = $("<td>").text(list.price);
							$rapplyTd = $("<td>").text(list.rapply.split(" ")[0]);
							
							if(list.status == 10) {
								$status = $("<td>").text("예약대기");
								$button = $("<button>").text("예약취소").attr("class","cancellation").css("margin-top","8px");
							}
							
							$infoTr.append($noTd);
							$infoTr.append($cNameTd);
							$infoTr.append($pNameTd);
							$infoTr.append($rapplyTd);
							$infoTr.append($priceTd);
							$infoTr.append($status);
							$infoTr.append($button);
							
							
							$(".infoTable").append($infoTr);
						}
						
						
						
						pageBtn(data);
						
					},
					error:function(data){
						console.log("error");
					}
					
				});
			}
			
		   function pageBtn(data){
			   var $pageBtnArea = $(".pageBtnArea");
			   			   
				//BoardPageInfo pi = (BoardPageInfo) session.getAttribute("pi");
				var currentPage = data.pi.currentPage;//pi.getCurrentPage();
				var limit = data.pi.limit;
				var maxPage = data.pi.maxPage;
				var startPage = data.pi.startPage;
				var endPage = data.pi.endPage;
				
							
			   $pageBtnArea.empty();
			   
			   $pageBtnArea.append($("<br>"));		   
			   
			   $pageBtnArea.append($("<button>").attr("class","paging").text("<<").css("cursor","pointer").click(function(){
				   currentView(1);
			   }));
			   			   
				if(currentPage <= 1) { 
					$pageBtnArea.append($("<button>").attr("class","paging").text("<").attr("disabled",true).css("cursor","pointer"));
				}else{ 
					$pageBtnArea.append($("<button>").attr("class","paging").text("<").css("cursor","pointer").click(function(){
						   currentView(currentPage - 1);
					   }));

				 } 
				 for(var p= startPage; p <= endPage; p++){
					if(p == currentPage){
					$pageBtnArea.append($("<button>").attr("class","paging").text(p).attr("disabled",true).css("cursor","pointer"));
				 }else{ 
					$pageBtnArea.append($("<button>").attr("class","paging").css("cursor","pointer").text(p).click(function(){
						   currentView($(this).text());
					   }));
				 }
					
				 } 
				 if(currentPage >= maxPage){ 
					 $pageBtnArea.append($("<button>").attr("class","paging").text(">").attr("disabled",true).css("cursor","pointer"));					
				 }else {
					 $pageBtnArea.append($("<button>").attr("class","paging").text(">").css("cursor","pointer").click(function(){
						   currentView(currentPage + 1);
					   }));
				 } 
				 	$pageBtnArea.append($("<button>").attr("class","paging").text(">>").click(function(){
						   currentView(maxPage);
					   }));
			   
			   
				 	
				 	
				 	
		   }
			
			
		});
		
		
	</script>

</body>
</html>
