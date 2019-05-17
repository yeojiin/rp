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
				<form action = "" method = "post">
					<div id = "titlePicture">
						<img src = "/redding/images/logo.png" alt = "대표사진" id = "titleimg">
					</div>
					<hr>
					<div id = "subPicture">
						<label>수량을 적어주세요 (최대 10개)</label>&nbsp;&nbsp;&nbsp;&nbsp;
						<input type = "number" id = "imgcount" value = "0" style = "width : 50px"> 
						<input type = "button" id = "countbtn" value = "확인">
						<span id = "guid" style = "width : 100px;"></span>
					</div>
					<table id="imgTable" border="1" cellspacing="0">
					  <tbody></tbody>
					</table>
					<div id = "fileArea" align = "left">
					<input type = "file" id = "thumbnailImg1" name = "thumbnailImg1" onchange = "loadImg(this,1)">
					<!-- <input type = "file" id = "thumbnailImg2" name = "thumbnailImg2" onchange = "loadImg(this,2)">
					<input type = "file" id = "thumbnailImg3" name = "thumbnailImg3" onchange = "loadImg(this,3)">
					<input type = "file" id = "thumbnailImg4" name = "thumbnailImg4" onchange = "loadImg(this,4)"> -->
					</div>
					<script>
						$(function(){
							//서브 이미지 정하고 클릭시 뿌려주기
							$("#countbtn").click(function(){
								$("#guid").css("color", "red");
								$("#guid").text("영역을 클릭해주세요");
								console.log("클릭");
								var imgcount = $("#imgcount").val();
								
								var input = "";
								
								var tr = "<tr>";
								var td = "<td>";
								
								//테이블에 이미지 뿌려주기
								input += "<tr>";
								for(var i = 0 ; i < imgcount ; i++){
									if (i % 2 != 0){
										input += "<td>" 
										input += "<div class = 'imgArea' id = img" + i + ">" 
										input += "<img id = 'subimg" + i + "' class = 'subimg'>" 
										input += "</div>";
										input += "</td>"; 
									 }else if (i % 2 == 0){
										 input += "</tr>"
										 input += "<tr>";
										 input += "<td>" 
										 input += "<div class = 'imgArea' id = img" + i + ">" 
										 input += "<img id = 'subimg" + i + "' class = 'subimg'>" 
										 input += "</div>";
										 input += "</td>"; 
									 }
								 }
								 input += "</tr>";
								 
								 $("#imgTable tbody").html(input);
								 
								 console.log("!! :" +  $("#imgTable").html());
								 
								 //클릭 하면 파일도 생성 되어야함
								 var file = "";
								 
								 for (var i = 0; i <  imgcount ; i++ ){
									 file += "<input type = 'file' id = 'thumbnailImg" + i+2 + "' name = 'thumbnailImg" + i+2 + "' onchange = 'loadImg(this,"+ i+2+ ")'>"
								 }
								 
								 
								 $("#fileArea").append(file);
								 
								 console.log( $("#fileArea").html());
								 
								
							});
						});
						
						function loadImg(value, num) {
							if (value.files && value.files[0]) {
								var reader = new FileReader();
								reader.onload = function(e) {
									switch (num) {
									case 1:
										$("#titleImg").attr("src", e.target.result);
										break;
									case 2:
										$("#contentImg1").attr("src", e.target.result);
										break;
									case 3:
										$("#contentImg2").attr("src", e.target.result);
										break;
									case 4:
										$("#contentImg3").attr("src", e.target.result);
										break;
									}
								}
								reader.readAsDataURL(value.files[0]);
							}
						}
					</script>

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