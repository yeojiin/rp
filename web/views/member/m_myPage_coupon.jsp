<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.redding.member.model.vo.Member"%>
<%
	Member loginUser = (Member) session.getAttribute("loginUser");
%>
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
	href="${pageContext.request.contextPath}/css/member/m_myPage_coupon.css">
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
		<jsp:include page="/views/member/m_header.jsp"></jsp:include>
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
				<td><button class="div1Table2Btn" onclick="location.href='<%=request.getContextPath() %>/views/member/m_myPage_payment.jsp'">결제 내역</button></td>
				<td><button class="div1Table2Btn1" onclick="location.href='<%=request.getContextPath() %>/views/member/m_myPage_coupon.jsp'">쿠폰함</button></td>
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
				<div style="position:fixed; width:15.3%;"><img src="<%=request.getContextPath()%>/images/event.png" width="100%"></div>
			</div>

			<div class="col-sm-10 text-left">
			<%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>
				<input type="hidden" value="<%= loginUser.getMno() %>" id="mno" >
				<input type="hidden" value="<%= loginUser.getMemberName() %>" id="memberName">
				
				<div class="contents">
				
					<div class="subTitle">
						<%=loginUser.getNickName()%>님의 쿠폰함
					</div>
					<br><br>
					
					<div class="availableCoupon">
						<div class="couponLabel1">사용가능한 쿠폰</div><br><br>
						<label class="couponLabel2" style="cursor:pointer">1</label>
						<label class="couponLabel3">개</label>
					</div>
					&nbsp;&nbsp;&nbsp;
					<div class="imminentCoupon">
						<div class="couponLabel1">마감임박 쿠폰</div><br><br>
						<label class="couponLabel2" style="cursor:pointer">1</label>
						<label class="couponLabel3">개</label>
					</div>
					&nbsp;&nbsp;&nbsp;
					<div class="downAvailableCoupon">
						<div class="couponLabel1">발급가능 쿠폰</div><br><br>
						<label class="couponLabel2" style="cursor:pointer">1</label>
						<label class="couponLabel3">개</label>
					</div>
					<br><br><br><br> 
					
					<div class="tableArea">
						<button class="availableCouponList">사용가능</button>
						<button class="usedCouponList">사용완료</button>
						
						<br><br>
					
						<table class="couponTable">
							<thead>
								<tr>
									<td>쿠폰명</td>
									<td>할인액(율)</td>
									<td>사용조건</td>
									<td>유효기간</td>
									<td>적용 카테고리</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="5">사용가능한 쿠폰이 없습니다.</td>
								</tr>
							</tbody>
						</table>
					</div>
					
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
	
	$(function() {
		
		$(".couponLabel2").click(function() {
			
			$.ajax({
								
				url:"../../selectIssuableCouponList.me",
				type:"post",
				data:{mno:$("#mno").val()},
				success:function(data) {
					
					$(".tableArea").empty();
					
					//여기부터
					
					/* for(var i in data) {
						console.log(data[i]); */
						/* 
						var fp = data[i].filePath;
						var src = fp.substring(fp.length-15, fp.length) + data[i].changeName;
						$couponDiv = $("<div class='couponDiv' style='width:32%; height:auto; border:1px solid salmon; display:inline-block; text-align:center;''>");
						$couponImg = $("<img src='../../" +  src + "' style='width:100%'>") ;
						$nbsp = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
						
						$couponDiv.append($couponImg);
						$couponDiv.after($nbsp);
						
						$(".tableArea").append($couponDiv); */
						
						/* for(var j = 1; j < ((i/3)+2); j++) {
							
							$rowDiv = $("<div class='row"+j+"' style='width:100%; height:50px; background:whitesmoke; margin-bottom:10px;'>");
							$(".tableArea").append($rowDiv); */
							
							/* $couponDiv = $("<div class='coupon" + j + "div' style='width:32%; height:auto; border:1px solid salmon; display:inline-block; text-align:center;'>");
							$(".tableArea").append($couponDiv);
							
							if(i < (j+(j*2)+1)) {
								var fp = data[i].filePath;
								var src = fp.substring(fp.length-15, fp.length) + data[i].changeName;
								$couponImg = $("<img src='../../" + src + "' style='width:100%'>") ;
								
								$("'.couponDiv" + j +"div'").append($couponImg);
							} */
							
						/* }
						
						
					} */
					
					// 여기까지 주석 (4파트)
					
					for(var j = 1; j < (data.length/3) + 1 ; j++) {
						$rowDiv = $("<div class='row"+j+"' style='width:100%; height:100%; margin-bottom:10px;'>");
						$(".tableArea").append($rowDiv);
						
						for(var i in data) {
							
							console.log(data[i]);
							
							if((j-1)*3 <= i && i < (j*2)+j) {
							
								$couponDiv = $("<div class='couponDiv'>");
								
								var fp = data[i].filePath;
								var src = fp.substring(fp.length-15, fp.length) + data[i].changeName;
								$couponImg = $("<img src='../../" + src + "' style='width:100%'>") ;
								$nbsp = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
								$br = "<br>";
								$couponName = $("<label style='font-size:20px;'>").text(data[i].couponName);
								$couponCategory = $("<label style='font-size:20px;'>").text(data[i].couponCategory);
								// $couponDescrition = $("<label style='color:gray;'>").text(data[i].couponDescrition);
								$couponEndDate = $("<label style='color:gray;'>").text(data[i].couponEndDate);
								$couponDownloadBtn = $("<button class='couponDownloadBtn'>").text("발급받기");
								
								
								
								$rowDiv.append($couponDiv);
								$couponDiv.append($br);
								$couponDiv.append($couponImg);
								$couponDiv.append($br);
								$couponDiv.append($br);
								$couponDiv.append($couponCategory);
								$couponDiv.append($couponName);
								$couponDiv.append($br);
								// $couponDiv.append($couponDescrition);
								// $couponDiv.append($br);
								$couponDiv.append($couponEndDate);
								$couponDiv.append($br);
								$couponDiv.append($br);
								$couponDiv.append($couponDownloadBtn);
								$couponDiv.after($nbsp);
								
							}
						}
						
						
					}
					
					
				},
				error:function() {
					
				}
			}); 
			
		});
		
	});
	
	</script>

</body>
</html>
