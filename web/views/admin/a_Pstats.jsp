<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	href="${pageContext.request.contextPath}/css/company/c_main.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/admin/a_stats.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common/layout.css">
<title>Insert title here</title>
</head>
<body>

	<div>
		<jsp:include page="/views/admin/a_nav.jsp"></jsp:include>
	</div>
	
	<div class="container-fluid text-center">
		<div class="row content">
		
			
				
				<!-- 여기는 큰화면 -->
				<div class="visible-md visible-lg visible-sm">
					<div class="col-sm-2 sidenav1">
						<div class="sidenavArea">
							<ul class="navList">
								<li onclick="location.href='a_Sstats.jsp'">매출 통계</li>
								<li onclick="location.href='a_Mstats.jsp'">사용자 통계</li>
								<li onclick="location.href='a_Pstats.jsp'" style="color:lightgray; padding-left:25px">상품 통계</li>
								<li>게시글 통계</li>
							</ul>
						</div>
					</div>
				</div>
				
				
				<!-- 여기는 스마트폰 -->
				<div class="visible-xs sideListnav2">
					<div class="col-sm-2 sidenav1">
						<div class="sidenavArea2">
						<ul class="navList2">
							<li onclick="location.href='a_Sstats.jsp'">매출 통계</li>
							<li onclick="location.href='a_Mstats.jsp'">사용자 통계</li>
							<li onclick="location.href='a_Pstats.jsp'" style="color:white">상품 통계</li>
							<li>게시글 통계</li>
						</ul>
					</div>
					</div>
					
					<br><br>
				</div>
				
			
			
			<div class="col-sm-8 text-left">
			<%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>
				<!-- 상품 통계 -->
				<div class="ptotalStatsArea" align="center">
				<br><br><br>
				<h2>상품 통계</h2>
					<table>
						<tr>
							<th>전체 상품수</th>
							<th>판매중인 상품수</th>
							<th>판매중단 상품수</th>
							<th>삭제된 상품수</th>
							<th>오늘 판매된 상품수</th>
						</tr>
						<tr>
							<td>1</td>
							<td>2</td>
							<td>3</td>
							<td>4</td>
							<td>5</td>
						</tr>
					</table>
				</div>
				<br><br><br>
				
				<div class="pselectArea">
					<table>
						<tr>
							<th>No.</th>
							<th>날짜</th>
							<th>판매중인 상품수</th>
							<th>판매중단 상품수</th>
							<th>삭제된 상품수</th>
							<th>오늘 판매된 상품수</th>
						</tr>
					<tbody>
						<tr>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
						</tr>
						<tr>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
						</tr>
						<tr>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
						</tr>
						<tr>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
						</tr>
						<tr>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
						</tr>
					</tbody>		
					</table>
				</div>
				<br><br>
				<div class="pselectBtnArea" align="center">
					<label><</label> &nbsp;
					<label>1</label> &nbsp;
					<label>2</label> &nbsp;
					<label>3</label> &nbsp;
					<label>4</label> &nbsp;
					<label>></label>
				</div>
			<div class="col-sm-2 sidenav2"></div>
		</div>
	</div>
	</div>
	<br><br><br>
	<!-- 커먼 풋터 -->
	<div class="footerArea">
		<jsp:include page="/views/common/footer.jsp"></jsp:include>
	</div>


</body>
</html>