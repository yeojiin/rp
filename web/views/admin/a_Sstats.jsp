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
								<li onclick="location.href='a_Sstats.jsp'" style="color:lightgray;">회원 통계</li>
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
							<li onclick="location.href='a_Sstats.jsp'" style="color:white">회원 통계</li>
							<li onclick="location.href='a_Mstats.jsp'">사용자 통계</li>
							<li onclick="location.href='a_Pstats.jsp'">상품 통계</li>
							<li>게시글 통계</li>
						</ul>
					</div>
					</div>
					
					<br><br>
				</div>
				
			
			
			<div class="col-sm-10 text-left">
			<%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>
				<div class="StatArea" style="width:100%; height:auto;">
				<br><br>
				<table>
					<tr>
						<td width="100%">
							<canvas id="canvas" style=></canvas>
						</td>
						<td width="100%">
							<canvas id="chart-area"></canvas>		
						</td>
					</tr>													
				</table>
				<br><br>
				
				<div style="float:right">
				<input type="date"> ~ <input type="date"> <button class="searchDate">조회</button>
				</div>
				
				<div style="width:100%; height:300px">
					<canvas id="canvas" class="hels"></canvas>					
				</div>
				<br><br><br>
				</div>
				
				
		</div>
				
		</div>
		</div>
	<!-- 커먼 풋터 -->
	<div class="footerArea">
		<jsp:include page="/views/common/footer.jsp"></jsp:include>
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<script>
	var checkFlag = true;
	//실행 로직
	window.onload = function(){
		
		
		//성별 통계 리턴
		getGenderCount();
		
		
		//getDateCount();
		
		getLineChart(MonthSetChart(/* data */));
		
		
		$("#canvas").css({"height":"300px"});
		$(".hels").css({"height":"300px"});
		
		
				
	}
	
	$(".searchDate").click(function(){
		var arr= $(this).siblings('input');
		var startDate = arr[0].value.split("-")[0] +  arr[0].value.split("-")[1];
		var endDate = arr[1].value.split("-")[0] +  arr[1].value.split("-")[1];
		
		$.ajax({
			url:'<%=request.getContextPath()%>/getGenderCount.ad',
			data:{startDate:startDate, endDate:endDate, value:30},
			type:"get",
			success:function(data){
				console.log(data);
			},
			error:function(data){
				
			}
			
		});
		
	});
	
	
	//파이차트 셋팅
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
	
	
	//파이 차트 출력
	function viewPie(config){
		var ctx = document.getElementById('chart-area').getContext('2d');
		window.myPie = new Chart(ctx, config);
	}
	
	
	//젠더 카운터 리턴 및 성비 출력
	 function getGenderCount(){
	
	
	 	$.ajax({
			url:'<%=request.getContextPath()%>/getGenderCount.ad',
			type:'get',
			data:{value:10},
			success: function(data){			
				//viewPie(setConfig(data));
				
				vlewPie();				
				getDateCount();
			},
			error: function(data){
				console.log("에러");
			}
			
		});
			
	} 
	
	
	//일별 가입수 리턴 바 차트 출력
	function getDateCount(){
		
		$.ajax({
			url:'<%=request.getContextPath()%>/getGenderCount.ad',
			type:'get',
			data:{value:20},			
			success: function(data){
				console.log(data);				
				var views = getChart(data);
				viewBar(views);
				//getYearCount();
			},
			error: function(data){
				console.log("에러");
			}
			
		});
	}
	
	//월별 가입수 리턴 라인 차트 출력
	function getYearCount(){
		
		$.ajax({
			url:'<%=request.getContextPath()%>/getGenderCount.ad',
			type:'get',
			data:{value:30},			
			success: function(data){
				console.log(data);				
				//getLineChart(MonthSetChart(data));
			},
			error: function(data){
				console.log("에러");
			}
			
		});
	}
	
	
	//바 차트 셋팅
	function getChart(data){
		
		var getDate = new Date();
		
		if((getDate.getMonth()+1) < 9){
			var month = '0' + (getDate.getMonth()+1);
		}else{
			var month = (getDate.getMonth()+1);
		}
		
		if((getDate.getDate()) < 9){
			var date = '0' + (getDate.getDate());
		}else{
			var date = (getDate.getDate());
		}
		
		
		var dateArr = new Array();
		var color = Chart.helpers.color;
		
		var femaleArr = new Array();
		var maleArr = new Array();				
		
		for(var i = 0; i< 7; i++){
			dateArr[i] = month + "월" + (date-i) + "일";	
			}
		
		//남녀 구분해서 배열에 담아줌
		   for(var i=0; i<data.length; i++){
			if(data[i].gender == 'M'){
				maleArr.push(data[i]);
			}else{
				femaleArr.push(data[i]);
			}
			
		}
		
		var maleCount = setDateCount(maleArr);
		var femaleCount = setDateCount(femaleArr);
				
		
		var barChartData = {	
			labels: [dateArr[6],dateArr[5],dateArr[4],dateArr[3],dateArr[2],dateArr[1],dateArr[0]],
			datasets: [{
				label: '여성회원',
				backgroundColor: color(window.chartColors.red).alpha(0.5).rgbString(),
				borderColor: window.chartColors.red,
				borderWidth: 1,
				data: [
					femaleCount[0],
					femaleCount[1],
					femaleCount[2],
					femaleCount[3],
					femaleCount[4],
					femaleCount[5],
					femaleCount[6],
					femaleCount[7],
				
				]   
			}, {
				label: '남성회원',
				backgroundColor: color(window.chartColors.blue).alpha(0.5).rgbString(),
				borderColor: window.chartColors.blue,
				borderWidth: 1,
				data: [
					maleCount[0],
					maleCount[1],
					maleCount[2],
					maleCount[3],
					maleCount[4],
					maleCount[5],
					maleCount[6],
					maleCount[7]
					
				]
			}]

		};
		return barChartData;
	}
	
	
	
	//바 차트 출력
	function viewBar(barChartData){
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
					text: '일별 가입수'
				}
			}
		});
		
	}
	//주별 로직
	function setDateCount(maleArr){
		var getDate = new Date();
		
		if((getDate.getMonth()+1) < 9){
			var month = '0' + (getDate.getMonth()+1);
		}else{
			var month = (getDate.getMonth()+1);
		}
		
		if((getDate.getDate()) < 9){
			var date = '0' + (getDate.getDate());
		}else{
			var date = (getDate.getDate());
		}

					
			var num = maleArr.length;
			
			 if(maleArr.length != 7){			
				for(var i = 0; i < (7-num); i++){
					maleArr.push(0);
				}
				
			} 
			
			console.log(maleArr);
			
			/* var fnum = femaleArr.length;
			
			 if(femaleArr.length != 7){			
				for(var i = 0; i < (7-fnum); i++){
					femaleArr.push(0);
				}
				
			} */  

			
			
				var maleCount = new Array();
				var femaleCount = new Array();
				
				 for(var i =0; i<7; i++){
					maleCount.push(0);
					/* femaleCount.push(0); */
				} 
				
							
				for(var i=0; i<7; i++){
					if(maleArr[i] != 0){
						for(var j=0; j<7; j++){
							if(maleArr[i].gNum.split(" ")[0] == getDate.getFullYear() + "-" + month + "-" + (date-j)){
							maleCount[j] = maleArr[i].tNum;
						}
					}				
				   }				
				}  
				
				 /* for(var i=0; i<7; i++){
					if(femaleArr[i] != 0){
						for(var j=0; j<7; j++){
							if(femaleArr[i].gNum.split(" ")[0] == getDate.getFullYear() + "-" + month + "-" + (date-j)){
							femaleCount[j] = femaleArr[i].tNum;
						}
					}				
				   }				
				} */ 
				
				
				 console.log(maleCount);
				console.log(femaleCount); 
				
				return maleCount;
	}
	
	
	//라인차트 출력
	function getLineChart(config){
		var ctx = document.getElementsByTagName("canvas")[2].getContext('2d');
		window.myLine = new Chart(ctx, config);
	}

	//라인 차트 세팅
	function MonthSetChart(/* data */){
		//var Date = new Date();
		var config = {
			
			type: 'line',
			data: {
				labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
				datasets: [{
					label: '여성회원',
					backgroundColor: window.chartColors.red,
					borderColor: window.chartColors.red,
					data: [
						randomScalingFactor(),
						randomScalingFactor(),
						randomScalingFactor(),
						randomScalingFactor(),
						randomScalingFactor(),
						randomScalingFactor(),
						randomScalingFactor()
					],
					fill: false,
				}, {
					label: '남성회원',
					fill: false,
					backgroundColor: window.chartColors.blue,
					borderColor: window.chartColors.blue,
					data: [
						randomScalingFactor(),
						randomScalingFactor(),
						randomScalingFactor(),
						randomScalingFactor(),
						randomScalingFactor(),
						randomScalingFactor(),
						randomScalingFactor()
					],
				}]
			},
			options: {
				responsive: true,
				title: {
					display: true,
					text: '월별 가입수'
				},
				tooltips: {
					mode: 'index',
					intersect: false,
				},
				hover: {
					mode: 'nearest',
					intersect: true
				},
				scales: {
					xAxes: [{
						display: true,
						scaleLabel: {
							display: true,
							labelString: 'Month'
						}
					}],
					yAxes: [{
						display: true,
						scaleLabel: {
							display: true,
							labelString: 'Value'
						}
					}]
				}
			}
		};
		return config;
}	
	
	



	
	
	
	</script>

</body>
</html>