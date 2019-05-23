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
<!-- 차트js -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/dist/css/Chart.min.css">
<script src="${pageContext.request.contextPath}/css/dist/js/Chart.min.js"></script>
<script src="${pageContext.request.contextPath}/css/dist/js/utils.js"></script>
<title>Insert title here</title>
<style>
	canvas {
		-moz-user-select: none;
		-webkit-user-select: none;
		-ms-user-select: none;
	}

</style>
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
				<div class="StatArea" style="width:100%; height:300px">
				<br><br>
				<table>
					<tr>
						<td width="100%">
							<div id="container" style="width: 75%;">
								<canvas id="canvas"></canvas>
							</div>
							
						</td>
						<td width="100%">
							<div id="canvas-holder" style="width:100%;float:left">
							<canvas id="chart-area"></canvas>
							<br><br>
							<p class="percentContent" style="text-align:center">성비 차트</p>					
							</div>
						</td>
					</tr>
													
				</table>	
				</div>
				
			</div>
		</div>
		</div>
	<!-- 커먼 풋터 -->
	<div class="footerArea">
		<jsp:include page="/views/common/footer.jsp"></jsp:include>
	</div>
	<script>
	
	function setConfig(data){
		var config = {
				type: 'pie',
				data: {
					datasets: [{
						data: [
							data[1].gNum,
							data[0].gNum,
						],
						backgroundColor: [
							window.chartColors.red,
							window.chartColors.blue

						],
					}],
					labels: [
						'여성회원',
						'남성회원'
					]
				},
				 options: {
					responsive: true

					},

								
			};
		 return config;
		}
	
	
	//실행 로직
	window.onload = function(){
		//성별 통계 리턴
		getGenderCount();
		
		var ctx = document.getElementById('canvas').getContext('2d');
		window.myBar = new Chart(ctx, {
			type: 'bar',
			data: barChartData,
			options: {
				responsive: true,
				legend: {
					position: 'top',
				},
				title: {
					display: true,
					text: 'Chart.js Bar Chart'
				}
			}
		});
		
	}
	
	
	//파이 차트 출력
	function viewPie(config){
		var ctx = document.getElementById('chart-area').getContext('2d');
		window.myPie = new Chart(ctx, config);
	}
	
	
	//젠더 카운터 리턴
	function getGenderCount(){
		$.ajax({
			url:'<%=request.getContextPath()%>/getGenderCount.ad',
			type:'get',
			success: function(data){
				console.log(data);
				viewPie(setConfig(data));
			},
			error: function(data){
				console.log("에러");
			}
			
		});
	}
	
	//
	var MONTHS = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
		var color = Chart.helpers.color;
		var barChartData = {
			labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
			datasets: [{
				label: 'Dataset 1',
				backgroundColor: color(window.chartColors.red).alpha(0.5).rgbString(),
				borderColor: window.chartColors.red,
				borderWidth: 1,
				data: [
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor()
				]
			}, {
				label: 'Dataset 2',
				backgroundColor: color(window.chartColors.blue).alpha(0.5).rgbString(),
				borderColor: window.chartColors.blue,
				borderWidth: 1,
				data: [
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor()
				]
			}]

		};
	
	

	
	</script>

</body>
</html>