<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
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
	rel="stylesheet">
<!-- 글꼴 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/member/m_header.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common/footer.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/member/m_myPage.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/member/m_wishList.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/semantic/semantic.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
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

				<div class="wishListArea">
					<h1 style="text-align: center; color: salmon;">Wish List</h1>
					<div class="wishList">
						<table id="wishListTable">
							<tr>
								<th>업체명</th>
								<th><img id="image"></th>
								<th>제품명</th>
								<th>상품금액</th>
								<th></th>
							</tr>
							<%
								/* 해쉬맵으로 받은 객체  꺼내주기*/ 
								for (int i = 0; i < list.size(); i++) {
									HashMap<String, Object> hmap = list.get(i);
							%>
							<tr>
								<td class="cName"><%=hmap.get("mname")%></td>
								<td class="imagetd"><img id="image"
									src="<%=request.getContextPath()%>/images/dressTest.jpg">
								</td>
								<td class="pName"><%=hmap.get("pname")%></td>
								<td class="price"><%=hmap.get("price")%></td>
								<td><input name="check" type="checkbox"
									value=<%=hmap.get("upno")%>></td>
							</tr>
							<%
								}
							%>
						</table>
					</div>
					<br>
					<div class="button">
						<button class="ui gray button" id="delete">삭제</button>
						<form action="<%=request.getContextPath()%>/delete.wi" method="post" id="deleteWishForm">
						<input type="hidden" name="deleteList" id="deleteList">
						<input type="hidden" name="deleteListMno">
						</form>
					</div>

				</div>
				<br>
				<br>
				<div class="pResult">
					<h2>패키지 구성</h2>
					<div id="packageArea">
						<div class="packageStudio">
							<img src="<%=request.getContextPath()%>/images/logo.png">
							<img src="<%=request.getContextPath()%>/images/plus.png">
						</div>

						<div class="packageDress">
							<img src="<%=request.getContextPath()%>/images/logo.png">
							<img src="<%=request.getContextPath()%>/images/plus.png">
						</div>

						<div class="packageMakeup">
							<img src="<%=request.getContextPath()%>/images/logo.png">
							<img src="<%=request.getContextPath()%>/images/equal.png">
						</div>
						<div class="packagePrice">
							<label id="totalPrice">1000000</label>
						</div>
					</div>
					<div class="button">
						<button class="ui pink button" style="background: salmon;" id="reserve">예약하기</button>
						<button class="ui pink button" style="background: salmon;" onclick="location.href='views/member/m_pay.jsp'">결제하기</button>
					</div>

					<%-- <table id="pResult" style="backgound:lightgray;">
						<tr>
						<td id="package1"><img id="image" src="<%= request.getContextPath() %>/images/logo.png"></td>
						<td><img src="<%= request.getContextPath() %>/images/plus.png"></td>
						<td id="package2"><img id="image" src="<%= request.getContextPath() %>/images/logo.png"></td>
						<td><img src="<%= request.getContextPath() %>/images/plus.png"></td>
						<td id="package3"><img id="image" src="<%= request.getContextPath() %>/images/logo.png"></td>
						<td><img src="<%= request.getContextPath() %>/images/equal.png"></td>
						<td></td>
						</tr>
					</table> --%>
				</div>


			</div>


			<!-- 오른쪽 빈공간 -->
			<div class="col-sm-2 sidenav"></div>

			<script>
			
			
				$('#delete').click(function() {
					var deleteList = "";

					$("input[name=check]:checked").each(function() {
						if (deleteList == "") {
							deleteList = $(this).val();
						} else {
							deleteList = deleteList + "," + $(this).val();
						}
					});
					//console.log(deleteList);
					$("#deleteList").val(deleteList);
					
					$("#deleteWishForm").submit();
				});
				
				
				//예약하기
				$('#reserve').click(function(){
					var reserveList = "";
					var page = "";
					
					$("input[name=check]:checked").each(function(){
						if(reserveList == ""){
							reserveList = $(this).val();
						}else{
							reserveList = reserveList + "," + $(this).val();
						}
					});
					
				/* 	if(reserveList != "") {
					location.href="views/member/m_reservation.jsp?reserveList="+reserveList; 
					}else {
						alert("선택하신 상품이 없습니다.");
					} */

					if(reserveList != "") {
						location.href="<%=request.getContextPath()%>/wishList.re?reserveList="+reserveList; 
						}else {
							alert("선택하신 상품이 없습니다.");
						}
					
				});
	
				
			</script>

		</div>

	</div>
	<br>

	<!-- 커먼 풋터 -->
	<div class="footerArea">
		<jsp:include page="/views/common/footer.jsp"></jsp:include>
	</div>


</body>
</html>