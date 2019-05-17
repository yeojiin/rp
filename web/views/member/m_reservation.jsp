<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, com.kh.redding.member.model.vo.Member"%>
<%
	ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>) request.getAttribute("list");
	Member loginUser = (Member) session.getAttribute("loginUser");
	/* String reserveList = (String) request.getAttribute("reservList"); */
%>
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
	rel="stylesheet">
<!-- 글꼴 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/member/m_header.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common/footer.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/member/m_myPage.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/member/m_reservation.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/semantic/semantic.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<style>
.container {
	width: 100%;
	color: salmon;
	font-family: 'Noto Sans KR', sans-serif;
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
	</div>
	<br>


	<!-- 섹션 -->
	<div class="container-fluid text-center">
		<div class="row content">

			<!-- 왼쪽 빈공간 -->
			<div class="col-sm-2 sidenav"></div>

			<div class="col-sm-8 text-left">
				<%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>
				<div class="reserveArea">
					<%
						for (int i = 0; i < list.size(); i++) {
							HashMap<String, Object> hmap = list.get(i);
							//System.out.println(list);
					%>

					<table
						style="width: 100%; margin-left: auto; margin-right: auto; background: mistyrose;">
						<tr>
							<h1 align="center" style="color: salmon; font-size: 35px;">예약</h1>
						</tr>
						<tr>
							<td class="imagetd" width="40%" height="470px"><img id="image" src="<%=request.getContextPath()%>/images/dressTest.jpg">
								<br>
							<br> <input class="form-control" id="productDetail"
								type="text" readonly value=<%=hmap.get("pcontent")%>></td>

							<td class="visible-md visible-lg visible-sm" width="30%"
								style="padding: 5%"><br>
								<table style="width: 100%">
									<tr>
										<td><label>업체명</label><input class="form-control"
											id="CompanyName" type="text" value='<%=hmap.get("mname")%>'
											style="width: 100%; height: 30px" readonly> <br>
										</td>
									</tr>
									<tr>
										<td><label>상품명</label><input class="form-control"
											id="productName" type="text" value='<%=hmap.get("pname")%>'
											style="width: 100%; height: 30px" readonly> <br>
										</td>
									</tr>
									<tr>
										<td><label>예약자</label> <br> <input
											class="form-control" id="userMno" type="text"
											style="width: 100%; height: 30px; float: left; margin-right: 20px"
											value="<%=loginUser.getMemberName()%>" readonly> <br>
										<br>
										<br></td>
									</tr>
									<tr>
										<td><label>가격</label> <br> <input
											class="form-control" id="price" type="text"
											value='<%=hmap.get("price")%>'
											style="width: 100%; height: 30px; float: left; margin-right: 20px"
											readonly> <br>
										<br>
										<br></td>
									</tr>
									<tr>
										<td><label>예약날짜</label> <br> <select
											id="reserveDate"></select> <br>
										<br>
										<br></td>
									</tr>
									<tr>
										<td><label>예약시간</label> <br> <select
											id="reserveTime"></select> <br>
										<br>
										<br></td>
									</tr>

									<tr>

									</tr>
								</table>
								<div style="text-align: center">
									<button class="ui gray button" id="reserve">예약</button>
									<button class="ui gray button" id="cancle"
										onclick="location.href='views/member/m_reservation.jsp'">취소</button>
								</div></td>
						</tr>
					</table>

					<%
						}
					%>

				</div>
				<br>

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

	<script>
		
	
	</script>

</body>
</html>