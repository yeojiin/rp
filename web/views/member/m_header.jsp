<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common/header.css">
</head>
<body>
	<div class="headerArea">
		<div class="miniMenu">
			<br>
			<ul>
				<li><button class="miniMenuBtn" onclick="location.href='<%=request.getContextPath()%>/views/common/login.jsp'">LOGIN</button></li>&nbsp;&nbsp;|&nbsp;&nbsp;
				<li><button class="miniMenuBtn" onclick="location.href='<%=request.getContextPath()%>/views/common/join.jsp'">JOIN</button></li>&nbsp;&nbsp;|&nbsp;&nbsp;
				<li><button class="miniMenuBtn" onclick="location.href='<%=request.getContextPath()%>/views/member/mypage.jsp'">MY PAGE</button></li>&nbsp;&nbsp;|&nbsp;&nbsp;
				<li><button class="miniMenuBtn" onclick="location.href='<%=request.getContextPath()%>/views/member/wishlist.jsp'">WISHLIST</button></li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;</li>
			</ul>
		</div>
		<jsp:include page = "/views/common/header.jsp"></jsp:include>
	</div>
</body>
</html>