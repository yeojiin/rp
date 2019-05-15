<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "com.kh.redding.member.model.vo.*"%>
<%
	Member loginUser = (Member) session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/company/c_nav.css">
</head>
<body>
	<%-- <% if(loginUser != null){ %> --%>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<button class="logo" onclick="location.href='<%=request.getContextPath()%>'">REDDING&nbsp;&nbsp;&nbsp;&nbsp;</button>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li class="active"><a href="a_Sstats.jsp">통계관리</a></li>
					<li><a href="a_calculate.jsp">정산관리</a></li>
					<li><a href="a_Company.jsp">업체관리</a></li>
					<li><a onclick="goTotalMember()">회원관리</a></li>
					<li><a href="a_BlackList.jsp">블랙리스트 관리</a></li>
					<li><a href="a_event.jsp">쿠폰 관리</a></li>
					<li><a href="a_Survey.jsp">설문조사 관리</a></li>
					
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="<%=request.getContextPath()%>/logout.me">LOGOUT</a></li>
				</ul>
			</div>
		</div>
	</nav>
<%-- 	<% }else {
		request.setAttribute("msg","잘못된 경로 접근하셨습니다");
		request.getRequestDispatcher("../common/errorPage.jsp").forward(request, response);
	}%> --%>
</body>
<script>
	function goTotalMember() {
		location.href="<%=request.getContextPath()%>/selectList.me";
	}
</script>

</html>

