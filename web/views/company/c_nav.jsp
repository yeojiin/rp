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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/company/c_nav.css">
<style>
 .sidenav1{
 	height:auto;
 }
 
  @media screen and (max-width: 600px) {
     .sidenav1{
 		height:300px;
	}
   }

}
 
 
</style>
</head>
<body>
	<% if( loginUser == null || loginUser.getMemberType() != 20) {
		request.setAttribute("msg","잘못된 경로 접근하셨습니다");
		request.getRequestDispatcher("../common/errorPage.jsp").forward(request, response);
	 }else {%>
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
					<li class="active"><a href="<%=request.getContextPath()%>/views/company/c_customerManager.jsp">고객관리</a></li><!-- *** -->
					<li><a href="<%=request.getContextPath()%>/views/company/c_ProductManagement.jsp">상품관리</a></li><!-- *** -->
					<li><a href="<%=request.getContextPath()%>/views/company/c_UpdateCompanyPhoto.jsp">정보수정</a></li>
					<li><a href="<%=request.getContextPath()%>/views/company/c_calculateManager.jsp">정산관리</a></li>
					<li><a href="<%=request.getContextPath()%>/views/company/c_messageManager.jsp">쪽지관리</a></li><!-- *** -->
					<li><a href="<%=request.getContextPath()%>/views/company/c_statistics.jsp">통계관리</a></li>
					<li><a href="#">커뮤니티</a></li>
					
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="<%=request.getContextPath()%>/logout.me">LOGOUT</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<%} %>
</body>
</html>