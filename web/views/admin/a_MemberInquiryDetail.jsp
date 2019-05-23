<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "com.kh.redding.board.model.vo.*,java.util.*"%>
 <%
	ArrayList<HashMap<String , Object>> QnADetail = (ArrayList<HashMap<String , Object>>)request.getAttribute("QnADetail");
 	//HashMap<String , Object> QnA = QnADetail.get(0);
 %>
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
<%-- <link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/admin/a_main.css"> --%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common/layout.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/admin/a_memberInquiry.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/semantic/semantic.min.css">
<script src="<%=request.getContextPath()%>/css/semantic/semantic.min.js"></script>	
<script src="<%=request.getContextPath()%>/css/semantic/jquery-3.4.1.min.js"></script>
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
						<li onclick="location.href='a_TotalMember.jsp'">전체 회원</li>
						<li onclick="location.href='a_MemberOrder.jsp'">주문내역</li>
						<li onclick="location.href='<%=request.getContextPath()%>/AllQnA.no'" style="color:lightgray; padding-left:25px">문의</li>
					</ul>
				</div>
			</div>
		</div>
		
		<div class="visible-xs sideListnav2">
					<div class="col-sm-2 sidenav1">
						<div class="sidenavArea2">
						<ul class="navList2">
						<li onclick="location.href='a_TotalMember.jsp'" style="color:lightgray; padding-left:25px">전체 회원</li>
						<li onclick="location.href='a_MemberOrder.jsp'">주문내역</li>
						<li onclick="location.href='<%=request.getContextPath()%>/AllQnA.no'" style="color:lightgray; padding-left:25px">문의</li>
						</ul>
					</div>
					</div>
					
					<br><br>
				</div>
				<div class="col-sm-8 text-left">
				<%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>
				<table>
					<tr>
						<th>문의제목</th>
						<td></td>
					</tr>
					
				</table>
				
				</div>
				<div class="col-sm-2 sidenav2"></div>
		</div>
	

		<!-- 커먼 풋터 -->
		<div class="footerArea">
			<jsp:include page="/views/common/footer.jsp"></jsp:include>
		</div>
</body>
</html>