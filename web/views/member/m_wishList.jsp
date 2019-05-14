<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" %>
<%
	ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>) request.getAttribute("list");
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

				<div class="wishListArea">
					<h1 style="text-align:center; color:salmon;">Wish List</h1>
					
					<div class="wishList">
					<table id="wishListTable">
						<tr>
							<th>상품명</th>
							<th><img id="image"></th>
							<th>상세설명</th>
							<th>상품금액</th>
							<th></th>
						</tr>
					<%
					System.out.println(list);
						for (int i = 0; i < list.size(); i++) {
						HashMap<String, Object> hmap = list.get(i);
					%>
						<tr>
							<td class="pName"><%=hmap.get("mname") %></td>
							<td class="imagetd">
								<img id="image" src="../../images/dressTest.jpg">
							</td>
							<td class="detail"><%=hmap.get("upname")%></td>
							<td class="price"><%=hmap.get("price")%></td>
							<td><input type="checkbox"></td>
						</tr>
					<% 
						}
					%>
					</table>
					</div>
				</div>
				<br><br>
				<div class="pResult">
				<h2>패키지 구성</h2>
					<table id="pResult">
						<tr>
						<td id="package1"><img id="image" src="../../images/logo.png"></td>
						<td><img src="../../images/plus.png"></td>
						<td id="package2"><img id="image" src="../../images/logo.png"></td>
						<td><img src="../../images/plus.png"></td>
						<td id="package3"><img id="image" src="../../images/logo.png"></td>
						<td><img src="../../images/equal.png"></td>
						<td id="price"><label id="resultPrice"></label><button onclick="push();">ㅇㅇ</button></td>
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

	<script>
		/* function push(){
			var price = document.getElementsByName("price");
			
			
		} */
		
	</script>


</body>
</html>