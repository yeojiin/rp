<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	href="${pageContext.request.contextPath}/css/admin/a_nav.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common/layout.css">
<link rel="stylesheet" type="text/css" 
	href="${pageContext.request.contextPath}/css/admin/a_message.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/semantic/semantic.min.css">

<style>

</style>
<title>Insert title here</title>
</head>
<body>
	<div>
		<jsp:include page="/views/admin/a_nav.jsp"></jsp:include>
	</div>
	<div class="container-fluid text-center">
		<div class="row content">

		<div class="visible-md visible-lg visible-sm">
			<div class="col-sm-2 sidenav1">
				<div class="sidenavArea">
					<ul class="navList">
						<li onclick="location.href='a_Company.jsp'">업체 목록</li>
						<li onclick="location.href='a_CompanyDetail.jsp'">업체 정보 조회</li>
						<li onclick="location.href='a_Message.jsp'" style="color:lightgray; padding-left:25px">업체 쪽지 관리</li>
					</ul>
				</div>
			</div>
		</div>
		
		<div class="visible-xs sideListnav2">
					<div class="col-sm-2 sidenav1">
						<div class="sidenavArea2">
						<ul class="navList2">
							<li onclick="location.href='a_Company.jsp'">업체 목록</li>
						<li onclick="location.href='a_CompanyDetail.jsp'">업체 정보 조회</li>
						<li onclick="location.href='a_Message.jsp'" style="color:lightgray; padding-left:25px">업체 쪽지 관리</li>
						</ul>
					</div>
					</div>
					
					<br><br>
				</div>
			<div class="col-sm-8 text-left">
				<%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>
				<div class="messageArea">
				
					<div class="message">
						<br>
						<div class="recieveMessage">
							<h3 id="text1">받은 쪽지 목록</h3>
							<br>
								<div class="ui category search">
									<div class="ui icon input">
										<select ></select> <input class="prompt" type="text"> 
										<i class="search icon"></i>
									</div>
								</div>
							<div class="memberBaseInfo">
								<br> <br>
								<table id="detailt">
									<thead>
										<tr style="background: lightgray;">
											<td></td>
											<td>No.</td>
											<td>발송인</td>
											<td>내용</td>
											<td>날짜</td>
											<td>상태</td>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><input type="radio"></td>
											<td>1</td>
											<td>KH스튜디오</td>
											<td><p>쪽지의 내용이 길어지면 어떡하죠?</p></td>
											<td>2019-03-05</td>
											<td><a class="ui red label">미학인</a></td>
										</tr>
										<tr>
											<td><input type="radio"></td>
											<td>2</td>
											<td>KH메이크업</td>
											<td><p>어렵다 어려워 css 어려워</p></td>
											<td>2019-02-05</td>
											<td><a class="ui blue label">확인</a></td>
										</tr>
										<tr>
											<td><input type="radio"></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<td><input type="radio"></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
									</tbody>
								</table>
								<div class=btns>
								<button class="ui pink button" style="background: salmon;" onclick=>삭제</button>
								<button class="ui pink button" style="background: salmon;" onclick=>답장</button>
								</div>
								<h4 style="text-align:center;">< 1, 2, 3></h4>
							</div>
						</div>
						<br><br>
						
						<div class="sendMessage">
							<h3 id="text2">보낸 쪽지 목록</h3>
							<br>
							<div class="ui category search">
									<div class="ui icon input">
										<select></select> <input class="prompt" type="text"> 
										<i class="search icon"></i>
									</div>
								</div>
							<div class="memberBaseInfo">
								<br> <br>
								<table id="detailt">
									<tr style="background: lightgray;">
										<td></td>
										<td>No.</td>
										<td>발송인</td>
										<td>내용</td>
										<td>날짜</td>
										<td>상태</td>
									</tr>
									<tr>
										<td><input type="radio"></td>
										<td>1</td>
										<td>KH스튜디오</td>
										<td><p>디자인 감각이 없어서 슬픈 정연이</p></td>
										<td>2019-03-05</td>
										<td><a class="ui red label">미학인</a></td>
									</tr>
									<tr>
										<td><input type="radio"></td>
										<td>2</td>
										<td>KH메이크업</td>
										<td><p>으아아앙 졸려요 자고 싶어요</p></td>
										<td>2019-02-05</td>
										<td><a class="ui blue label">확인</a></td>
									</tr>
									<tr>
										<td><input type="radio"></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td><input type="radio"></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
								</table>
								<div class="btns">
								<button class="ui pink button" style="background: salmon;" onclick=>삭제</button>
								</div>
								<h4 style="text-align:center;">< 1, 2, 3></h4>
							</div>
						</div>

					</div>
				</div>


				<div class="col-sm-2 sidenav2"></div>

			</div>
		</div>
		</div>

		<!-- 커먼 풋터 -->
		<div class="footerArea">
			<jsp:include page="/views/common/footer.jsp"></jsp:include>
		</div>
</body>
</html>