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
								/* 해쉬맵으로 받은 객체 꺼내주기*/ 
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
								<td><input name="check" type="checkbox" id="checkbox" class="checkbox"></td>
								<td class="pno"><%=hmap.get("pno")%></td>
								<td class="cType"><%=hmap.get("ctype")%></td>
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
					<div class="packageArea">
						<div class="packageStudio">
							<input class="Studio">
							<%-- <img src="<%=request.getContextPath()%>/images/logo.png"> --%>
							<img src="<%=request.getContextPath()%>/images/plus.png">
						</div>

						<div class="packageDress">
							<input class="Dress">
							<%-- <img src="<%=request.getContextPath()%>/images/logo.png"> --%>
							<img src="<%=request.getContextPath()%>/images/plus.png">
						</div>

						<div class="packageMakeup">
							<input class="Makeup">
							<%-- <img src="<%=request.getContextPath()%>/images/logo.png"> --%>
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

				</div>


			</div>


			<!-- 오른쪽 빈공간 -->
			<div class="col-sm-2 sidenav"></div>

			<script>
				$('#delete').click(function() {
					var deleteList = "";

					$("input[name=check]:checked").each(function() {
						if(deleteList == "") {
							deleteList = $(this).closest('td').siblings('.pno').text();
						} else {
							deleteList = deleteList + "," + $(this).closest('td').siblings('.pno').text();
						}
					});
					console.log(deleteList);
					$("#deleteList").val(deleteList);
					
					$("#deleteWishForm").submit();
				});
				
				
				//예약하기
				$('#reserve').click(function(){
					var reserveList = "";
					var page = "";
					
					$("input[name=check]:checked").each(function(){
						if(reserveList == ""){
							reserveList = $(this).closest('td').siblings('.pno').text();
						}else{
							reserveList = reserveList + "," + $(this).closest('td').siblings('.pno').text();
						}
					});
					
					if(reserveList != "") {
						location.href="<%=request.getContextPath()%>/wishList.re?reserveList="+reserveList; 
						}else {
							alert("선택하신 상품이 없습니다.");
						}
					
				});
				
		
				
				//패키지 구성에 감기
				var sctn=0;
				var dctn=0;
				var mctn=0;
				$(".checkbox").change(function() {
					var cType = $(this).closest("td").siblings('.cType').text();
					var pno = $(this).closest("td").siblings('.pno').text();
					var ctn = 0;

					if($(this).prop("checked") == true){
						if(cType == "스튜디오" && sctn==0){
							$(".Studio").val(pno);
							sctn++;
						}else if(cType == "드레스" && dctn==0){
							$(".Dress").val(pno);
							dctn++;
						}else if(cType == "메이크업" && mctn==0){
							$(".Makeup").val(pno);
							mctn++;
						 }else if(cType == "스튜디오"){
							//$(this).prop('checked', false);
							confirmPack(cType,pno);
						}else if(cType == "드레스"){
							//$(this).prop('checked', false);
							confirmPack(cType,pno);
						}else if(cType == "메이크업"){
							//$(this).prop('checked', false);
							comfirmPack(cType,pno); 
						}
					}else{
						if(cType == "스튜디오"){
							$(".Studio").val("");
							sctn--;
						}else if(cType == "드레스"){
							$(".Dress").val("");
							dctn--;
						}else if(cType == "메이크업"){
							$(".Makeup").val("");
							mctn--;
						}
					}
					
				});
				
				
				//추가 할 것 인가요?
				function confirmPack(cType, pno){
					if(cType == "스튜디오"){
						addPack(cType, pno);
					}else if(cType == "드레스"){
						addPack(cType, pno);
					}else if(cType == "메이크업"){
						addPack(cType, pno);
					}
				}
				
				
				//추가 메소드
				function addPack(cType, pno){
					//console.log("제품번호는: " +pno);
					if(confirm(cType+"가/이 이미 있습니다. 추가하시겠습니까?")){
						$( "<input>",{type:'text'}).appendTo(".packageArea").val(pno);
					}else{
						return false;
					}
				}
				
				
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