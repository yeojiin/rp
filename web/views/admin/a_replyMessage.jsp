<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="com.kh.redding.member.model.vo.*, com.kh.redding.admin.model.vo.*, java.util.*"%>
<%-- <%
	ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>) request.getAttribute("list");
	TotalMemberPageInfo pi = (TotalMemberPageInfo) request.getAttribute("pi");
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	ArrayList<HashMap<String, Object>> oneCompany = (ArrayList<HashMap<String, Object>>) request.getAttribute("oneCompany");
%> --%>
<%-- <%
	Member loginUser = (Member) session.getAttribute("loginUser");
%>  --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR"
	rel="stylesheet">
<!-- 글꼴 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common/footer.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/admin/a_nav.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common/layout.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/admin/a_company.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/semantic/semantic.min.css">

<title>Insert title here</title>
</head>
<body>
	<div>
		<%@include file="/views/admin/a_nav.jsp"%>
	</div>
	<div class="container-fluid text-center">
		<div class="row content">

			<div class="visible-md visible-lg visible-sm">
				<div class="col-sm-2 sidenav1">
					<div class="sidenavArea">
						<ul class="navList">
							<li onclick="location.href='a_Company.jsp'">업체 목록</li>
							<li onclick="location.href='<%=request.getContextPath()%>/views/admin/a_Message.jsp'">업체 쪽지 관리</li>
						</ul>
					</div>
				</div>
			</div>

			<div class="visible-xs sideListnav2">
				<div class="col-sm-2 sidenav1">
					<div class="sidenavArea2">
						<ul class="navList2">
							<li onclick="location.href='a_Company.jsp'">업체 목록</li>
							<li onclick="location.href='<%=request.getContextPath()%>/views/admin/a_Message.jsp'">업체 쪽지 관리</li>
						</ul>
					</div>
				</div>

				<br> <br>
			</div>

			<div class="col-sm-8 text-left">
				<%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>
				<div class="companyArea">
					<label>쪽지 보내기</label>
					<div>
						<table border="1">
							<tr>
								<td><input type="text" name="cname" id="cname" readonly value=""></td>
							</tr>
						</table>
					</div>
					


					<div class="col-sm-2 sidenav2"></div>

				</div>
			</div>
		</div>
		<!-- 커먼 풋터 -->
		<div class="footerArea">
			<jsp:include page="/views/common/footer.jsp"></jsp:include>
		</div>
</body>
</html>