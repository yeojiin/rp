<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.redding.admin.model.vo.*, java.util.*" %>
<%
	ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>) request.getAttribute("list");
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
	href="${pageContext.request.contextPath}/css/admin/a_calculate.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/admin/a_stats.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common/layout.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/semantic/semantic.min.css">
<title>Insert title here</title>
</head>
<body>

	<div>
		<jsp:include page="/views/admin/a_nav.jsp"></jsp:include>
	</div>
	
	<div class="container-fluid text-center">
		<div class="row content">
		
			
				
				<!-- 여기는 큰화면 -->
				<div class="visible-md visible-lg visible-sm">
				<div class="col-sm-2 sidenav1">
					<div class="sidenavArea">
						<ul class="navList">
							<li id="memCalc">회원 정산</li>	
							<li onclick="location.href='<%=request.getContextPath()%>/views/admin/a_comCalculate.jsp">업체 정산</li>
						</ul>
					</div>
				</div>
			</div>
				
				
				<!-- 여기는 스마트폰 -->
				<div class="visible-xs sideListnav2">
					<div class="col-sm-2 sidenav1">
					</div>
					
					<br><br>
				</div>
				
			
			
			<div class="col-sm-8 text-left">
			<%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>
		<br>
				<div class="pselectArea">
				<h2>정산 대기 리스트</h2>
				<br>
					<table class="calcTable">
						<tr>
							<th>No.</th>
							<th>업체</th>
							<th>상품</th>
							<th>판매액</th>
							<th>주문자</th>
							<th>결제수단</th>
							<th>결제상태</th>
							<th>결제코드</th>
							<th>결제완료일</th>
							<th>승인상태</th>
							<th>최종금액</th>
							<th>지급보류</th>
							<th>지급하기</th>
						</tr>
					<%
						for (int i = 0; i < list.size(); i++) {
						HashMap<String, Object> hmap = list.get(i);
					%>
						<tr>
							<td id="mno" hidden><%=hmap.get("mno") %></td>
							<td id="payno" hidden><%=hmap.get("payno") %></td>
							<td id="rnum"><%=hmap.get("rnum")%></td>
							<td id="cname" style="width:70px;"><%=hmap.get("cname") %></td>
							<td id="pname" style="width:60px;"><%=hmap.get("pname") %></td>
							<td id="price"><%=hmap.get("price") %></td>
							<td id="mname"><%=hmap.get("mname") %></td>
							<td id="pselect"  style="width:40px;"><%=hmap.get("pselect")%></td>
							<td id="paydiv" style="width:40px;"><%=hmap.get("paydiv") %></td>
							<td id="paycode" style="width:50px;"><%=hmap.get("paycode") %></td>
							<td id="pcompdate"><%=hmap.get("pcompdate") %></td>
					<%
							if(hmap.get("pstatus").equals("승인")){
					%>
							<td id="pstatus" class="pstatus" style="width:40px; color:blue;"><%=hmap.get("pstatus") %></td>
					<% 
							}else{
					%>		
							<td id="pstatus" class="pstatus" style="width:40px; color:red;"><%=hmap.get("pstatus") %></td>
					<%
							}
					%>		
							<td id="fprice"><%=hmap.get("fprice") %></td>
					<%
							if(hmap.get("pstatus").equals("승인")){
					%>		
							<td><button class="ui blue button" id="pay" disabled>승인하기</button></td>
							<td><button class="ui red button" id="cancle">취소하기</button></td>
					<% 
							}else{
					%>
							<td><button class="ui blue button" id ="pay">승인하기</button></td>	
							<td><button class="ui green button" id="hold">보류하기</button></td>
					<%
							}
					%>	
						
						
						</tr>
					<%	
						}
					%>	
					</table>
					<br>
					<div class="pagingArea" align="center">
						<button class="ui button" onclick="location.href='<%= request.getContextPath() %>/showCalc.ad?currentPage=1'"><<</button>
						<% if(currentPage <= 1) { %>
						<button disabled class="ui button"><</button>
						<% } else { %>
						<button class="ui button" onclick="location.href='<%= request.getContextPath() %>/showCalc.ad?currentPage=<%= currentPage - 1 %>'"><</button>
						<% } %>
						
						<% for(int p = startPage; p <= endPage; p++) { 
								if(p == currentPage) { %>
									<button class="ui button" disabled><%= p %></button>
						<% 		}else {%>
									<button class="ui button" onclick="location.href='<%= request.getContextPath() %>/showCalc.ad?currentPage=<%= p %>'"><%= p %></button>
						<%		} %>
							
						<% } %>
						
						<% if(currentPage >= maxPage) { %>
						<button class="ui button" disabled>></button>
						<% } else { %>
						<button class="ui button" onclick="location.href='<%= request.getContextPath() %>/showCalc.ad?currentPage=<%= currentPage + 1 %>'">></button>
						<% } %>
						<button class="ui button" onclick="location.href='<%= request.getContextPath() %>/showCalc.ad?currentPage=<%= maxPage %>'">>></button>
						<br>
						</div>
				</div>
				<br><br>
				
				<div class="pselectArea">
				<h2>정산 완료 리스트</h2>
				<br>
					<table>
						<tr>
							<th>No.</th>
							<th>업체</th>
							<th>상품</th>
							<th>판매액</th>
							<th>지급완료액</th>
							<th>지급완료날짜</th>
						</tr>
					<tbody>
						<tr>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
						</tr>
						<tr>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
						</tr>
						<tr>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
						</tr>
						<tr>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
						</tr>
						<tr>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
						</tr>
					</tbody>		
					</table>
				</div>
				<br><br>
				<div class="pselectBtnArea" align="center">
					<label><</label> &nbsp;
					<label>1</label> &nbsp;
					<label>2</label> &nbsp;
					<label>3</label> &nbsp;
					<label>4</label> &nbsp;
					<label>></label>
				</div>
				
			<div class="col-sm-2 sidenav2"></div>
		</div>
	</div>
	</div>
	<br><br><br>
	<!-- 커먼 풋터 -->
	<div class="footerArea">
		<jsp:include page="/views/common/footer.jsp"></jsp:include>
	</div>
	
	
	<script>	
	
	//배경 바꾸기
	$(function() {
		$(".calcTable td").mouseenter(function() {
			$(this).parent().css({"background":"mistyrose", "cursor":"pointer"});
		}).mouseout(function() {
			$(this).parent().css({"background":"white"});
		}); 
	});
	
	
	//회원정산메뉴 클릭
	$("#memCalc").click(function(){
		 location.href="<%=request.getContextPath()%>/showCalc.ad"; 
		
	});
		
	
	/* $(document).ready(function(){
		$.ajax
		
	});
	 */
	
	
	
	//승인하기 버튼(계좌이체 확인)
	$(document).on("click","#pay",function(){
		var payno = $(this).closest("td").siblings('#payno').text();
		
		$.ajax({
			url : "/redding/memberPay.ad",
  			data : {payno:payno},
  			type : "post",
  			success : function(data){
  				if(data>0){
  					alert("승인성공!");
  					
  					location.href="<%=request.getContextPath()%>/showCalc.ad";
  				}else{
  					alert("승인실패!");
  				}
  				
  				
  			},error:function(){
  				console.log("승인하기 실패!");
  			}
		});
		
		
	});
	
	
		
	</script>


</body>
</html>