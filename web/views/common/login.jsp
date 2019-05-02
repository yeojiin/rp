<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common/main.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common/login.css">
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
		<div class = "login">
			<form>
				<label class = "title">Login</label>
				<table>
					<tr>
						<td><input type="radio" id = "member" name="Login_selection" value="member" checked>
						&nbsp;&nbsp;<label for="member">회원</label></td>
						<td><input type="radio" id = "company" name="Login_selection" value="company">
						&nbsp;&nbsp;<label for="company">업체</label></td>
					</tr>
					<tr>
						<td><label>아이디</label></td>
						<td><input type="text" id="userId"></td>
						<td colspan="2" rowspan="2"><input type="submit" value="로그인"></td>

					</tr>
					<tr>
						<td><label>비밀번호</label></td>
						<td><input type="password" id="userPwd"></td>

					</tr>
					<tr>
						<td colspan = "2"><a href= "<%=request.getContextPath() %>/views/common/joinStart.jsp" class = "sign">회원이 아니신가요?</a></td>
						<td><a href= "#" class ="id_pwd">ID/PWD 찾기</a></td>
					</tr>
				</table>
			</form>
		</div>
	</section>
	<footer> </footer>

</body>
</html>