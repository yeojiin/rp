<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Redding</title>
<style>
	@import url("css/common/main.css");
</style>
</head>
<body>
	<header>
		<!--회원 header 가져오기-->
		<jsp:include page = "views/member/m_header.jsp"></jsp:include>
	</header>
	<nav>
		<!--회원 메뉴바 가져오기-->
		<jsp:include page = "views/member/m_nav.jsp"></jsp:include>
	</nav>
	<section>
		<a href = "views/company/c_main.jsp">업체 페이지로 이동</a>
	</section>
	<footer>
		<jsp:include page = "views/common/footer.jsp"></jsp:include>
	</footer>
	
</body>
</html>