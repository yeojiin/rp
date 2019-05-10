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
<link href="https://fonts.googleapis.com/css?family=Sunflower:300" rel="stylesheet">
<!-- 글꼴 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common/footer.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/company/c_nav.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/company/c_CompanyUpdate.css">
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
	font-size: 20px;
	
}

.sidenav1 a{
	text-decoration: none; 
	color : black;
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
					<li><a href ="<%=request.getContextPath()%>/views/company/c_UpdateCompanyPhoto.jsp">업체 사진 올리기</a></li>
					<li><a href = "<%=request.getContextPath()%>/views/company/c_UpdateCompanyInfor.jsp">업체 정보 수정 </a></li>
				</ul>
			</div>
			<div class="col-sm-8 text-left">
				<%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>
				<div class="contentsArea">
					<div class= "contentsArea con1">
						<table id = "photoTable">
							<tbody>
							<tr>
								<td>
									<div id = "conTitlephoto">
										<label>대표사진</label>
									</div>
								</td>
								<td colspan = "2">
									<h3>소개글</h3>
									<textarea rows= "12" cols = "100" style = "resize:none;"></textarea>
								</td>
							</tr>
							<tr>
								<td colspan = "3">
									<h4>상품및 업체사진</h4>
								</td>
							</tr>
							<tr id = "subPhoto">
								<td>
									<div id="consubphoto3">
										<label>서브사진</label>
									</div>
								</td>
								<td>
									<h3>소개글</h3>
									<textarea rows= "7" cols = "80" style = "resize:none;"></textarea>
								</td>
								<td>
									<br><br>
									<button id = "photoadd">추가</button>
								</td>

							</tr>
							</tbody>
						</table>
	  				</div>
	  				<hr>
	  				
				</div>
			</div>


			<div class="col-sm-2 sidenav2"></div>
		</div>

	</div>

	<!-- 커먼 풋터 -->
	<div class="footerArea">
		<jsp:include page="/views/common/footer.jsp"></jsp:include>
	</div>
	
	<script>
		$(function(){
			
			$("#photoadd").click(function(){
				var subphoto = $("#subPhoto").clone(true);
				
				$("#photoTable>tbody:last").append(subphoto);
				
			});
			
		});
	</script>

</body>
</html>