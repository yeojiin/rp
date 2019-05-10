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
	href="${pageContext.request.contextPath}/css/company/c_nav.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/company/c_main.css">
<style>

/* Set height of the grid so .sidenav can be 100% (adjust as needed) */
.row.content {
	height: 600px;
}

/* Set gray background color and 100% height */
.sidenav1 {
	padding-top: 20px;
	background: MistyRose;
	height: 100%;
	text-align: left;
	color:black;
}
 table{
 	border:1px solid black;
 	margin-left:auto;
 	margin-right:auto;
 	width:700px;
 	text-align:center;
 }
 td{
 	border:1px solid black;
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
<title>Insert title here</title>
</head>
<body>
	<div>
		<jsp:include page="/views/admin/a_nav.jsp"></jsp:include>
	</div>

	<div class="container-fluid text-center">
		<div class="row content">

			<div class="col-sm-2 sidenav1">
				<ul>
					<li><a href="a_TotalMember.jsp">전체회원</a></li>
					<li><a href="a_MemberOrder.jsp">주문내역</a></li>
					<li><a href="a_MemberInquiry.jsp">문의</a></li>
				</ul>
			</div>


			<div class="col-sm-8 text-left">
				<%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>
				<div class="contentsArea">
					<div class="MemberNum">
					<br>
						<table>
							<tr>
								<td width="250" style="background: lightgray;">전체 회원 수</td>
								<td width="100">10</td>
								<td width="250" style="background: lightgray;">탈퇴 회원 수</td>
								<td width="100">5</td>
							</tr>
						</table>
					</div>
					<br>
					
					<div class="memberList">
						<table>
							<tr>
								<!-- <td><input type="checkbox"></td> -->
								<td>회원 아이디</td>
								<td>닉네임</td>
								<td>회원 이름</td>
								<td>성별</td>
								<td>전화번호</td>
								<td>휴대전화</td>
								<td>이메일주소</td>
								<td>신고횟수</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td>
								<td>user01</td>
								<td>user</td>
								<td>임정연</td>
								<td>여</td>
								<td>010-5123-7872</td>
								<td>010-5123-7872</td>
								<td>diddu23@naver.com</td>
								<td>10</td>
							</tr>
							<tr>
								<td><input type="checkbox"></td> 
								<td>회원 아이디</td>
								<td>닉네임</td>
								<td>회원 이름</td>
								<td>성별</td>
								<td>전화번호</td>
								<td>휴대전화</td>
								<td>이메일주소</td>
								<td>신고횟수</td>
							</tr>
							
								
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

</body>
</html>