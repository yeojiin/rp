<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//String memberID = "userid";
	String memberID = null;
%>


<link href="https://fonts.googleapis.com/css?family=Sunflower:300"
	rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common/m_header.css">


<!--다 클래스 선언이므로 스타일 바꿀시 id로 적용해주세요 -->
<div class="west">
	<%
			if (memberID != null) {
		%>
	<br> <label>D-180</label>
	<%
			}
		%>
</div>
<div class="center">
	<img src="<%=request.getContextPath()%>/images/logo.png" alt="로고">
</div>
<div class="east">
	<%if (memberID == null){%>
	<ul class="login_menu">

		<li><a
			href="<%=request.getContextPath()%>/views/common/login.jsp">login</a></li>
		<li><a href="<%=request.getContextPath()%>/views/common/joinStart.jsp">Sign up</a></li>
	</ul>
	<%}else{ %>
	<table>
		<tr>
			<td colspan="2"><%=memberID %>님 환영합니다.</td>
			<td><label>logout</label></td>
		</tr>
		<tr>
			<td><a href="#">My Page</a></td>
			<td><a href="#">Wish<span class="badge">5</span></a></td>
			<td><a href="#">Cupon<span class="badge">5</span></a></td>
		</tr>
	</table>
	<%} %>
</div>

