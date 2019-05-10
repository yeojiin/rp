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
								<li onclick="location.href='a_Pstats.jsp'" style="color:lightgray; padding-left:25px">매출 통계</li>
								<li onclick="location.href='a_Mstats.jsp'">사용자 통계</li>
								<li onclick="location.href='a_Pstats.jsp'">상품 통계</li>
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
							<li onclick="location.href='a_Pstats.jsp'" style="color:white">매출 통계</li>
							<li onclick="location.href='a_Mstats.jsp'">사용자 통계</li>
							<li onclick="location.href='a_Pstats.jsp'">상품 통계</li>
							<li>게시글 통계</li>
						</ul>
					</div>
					</div>
					
					<br><br>
				</div>
				
			
			
			<div class="col-sm-8 text-left">
			<%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>
				<div class="StotalStatsArea">
					<div class="dtotalStatsArea sArea">
						<h3 align="center">요일별 매출 현황</h3>
						<div class="dtotalStatschart">
							<br><br><br><br><br><br><br><br><br>
						</div>
						<table>
							<tr>
								<th>요일</th>
								<th>일</th>
								<th>월</th>
								<th>화</th>
								<th>수</th>
								<th>목</th>
								<th>금</th>
								<th>토</th>
							</tr>
							<tr>
								<td>금액(원)</td>
								<td>1</td>
								<td>1</td>
								<td>1</td>
								<td>1</td>
								<td>1</td>
								<td>1</td>
								<td>1</td>
							</tr>
							<tr>
								<td>건</td>
								<td>1</td>
								<td>1</td>
								<td>1</td>
								<td>1</td>
								<td>1</td>
								<td>1</td>
								<td>1</td>
							</tr>
						</table>
					</div>
				
					<div class="mtotalStatsArea sArea">
						<h3 align="center">월별 매출 현황</h3>
						<div class="mtotalStatschart">
							<br><br><br><br><br><br><br><br><br> 
						</div>
						<table>
							<tr>
								<th>월</th>
								<th>1월</th>
								<th>2월</th>
								<th>3월</th>
								<th>4월</th>
								<th>5월</th>
								<th>6월</th>
								<th>7월</th>
								<th>8월</th>
								<th>9월</th>
								<th>10월</th>
								<th>11월</th>
								<th>12월</th>
							</tr>
							<tr>
								<td>금액</td>
								<td>1</td>
								<td>2</td>
								<td>3</td>
								<td>4</td>
								<td>5</td>
								<td>6</td>
								<td>7</td>
								<td>8</td>
								<td>9</td>
								<td>10</td>
								<td>11</td>
								<td>12</td>
							</tr>
							<tr>
								<td>건</td>
								<td>1</td>
								<td>2</td>
								<td>3</td>
								<td>4</td>
								<td>5</td>
								<td>6</td>
								<td>7</td>
								<td>8</td>
								<td>9</td>
								<td>10</td>
								<td>11</td>
								<td>12</td>
							</tr>
						</table>
					</div>
				
					<div class="ytotalStatsArea sArea">
						<h3 align="center">연도별 매출 현황</h3>
						<div class="ytotalStatschart">
							<br><br><br><br><br><br><br><br><br>  
						</div>
						<table>
							<tr>
								<th>연</th>
								<th>2017</th>
								<th>2018</th>
								<th>2019</th>
								<th>2020</th>
								<th>2021</th>
								<th>2022</th>
								<th>2023</th>
							</tr>
							<tr>
								<td>금액(원)</td>
								<td>1</td>
								<td>1</td>
								<td>1</td>
								<td>1</td>
								<td>1</td>
								<td>1</td>
								<td>1</td>
							</tr>
							<tr>
								<td>건</td>
								<td>1</td>
								<td>1</td>
								<td>1</td>
								<td>1</td>
								<td>1</td>
								<td>1</td>
								<td>1</td>
							</tr>
						</table>
					</div>
				</div>
				
			</div>
		</div>
		</div>
	<!-- 커먼 풋터 -->
	<div class="footerArea">
		<jsp:include page="/views/common/footer.jsp"></jsp:include>
	</div>


</body>
</html>