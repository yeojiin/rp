<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="redding.member.model.vo.Member"%>
<%
	Member loginUser = (Member) session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<title>REDDING-MyPage</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR"
	rel="stylesheet"><!-- 글꼴 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/member/m_header.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common/footer.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/member/m_myPage.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/member/m_myPage_myWriting.css">

<style>

.container {
	width:100%;
	color:salmon;
	font-family:'Noto Sans KR', sans-serif;
}

.row.content {
	height: 450px;
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
	</div><br>
	
	<div class="pageTitle">MY PAGE</div>

	<!-- 섹션 -->
	<div class="container-fluid text-center">
		<div class="row content">
			
			<!-- 왼쪽 빈공간 -->
			<div class="col-sm-2 sidenav" id="leftNav">
			
				<!-- <ul>
					<li><div class="leftMenu">CHECK LIST</div></li>
					<li><div class="leftMenu">결제 내역</div></li>
					<li><div class="leftMenu">쿠폰함</div></li>
					<li><div class="leftMenu">내 글 관리</div></li>
					<li><div class="leftMenu">개인정보 수정</div></li>
				</ul> -->
			
			</div>

			<div class="col-sm-8 text-left">
			<%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>
				<nav class="navbar navbar-inverse">
					<div class="container-fluid">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
								<span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
							</button>
						</div>
						<div class="collapse navbar-collapse" id="myNavbar">
							<ul class="nav navbar-nav">
								<li><button class="navBtn" id="navBtn" onclick="location.href='<%=request.getContextPath() %>/views/member/m_myPage_checkList.jsp'">&nbsp;&nbsp;&nbsp;CHECK LIST&nbsp;&nbsp;&nbsp;</button></li><br>
								<li><button class="navBtn" id="navBtn" onclick="location.href='<%=request.getContextPath() %>/views/member/m_myPage_payment.jsp'">&nbsp;&nbsp;&nbsp;결제내역&nbsp;&nbsp;&nbsp;</button></li><br>
								<li><button class="navBtn" id="navBtn" onclick="location.href='<%=request.getContextPath() %>/views/member/m_myPage_coupon.jsp'">&nbsp;&nbsp;&nbsp;쿠폰함&nbsp;&nbsp;&nbsp;</button></li><br>
								<li><button class="navBtn" id="navBtn" onclick="location.href='<%=request.getContextPath() %>/views/member/m_myPage_myWriting.jsp'">&nbsp;&nbsp;&nbsp;내 글 관리&nbsp;&nbsp;&nbsp;</button></li><br>
								<li><button class="navBtn" onclick="location.href='<%=request.getContextPath() %>/views/member/m_myPage_personalInformation.jsp'">&nbsp;&nbsp;&nbsp;개인정보 수정&nbsp;&nbsp;&nbsp;</button></li><br>
							</ul>
						</div>
					</div>
				</nav> 
				<div class="cont-box"></div>
				
				<div class="contents">
				
					<div class="subTitle">
						[ <%=loginUser.getMemberName()%>님의 내 글 관리 ]
					</div>
					
					<br><br><br>
					
					<label class="subSubTitle">게시글</label>
					<br><br>
					<table class="board">
						<thead>
							<tr>
								<td>선택</td>
								<td>카테고리</td>
								<td>제목</td>
								<td>작성일</td>
								<td>조회수</td>
								<td>좋아요</td>
								<td>수정하기</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><input type="checkBox"></td>
								<td>정보공유</td>
								<td>제목3</td>
								<td>19/05/09</td>
								<td>30</td>
								<td>11</td>
								<td><button class="edit">수정하기</button></td>
							</tr>
							<tr>
								<td><input type="checkBox"></td>
								<td>질문있어요</td>
								<td>제목2</td>
								<td>19/05/08</td>
								<td>62</td>
								<td>13</td>
								<td><button class="edit">수정하기</button></td>
							</tr>
							<tr>
								<td><input type="checkBox"></td>
								<td>질문있어요</td>
								<td>제목1</td>
								<td>19/05/07</td>
								<td>25</td>
								<td>71</td>
								<td><button class="edit">수정하기</button></td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td><br><button class="chooseAll">전체선택</button></td>
								<td colspan="5"><br>
									<button class="paging"><<</button>
									<button class="paging"><</button>
									<button class="paging">1</button>
									<button class="paging">2</button>
									<button class="paging">3</button>
									<button class="paging">4</button>
									<button class="paging">5</button>
									<button class="paging">></button>
									<button class="paging">>></button>
								</td>
								<td><br><button class="delete">삭제하기</button></td>
							</tr>
						</tfoot>
					</table>
					
					
					<br><br><br>
					
					<label class="subSubTitle">&nbsp;&nbsp;&nbsp;댓글</label>
					
					<br><br>
					<table class="board">
						<thead>
							<tr>
								<td>선택</td>
								<td>카테고리</td>
								<td>내용</td>
								<td>작성일</td>
								<td>달린 댓글수</td>
								<td>좋아요</td>
								<td>수정하기</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><input type="checkBox"></td>
								<td>정보공유</td>
								<td>내용3</td>
								<td>19/05/09</td>
								<td>30</td>
								<td>11</td>
								<td><button class="edit">수정하기</button></td>
							</tr>
							<tr>
								<td><input type="checkBox"></td>
								<td>질문있어요</td>
								<td>내용2</td>
								<td>19/05/08</td>
								<td>62</td>
								<td>13</td>
								<td><button class="edit">수정하기</button></td>
							</tr>
							<tr>
								<td><input type="checkBox"></td>
								<td>질문있어요</td>
								<td>내용1</td>
								<td>19/05/07</td>
								<td>25</td>
								<td>71</td>
								<td><button class="edit">수정하기</button></td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td><br><button class="chooseAll">전체선택</button></td>
								<td colspan="5"><br>
									<button class="paging"><<</button>
									<button class="paging"><</button>
									<button class="paging">1</button>
									<button class="paging">2</button>
									<button class="paging">3</button>
									<button class="paging">4</button>
									<button class="paging">5</button>
									<button class="paging">></button>
									<button class="paging">>></button>
								</td>
								<td><br><button class="delete">삭제하기</button></td>
							</tr>
						</tfoot>
					</table>
					
					<br><br><br>
					
					<label class="subSubTitle">&nbsp;&nbsp;&nbsp;1:1 문의내역</label>
					
					<br><br>
					<table class="board">
						<thead>
							<tr>
								<td>선택</td>
								<td>카테고리</td>
								<td>제목</td>
								<td>작성일</td>
								<td>진행상태</td>
								<td>수정하기</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><input type="checkBox"></td>
								<td>업체문의</td>
								<td>제목3</td>
								<td>19/05/09</td>
								<td>답변대기중</td>
								<td><button class="edit">수정하기</button></td>
							</tr>
							<tr>
								<td><input type="checkBox"></td>
								<td>상품문의</td>
								<td>제목2</td>
								<td>19/05/08</td>
								<td>답변완료</td>
								<td><button class="edit">수정하기</button></td>
							</tr>
							<tr>
								<td><input type="checkBox"></td>
								<td>사이트문의</td>
								<td>제목1</td>
								<td>19/05/07</td>
								<td>답변완료</td>
								<td><button class="edit">수정하기</button></td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td><br><button class="chooseAll">전체선택</button></td>
								<td colspan="4"><br>
									<button class="paging"><<</button>
									<button class="paging"><</button>
									<button class="paging">1</button>
									<button class="paging">2</button>
									<button class="paging">3</button>
									<button class="paging">4</button>
									<button class="paging">5</button>
									<button class="paging">></button>
									<button class="paging">>></button>
								</td>
								<td><br><button class="delete">삭제하기</button></td>
							</tr>
						</tfoot>
					</table>
					
				
					
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
