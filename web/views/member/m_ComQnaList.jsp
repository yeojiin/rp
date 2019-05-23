<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="com.kh.redding.member.model.vo.*, com.kh.redding.company.model.vo.*, com.kh.redding.attachment.model.vo.*, com.kh.redding.product.model.vo.*, java.util.*"%>
<%
	ArrayList<HashMap<String, Object>> blist = (ArrayList<HashMap<String, Object>>) request.getAttribute("blist");
	HashMap<String, Object> list = blist.get(blist.size()-1);
	ArrayList<Product> prolist = (ArrayList<Product>)list.get("Product");
	ArrayList<Attachment> attachlist = (ArrayList<Attachment>)list.get("Attachment");
	Company com = (Company)list.get("Company");
	Member mem = (Member)list.get("Member");
	String companyAddress = "";
	Product pro = null;
	int cno = com.getCNO();
	/* int cno = (int) session.getAttribute("cno"); */
	M_ComQnaListPageInfo cqlpi = (M_ComQnaListPageInfo) request.getAttribute("cqlpi");
	int currentPage = cqlpi.getCurrentPage();
	int maxPage = cqlpi.getMaxPage();
	int startPage = cqlpi.getStartPage();
	int endPage = cqlpi.getEndPage();
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

/* td {
   border: 1px solid salmon;
} */

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
            <%---------------------------------------------------------------------------------------------------------------%>
            
            <p style="font-size:40px; text-align:center"><%=mem.getMemberName() %></p>
				<div id="titleimg" style="width:100%; height:auto;">
					<div style="width:50%; height:auto; float:left;">
						<% for (int i = 0; i < attachlist.size(); i++) {
	            			Attachment att = attachlist.get(i); 
	            			System.out.println("타입 :" + att.getCno_div());
	            			String cnodiv = (String)att.getCno_div();
	            			if(cnodiv != null && cnodiv.equals("대표")){%>
								<img src="/redding/company_upload/<%=att.getChangename() %>" id="timg" style="max-width:100%;">
							<%} %>
						<%} %>
					</div>
					<div style="width:50%; height:auto; float:right;">
					<br><br><br>
						
						<p style="font-size:20px; margin-left:25%;">상품이름 : <select>
						<%
						if (prolist != null && prolist.size() > 0){
						for (int i = 0; i < prolist.size(); i++) {
	            			pro = prolist.get(i); %>
							<option><%=pro.getpName() %></option>
						<%} } %>
						</select></p>
						<a class="btn btn-default" style="border-color:salmon; background:salmon; color:white; width:50%; height:auto; font-size:20px; margin-left:25%; margin-top:10%;">예약하기</a><br><br>
						<a class="btn btn-default" style="border-color:salmon; background:salmon; color:white; width:50%; height:auto; font-size:20px; margin-left:25%">위시리스트에 담기</a>
					</div>
					<br><br><br><br><br><br><br><br><br><br>
					<hr style="border-color: black; width:100%;">
					<table border="1"; align="center"; style="width:100%; height:auto; background:salmon; color:white; border-color:white;">
						<tr>
							<td align="center" style="width:25%; font-size:20px;" onclick="location.href='<%=request.getContextPath()%>/selectDetailCom.dc?cno=<%= cno%>'">업체정보</td>
							<td align="center" style="width:25%; font-size:20px;" onclick="location.href='<%=request.getContextPath()%>/selectDetailCom.dc?cno=<%= cno%>'">상품정보</td>						
							<td align="center" style="width:25%; font-size:20px;" onclick="fnMove('3')">후기</td>
							<td align="center" style="width:25%; font-size:20px;" onclick="location.href='<%=request.getContextPath()%>/selectDetailComQna.cq?cno=<%=cno%>'">문의</td>				
						</tr>
					</table>
            			<div style="width:100%; height:auto;">
						<h1>문의</h1>
						<table class="table table-striped" id = "comTable"  style="width: 100%;">
							<thead style = "border : none;">
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
								</tr>
							</thead>
							<tbody>
							    <%  HashMap<String, Object> hmap = null;
							    	String name[] = null;
									for (int i = 0; i < blist.size()-1; i++) {
									System.out.println("dd:" + blist);
										hmap = blist.get(i);
										if (hmap != null){
								%>
								<tr class="detail">
									<td><%=hmap.get("bid") %>
									<%-- <input type="hidden" name="cno" value="<%=cno%>"> --%></td>
									<td><%=hmap.get("bcontent") %></td>
									<td><%=hmap.get("mname") %></td>
									<td><%=hmap.get("bdate") %></td>
								</tr>
								<% 
										}
								} %>
							</tbody>
						</table>
					<button onclick="location.href='<%=request.getContextPath() %>/views/member/m_ComQnaWrite.jsp?cno=<%=cno %>'">글쓰기</button>
					</div>
					<div style="width:100%; height:auto;">
						<button type="button" class="test" onclick="location.href='<%=request.getContextPath() %>/selectDetailComQna.cq?currentPage=1&cno=<%= hmap.get("cno") %>'"><<</button>
						<% if(currentPage <= 1){ %>
						<button disabled><</button>
						<% }else{ %>
						<button onclick="location.href='<%=request.getContextPath() %>/selectDetailComQna.cq?currentPage=<%=currentPage - 1 %>&cno=<%= hmap.get("cno") %>'"><</button>
						<% } %>
									
						<% for(int p = startPage; p <= endPage; p++){
						if(p == currentPage){%>
						<button disabled><%= p %></button>
						<% }else{ %>
						<button onclick="location.href='<%=request.getContextPath() %>/selectDetailComQna.cq?currentPage=<%= p %>&cno=<%= hmap.get("cno") %>'"><%= p %></button>
						<% } %>
						<% } %>
									
						<% if(currentPage >= maxPage){ %>
						<button disabled>></button>
						<% }else{ %>
						<button onclick="location.href='<%=request.getContextPath() %>/selectDetailComQna.cq?currentPage=<%=currentPage + 1 %>&cno=<%= hmap.get("cno") %>'">></button>
						<% } %>
						<button onclick="location.href='<%=request.getContextPath() %>/selectDetailComQna.cq?currentPage=<%=maxPage %>&cno=<%= hmap.get("cno") %> '">>></button>
					</div>
            
            <%---------------------------------------------------------------------------------------------------------------%>
         </div>

         <!-- 오른쪽 빈공간 -->
         <div class="col-sm-2 sidenav"></div>

      </div>
	</div>
   </div>
   <br>

   <!-- 커먼 풋터 -->
   <div class="footerArea">
      <jsp:include page="/views/common/footer.jsp"></jsp:include>
   </div>

</body>
</html>