<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.redding.member.model.vo.*, com.kh.redding.admin.model.vo.*, java.util.*"%>
<%
	ArrayList<HashMap<String,Object>> list = (ArrayList<HashMap<String,Object>>) request.getAttribute("list");
	TotalMemberPageInfo pi = (TotalMemberPageInfo) request.getAttribute("pi");
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
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
						<li onclick="location.href='a_Company.jsp'" style="color:lightgray; padding-left:25px">업체 목록</li>
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
							<li onclick="location.href='a_Company.jsp'" style="color:lightgray; padding-left:25px">업체 목록</li>
						<li onclick="location.href='a_CompanyDetail.jsp'">업체 정보 조회</li>
						<li onclick="location.href='a_Message.jsp'">업체 쪽지 관리</li>
						</ul>
					</div>
					</div>
					
					<br><br>
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

					<h4 id="text1">업체 검색</h4>
					<br> <br> <br>

					<div class="companyList">
						<table id="companyListt">
							<tr style="background: lightgray;" height="40">
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
								<td colspan="2">
									<input type="text" class="form-control" placeholder="내용을 입력해주세요"></td>
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
								<td>
									<input type="date">
									<span> ~ </span>
									<input type="date">
								</td>
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
							<button class="ui pink button" style="background:salmon;">검색</button>
						</div>
						<br> <br> <br> <br>


						<div class="companyDetail">
							<h3 id="text2">업체 목록</h3>
							<br> 

							<div class="companyBaseInfo">
								<br> <br>
								<table id="detailt">
									<tr style="background: lightgray;">
										<td>선택</td>
										<td>번호</td>
										<td>업체구분</td>
										<td>업체명</td>
										<td>가입일</td>
										<td>활동상태</td>
									</tr>
									<% for(int i = 0 ; i < list.size() ; i++) { 
										HashMap<String, Object> hmap = list.get(i);
									%>
									<tr>
										<td><input type="checkbox"></td>
										<td><%= hmap.get("num") %></td>
										<% Member company = (Member)hmap.get("member"); %>
										<td><%= company.getMemberName()%></td>
										<td><%= company.getMemberName()%></td>
										<td><%= company.getEnrollDate() %></td>
										<td><%= company.getStatus() %></td>
									</tr>
									<% } %> 
								</table>
								<br>
								<!-- 페이지 버튼 처리 -->
								<div class="pagingArea" align="center">
								<button onclick="location.href='<%= request.getContextPath() %>/selectList.me?currentPage=1'"><<</button>
								<% if(currentPage <= 1) { %>
								<button disabled><</button>
								<% } else { %>
								<button onclick="location.href='<%= request.getContextPath() %>/selectList.me?currentPage=<%= currentPage - 1 %>'"><</button>
								<% } %>
								
								<% for(int p = startPage; p <= endPage; p++) { 
										if(p == currentPage) { %>
											<button disabled><%= p %></button>
								<% 		}else {%>
											<button onclick="location.href='<%= request.getContextPath() %>/selectList.me?currentPage=<%= p %>'"><%= p %></button>
								<%		} %>
									
								<% } %>
								
								<% if(currentPage >= maxPage) { %>
								<button disabled>></button>
								<% } else { %>
								<button onclick="location.href='<%= request.getContextPath() %>/selectList.me?currentPage=<%= currentPage + 1 %>'">></button>
								<% } %>
								<button onclick="location.href='<%= request.getContextPath() %>/selectList.me?currentPage=<%= maxPage %>'">>></button>
								<br>
								<div class="btns">
									<button class="ui pink button" style="background:salmon;">블랙리스트 추가</button>
									<button class="ui pink button" style="background:salmon;">탈퇴</button>
								</div>
								<br>
								<br>
								<br>
								<div class="btns">
									<button class="ui pink button" style="background: salmon;" onclick=>상세정보 조회</button>
								</div>
							</div>

						</div>

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
</body>
</html>