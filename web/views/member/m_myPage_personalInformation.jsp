<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.redding.member.model.vo.Member"%>
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
	href="${pageContext.request.contextPath}/css/member/m_myPage_personalInformation.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/member/m_join.css">
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
						[ <%=loginUser.getMemberName()%>님의 개인정보 수정]
					</div>
					
					<br><br><br>
					
					<table class="memberJoinTable">
							<tr>
								<td class="col1"><label>아이디&nbsp;&nbsp;</label><label class="star">*</label></td>
								<td class="col2">
									<input type="text" name="memberId" value="<%=loginUser.getMemberId()%>" readonly>&nbsp;&nbsp;&nbsp;&nbsp;
									<button class="check">아이디중복확인</button>&nbsp;&nbsp;&nbsp;&nbsp;(영문소문자/숫자, 4~16자)
								</td>
							</tr>
							<tr>
								<td class="col1"><label>비밀번호&nbsp;&nbsp;</label><label class="star">*</label></td>
								<td class="col2"><input type="password" name="memberPwd" value="<%=loginUser.getMemberPwd()%>">&nbsp;&nbsp;&nbsp;&nbsp;(영문대소문자/숫자/특수문자 중 2가지 이상 조합, 8~16자)</td>
							</tr>
							<tr>
								<td class="col1"><label>비밀번호 확인&nbsp;&nbsp;</label><label class="star">*</label></td>
								<td class="col2"><input type="password" name="memberPwd2" value="<%=loginUser.getMemberPwd()%>"></td>
							</tr>
							<tr>
								<td class="col1"><label>이름&nbsp;&nbsp;</label><label class="star">*</label></td>
								<td class="col2"><input type="text" name="memberName" value="<%=loginUser.getMemberName()%>" readonly></td>
							</tr>
							<tr>
								<td class="col1"><label>닉네임&nbsp;&nbsp;</label><label class="star">*</label></td>
								<td>
									<input type="text" name="nickName" value="<%=loginUser.getNickName()%>">&nbsp;&nbsp;&nbsp;&nbsp;
									<button class="check">닉네임중복확인</button>
								</td>
							</tr>
							<tr>
								<td class="col1"><label>휴대전화&nbsp;&nbsp;</label><label class="star">*</label></td>
								<td class="col2">
									<select name="tel1" style="width:53px;" value="<%= loginUser.getPhone().split("-")[0]%>">
										<option>010</option>
										<option>011</option>
										<option>016</option>
										<option>017</option>
										<option>018</option>
										<option>019</option>
									</select>&nbsp;-
									<input type="text" name="tel2" style="width:60px;" value="<%= loginUser.getPhone().split("-")[1]%>">&nbsp;-
									<input type="text" name="tel3" style="width:60px;" value="<%= loginUser.getPhone().split("-")[2]%>">&nbsp;&nbsp;&nbsp;&nbsp;
									<button class="check">인증하기</button>
								</td>
							</tr>
							<tr>
								<td class="col1"><label>비상연락번호</label></td>
								<td class="col2">
									<select name="con1" style="width:53px;" value="<%= loginUser.getEmergenCon().split("-")[0]%>">
										<option>010</option>
										<option>011</option>
										<option>016</option>
										<option>017</option>
										<option>018</option>
										<option>019</option>
									</select>&nbsp;-
									<input type="text" name="con2" style="width:60px;" value="<%= loginUser.getEmergenCon().split("-")[1]%>">&nbsp;-
									<input type="text" name="con3" style="width:60px;" value="<%= loginUser.getEmergenCon().split("-")[2]%>">
								</td>
							</tr>
							<tr>
								<td class="col1"><label>이메일&nbsp;&nbsp;</label><label class="star">*</label></td>
								<td class="col2">
									<input type="text" name="email1" value="<%= loginUser.getEmail().split("@")[0]%>">&nbsp;&nbsp;@&nbsp;&nbsp;
									<input type="text" name="email2">&nbsp;&nbsp;
									<select name="email3">
										<option>- 이메일 선택 -</option>
										<option>naver.com</option>
										<option>daum.net</option>
										<option>nate.com</option>
										<option>hotmail.com</option>
										<option>yahoo.com</option>
										<option>empas.com</option>
										<option>korea.com</option>
										<option>gmail.com</option>
										<option>직접입력</option>
									</select>&nbsp;&nbsp;&nbsp;&nbsp;
									<button class="check">인증하기</button>
								</td>
							</tr>
							<tr>
								<td class="col1"><label>성별&nbsp;&nbsp;</label><label class="star">*</label></td>
								<td class="col2">
									<input type="radio" name="gender" value="M">남자&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="radio" name="gender" value="F" checked>여자
								</td>
							</tr>
						</table>
						
						<br>
						<br>
						<div class="memberJoinBtnArea"> <!-- if문 처리하기 -->
							<input class="memberJoinBtn" type="reset" value="뒤로가기">&nbsp;&nbsp;&nbsp;&nbsp;
							<input class="memberJoinBtn" type="submit" value="수정하기">
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
