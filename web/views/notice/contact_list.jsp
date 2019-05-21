<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>REDDING♥</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR"
	rel="stylesheet"><!-- 글꼴 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/member/m_header.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/member/m_nav.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/notice/contact_list.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common/footer.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<style>

.container {
	width:100%;
	color:salmon;
	font-family:'Noto Sans KR', sans-serif;
}

.row.content {
	height: 600px;
}

.sidenav {
	height: 100%;
}

/* On small screens, set height to 'auto' for sidenav and grid */
@media screen and (max-width: 767px) {
	.sidenav {
		height: auto;
		padding: 15px;
	}
	.row.content {
		height: auto;
	}
	
	.noticetable{
		width : 400px;
	}
}
</style>
</head>
<body>

	<!-- 멤버 헤더 (미니메뉴, 로고) -->
	<div class="headerArea">
		<%-- <jsp:include page="/views/member/m_header.jsp"></jsp:include> --%>
		<%@ include file="/views/member/m_header.jsp"%>s
	</div><br>

	<!-- 멤버 나브 -->
	<div>
		<jsp:include page="/views/member/m_nav.jsp"></jsp:include>
	</div>

	<!-- 섹션 -->
	<div class="container-fluid text-center">
		<div class="row content">
			
			<!-- 왼쪽 빈공간 -->
			<div class="col-sm-2 sidenav"></div>

			<div class="col-sm-8 text-left">
			<%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>

			<div class="container">
				<h2>1대 1 문의</h2>
				<hr>
					<div class="wrap">
						<div class="conMenu">
							<div class="writerbtn">
								<i class="material-icons md-36">border_color</i>
								<div class="labeldiv">
									<label>작성하기</label>
								</div>
							</div>
							<div class="listbtn">
								<i class="material-icons md-36" id="writeIcon">insert_comment</i>
								<div class="labeldiv">
									<label id="wlabel">문의내역</label>
								</div>
							</div>
						</div>
						<div class="contactwrite">
							<h3>문의내역</h3>
							<br>
							<table class="contacttable">
								<thead>
									<tr>
										<th>NO</th>
										<th>제목</th>
										<th>작성일</th>
										<th>진행상태</th>
									</tr>
								</thead>
								<tbody>
								<% if (loginUser == null){ %>
									<tr id="contactTitle" onclick="NoticeClick(this);">
										<td></td>
										<td colspan = "2">등록된 게시글이 없습니다</td>
										<td></td>
									</tr>
								<% }else { %>
									
								
								<% }%>
								</tbody>
							</table>
						</div>
					</div>


				</div>
			
			<!-- 오른쪽 빈공간 -->
			<div class="col-sm-2 sidenav"></div>
			
		</div>

	</div>
	<br>
	
	<!-- 커먼 풋터 -->
	<div class="footerArea">
		<jsp:include page="/views/common/footer.jsp"></jsp:include>
	</div>
	
	<script>
		$(function(){
			$(".listbtn").click(function(){
				location.href = "<%=request.getContextPath()%>/views/notice/contact_list.jsp";
			});
			
			$(".writerbtn").click(function(){
				location.href = "<%=request.getContextPath()%>/views/notice/contact_main.jsp";
			});
		})
		
	</script>

</body>
</html>
