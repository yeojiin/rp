<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.redding.member.model.vo.Member"%>
<%
   Member loginUser = (Member) session.getAttribute("loginUser");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common/header.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/member/m_header.css">
</head>
<body>
	<div class="headerArea">
		<div class="miniMenu">
			<%if(loginUser == null) {%>
				<br>
				<ul>
					<li><button class="miniMenuBtn" onclick="location.href='<%=request.getContextPath()%>/views/common/login.jsp'">LOGIN</button></li>&nbsp;&nbsp;|&nbsp;&nbsp;
					<li><button class="miniMenuBtn" onclick="location.href='<%=request.getContextPath()%>/views/common/join.jsp'">JOIN</button></li>&nbsp;&nbsp;|&nbsp;&nbsp;
					<li><button class="miniMenuBtn" onclick="nullMyPage()">MY PAGE</button></li>&nbsp;&nbsp;|&nbsp;&nbsp;
					<li><button class="miniMenuBtn" onclick="nullWishList()">WISHLIST</button></li>
					<li>&nbsp;&nbsp;&nbsp;&nbsp;</li>
				</ul>
				
			<% } else if(loginUser != null && loginUser.getMemberId().equals("admin")) { %>
				<br>
				<ul>
					<li><button class="miniMenuBtn"><%=loginUser.getNickName() %>님의 방문을 환영합니다!</button></li>&nbsp;&nbsp;|&nbsp;&nbsp;
					<li><button class="miniMenuBtn" onclick="logout()">LOGOUT</button></li>&nbsp;&nbsp;|&nbsp;&nbsp;
					<li><button class="miniMenuBtn" onclick="location.href='<%=request.getContextPath()%>/views/admin/a_main.jsp'">MY PAGE</button></li>
					<li>&nbsp;&nbsp;&nbsp;&nbsp;</li>
				</ul>
				
			<% } else { %>
				<br>
				<ul>
					<li><button class="miniMenuBtn"><%=loginUser.getNickName() %>님의 방문을 환영합니다!</button></li>&nbsp;&nbsp;|&nbsp;&nbsp;
					<li><button class="miniMenuBtn" onclick="logout()">LOGOUT</button></li>&nbsp;&nbsp;|&nbsp;&nbsp;
					<li><button class="miniMenuBtn" onclick="location.href='<%=request.getContextPath()%>/views/member/m_myPage_checkList.jsp'">MY PAGE</button></li>&nbsp;&nbsp;|&nbsp;&nbsp;
					<li><form action="<%=request.getContextPath()%>/showList.wi" method="post" id = "WishForm">
					<button class="miniMenuBtn" type="submit">WISHLIST</button>
					<input type="hidden" name="num" value=<%=loginUser.getMno()%>></form></li>
					<li>&nbsp;&nbsp;&nbsp;&nbsp;</li>
				</ul>
			<% } %>
		</div>
		<jsp:include page = "/views/common/header.jsp"></jsp:include>
	</div>
	<script>
		function logout() {
			location.href="<%= request.getContextPath()%>/logout.me";
		}
		function nullMyPage() {
			alert("로그인 후 이용이 가능합니다♥");
			location.href='<%=request.getContextPath()%>/views/common/login.jsp';
		}
		function nullWishList() {
			alert("로그인 후 이용 가능합니다.");
			location.href='<%=request.getContextPath()%>/views/common/login.jsp';
		}
		<%-- function goWishList(){
			<% if (loginUser != null) { %>
			var num =<%=loginUser.getMno()%>
			<%} %>
			location.href='<%=request.getContextPath()%>/showList.wh?num='+num;
		} --%>
	</script>

</body>
</html>
