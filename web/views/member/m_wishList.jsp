<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	href="${pageContext.request.contextPath}/css/member/m_wishList.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
</head>
<body>

	<!-- 멤버 헤더 (미니메뉴, 로고) -->
	<div class="headerArea">
		<jsp:include page="/views/member/m_header.jsp"></jsp:include>
	</div><br>

	<!-- 섹션 -->
	<div class="container-fluid text-center">
		<div class="row content">

			<!-- 왼쪽 빈공간 -->
			<div class="col-sm-2 sidenav"></div>

			<div class="col-sm-8 text-left">
				<%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>

				<div class="wishList">
					<h1 style="text-align:center;">Wish List</h1>
					<table id="wishListTable">
						<tr style="border-bottom:1px solid lightgray;">
							<th>상품명</th>
							<th><img id="image"></th>
							<th>상품금액</th>
							<th></th>
						</tr>
						<tr>
							<td><label id="pName">빠숑 스튜디오</label></td>
							<td>
								<img id="image" src="../../images/logo.png">
							</td>
							<td>1500000</td>
							<td><input type="checkbox"></td>
						</tr>
						<tr>
							<td><label id="pName">KH드레스</label></td>
							<td>
								<img id="image" src="../../images/logo.png">
							</td>
							<td>2540000</td>
							<td><input type="checkbox"></td>
						</tr>
						<tr>
							<td><label id="pName">하기시러</label></td>
							<td>
								<img id="image" src="../../images/logo.png">
							</td>
							<td>7800000</td>
							<td><input type="checkbox"></td>
						</tr>
					</table>
				</div>
				<br><br>
				<div class="pResult">
				<h2>패키지 구성</h2>
					<table id="pResult">
						<tr>
						<td id="package1"><img id="image" src="../../images/logo.png"></td>
						<td> + </td>
						<td id="package2"><img id="image" src="../../images/logo.png"></td>
						<td> + </td>
						<td id="package3"><img id="image" src="../../images/logo.png"></td>
						<td> = </td>
						<td id="price">1000000</td>
						</tr>
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