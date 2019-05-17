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
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
<!-- 글꼴 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/member/m_header.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/member/m_nav.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common/footer.css">
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
				<div class="b_title" style="width:100%; height:auto;">
					<div style="width:50%; height:auto; float:left; font-size:30px; margin-top:18px;">
						<i class="fas fa-edit">후기게시판</i>					
					</div>
					<div style="width:50%; height:auto; float:right;">
						<ul class="pager" style="float:right;">
						<button type="button" class="btn" onclick="location.href='<%=request.getContextPath() %>/selectBoardList.bo'" style="background:salmon; color:white;">목록</button>
  							<li><a href="#"><</a></li>
  							<li><a href="#">></a></li>
						</ul>
					</div>
					<hr style="width:100%; border: solid 3px black;">
					<div style="width:100%; height:auto;">
						<h3 style="color:salmon">['KH스튜디오 후기']</h3>
						<h3>['KH스튜디오에 다녀 온 후기입니다.2019-05-14']</h3>
					</div>
					<hr style="width:100%; border: solid 1px lightgray;">
					<div style="width:100%; height:auto;">
						<h5>작성자 : 김수민 / 작성일자 : 2019-05-14 / 조회수 : 10 / 추천수 : 1</h5>
					</div>
					<div>
						<p>뜨고, 길지 풀이 영원히 할지니, 청춘 얼마나 찾아다녀도, 말이다. 이것을 그들의 보이는 살았으며, 가치를 반짝이는 인생에 우는 앞이 아름다우냐? 두기 방지하는 하는 사막이다. 그것을 들어 그들의 얼음과 거친 부패뿐이다. 별과 얼음과 품고 따뜻한 것이다. 가슴에 트고, 두손을 가는 구하지 길지 스며들어 위하여서 운다.
						 평화스러운 무엇을 끓는 풍부하게 할지라도 그들에게 많이 거선의 것이다. 피에 이것을 지혜는 것은 것이다. 이성은 이상은 뼈 청춘을 천자만홍이 안고, 동산에는 것이다. 천지는 인생의 방황하여도, 주는 없으면 때문이다. 품에 같은 있는 없는 앞이 유소년에게서 같이 예수는 것이다.

						 시들어 끓는 청춘 교향악이다. 쓸쓸한 피고 군영과 간에 전인 것이 많이 속에 철환하였는가? 기쁘며, 하는 튼튼하며, 끓는다. 아니더면, 날카로우나 웅대한 말이다. 무엇을 이것을 우리 인생에 고행을 봄바람이다. 
						 영락과 하는 위하여 무엇을 웅대한 찾아다녀도, 아름답고 소담스러운 황금시대다. 발휘하기 것이 생명을 봄바람이다. 이것이야말로 그것은 우리 찬미를 작고 보내는 것이다. 평화스러운 청춘에서만 든 못할 더운지라 곳으로 끓는 이상의 하였으며, 피다.

						 미인을 있음으로써 낙원을 피가 피가 듣는다. 있는 곧 더운지라 있다. 풀이 하였으며, 오직 얼음과 있는 같이 붙잡아 쓸쓸하랴? 현저하게 찾아 노년에게서 튼튼하며, 있으랴? 피어나기 가진 어디 행복스럽고 영락과 하였으며, 듣는다.
 						 바이며, 청춘은 방지하는 거선의 실로 뭇 뿐이다. 무엇을 이상이 그들은 같으며, 피어나기 아름답고 같이, 있으랴? 만물은 희망의 청춘의 그들의 되려니와, 것이다. 힘차게 품으며, 아니더면, 끝까지 방황하여도, 원대하고, 현저하게 만천하의 역사를 아니다. 
 						 이상은 풀이 노년에게서 소담스러운 불어 얼마나 약동하다. 풍부하게 얼마나 군영과 공자는 아니다.</p>
					</div>
					<div>
						 <div class="row">
							  <div class="col-md-4">
							    <div class="thumbnail">
							      <a href="../../images/dressTest.jpg">
							        <img src="../../images/dressTest.jpg" alt="Lights" style="width:100%">
							        <div class="caption">
							          <p>Lorem ipsum...</p>
							        </div>
							      </a>
							    </div>
							  </div>
							  <div class="col-md-4">
							    <div class="thumbnail">
							      <a href="../../images/dressTest.jpg">
							        <img src="../../images/dressTest.jpg" alt="Nature" style="width:100%">
							        <div class="caption">
							          <p>Lorem ipsum...</p>
							        </div>
							      </a>
							    </div>
							  </div>
							  <div class="col-md-4">
							    <div class="thumbnail">
							      <a href="../../images/dressTest.jpg">
							        <img src="../../images/dressTest.jpg" alt="Fjords" style="width:100%">
							        <div class="caption">
							          <p>Lorem ipsum...</p>
							        </div>
							      </a>
							    </div>
							  </div>
						</div>
					</div>
					<hr style="width:100%; border: solid 1px lightgray;">
					<!-- Left-aligned -->
						<div class="media">
						  <div class="media-left">
						    <img src="../../images/logo.png" class="media-object" style="width:60px">
						  </div>
						  <div class="media-body">
						    <h4 class="media-heading">김수민</h4>
						    <p>좋아요와 구독 부탁드려요</p>
						  </div>
						</div>
						<hr style="width:100%; border: solid 1px lightgray;">
						<!-- Right-aligned -->
						<div class="media">
						  <div class="media-body">
						    <h4 class="media-heading">문지원</h4>
						    <p>조용히하세요</p>
						  </div>
						  <div class="media-right">
						    <img src="../../images/logo.png" class="media-object" style="width:60px">
						  </div>
						</div>
						<div class="form-group" style="width:100%;">
					<label for="comment">댓글</label><br>
					<textarea class="form-control" rows="3" id="comment" style="width:90%; float:left;"></textarea>
					<button type="button" class="btn btn-default" style="width:8%; float:right;">등록</button>
				</div>
               	<div class="text-center">
                  <ul class="pagination">
                     <li><a href="#">1</a></li>
                     <li><a href="#">2</a></li>
                     <li><a href="#">3</a></li>
                     <li><a href="#">4</a></li>
                     <li><a href="#">5</a></li>
                  </ul>
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

</body>
</html>