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
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common/footer.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/admin/a_nav.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common/layout.css">
<link rel="stylesheet" type="text/css" 
	href="${pageContext.request.contextPath}/css/admin/a_blackList.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/semantic/semantic.min.css">

<title>Redding♥</title>
</head>
<body>
	<div>
		<jsp:include page="/views/admin/a_nav.jsp"></jsp:include>
	</div>
	<div class="container-fluid text-center">
		<div class="row content">
		</div>

		<div class="visible-md visible-lg visible-sm">
			<div class="col-sm-2 sidenav1">
			</div>
		</div>
		
		<div class="visible-xs sideListnav2">
			<div class="col-sm-2 sidenav1">
			</div>
		</div>

			<div class="col-sm-8 text-left">
				<%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>
				<div class="BlackListArea">
				<br>
					<h4 id="text1">블랙리스트</h4>
					<br> <br> <br>
					<div class="ui category search">
						<div class="ui icon input">
							<select></select> <input class="prompt" type="text"> <i
								class="search icon"></i>
						</div>
					</div>
					<br><br><br>
					<div class="BlackList">
						<table id="totalBlackList">
							<tr style="background: lightgray;">
								<td><input type="checkbox"></td>
								<td>회원 아이디</td>
								<td>닉네임</td>
								<td>회원 이름</td>
								<td>휴대전화</td>
								<td>이메일주소</td>
								<td>신고횟수</td>
								<td>상태</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>user01</td>
								<td>유저</td>
								<td>임정연</td>
								<td>010-5123-7872</td>
								<td>only1ea@naver.com</td>
								<td>3</td>
								<td><a class="ui pink label">일시정지</a></td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>user02</td>
								<td>유저2</td>
								<td>전효정</td>
								<td>010-1111-7872</td>
								<td>as1ea@naver.com</td>
								<td>12</td>
								<td><a class="ui red label">정지</a></td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							
						</table>
						<br>
						<div class="btns">
							<button class="ui pink button" style="background:salmon;">해제</button>
							<button class="ui pink button" style="background:salmon;">일시정지</button>
							<button class="ui pink button" style="background:salmon;">탈퇴</button>
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