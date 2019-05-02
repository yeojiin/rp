<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common/main.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common/joinstart.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<header>
		<jsp:include page = "/views/member/m_header.jsp"></jsp:include>
	</header>
	<nav>
		<jsp:include page = "/views/member/m_nav.jsp"></jsp:include>
	</nav>	
	<section>
		<div class = "form">
			<br>
			<label class = "title">Sign up</label>
			<br><br>
			<div class = "sign_div1">
				<div class = "sign_div1 sign1">
					<img src = "<%=request.getContextPath()%>/images/user_icon.png" alt = "user" id = "sign_user"><br>
					<label>만 14세 이상 회원가입 가능</label><br>
					<button id = "goSign">회원가입</button>
				</div>
			</div>
			<br><br>
			<div class = "sign_div1">
				<div class="sign_div1 sign2">
					<img src="<%=request.getContextPath()%>/images/company.png"
						alt="user" id = "sign_user"><br> 
					<label>사업자등록번호가 있는 고객님</label><br>
					<button id="goSign" onclick = "location='<%=request.getContextPath()%>/views/common/JoinService.jsp'">회원가입</button>
				</div>
			</div>
		</div>
	</section>
	<footer>
	</footer>
</body>
</html>