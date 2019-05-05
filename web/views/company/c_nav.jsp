<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/company/c_nav.css">

</head>
<body>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<button class="logo" onclick="location.href='<%=request.getContextPath()%>/views/company/c_main.jsp'">REDDING&nbsp;&nbsp;&nbsp;&nbsp;</button>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">고객관리</a></li>
					<li><a href="#">상품관리</a></li>
					<li><a href="#">정보수정</a></li>
					<li><a href="#">정산관리</a></li>
					<li><a href="#">쪽지관리</a></li>
					<li><a href="#">통계관리</a></li>
					<li><a href="#">커뮤니티</a></li>
					
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">LOGOUT</a></li>
				</ul>
			</div>
		</div>
	</nav>
</body>
</html>