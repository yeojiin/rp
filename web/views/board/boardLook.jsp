<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>REDDING</title>
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
<!-- 글꼴 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/member/m_header.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/member/m_nav.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common/footer.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/board/b_Look.css">
<style>
.container {
	width: 100%;
	color: salmon;
	font-family: 'Noto Sans KR', sans-serif;
}

.row.content {
	height: 490px;
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
}
</style>
</head>
<body>

	<!-- 멤버 헤더 (미니메뉴, 로고) -->
	<div class="headerArea">
		<jsp:include page="/views/member/m_header.jsp"></jsp:include>
	</div>
	<br>

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
				<div class="panel panel-warning">
					<div class="panel-heading">공지입니다</div>
					<div class="panel-body">못할 있는 바이며, 무엇을 희망의 청춘은 것이다. 앞이 청춘 꾸며 뛰노는 동산에는 내려온 인간의 있으랴? 긴지라 방황하였으며, 타오르고 가는 길지 할지니, 현저하게 힘차게 풀이 봄바람이다. 없으면, 인도하겠다는 별과 같으며, 인생의 사라지지 교향악이다. 얼음 인생을 산야에 사는가 스며들어 그리하였는가? 무엇이 발휘하기 가지에 그들은 있는 되려니와, 것이다. 인생에 얼음이 같이 그러므로 크고 꽃이 것이다. 위하여서 돋고, 얼마나 찾아 피는 부패뿐이다. 주며, 안고, 꾸며 위하여서 사막이다. 청춘에서만 피가 하여도 유소년에게서 천지는 하는 이는 뜨고, 부패뿐이다.</div>
				</div>
				<div class="form-group" style="width:100%;">
					<label for="comment">댓글</label><br>
					<textarea class="form-control" rows="3" id="comment" style="width:90%; float:left;"></textarea>
					<button type="button" class="btn btn-default" style="width:8%; float:right;">등록</button>
				</div>
				<br><br><br><br>
				<hr style="align:center; border-color:black; width:100%;" >
				 <table class="table table-striped" style="width:100%;">
                  <thead>
                     <tr>
                        <th>댓글작성자</th>
                        <th>내용</th>
                        <th>작성일</th>
                        <th>조회수</th>
                        <th>좋아요</th>
                     </tr>
                  </thead>
                  <tbody>
                     <tr>
                        <td>전효정</td>
                        <td>댓글내용전효정김수민문지원임정연남궁욱</td>
                        <td>19.04.16</td>
                        <td>10</td>
                        <td>15</td>
                     </tr>
                  </tbody>
               </table>

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

</body>
</html>