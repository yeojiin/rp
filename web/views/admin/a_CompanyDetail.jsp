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
	border-bottom: 1px solid gray;
	text-align: center;
}

#memberNumt, #plusInfot {
	border-bottom: 1px solid gray;
	border-top: 1px solid gray;
	width: 100%;
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
.btns{
	margin-left:auto;
	margin-right:auto;
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
					<h3 onclick="javascript: location.href= 'a_Company.jsp';">업체 목록</h3>
					<h3 onclick="javascript: location.href= 'a_CompanyDetail.jsp';">업체 정보 조회</h3>
					<h3 onclick="javascript: location.href= 'a_Message.jsp';">업체 쪽지 관리</h3>
				</ul>
			</div>


			<div class="col-sm-8 text-left">
				<%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>
				<div class="memberArea">
					<div class="memberNum">
						<br>
						<h2>업체정보조회</h2>
						<table id="memberNumt">
							<tr>
								<td width="200" style="background: lightgray;"><span>사용자
										등록 번호</span></td>
								<td><input type="text" class="form-control"
									value="123456789" disabled></td>
								<td colspan="5"></td>
							</tr>
							<tr>
								<td width="200" style="background: lightgray;""><span>아이디</span></td>
								<td><input type="text" class="form-control"
									value="MakeUp01" disabled></td>
								<td colspan="5"></td>
							</tr>
							<tr>
								<td width="200" style="background: lightgray;"><span>비밀번호</span></td>
								<td><input type="text" class="form-control" value="*****"
									disabled></td>
								<td colspan="5"></td>
							</tr>
							<tr>
								<td width="200" style="background: lightgray;"><span>대표자명</span></td>
								<td><input type="text" class="form-control" value="남궁욱"
									disabled></td>
								<td colspan="5"></td>
							</tr>
							<tr>
								<td width="200" style="background: lightgray;" rowspan="3"><span>주소</span></td>
								<td><input type="text" class="form-control" value="12345"
									disabled></td>
								<td colspan="5"></td>
							</tr>
							<tr>
								<td colspan="2"><input type="text" class="form-control"
									value="XXX XXX XXX" disabled></td>
								<td>기본주소</td>
							</tr>
							<tr>
								<td colspan="2"><input type="text" class="form-control"
									value="XXX XXX XXX" disabled></td>
								<td>상세주소</td>
							</tr>
							<tr>
								<td width="200" style="background: lightgray;" >연락처</td>
								<td style="float:left;"><input type="text" maxlength="3" name="tel1" size="2" disabled>-
									<input type="text" maxlength="4" name="tel2" size="2" disabled>-
									<input type="text" maxlength="4" name="tel3" size="2" disabled>
								</td>
								<td colspan="5"></td>
							</tr>
							<tr>
								<td width="200" style="background: lightgray;" >휴대전화</td>
								<td style="float:left;"><input type="text" maxlength="3" name="tel1" size="2" disabled>-
									<input type="text" maxlength="4" name="tel2" size="2" disabled>-
									<input type="text" maxlength="4" name="tel3" size="2" disabled>
								</td>
								<td colspan="5"></td>
							</tr>
							<tr>
								<td width="200" style="background: lightgray;"><span>통장번호</span></td>
								<td style="float:left;">
									<div class="ui right action left icon input">
										<input type="text" value="우리은행">
										<div class="ui basic floating dropdown button">
											<i class="dropdown icon"></i>
										</div>
									</div>
								</td>
								<td style="float:left;"><input type="text" class="form-control" value="10000-11110-52245" disabled></td>
								<td colspan="5"></td>
							</tr>
							<tr>
								<td width="200" style="background: lightgray;" >영업시간</td>
								<td style="float:left;"><input type="time" disabled>~
									<input type="time" disabled></td>
								<td colspan="5"></td>
							</tr>
							<tr>
								<td width="200" style="background: lightgray;" >이메일</td>
								<td><input type="text" class="form-control" value="only1yew@naver.cpm" disabled></td>
								<td colspan="5"></td>
							</tr>
							<tr>
								<td width="200" style="background: lightgray;" >홈페이지</td>
								<td><input type="text" class="form-control" value="kh.co.kr" disabled></td>
								<td colspan="5"></td>
							</tr>
							<tr>
								<td width="200" style="background: lightgray;" >인삿말</td>
								<td><input type="text" class="form-control" value="안녕하세요" disabled></td>
								<td colspan="5"></td>
							</tr>
						</table>
					</div>
					<br>
						<div class="btns">
							<button class="ui pink button" style="background: salmon;">뒤로가기</button>
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