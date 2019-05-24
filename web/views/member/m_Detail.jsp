<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.redding.member.model.vo.*, com.kh.redding.company.model.vo.*, com.kh.redding.attachment.model.vo.*, com.kh.redding.product.model.vo.*, java.util.*"%>
<%
	HashMap<String, Object> list = (HashMap<String, Object>)request.getAttribute("list");
	ArrayList<Product> prolist = (ArrayList<Product>)list.get("Product");
	ArrayList<Attachment> attachlist = (ArrayList<Attachment>)list.get("Attachment");
	Company com = (Company)list.get("Company");
	Member mem = (Member)list.get("Member");
	String companyAddress = "";
	Product pro = null;
	int cno = (int) session.getAttribute("cno");
	Member loginUser = (Member) session.getAttribute("loginUser");
%>
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
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.0/jquery-ui.min.js"></script>

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
	href="<%=request.getContextPath() %>/css/member/m_detail.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
	integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay"
	crossorigin="anonymous">
<style>
.container {
	width: 100%;
	color: salmon;
	font-family: 'Noto Sans KR', sans-serif;
}

.row.content {
	height: auto;
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

	.imgContent{
		width: 100%;
		height: 300px;
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
				<form action="<%=request.getContextPath()%>/selectDetailCom.dc">
				<br>
				
				<p style="font-size:40px; text-align:center"><%=mem.getMemberName() %></p>
				<div id="titleimg" style="width:100%; height:auto;">
					<div style="width:50%; height:auto; float:left;">
						<% for (int i = 0; i < attachlist.size(); i++) {
	            			Attachment att = attachlist.get(i); 
	            			//System.out.println("타입 :" + att.getCno_div());
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
						<a class="btn btn-default" style="border-color:salmon; background:salmon; color:white; width:50%; height:auto; font-size:20px; margin-left:25%" id="wishList">위시리스트에 담기</a>
							<h2 id="pnoRe" hidden><%=pro.getpNo() %></h2>
							<h2 id="mnoRe" hidden><%=loginUser.getMno() %></h2>
					</div>
					<br><br><br><br><br><br><br><br><br><br>
					<hr style="border-color: black; width:100%;">
				</div>
				
					<table border="1"; align="center"; style="width:100%; height:auto; background:salmon; color:white; border-color:white;">
						<tr>
							<td align="center" style="width:25%; font-size:20px;" onclick="fnMove('1')">업체정보</td>
							<td align="center" style="width:25%; font-size:20px;" onclick="fnMove('2')">상품정보</td>						
							<td align="center" style="width:25%; font-size:20px;" onclick="fnMove('3')">후기</td>
							<td align="center" style="width:25%; font-size:20px;" onclick="location.href='<%=request.getContextPath()%>/selectDetailComQna.cq?cno=<%= cno %>'">문의</td>				
						</tr>
					</table>
					<div style="width:100%; height:auto;">
						<div id="div1" style=" width:50%; height:auto; float:left">
						<p style="font-size:30px;"><%=mem.getMemberName() %></p>
						<% 
						String address = com.getComAddress();
						String[] addressArr = address.split("\\|");
						if (addressArr.length > 2){
							companyAddress = addressArr[1] + addressArr[2];
						}else {
							companyAddress = addressArr[1];
						}
						%>
						<p style="font-size:23px;">주소 : <%=companyAddress %></p>
						<p style="font-size:23px;">영업시간 : AM <%=com.getOpenTime() %> ~ PM <%=com.getEndTime() %></p>
						<p style="font-size:23px;">홈페이지 : <a href="<%=com.getComUrl() %>">바로가기</a></p>
						</div>
							<div id="map" style="width:50%; height:500px; float:right"></div>	
					</div>

					<hr style="align: center; border-color: black; width: 100%;">
					<div id="div2">
						<h1>상품정보</h1>
						<% for (int i = 0; i < attachlist.size(); i++) {
								Attachment att = attachlist.get(i); 
            					System.out.println("타입 :" + att.getCno_div());
            					String cnodiv = (String)att.getCno_div();
            					if(cnodiv != null && cnodiv.equals("서브")){%>
            					<table border:"1" style="width:100%; height:auto;">
            					<tr>
            					<%if(i % 2 == 0) {%>
            					<td class="imgArea" style="width:50%;">
            						<img src="/redding/company_upload/<%=att.getChangename() %>" id="timg" class="imgContent">
            						</td>
            						<td style="width:50%; font-size:20px;"><%=pro.getpContent() %></td>
            					<%}else{ %>
            						<hr style="align: center; border-color: black; width: 100%;">
									<td style="width:50%; font-size:20px;"><%=pro.getpContent() %></td>
									<td class="imgArea" style="width:50%;">
            						<img src="/redding/company_upload/<%=att.getChangename() %>" id="timg" class="imgContent">
            						</td>
									</tr>
									<% } %>
									<% } %>							
						</table>
						<% } %>	
					</div>
					
					<hr style="align: center; border-color: black; width: 100%;">
					<a href="#" class="top" style="position:fixed; left:90%; bottom: 50px; display:none; font-size:30px;">Top</a>
					<div id="div3">
						<h1>후기</h1>
						<p style="font-size: 30px; text-align: center;">
							<br>★총 평점 3.98
						</p>
					</div>
					<div id="detailsixth">
						<br>
						<div id="detail11" style="width:10%; float:left">
							<i class="fas fa-user-circle" style="font-size: 100px;"></i>
						</div>
						<div id="detail12" style="width:90%; float:left">
							<p style="font-size: 20px;">
								닉네임<br> 2월 결혼 / 업체명<br> ★ 3.5
							</p>
						</div>
					</div>
					<div id="detailseventh">
						<p>못할 있는 바이며, 무엇을 희망의 청춘은 것이다. 앞이 청춘 꾸며 뛰노는 동산에는 내려온 인간의 있으랴?
							긴지라 방황하였으며, 타오르고 가는 길지 할지니, 현저하게 힘차게 풀이 봄바람이다. 없으면, 인도하겠다는 별과
							같으며, 인생의 사라지지 교향악이다. 얼음 인생을 산야에 사는가 스며들어 그리하였는가? 무엇이 발휘하기 가지에 그들은
							있는 되려니와, 것이다. 인생에 얼음이 같이 그러므로 크고 꽃이 것이다. 위하여서 돋고, 얼마나 찾아 피는
							부패뿐이다. 주며, 안고, 꾸며 위하여서 사막이다. 청춘에서만 피가 하여도 유소년에게서 천지는 하는 이는 뜨고,
							부패뿐이다.</p>
					</div>
					<hr style="align: center; border-color: black; width: 100%;">
					
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
		<script>
		
			<%-- $(function(){
				
				
				viewCall(<%=cno%>);
							
			});
			
			function viewCall(cno){
				
				$.ajax({
					url:'<%=request.getContextPath()%>/selectDetailComQna.cq',
					type:"post",
					data:{cno:cno},
					success:function(data){
						console.log(data);
					},
					error:function(data){
						console.log(data);
					}
					
				});
			} --%>
		
			$(window).scroll(function(){
				if($(this).scrollTop() > 200){
					$('.top').fadeIn();
				}else{
					$('.top').fadeOut();
				}
			});
			
			$('.top').click(function(){
				$('html, body').animate({scrollTop:0}, 400);
				return false;
			});
		</script>
		<script>
    		function fnMove(seq){
        	var offset = $("#div" + seq).offset();
        	$('html, body').animate({scrollTop : offset.top}, 400);
    		}
		</script>
		<script>
			$(".detail").click(function(){            
    		var myTr = $(this).next();
    		if(myTr.is(":visible")){
       		myTr.slideUp();
    		}else{
       		myTr.slideDown();
       		$(this).css({"border-bottom":"none"});
       		myTr.css({"border-top":"none"});
    		}
 			}).mouseenter(function(){
    			$(this).css({"background":"MistyRose"});
 			}).mouseout(function(){
    			$(this).css({"background":"white"});
 			});
		</script>
		<script type="text/javascript"
						src="//dapi.kakao.com/v2/maps/sdk.js?appkey=48f994d86c014b047dc33cccd8b9996f&libraries=services"></script>
					<script>
                  var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                      mapOption = {
                          center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                          level: 1 // 지도의 확대 레벨
                      };  
                  
                  // 지도를 생성합니다
                  var map = new daum.maps.Map(mapContainer, mapOption); 
                  
                  // 주소-좌표 변환 객체를 생성합니다
                  var geocoder = new daum.maps.services.Geocoder();
                  
                    <% 
					/* String address = (String)company.get("comAddress");
					String[] addressArr = address.split("\\|"); */
					companyAddress = addressArr[1];
					%>
                  
					var address = "<%=companyAddress%>";

                  geocoder.addressSearch(address, function(result, status) {
                  
                      // 정상적으로 검색이 완료됐으면 
                       if (status === daum.maps.services.Status.OK) {
                  
                          var coords = new daum.maps.LatLng(result[0].y, result[0].x);
                  
                          // 결과값으로 받은 위치를 마커로 표시합니다
                          var marker = new daum.maps.Marker({
                              map: map,
                              position: coords
                          });
                  
                          // 인포윈도우로 장소에 대한 설명을 표시합니다
                          var infowindow = new daum.maps.InfoWindow({
                              content: '<div style="width:150px;text-align:center;padding:6px 0;"><%=mem.getMemberName() %></div>'
                          });
                          infowindow.open(map, marker);
                  
                          // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                          map.setCenter(coords);
                      } 
                  });    
         </script>
         
         
         	<!-- 예약하기(정연) -->
         <script>
         	$("#wishList").click(function(){
         		var pno = $("#pnoRe").text();
         		var mno = $("#mnoRe").text();
         		
         		$.ajax({
        			url : "/redding/insert.wi",
          			data : {pno:pno, mno:mno},
          			type : "post",
          			success : function(data){
          				if(data>0){
          					alert("위시리스트 담기 성공!");
          				}else{
          					alert("이미 위시리스트에 담겨있습니다!");
          				}
          				
          			},error:function(){
          				console.log("위시리스트 담기 실패!");
          			}
          			
          			

         		});
         		<%-- location.href="<%=request.getContextPath()%>/insert.wi?pno="+pno; --%>
         	});
         
         </script>
         
</body>
</html>