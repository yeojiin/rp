<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.redding.member.model.vo.Member, com.kh.redding.board.model.vo.*, java.util.Date"%>

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
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

<link href="${pageContext.request.contextPath}/css/dist/css/datepicker.min.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/css/dist/js/datepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/css/dist/js/i18n/datepicker.en.js"></script>

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
					<form action="">
					<fieldset style="border:1px solid lightgray !important; height:74px; margin-top:auto; margin-bottom:auto; padding:24px">
						<div>
						<div class="selectArea" style=" width:15%; display:inline-block; padding: 0 12px 0 0;margin: 0 5px 0 2px;">
							<select class="searchSelect" style="width:100%">
										<option value="40">예약대기</option>
										<option value="50">결제대기</option>
										<option value="60">결제완료</option>
										<option value="70">결제취소</option>										
								</select>
						</div>

								<span style="margin:0">
									<button type="button" class="cancellation dateSelect" value="1">오늘</button>
									<button type="button" class="cancellation dateSelect" value="7">1주일</button>
									<button type="button" class="cancellation dateSelect" value="30">1개월</button>
									<button type="button" class="cancellation dateSelect" value="90">3개월</button>
									<button type="button" class="cancellation dateSelect" value="180">6개월</button>
								</span>
								&nbsp;&nbsp;&nbsp;&nbsp;
								
								<input type='text' class='datepicker-here firstDate' data-language='en' data-date-format ='yyyy-mm-dd' style="width:7%"/>
								<!-- <input type = "text"  id ="datepicker" style="width:7%"> -->

								&nbsp;&nbsp;&nbsp;&nbsp;~
								&nbsp;&nbsp;&nbsp;&nbsp;
								
								<input type='text' class='datepicker-here lastDate' data-language='en' data-date-format ='yyyy-mm-dd' style="width:7%"/>							
								
								&nbsp;&nbsp;&nbsp;&nbsp;
								<button type="button" class="searchBtn cancellation">조회</button>
								
						</div>
					</fieldset>
					</form>					
					<br>					
				
					<table class="paymentList">
						<thead>
							<tr>
								<td>No</td>
								<td>업체명</td>
								<td>상품명</td>
								<td class="statusPayTd">결제일</td>
								<td>결제금액</td>
								<td>상태</td>
								<td></td>
							</tr>
						</thead>
						<tbody class="infoTable">
							
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
			
			//예약대기, 결제대기, 결제완료 카운트를 리턴
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
			
			//호출함수
			$("#resWait").click(function(){
				currentView(1,10);				
			});
			
			$("#payWait").click(function(){
				currentView(1,20);
			});
			
			$("#payFinal").click(function(){
				currentView(1,30);
			});
			
			$(".searchBtn").click(function(){
				currentView(1,$(".searchSelect").val());		 
			 });
			
			
			
			//페이징 처리를 하며 리스트를 리턴받음
			function currentView(currentPage,value){
				if(value == 40 || value == 50 || value == 60 || value == 70){
					var firstDate = $(".firstDate").val();
					var lastDate = $(".lastDate").val();
					 
					var firstDateArr = new Array();
					var lastDateArr = new Array();
					 //firstDate.split("-");	 
					for(var i=0; i<firstDate.split("-").length; i++){
						 firstDateArr[i] = firstDate.split("-")[i];
						 lastDateArr[i] = lastDate.split("-")[i];
					 }
					console.log(firstDateArr.join(""));
					console.log(lastDateArr.join(""));
				}else{
					var firstDateArr = new Array();
					var lastDateArr = new Array();
				}
				 
				
				$.ajax({
					url:"<%=request.getContextPath() %>/revSelect.me",
					type:"get",
					data:{mno:<%= loginUser.getMno() %>, value:value, currentPage:currentPage, firstDate:firstDateArr.join(""), lastDate:lastDateArr.join("")},
					success:function(data){
						viewTable(data,value);						
					},
					error:function(data){
						console.log("error");
					}
					
				});
			
				
			}
			
			
		   //넘겨 받은 pageInfo 객체를  통해 페이징
		   function pageBtn(data,value){
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
				   currentView(1,value);
			   }));
			   	   
				if(currentPage <= 1) { 
					$pageBtnArea.append($("<button>").attr("class","paging").text("<").attr("disabled",true).css("cursor","pointer"));
				}else{ 
					$pageBtnArea.append($("<button>").attr("class","paging").text("<").css("cursor","pointer").click(function(){
						   currentView(currentPage - 1,value);
					   }));

				 } 
				 for(var p= startPage; p <= endPage; p++){
					if(p == currentPage){
					$pageBtnArea.append($("<button>").attr("class","paging").text(p).attr("disabled",true).css({"cursor":"pointer","color":"white","background":"salmon"}));
				 }else{ 
					$pageBtnArea.append($("<button>").attr("class","paging").css("cursor","pointer").text(p).click(function(){
						   currentView($(this).text(),value);
					   }));
				 }
					
				 } 
				 if(currentPage >= maxPage){ 
					 $pageBtnArea.append($("<button>").attr("class","paging").text(">").attr("disabled",true).css("cursor","pointer"));					
				 }else {
					 $pageBtnArea.append($("<button>").attr("class","paging").text(">").css("cursor","pointer").click(function(){
						   currentView(currentPage + 1,value);
					   }));
				 } 
				 	$pageBtnArea.append($("<button>").attr("class","paging").text(">>").click(function(){
						   currentView(maxPage,value);
					   }));
		 	
		   }
		   			
			
		   //초기 날짜를 3개월로 설정
		   getDate(90);
		   
		   
		   //클릭시 날짜를 계산해주는 함수로 인자값을 전송
		   $(".dateSelect").click(function(){
			
			var value = $(this).val();
			
			getDate(value);
		
		 });
		   
		 
		 //넘겨받은 값에 따라 날짜를 계산해주는 포맷
		 function getDate(value){
			
			 var date = new Date();
			 
				if(value == 7){
					date.setDate(date.getDate() - 7);					
				}else if(value == 30){
					date.setMonth(date.getMonth() - 1);
				}else if(value == 90){
					date.setMonth(date.getMonth() - 3);
				}else if(value == 180){
					date.setMonth(date.getMonth() - 6);
				}
			 
			 var month = getMonth(date.getMonth());
			 
			 $(".firstDate").val(date.getFullYear()+ "-" + month + "-" + date.getDate());
			 $(".lastDate").val(new Date().getFullYear()+ "-" + getMonth(new Date().getMonth()) + "-" + new Date().getDate());
			 
		 }
		 
		 
		 //월을 포맷에 맞게 리턴
		 function getMonth(month){
			 		 
			 if(month < 9){
				   month = ('0' + (month+1));
				   
			   }else{
				   month = (month+1);				   
			   }
			 
			 
			 return month;
		 }
		 
		 
			
			function viewTable(data,value){
				$(".infoTable").empty();
				
				if(value==10 || value==20 || value==40 || value == 50){
					$(".statusPayTd").text("예약일");
				}else if(value == 70){
					$(".statusPayTd").text("예약일/결제취소일");
				}else{
					$(".statusPayTd").text("예약일/결제일");
				}
				
				console.log(data);
				
				for(var i=0; i<data.list.length; i++){
					var list = data.list[i];
					
					if(value == 10 || value == 20  || value == 40 || value == 50){
					var $infoTr = $("<tr>");
					var $noTd = $("<td>").text(list.rnum);
					var $pNameTd = $("<td>").text(list.pName);
					var $cNameTd = $("<td>").text(list.cName);
					var $priceTd = $("<td>").text(list.price);
					var $rapplyTd = $("<td>").text(list.rapply.split(" ")[0]);
					
					if(value == 10 || value==40 ) {
						$status = $("<td>").text("예약대기");
						$button = $("<button>").text("예약취소").attr("class","cancellation").css("margin-top","3px");
					}else if(value == 20 || value == 50){
						$status = $("<td>").text("예약승인").css("color","green");
						$button = $("<button>").text("예약취소요청").attr("class","cancellation").css("margin-top","3px");
					}else{
						$status = $("<td>").text("대기");
					}
					
					$infoTr.append($noTd);
					$infoTr.append($cNameTd);
					$infoTr.append($pNameTd);
					$infoTr.append($rapplyTd);
					$infoTr.append($priceTd);
					$infoTr.append($status);
					$infoTr.append($button);
					
					
					$(".infoTable").append($infoTr);
					
					}else if(value == 30 || value == 60 || value == 70){
						var $infoTr = $("<tr>");
						var $noTd = $("<td>").text(list.rnum);
						var $pNameTd = $("<td>").text(list.pName);
						var $cNameTd = $("<td>").text(list.cName);
						var $priceTd = $("<td>").text(list.price);
						var $rapplyTd = $("<td>").text(list.rapply.split(" ")[0] + "/" + list.approval.split(" ")[0]);
						//var $approvalTd = $("<td>").text(list.approval.split(" ")[0]);
						
						if(value == 70){
							var $status = $("<td>").text("결제취소").css("color","red");
						}else{
							var $status = $("<td>").text("결제완료").css("color","salmon");
						}
						
						
						var $div = $("<div>");
						$div.empty();
						
						if(value == 70){
							
						}else{						
						var $button = $("<button>").text("후기작성").attr("class","cancellation").css("margin-top","3px");								
						var $cancleBtn = $("<button>").text("결제취소요청").attr("class","cancellation").css("margin-top","3px");
						}
						
						$div.append($button);
						$div.append("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
						$div.append($cancleBtn);
						
						$infoTr.append($noTd);
						$infoTr.append($cNameTd);
						$infoTr.append($pNameTd);
						$infoTr.append($rapplyTd);
						//$infoTr.append($approvalTd);
						$infoTr.append($priceTd);
						$infoTr.append($status);
						$infoTr.append($div);
						
						$(".infoTable").append($infoTr);
					}
						
				}
										
				pageBtn(data,value);
			}
		});
		
		
	</script>

</body>
</html>
