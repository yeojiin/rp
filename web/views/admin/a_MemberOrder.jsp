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
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common/layout.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/semantic/semantic.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/semantic/transition.js">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/semantic/semantic.min.js">

<style>
.memberArea table {
	margin-left: auto;
	margin-right: auto;
	width: 100%;
}

.memberArea table th {
	padding: 8px;
	text-align: center;
}

.memberArea table tr td {
	padding: 8px;
	border-bottom: 1px solid lightgray;
	text-align: center;
}

#memberNumt, #plusInfot {
	border: 1px solid lightgray;
}

#detailt {
	border-top: 1px solid gray;
}

#text1, #text2 {
	float: left;
	font-size: 25px;
	margin-left: 0;
}

#text3, #text4 {
	float: left;
	font-size: 20px;
	margin-left: 3%;
}

.sidenav1 {
	color: black;
	font-size: 20px;
}

ul {
	list-style-type: none;
	margin-right: 65px;
	color: gray;
}

ul h3:hover {
	background: mistyrose;
}

.btns {
	float: right;
}

.search {
	float: right;
}

.memberList {
	text-align: center;
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
					<h3 onclick="javascript: location.href= 'a_TotalMember.jsp';">전체회원</h3>
					<h3 onclick="javascript: location.href= 'a_MemberOrder.jsp';">주문내역</h3>
					<h3 onclick="javascript: location.href= 'a_MemberInquiry.jsp';">문의</h3>
				</ul>
			</div>


			<div class="col-sm-8 text-left">
				<%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>
				<div class="memberArea">
					<div class="memberNum">
						<br>
						<table id="memberNumt">
							<tr>
								<td width="250" style="background: lightgray;" width="100">전체 주문 횟수</td>
								<td width="100" style="color:salmon">350</td>
								<td width="250" style="background: lightgray;" width="100">진행중</td>
								<td width="100" style="color:salmon">15</td>
								<td width="250" style="background: lightgray;" width="100">예약완료</td>
								<td width="100" style="color:salmon">11</td>
								<td width="250" style="background: lightgray;" width="100">결제완료</td>
								<td width="100" style="color:salmon">18</td>
							</tr>
						</table>
					</div>
					<br>

					<h4 id="text1">회원 조회</h4>
					<br> <br> <br>
					<div class="ui category search">
						<div class="ui icon input">
							<select></select> <input class="prompt" type="text"> <i
								class="search icon"></i>
						</div>
					</div>

					<div class="memberList">
						<table id="memberListt">
							<tr style="background: lightgray;">
								<td>주문번호</td>
								<td>상품이름</td>
								<td>옵션</td>
								<td>회원아이디</td>
								<td>회원이름</td>
								<td>예약일자</td>
								<td>휴대전화</td>
								<td>이메일주소</td>
								<td>진행상태</td>
								<!-- <td></td> -->
							</tr>
							<tr>
								<td>1521</td>
								<td>KH스튜디오-리허설</td>
								<td>원장</td>
								<td>user01</td>
								<td>임정연</td>
								<td>2019-05-30 10:00 ~ 12:00</td>
								<td>010-5121-7872</td>
								<td>only1year@naver.com</td>
								<td><a class="ui red label">예약완료</a></td>
							</tr>
							<tr>
								<td>1521</td>
								<td>KH스튜디오-리허설</td>
								<td>원장</td>
								<td>user01</td>
								<td>임정연</td>
								<td>2019-05-30 10:00 ~ 12:00</td>
								<td>010-5121-7872</td>
								<td>only1year@naver.com</td>
								<td><a class="ui blue label">예약대기</a></td>
							</tr>
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</table>
						<h4>< 1, 2, 3 ></h4>
						<br> <br>


						<div class="memberDetail">
							<h3 id="text2">주문 상세 조회</h3>
							<br> <br> <br>

							<div class="memberBaseInfo">
								<h4 id="text3">기본정보</h4>
								<br> <br>
								<table id="detailt">
									<tr>
										<td style="background: lightgray;">주문번호</td>
										<td colspan="3">1521</td>
									</tr>
									<tr>
										<td style="background: lightgray;">상품명</td>
										<td>KH스튜디오-리허설</td>
										<td style="background: lightgray;">옵션</td>
										<td>원장</td>
									</tr>
									<tr>
										<td style="background: lightgray;">회원아이디</td>
										<td>user01</td>
										<td style="background: lightgray;">회원이름</td>
										<td>임정연</td>
									</tr>
									<tr>
										<td style="background: lightgray;">전화번호</td>
										<td>010-5123-7872</td>
										<td style="background: lightgray;">이메일주소</td>
										<td>only1year@nave.com</td>
									</tr>
									<tr>
										<td style="background: lightgray;">예약날짜</td>
										<td>2019-05-30 10:00~12:00</td>
										<td style="background: lightgray;">진행상태</td>
										<td><a class="ui red label">예약완료</a></td>
									</tr>
								</table>
								<div class="btns">
									<button class="ui pink button" style="background:salmon;">쪽지보내기</button>
									<button class="ui pink button" style="background:salmon;">예약취소</button>
								</div>
							</div>

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