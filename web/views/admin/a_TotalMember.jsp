<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.redding.member.model.vo.*, com.kh.redding.admin.model.vo.*, java.util.*"%>
<%
	ArrayList<HashMap<String,Object>> list = (ArrayList<HashMap<String,Object>>) request.getAttribute("list");
	TotalMemberPageInfo pi = (TotalMemberPageInfo) request.getAttribute("pi");
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	Member onemember = (Member) request.getAttribute("onemember");
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
	href="${pageContext.request.contextPath}/css/company/c_nav.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/company/c_main.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common/layout.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/admin/a_totalMember.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/semantic/semantic.min.css">
<script src="<%=request.getContextPath()%>/css/semantic/semantic.min.js"></script>	
<script src="<%=request.getContextPath()%>/css/semantic/jquery-3.4.1.min.js"></script>
<style>

</style>
<title>Insert title here</title>
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
						<li onclick="location.href='a_TotalMember.jsp'" style="color:lightgray; padding-left:25px">전체 회원</li>
						<li onclick="location.href='<%=request.getContextPath()%>/views/admin/a_MemberOrder.jsp'">주문내역</li>
						<li onclick="location.href='<%=request.getContextPath()%>/views/admin/a_MemberInquiry.jsp'">문의</li>
					</ul>
				</div>
			</div>
		</div>
		
		<div class="visible-xs sideListnav2">
					<div class="col-sm-2 sidenav1">
						<div class="sidenavArea2">
						<ul class="navList2">
						<li onclick="location.href='a_TotalMember.jsp'" style="color:lightgray; padding-left:25px">전체 회원</li>
						<li onclick="location.href='<%=request.getContextPath()%>/views/admin/a_MemberOrder.jsp'">주문내역</li>
						<li onclick="location.href='a_MemberInquiry.jsp'">문의</li>
						</ul>
					</div>
					</div>
					
					<br><br>
				</div>
			


			<div class="col-sm-8 text-left">
				<%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>
				<div class="memberArea">
					<div class="memberNum">
						<br>
						<table id="memberNumt">
							<tr>
								<td>전체회원</td>
								<td><%=request.getAttribute("allMemberlistCount")%>명</td>
								<td>신규회원</td>
								<td><%=request.getAttribute("newMemberlistCount")%>명</td>
								<td>탈퇴회원</td>
								<td><%=request.getAttribute("withdrawalMemberlistCount")%>명</td>
							</tr>
						</table>
					</div>
					<br>

					<h4 id="text1">회원 조회</h4>
					<br> <br> <br>
					<div class="memberList">
						<table class="memberListTable">
							<tr>
								<td>선택</td>
								<td>번호</td>
								<td>닉네임</td>
								<td>회원 이름</td>
								<td>성별</td>
								<td>연락처</td>
								<td>이메일주소</td>
								<td>결혼예정일</td>
								<td>신고횟수</td>
							</tr>
							<% for(int i = 0 ; i < list.size() ; i++) { 
								HashMap<String, Object> hmap = list.get(i);
								
								//System.out.println(hmap.get("num"));
							%>
							<tr>
								<td><input type="checkbox"></td>
								<td><%= hmap.get("num") %></td>
								<% Member member = (Member)hmap.get("member"); %>
								<td><%= member.getNickName() %></td>
								<td><%= member.getMemberName() %></td>
								<td><%= member.getGender() %></td>
								<td><%= member.getPhone() %></td>
								<td><%= member.getEmail() %></td>
								<td><%= member.getWeddingDate() %></td>
								<td><%= member.getMnotiType() %></td>
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

						<div class="memberDetail">
							<h3 id="text2">회원 상세정보 조회</h3>
							<br> <br> <br>


							<div class="memberBaseInfo">
								<h4 id="text3">기본정보</h4>
								<br> <br>
								<table id="detailt">
									<tr>
										<td style="background: lightgray;">아이디</td>
										<td class="memberId"></td>
										<td style="background: lightgray;">이름</td>
										<td class="memberName"></td>
									</tr>
									<tr>
										<td style="background: lightgray;">닉네임</td>
										<td class="memberNickName"></td>
										<td style="background: lightgray;">성별</td>
										<td class="memberGender"></td>
									</tr>
									<tr>
										<td style="background: lightgray;">전화번호</td>
										<td class="memberPhone"></td>
										<td style="background: lightgray;">비상연락처</td>
										<td class="memberEmergenCon"></td>
									</tr>
									<tr>
										<td style="background: lightgray;">이메일</td>
										<td class="memberEmail"></td>
										<td style="background: lightgray;">신고횟수</td>
										<td class="memberMnotiType"></td>
									</tr>
									<tr>
										<td style="background: lightgray;">가입일</td>
										<td class="memberEnrollDate"></td>
										<td style="background: lightgray;">결혼예정일</td>
										<td class="memberWeddingDate"></td>
									</tr>
									<tr>
										<td style="background: lightgray;">활동상태</td>
										<td class="memberStatus"></td>
										<td style="background: lightgray;">탈퇴일</td>
										<td class="memberOutDate"></td>
									</tr>
								</table>
								<br>
									<div class="btns">
								<button class="ui pink button" style="background:salmon;">블랙리스트 추가</button>
								<button class="ui pink button" style="background:salmon;">탈퇴</button>
							</div>
								
							</div>



								<br> <br> <br> <br>

								<div class="survey">
									<h4 id="surveyTitle" onclick="surveyClick(this);">설문조사 <i class="dropdown icon"></i></h4>
									<table class="surveyTable" id="surveyContent" style="display:none;">
										<tr id="surveyHead">
											<th>번호</th>
											<th>질문</th>
											<th>내용</th>
										</tr>
										<tr>
											<td>1</td>
											<td>예식장을 예약하셨나요?</td>
											<td>Y</td>
										</tr>
										<tr>
											<td>2</td>
											<td>선호하는 드레스 스타일은?</td>
											<td><p>보헤미안 스타일</p></td>
										</tr>
										<tr>
											<td>3</td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<td>4</td>
											<td></td>
											<td></td>
										</tr>
									</table>
								</div>

							<br>

						


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
		
		<script>
			function surveyClick(obj){
				var tr = $(obj);
				var sub = tr.next();
				
				if(sub.is(":visible")){
					sub.slideUp();
				}else{
					sub.slideDown();
				}
			}
			
			$(function() {
				$(".memberListTable td").mouseenter(function() {
					$(this).parent().css({"background":"mistyrose", "cursor":"pointer"});
				}).mouseout(function() {
					$(this).parent().css({"background":"white"});
				}).click(function() {
					var num = $(this).parent().children().eq(1).text();
					$.ajax({
						url:"selectOneMember.ad",
						data:{num:num},
						type:"get",
						success:function(data) {
							$(".memberId").text(data.memberId);	
							$(".memberName").text(data.memberName);	
							$(".memberNickName").text(data.nickName);	
							$(".memberGender").text(data.gender);	
							$(".memberPhone").text(data.phone);	
							$(".memberEmergenCon").text(data.emergenCon);	
							$(".memberEmail").text(data.email);	
							$(".memberMnotiType").text(data.mnotiType);	
							$(".memberEnrollDate").text(data.enrollDate);	
							$(".memberWeddingDate").text(data.weddingDate);	
							$(".memberStatus").text(data.status);	
							$(".memberOutDate").text(data.outDate);
						}
					});
					
				});
			});
			
		</script>
		
</body>
</html>