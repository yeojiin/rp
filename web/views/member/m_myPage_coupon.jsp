<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="redding.member.model.vo.Member"%>
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
</style>
</head>
<body>

	<!-- 멤버 헤더 (미니메뉴, 로고) -->
	<div class="headerArea">
		<jsp:include page="/views/member/m_header.jsp"></jsp:include>
	</div><br>
	
	<div class="pageTitle">MY PAGE</div>

	<!-- 섹션 -->
	<div class="container-fluid text-center">
		<div class="row content">
			
			<!-- 왼쪽 빈공간 -->
			<div class="col-sm-2 sidenav" id="leftNav">
			
				<!-- <ul>
					<li><div class="leftMenu">CHECK LIST</div></li>
					<li><div class="leftMenu">결제 내역</div></li>
					<li><div class="leftMenu">쿠폰함</div></li>
					<li><div class="leftMenu">내 글 관리</div></li>
					<li><div class="leftMenu">개인정보 수정</div></li>
				</ul> -->
			
			</div>

			<div class="col-sm-8 text-left">
			<%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>
				<nav class="navbar navbar-inverse">
					<div class="container-fluid">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
								<span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
							</button>
						</div>
						<div class="collapse navbar-collapse" id="myNavbar">
							<ul class="nav navbar-nav">
								<li><button class="navBtn" id="navBtn" onclick="location.href='<%=request.getContextPath() %>/views/member/m_myPage_checkList.jsp'">&nbsp;&nbsp;&nbsp;CHECK LIST&nbsp;&nbsp;&nbsp;</button></li><br>
								<li><button class="navBtn" id="navBtn" onclick="location.href='<%=request.getContextPath() %>/views/member/m_myPage_payment.jsp'">&nbsp;&nbsp;&nbsp;결제내역&nbsp;&nbsp;&nbsp;</button></li><br>
								<li><button class="navBtn" id="navBtn" onclick="location.href='<%=request.getContextPath() %>/views/member/m_myPage_coupon.jsp'">&nbsp;&nbsp;&nbsp;쿠폰함&nbsp;&nbsp;&nbsp;</button></li><br>
								<li><button class="navBtn" id="navBtn" onclick="location.href='<%=request.getContextPath() %>/views/member/m_myPage_myWriting.jsp'">&nbsp;&nbsp;&nbsp;내 글 관리&nbsp;&nbsp;&nbsp;</button></li><br>
								<li><button class="navBtn" onclick="location.href='<%=request.getContextPath() %>/views/member/m_myPage_personalInformation.jsp'">&nbsp;&nbsp;&nbsp;개인정보 수정&nbsp;&nbsp;&nbsp;</button></li><br>
							</ul>
						</div>
					</div>
				</nav> 
				<div class="cont-box"></div>
				
				<div class="contents">
				
					<div class="subTitle">
						[ <%=loginUser.getMemberName()%>님의 쿠폰함 ]
					</div>
					
					<br><br><br>
					
					<div class="availableCoupon" style="background:white">
						<div class="couponLabel1">사용가능한 쿠폰</div><br><br><br>
						<label class="couponLabel2">3</label>
						<label class="couponLabel3">개</label>
					</div>
					&nbsp;&nbsp;&nbsp;
					<div class="imminentCoupon">
						<div class="couponLabel1">마감임박 쿠폰</div><br><br><br>
						<label class="couponLabel2">2</label>
						<label class="couponLabel3">개</label>
					</div>
					
					<br><br><br>
					
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
			
			<!-- 오른쪽 빈공간 -->
			<div class="col-sm-2 sidenav"></div>
			
		</div>

	</div>
	<br>
	
	<!-- 커먼 풋터 -->
	<div class="footerArea">
		<jsp:include page="/views/common/footer.jsp"></jsp:include>
	</div>

</body>
</html>
