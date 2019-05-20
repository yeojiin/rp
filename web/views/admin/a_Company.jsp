<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.kh.redding.member.model.vo.*, com.kh.redding.admin.model.vo.*, java.util.*"%>
<%
	ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>) request.getAttribute("list");
	TotalMemberPageInfo pi = (TotalMemberPageInfo) request.getAttribute("pi");
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	ArrayList<HashMap<String, Object>> oneCompany = (ArrayList<HashMap<String, Object>>) request.getAttribute("oneCompany");
%>
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
	href="${pageContext.request.contextPath}/css/common/layout.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/admin/a_company.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/semantic/semantic.min.css">

<title>Redding♥</title>
</head>
<body>
	<div>
		<jsp:include page="/views/admin/a_nav.jsp"></jsp:include>
	</div>
	<div class="container-fluid text-center">
		<div class="row content">

			<div class="visible-md visible-lg visible-sm">
				<div class="col-sm-2 sidenav1">
					<div class="sidenavArea">
						<ul class="navList">
							<li onclick="location.href='a_Company.jsp'"
								style="color: lightgray; padding-left: 25px">업체 목록</li>
							<li onclick="location.href='a_CompanyDetail.jsp'">업체 정보 조회</li>
							<li onclick="location.href='a_Message.jsp'">업체 쪽지 관리</li>
						</ul>
					</div>
				</div>
			</div>

			<div class="visible-xs sideListnav2">
				<div class="col-sm-2 sidenav1">
					<div class="sidenavArea2">
						<ul class="navList2">
							<li onclick="location.href='a_Company.jsp'"
								style="color: lightgray; padding-left: 25px">업체 목록</li>
							<li onclick="location.href='/views/admin/a_CompanyDetail.jsp'">업체
								정보 조회</li>
							<li onclick="location.href='a_Message.jsp'">업체 쪽지 관리</li>
						</ul>
					</div>
				</div>

				<br> <br>
			</div>

			<div class="col-sm-8 text-left">
				<%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>
				<div class="companyArea">
					<div class="companyNum">
						<br>
						<table id="companyNumt">
							<tr>
								<td>전체업체</td>
								<td><%=request.getAttribute("allCompanyListCount")%>개</td>
								<td>신규업체</td>
								<td><%=request.getAttribute("newCompanyListCount")%>개</td>
								<td>탈퇴업체</td>
								<td><%=request.getAttribute("withdrawalCompanyListCount")%>개</td>
							</tr>
						</table>
					</div>
					<br>

					<!-- <h4 id="text1">업체 검색</h4>
					<br> <br> <br>

					<div class="companyList">
						<table id="companyListt">
							<tr>
								<td colspan="3" style="border: 1px solid gray;"></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td colspan="3" style="border: 1px solid gray;">검색 분류</td>
								<td colspan="2">
									<div class="ui right action left icon input">
										<input type="text" value="KH스튜디오">
										<div class="ui basic floating dropdown button">
											<i class="dropdown icon"></i>
										</div>
									</div>
								</td>
								<td colspan="2"><input type="text" class="form-control"
									placeholder="내용을 입력해주세요"></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td colspan="3" style="border: 1px solid gray;">업체구분</td>
								<td><input type="radio">스튜디오</td>
								<td><input type="radio">드레스</td>
								<td><input type="radio">메이크업</td>
								<td colspan="7"></td>
							</tr>
							<tr>
								<td colspan="3" style="border: 1px solid gray;">업체 가입일</td>
								<td><input type="radio">일주일 이내</td>
								<td><input type="radio">1개월 이내</td>
								<td><input type="radio">3개월 이내</td>
								<td><input type="date"> <span> ~ </span> <input
									type="date"></td>
								<td colspan="7"></td>
							</tr>
							<tr>
								<td colspan="3" style="border: 1px solid gray;">상태</td>
								<td><input type="radio">활성</td>
								<td><input type="radio">비활성</td>
								<td colspan="7"></td>
							</tr>
						</table>
						<div class="btns">
							<button class="ui pink button" style="background: salmon;">검색</button>
						</div>
						<br> <br> <br> <br> -->


						<div class="companyList">
							<h3 id="text2">업체 목록</h3>
							<br>

							<div class="companyBaseInfo">
								<br> <br>
								<table class="companyListTable" id="detail">
									<tr>
										<td>선택</td>
										<td>번호</td>
										<td>업체구분</td>
										<td>업체명</td>
										<td>가입일</td>
										<td>활동상태</td>
									</tr>
									<%
										for (int i = 0; i < list.size(); i++) {
											HashMap<String, Object> hmap = list.get(i);
									%>
									<tr>
										<td><input type="checkbox"></td>
										<td><%=hmap.get("num")%></td>
										<%
											Member company = (Member) hmap.get("member");
										%>
										<td><%=company.getMemberName()%></td>
										<td><%=company.getMemberName()%></td>
										<td><%=company.getEnrollDate()%></td>
										<td><%=company.getStatus()%></td>
									</tr>
									<%
										}
									%>
								</table>
								<br>
								<!-- 페이지 버튼 처리 -->
								<div class="pagingArea" align="center">
									<button
										onclick="location.href='<%=request.getContextPath()%>/selectList.me?currentPage=1'"><<</button>
									<%
										if (currentPage <= 1) {
									%>
									<button disabled><</button>
									<%
										} else {
									%>
									<button
										onclick="location.href='<%=request.getContextPath()%>/selectList.me?currentPage=<%=currentPage - 1%>'"><</button>
									<%
										}
									%>

									<%
										for (int p = startPage; p <= endPage; p++) {
											if (p == currentPage) {
									%>
									<button disabled><%=p%></button>
									<%
										} else {
									%>
									<button
										onclick="location.href='<%=request.getContextPath()%>/selectList.me?currentPage=<%=p%>'"><%=p%></button>
									<%
										}
									%>

									<%
										}
									%>

									<%
										if (currentPage >= maxPage) {
									%>
									<button disabled>></button>
									<%
										} else {
									%>
									<button
										onclick="location.href='<%=request.getContextPath()%>/selectList.me?currentPage=<%=currentPage + 1%>'">></button>
									<%
										}
									%>
									<button
										onclick="location.href='<%=request.getContextPath()%>/selectList.me?currentPage=<%=maxPage%>'">>></button>
									<br>
									<!-- <div class="btns">
										<button class="ui pink button" style="background: salmon;">블랙리스트
											추가</button>
										<button class="ui pink button" style="background: salmon;">탈퇴</button>
									</div> -->
									
								</div>

							</div>
							<br><br><br>
							<h3 id="text2">업체 상세정보 조회</h3>
							<br>

							<div class="companyBaseInfo">
								<br> <br>
								<table>
									<tr>
										<td style="background: lightgray;">아이디</td>
										<td class="memberId"></td>
										<td style="background: lightgray;">대표자명</td>
										<td class="repName"></td>
									</tr>
									<tr>
										<td style="background: lightgray;">업체구분</td>
										<td class="comType"></td>
										<td style="background: lightgray;">업체명</td>
										<td class="memberName"></td>
									</tr>
									<tr>
										<td style="background: lightgray;">이메일</td>
										<td class="memberEmail"></td>
										<td style="background: lightgray;">전화번호</td>
										<td class="memberPhone"></td>
									</tr>
									<tr>
										<td style="background: lightgray;">주소</td>
										<td class="companyAddress"></td>
										<td style="background: lightgray;">URL</td>
										<td class="companyUrl"></td>
									</tr>
									<tr>
										<td style="background: lightgray;">OPEN TIME</td>
										<td class="companyOpenTime"></td>
										<td style="background: lightgray;">CLOSE TIME</td>
										<td class="companyCloseTime"></td>
									</tr>
									<tr>
										<td style="background: lightgray;">은행</td>
										<td class="companyBank"></td>
										<td style="background: lightgray;">계좌번호</td>
										<td class="companyBankNum"></td>
									</tr>
									<tr>
										<td style="background: lightgray;">휴일</td>
										<td class="companyHoliday"></td>
										<td style="background: lightgray;">가입일</td>
										<td class="memberEnrollDate"></td>
									</tr>
									<tr>
										<td style="background: lightgray;">활동상태</td>
										<td class="memberStatus"></td>
										<td style="background: lightgray;">탈퇴일</td>
										<td class="memberEndDate"></td>
									</tr>
								
								</table>
							
							

						</div>


					</div>


					<div class="col-sm-2 sidenav2"></div>

				</div>
			</div>
		</div>
		<!-- 커먼 풋터 -->
		<div class="footerArea">
			<jsp:include page="/views/common/footer.jsp"></jsp:include>
		</div>

		<script>
			$(function() {
				$(".companyList td").mouseenter(function() {
					$(this).parent().css({"background":"mistyrose", "cursor":"pointer"});
				}).mouseout(function(){
					$(this).parent().css({"background":"white"});
				}).click(function() {
					var num = $(this).parent().children().eq(1).text();
					$.ajax({
						url:"selectOneCompany.ad",
						data:{num:num},
						type:"get",
						success:function(data) {
							
							$(".memberId").text(data[0].memberId);
							$(".repName").text(data[0].repName);
							$(".comType").text(data[0].comType);
							$(".memberName").text(data[0].memberName);
							$(".memberEmail").text(data[0].memberEmail);
							$(".memberPhone").text(data[0].memberPhone);
							$(".companyAddress").text(data[0].companyAddress);
							$(".companyUrl").text(data[0].companyUrl);
							$(".companyOpenTime").text(data[0].companyOpenTime);
							$(".companyCloseTime").text(data[0].companyCloseTime);
							$(".companyBank").text(data[0].companyBank);
							$(".companyBankNum").text(data[0].companyBankNum);
							$(".companyHoliday").text(data[0].companyHoliday);
							$(".memberEnrollDate").text(data[0].memberEnrollDate);
							$(".memberStatus").text(data[0].memberStatus);
							$(".memberOutDate").text(data[0].memberOutDate);
						}
					});
				});
			});
			
			
			
			
			
			
			
			
		</script>
</body>
</html>