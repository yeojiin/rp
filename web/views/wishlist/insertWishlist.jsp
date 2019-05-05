<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	@import url("css/common/main.css");
</style>
</head>
<body>
	<header>
		<!--회원 header 가져오기-->
		<jsp:include page = "../member/m_header.jsp"></jsp:include>
	</header>
	<nav>
		<!--회원 메뉴바 가져오기-->
		<jsp:include page = "../member/m_nav.jsp"></jsp:include>
	</nav>
	<br>
	
	<div align="center"><h1>상품목록</h1></div>
	
</body>
</html>