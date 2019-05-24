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
								<li onclick="location.href='a_Sstats.jsp'">회원 통계</li>
								<li onclick="location.href='a_Mstats.jsp'">업체 통계</li>
								<li onclick="location.href='a_Pstats.jsp'"  style="color:lightgray;">매출 통계</li>
							</ul>
						</div>
					</div>
				</div>
				
				
				<!-- 여기는 스마트폰 -->
				<div class="visible-xs sideListnav2">
					<div class="col-sm-2 sidenav1">
						<div class="sidenavArea2">
						<ul class="navList2">
							<li onclick="location.href='a_Sstats.jsp'" >회원 통계</li>
							<li onclick="location.href='a_Mstats.jsp'">업체 통계</li>
							<li onclick="location.href='a_Pstats.jsp'" style="color:white">매출 통계</li>
						</ul>
					</div>
					</div>
					
					<br><br>
				</div>
				
			
			
			<div class="col-sm-10 text-left">
			<%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>
				<div style="width:100%">
				<br><br>
				<div>
					<input type="radio" name="comTypeRadio" class="serachRadio" checked value="전체">전체 
					<input type="radio" name="comTypeRadio" class="serachRadio" value="스튜디오">스튜디오
					<input type="radio" name="comTypeRadio" class="serachRadio" value="드레스">드레스 
					<input type="radio" name="comTypeRadio" class="serachRadio" value="메이크업">메이크업
				</div>
				<br>
					<select style="height:25px" class="searchSelect">
						<option>일별</option>
						<option>주별</option>
						<option>Top10</option>
					</select>&nbsp;&nbsp;
						<input type="date" class="firstDate"> ~ <input type="date" class="lastDate"> &nbsp; <button class="searchBtn">조회</button>		 	
				</div>
				<div>
				<br><br>
					<div class="chart-container" style="position: relative; height:500px; width:90%;">
					<canvas id="canvas"></canvas>
					</div>								
				</div>
			</div>
				
		</div>
		</div>
	<!-- 커먼 풋터 -->
	<div class="footerArea">
		<jsp:include page="/views/common/footer.jsp"></jsp:include>
	</div>
	
	<script>
		window.onload = function(){
			
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
			
			
			$(".firstDate").val(getDate.getFullYear() + "-" + month + "-" + date);
			$(".lastDate").val(getDate.getFullYear() + "-" + month + "-" + date);
			
			viewBar(getBarChart);
			
		};
		
	$(".searchBtn").click(function(){
		//console.log($(".serachRadio"));
		for(var i=0; i<$(".serachRadio").length; i++){
			if($(".serachRadio")[i].checked == true){
				var value = $(".serachRadio")[i].value;
			}
		}
		var radioValue = value;
		var selectValue = $(".searchSelect").val();
		var arr= $(this).siblings('input');
		var startDate = arr[0].value.split(" ")[0].split("-");
		var endDate = arr[1].value.split(" ")[0].split("-");
		getCategoryStats(radioValue,selectValue,startDate.join(""),endDate.join(""));
		
	});
		
	
		
	function getCategoryStats(radioValue,selectValue,startDate,endDate){
		$.ajax({
			url:"../../salsStats.ad",
			type:"post",
			data:{radioValue:radioValue,selectValue:selectValue,startDate:startDate,endDate:endDate},
			success:function(data){
				console.log(data);
				
				if(selectValue == '일별'){
					

					
					console.log(myBar.config.data.datasets[0]);
					//data[i].price.trim().split(",").join("")
					for(var i=0; i<data.length; i++){
						myBar.config.data.labels[i] = data[i].date;
						//myBar.config.data.datasets[0].data[i] = i;
					}

					myBar.update();
				}else{
					
				}
				
				//console.log(data[0].price.trim());
				
				
				
			},
			error:function(data){
				console.log("에라");
			}
			
		});
		
	}
	
	function getBarChart(){
	var color = Chart.helpers.color;
	var barChartData = {	
		labels: [],
		datasets: [{
			label: '매출액',
			backgroundColor: color(window.chartColors.red).alpha(0.5).rgbString(),
			borderColor: window.chartColors.red,
			borderWidth: 1,
			data: [	
				
			]   
		}]
	
	};
	return barChartData;
  }

  
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
					text: '매출액'
				}
			}
		});
		
	}
	
	</script>
	
</body>
</html>