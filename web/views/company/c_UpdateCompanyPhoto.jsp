<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Sunflower:300"
	rel="stylesheet">
<!-- 글꼴 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common/footer.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/company/c_nav.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/company/c_CompanyUpdate.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>

/* Set height of the grid so .sidenav can be 100% (adjust as needed) */
.row.content {
	height: 600px;
}

/* Set gray background color and 100% height */
.sidenav1 {
	padding-top: 20px;
	height: 100%;
	text-align: left;
	font-size: 17px;
}

.sidenav1 a {
	text-decoration: none;
	color: black;
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
}
</style>
</head>
<body>

	<!-- 업체 나브 -->
	<div>

		<jsp:include page="/views/company/c_nav.jsp"></jsp:include>
	</div>

	<div class="container-fluid text-center">
		<div class="row content">

			<div class="col-sm-2 sidenav1">
				<ul>
					<li><a
						href="<%=request.getContextPath()%>/views/company/c_UpdateCompanyPhoto.jsp">업체
							사진 올리기</a></li>
					<li><a href="<%=request.getContextPath()%>/selectcom.me">업체 정보 수정 </a></li>
				</ul>
			</div>
			<div class="col-sm-8 text-left">
				<%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>
				<form action ="" method="post">
					<div class="wrap">
						<div class="container" id="container">
							<h2>대표사진</h2>
							<div class="panel panel-default">
								<div class="panel-heading">
									<div class="imgArea">
										<img class="img" id="img">
									</div>
									<input type="file" id="companyTitle"
										onchange="loadImg1(this,1)">
								</div>
								<div class="form-group">
									<label for="comment">Comment:</label>
									<textarea class="form-control" rows="5" id="Titlecomment" style = "resize:none;"></textarea>
								</div>
							</div>
						</div>
						<div id="subPhoto">
							<h2>
								서브사진
								<button type="button" id="addSubPhoto">+</button>
							</h2>
							<div class="panel panel-default">
								<div class="panel-heading">
									<div class="imgArea">
										<img class="img" id="subPhoto">
									</div>
									<input type="file" id="subPhoto" onchange="loadImg1(this,1)">
								</div>
								<div class="form-group">
									<label for="comment">Comment:</label>
									<textarea class="form-control" rows="5" id="subcomment"
										style="resize: none;"></textarea>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>

			<div class="col-sm-2 sidenav2">
				<div class="sideMenu2">
					<button id="photoSubmit">등록하기</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 커먼 풋터 -->
	<div class="footerArea">
		<jsp:include page="/views/common/footer.jsp"></jsp:include>
	</div>

	<script>
		$(function() {
			$("#companyTitle").hide();

			$(".img").click(function() {
				$("#companyTitle").click();
			});

			var cloneCount = 1;
			$("#addSubPhoto").click(function() {
				var subphoto = $("#subPhoto").clone(true);

				var imgArea = subphoto.children().children().children();

				imgArea.attr('id', 'imgArea' + cloneCount++);
				
				

				console.log(imgArea);

				$(".container").append(subphoto);

			});

		});

		function loadImg1(value) {
			console.log(value.files);
			console.log(value.files[0]);
			if (value.files && value.files[0]) {
				/* console.log(value); */
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#img").attr("src", e.target.result); //e(이벤트).target(대상).result(경로)
				};

				reader.readAsDataURL(value.files[0]);
			}
		}
		
		
	
	
		
	</script>

</body>
</html>