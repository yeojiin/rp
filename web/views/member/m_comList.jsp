<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="com.kh.redding.member.model.vo.*, com.kh.redding.attachment.model.vo.*, java.util.*"%>
<%
	ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>) request.getAttribute("list");
	M_comListPageInfo clpi = (M_comListPageInfo) request.getAttribute("clpi");
	int currentPage = clpi.getCurrentPage();
	int maxPage = clpi.getMaxPage();
	int startPage = clpi.getStartPage();
	int endPage = clpi.getEndPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR"
   rel="stylesheet">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/css/member/m_plist.css">
<!-- 글꼴 -->
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/css/member/m_header.css">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/css/member/m_nav.css">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/css/common/footer.css">

<style>
.container {
   color: salmon;
   width: 100%;
   argin-left: auto;
   margin-right: auto;
   text-align: center;
   font-family: 'Noto Sans KR', sans-serif;
}

.row.content {
   height: 450px;
}

.sidenav {
   height: 100%;
}

.productlist {
   margin-left: auto;
   margin-right: auto;
   text-align: center;
   font-size: 30px;
   border: 1px solid salmon;
}

table {
   border-collapse: collapse;
   width: 100%;
}

td {
   border: 1px solid salmon;
}

.result {
   text-align: center;
   color: salmon;
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
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
</head>
<body>
   <!-- 멤버 헤더 (미니메뉴, 로고) -->
   <div class="headerArea">
   	  <%@ include file="/views/member/m_header.jsp" %>
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
            <form action="<%=request.getContextPath()%>/listcomtype.mb">
            <div class="list1" align="center">
            	<div style="width:100%; height:auto">
            	<%
            		HashMap<String, Object> hmap = null;
            		String name[] = null;
            		for (int i = 0; i < list.size(); i++) {
            			hmap = list.get(i);
            	%>
            		<div style="width:25%; height:auto; float:left;">
            			<div>
		                  	<img src="/redding/company_upload/<%=hmap.get("changename") %>" style="max-width:100%"; onclick="location.href='<%=request.getContextPath() %>/selectDetailCom.dc?mname=<%=hmap.get("membername") %>'"><br>
            				<p style="font-size:25px; color:black;"><%=hmap.get("membername") %></p>
            				<p style="font-size:25px; font-weight:bold; color:salmon;"><%=hmap.get("price") %>~</p>
            				<p style="font-size:25px; font-weight:bold; color:gold;">★: <%=hmap.get("ComLike") %></p>
            			</div>
            		</div>
               		<% } %>
            	</div>
            	<br>
            	<div class="text-center">
							<ul class="pagination">
								<button onclick="location.href='<%=request.getContextPath() %>/listcomtype.mb?currentPage=1'"><<</button>
								<% if(currentPage <= 1){ %>
								<button disabled><</button>
								<% }else{ %>
								<button onclick="location.href='<%=request.getContextPath() %>/listcomtype.mb?currentPage=<%=currentPage - 1%>'"><</button>
								<% } %>
								
								<% for(int p = startPage; p <= endPage; p++){
									if(p == currentPage){%>
										<button disabled><%= p %></button>
								<% }else{ %>
									<button onclick="location.href='<%=request.getContextPath() %>/listcomtype.mb?currentPage=<%= p %>'"><%= p %></button>
								<% } %>
								<% } %>
								
								<% if(currentPage >= maxPage){ %>
								<button disabled>></button>
								<% }else{ %>
								<button onclick="location.href='<%=request.getContextPath() %>/listcomtype.mb?currentPage=<%=currentPage + 1 %>'">></button>
								<% } %>
								<button onclick="location.href='<%=request.getContextPath() %>/listcomtype.mb?currentPage=<%=maxPage %>'">>></button>
							</ul>
						</div>
            </div>
            </form>
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