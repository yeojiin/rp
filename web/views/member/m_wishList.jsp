<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.kh.redding.member.model.vo.Member"%>
<%
	ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>) request.getAttribute("list");
	Member loginUser = (Member) session.getAttribute("loginUser");
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
	href="${pageContext.request.contextPath}/css/common/footer.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/member/m_myPage.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/member/m_wishList.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/semantic/semantic.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
</head>
<body>

	<!-- 멤버 헤더 (미니메뉴, 로고) -->
	<div class="headerArea">
		<jsp:include page="/views/member/m_header.jsp"></jsp:include>
	</div>
	<br>

	<!-- 섹션 -->
	<div class="container-fluid text-center">
		<div class="row content">

			<!-- 왼쪽 빈공간 -->
			<div class="col-sm-2 sidenav"></div>

			<div class="col-sm-8 text-left">
				<%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>

				<div class="wishListArea">
					<h1 style="text-align: center; color: salmon;">Wish List</h1>
					<div class="wishList">
						<table id="wishListTable">
							<tr>
								<th>업체명</th>
								<th></th>
								<th>제품명</th>
								<th>상품금액</th>
								<th></th>
							</tr>
							<%
								/* 해쉬맵으로 받은 객체 꺼내주기*/ 
								for (int i = 0; i < list.size(); i++) {
									HashMap<String, Object> hmap = list.get(i);
							%>
							<tr>
								<td class="cName"><%=hmap.get("mname")%></td>
								<td class="imagetd"><img id="image" style=" max-width:100%" src="<%= request.getContextPath() %>/company_upload/<%=hmap.get("changename").toString()%>">
								</td>
								<td class="pName"><%=hmap.get("pname")%></td>
								<td class="price"><%=hmap.get("price")%></td>
								<td><input name="check" type="checkbox" id="checkbox" class="checkbox"></td>
								<td class="pno"><%=hmap.get("pno")%></td>
								<td class="cType"><%=hmap.get("ctype")%></td>
								<td class="wishCode"><%=hmap.get("wishcode")%></td>
							</tr>
							<%
								}
							%>
						</table>
					</div>
					<br>
					<div class="button">
						<button class="ui gray button" id="package">패키지에 담기</button>
						<button class="ui gray button" id="delete">삭제</button>
						<form action="<%=request.getContextPath()%>/delete.wi" method="post" id="deleteWishForm">
						<input type="hidden" name="deleteList" id="deleteList">
						<input type="hidden" name="deleteListMno">
						</form>
					</div>

				</div>
				<br>
				<br>
				<div class="pResult">
					<div class = "wishpackage">
					<h2>패키지 구성</h2>
					<div class="pack">
					<div class="packageArea" id="packageArea" style="display:inline-block">
						<div class="firstStudio" style="display:inline-block;">
							<img id="simg1" src="" style="max-width:100%; height:200px;">
						</div>
						<div class="packImg" style="display:inline-block">
							<img src="<%=request.getContextPath()%>/images/plus.png">
							<p></p>
						</div>
						<div class="firstDress" style="display:inline-block;">
							<img id="dimg1" src="" style="max-width:100%; height:200px;">
							<p></p>
						</div>
						<div class="packImg" style="display:inline-block">
							<img src="<%=request.getContextPath()%>/images/plus.png">
							<p></p>
						</div>
						<div class="firstMakeup" style="display:inline-block;">
							<img id="mimg1" src="" style="max-width:100%; height:200px;">
							<p></p>
						</div>
					</div>
					<div class="packageArea2" id="packageArea2" style="display:inline-block">
						<div class="secondStudio" style="display:inline-block">
						</div>
						<div class="packImg" style="display:inline-block">
						</div>
						<div class="secondDress" style="display:inline-block">
						</div>
						<div class="packImg" style="display:inline-block">
						</div>
						<div class="secondMakeup" style="display:inline-block">
						</div>
						<div class="packImg" style="display:inline-block">
					</div>
				</div>
				</div>
				<div class= "priceWrap">
					<div class="totalPrice" style="float:left">
						<img  src="<%=request.getContextPath()%>/images/equal.png">
					</div>
					<h2 id = "price"></h2>
				</div>
				</div>
				
				</div>
				<br><br><br><br>
					
					<div class="button">
						<button class="ui pink button" style="background: salmon;" id="reserve">예약하기</button>
						<button class="ui pink button" style="background: salmon;" onclick="location.href='views/member/m_pay.jsp'">결제하기</button>
					</div>

				</div>

			</div>


			<!-- 오른쪽 빈공간 -->
			<div class="col-sm-2 sidenav"></div>

			<script>
				$('#delete').click(function() {
					var deleteList = "";

					$("input[name=check]:checked").each(function() {
						if(deleteList == "") {
							deleteList = $(this).closest('td').siblings('.pno').text();
						} else {
							deleteList = deleteList + "," + $(this).closest('td').siblings('.pno').text();
						}
					});
					console.log(deleteList);
					$("#deleteList").val(deleteList);
					
					$("#deleteWishForm").submit();
				});
				
				
				//예약하기
				$('#reserve').click(function(){
					var reserveList = "";
					var page = "";
					
					$("input[name=check]:checked").each(function(){
						if(reserveList == ""){
							reserveList = $(this).closest('td').siblings('.pno').text();
						}else{
							reserveList = reserveList + "," + $(this).closest('td').siblings('.pno').text();
						}
					});
					
					if(reserveList != "") {
						location.href="<%=request.getContextPath()%>/wishList.re?reserveList="+reserveList; 
						}else {
							alert("선택하신 상품이 없습니다.");
						}
					
				});
				
		
				
				//패키지 구성에 담기
				 $("#package").click(function(){
					 var packList = [];
					 var ctn=0;
					 var mno = <%=loginUser.getMno()%>;
					 
					$("input[name=check]:checked").each(function(){
					var pno = $(this).closest("td").siblings('.wishCode').text();
					
						if($(this).prop("checked") == true){
							/* packList[ctn] = pno;
							ctn++; */
							packList.push(pno);
						}
					});
					
					if(packList != ""){
						//$.ajaxSettings.traditional = true;
						$.ajax({
		          			url : "/redding/insertPack.wi",
		          			traditional:true,
		          			data : {packList:packList},
		          			type : "post",
		          			success : function(data){
		          				//console.log(data);
		          				if(data>0){
								alert("패키지 담기에 성공했습니다!");
								
								
								$.ajax({
		      						url : "/redding/showPack.wi",
				          			data : {mno:mno},
				          			type : "post",
				          			success : function(data){
				          				$firstStudio = $(".firstStudio"); 
				          				$firstDress = $(".firstDress");
				          				$firstMakeup = $(".firstMakeup");
				          				$secondStudio = $(".secondStudio");
				          				$secondDress = $(".secondDress");
				          				$secondMakeup = $(".secondMakeup");
				          				$totalPrice = $(".priceWrap");
				          				var sctn = 0;
				          				var dctn = 0;
				          				var mctn = 0;
				          				var totalPrice = 0;
				          				
				          				$firstStudio.empty();
				          				$firstDress.empty();
				          				$firstMakeup.empty();
				          				$secondStudio.empty();
				          				$secondDress.empty();
				          				$secondMakeup.empty();
				          				$totalPrice.empty();
				          				
				          				for(var i in data){
					          				var cname = data[i].cname;
					          				var pname = data[i].pname;
					          				var price = data[i].price;
					          				var ctype = data[i].comType;
					          				var pno = data[i].pno;
					          				var changename = data[i].changename;
					          				
					        				
					          				if(ctype == "스튜디오" && sctn==0){
					          					$firstStudio.append("<p class=" + pno + ">" + cname + "<br>" + pname + "<br>" + price + "<br>" + pno+"</p>"+"<br>")
					          					sctn++;
					          				}else if(ctype == "드레스" && dctn==0 ){
				    	      					$firstDress.append("<p class=" + pno + ">" + cname + "<br>" + pname + "<br>" + price + "<br>" + pno+"</p>"+"<br>")
				        	  					dctn++;
				        	  				}else if(ctype == "메이크업" && mctn==0){
				          						$firstMakeup.append("<p class=" + pno + ">" + cname + "<br>" + pname + "<br>" + price + "<br>" + pno+"</p>"+"<br>")
				          						mctn++;
				          					}else if(ctype == "스튜디오"){
				          						$secondStudio.append("<p class=" + pno + ">" + cname + "<br>" + pname + "<br>" + price + "<br>" + pno+"</p>"+"<br>")
				          					}else if(ctype == "드레스") {
				          						$secondDress.append("<p class=" + pno + ">" + cname + "<br>" + pname + "<br>" + price + "<br>" + pno+"</p>"+"<br>")
				          					}else if(ctype == "메이크업"){
				          						$secondMakeup.append("<p class=" + pno + ">" + cname + "<br>" + pname + "<br>" + price + "<br>" + pno+"</p>"+"<br>")
				          					}
					          				
						          			$totalPrice += price; 
				          				}
					          				
					          				$("#price").html(totalPrice);
					          				
					          			}
					          			
		      					});
								
		          				}else{
		          				alert("이미 패키지 담겨 있습니다!");	
		          				}        
		          			}, 
		          			error : function(){
		          				console.log("패키지 넣기 실패!!");
		          			}
		          		});
					}else{
						alert("선택한 상품이 없습니다!");
					}
				}); 
				
				
				
				//패키지 구성 불러오기
				$(document).ready(function(){
					var mno = <%=loginUser.getMno()%>;
					
					$.ajax({
		          			url : "/redding/showPack.wi",
		          			data : {mno:mno},
		          			type : "post",
		          			success : function(data){
		          				//console.log(data);
		          				
		          				$firstStudio = $(".firstStudio"); 
		          				$firstDress = $(".firstDress");
		          				$firstMakeup = $(".firstMakeup");
		          				$secondStudio = $(".secondStudio");
		          				$secondDress = $(".secondDress");
		          				$secondMakeup = $(".secondMakeup");
		          				$totalPrice = $(".priceWrap");
		          				var sctn = 0;
		          				var dctn = 0;
		          				var mctn = 0;
		          				var totalPrice = 0;
		          				
		          				for(var i in data){
		          				var cname = data[i].cname;
		          				var pname = data[i].pname;
		          				var price = data[i].price;
		          				var ctype = data[i].comType;
		          				var pno = data[i].pno;
		          				var changename = data[i].changename;
		          				var src = "<%= request.getContextPath() %>/company_upload/" + changename;
		        				
		          				//console.log(changename);
		        				
		          				
		        				
		          				if(ctype == "스튜디오" && sctn==0){
		          					$("#simg1").attr("src", src);
		          					$firstStudio.append("<p class=" + pno + ">" + cname + "<br>" + pname + "<br>" + price + "<br>" + pno+"</p>"+"<br>")
		          					sctn++;
		          				}else if(ctype == "드레스" && dctn==0 ){
		          					$("#dimg1").attr("src", src);
	    	      					$firstDress.append("<p class=" + pno + ">" + cname + "<br>" + pname + "<br>" + price + "<br>" + pno+"</p>"+"<br>")
	        	  					dctn++;
	        	  				}else if(ctype == "메이크업" && mctn==0){
	        	  					$("#mimg1").attr("src", src);
	          						$firstMakeup.append("<p class=" + pno + ">" + cname + "<br>" + pname + "<br>" + price + "<br>" + pno+"</p>"+"<br>")
	          						mctn++;
	          					}else if(ctype == "스튜디오"){
	          						$secondStudio.append("<p class=" + pno + ">" + cname + "<br>" + pname + "<br>" + price + "<br>" + pno+"</p>"+"<br>")
	          					}else if(ctype == "드레스") {
	          						$secondDress.append("<p class=" + pno + ">" + cname + "<br>" + pname + "<br>" + price + "<br>" + pno+"</p>"+"<br>")
	          					}else if(ctype == "메이크업"){
	          						$secondMakeup.append("<p class=" + pno + ">" + cname + "<br>" + pname + "<br>" + price + "<br>" + pno+"</p>"+"<br>")
	          					}
		          				
			          				totalPrice += price;
			          				
			          				//체크박스 
			          				/* var wishcode = data[i].wishCode;
			          				console.log($(".wishCode").text());
			          				if($(".wishCode").text() == wishcode){
			          					$(this).closest('td').siblings('.checkbox').attr("checked", true);
			          				//console.log($(".checkbox").attr("checked", true));
			          				} */
		          				}
		          				
		          				$("#price").html(totalPrice);
		          				
		          			}, 
		          			error : function(){
		          				console.log("패키지 불러오기 실패!!");
		          			}
		          		});
				});
					
				

				//패키지 삭제 메소드
				$(document).on('click','p',function(){
					var pno = $(this).prop("class");			
					var mno = <%=loginUser.getMno()%>;
					
					var result = confirm('패키지에서 삭제 하시겠습니까?'); 
					
					if(result){
						$.ajax({
							url : "/redding/deletePack.wi",
			      			traditional:true,
			      			data : {pno:pno, mno:mno},
			      			type : "post",
			      			success : function(data){
			      			//console.log(data);
			      				
			      				if(data>0){	
			      					alert("패키지 삭제에 성공했습니다!");
			      					
			      					$.ajax({
			      						url : "/redding/showPack.wi",
					          			data : {mno:mno},
					          			type : "post",
					          			success : function(data){
					          				$firstStudio = $(".firstStudio"); 
					          				$firstDress = $(".firstDress");
					          				$firstMakeup = $(".firstMakeup");
					          				$secondStudio = $(".secondStudio");
					          				$secondDress = $(".secondDress");
					          				$secondMakeup = $(".secondMakeup");
					          				$totalPrice = $(".priceWrap");
					          				var sctn = 0;
					          				var dctn = 0;
					          				var mctn = 0;
					          				var totalPrice = 0;
					          				
					          				$firstStudio.empty();
					          				$firstDress.empty();
					          				$firstMakeup.empty();
					          				$secondStudio.empty();
					          				$secondDress.empty();
					          				$secondMakeup.empty();
					          				$totalPrice.empty();
					          				
					          				for(var i in data){
						          				var cname = data[i].cname;
						          				var pname = data[i].pname;
						          				var price = data[i].price;
						          				var ctype = data[i].comType;
						          				var pno = data[i].pno;
						          				var changename = data[i].changename;
						          				
						          				
						        				
						          				if(ctype == "스튜디오" && sctn==0){
						          					$firstStudio.append("<p class=" + pno + ">" + cname + "<br>" + pname + "<br>" + price + "<br>" + pno+"</p>"+"<br>")
						  
						          					sctn++;
						          				}else if(ctype == "드레스" && dctn==0 ){
					    	      					$firstDress.append("<p class=" + pno + ">" + cname + "<br>" + pname + "<br>" + price + "<br>" + pno+"</p>"+"<br>")
					        	  					dctn++;
					        	  				}else if(ctype == "메이크업" && mctn==0){
					          						$firstMakeup.append("<p class=" + pno + ">" + cname + "<br>" + pname + "<br>" + price + "<br>" + pno+"</p>"+"<br>")
					          						mctn++;
					          					}else if(ctype == "스튜디오"){
					          						$secondStudio.append("<p class=" + pno + ">" + cname + "<br>" + pname + "<br>" + price + "<br>" + pno+"</p>"+"<br>")
					          					}else if(ctype == "드레스") {
					          						$secondDress.append("<p class=" + pno + ">" + cname + "<br>" + pname + "<br>" + price + "<br>" + pno+"</p>"+"<br>")
					          					}else if(ctype == "메이크업"){
					          						$secondMakeup.append("<p class=" + pno + ">" + cname + "<br>" + pname + "<br>" + price + "<br>" + pno+"</p>"+"<br>")
					          					}
						          				
							          			$totalPrice += price; 
					          				}
						          				
						          				$("#price").html(totalPrice);
						          				
						          			},error : function(){
						          				console.log("패키지 불러오기 실패!!");
						          			}
			      					});
					          	}
			      			
			      			},error : function(){
		          				console.log("패키지 불러오기 실패!!");
		          			}
						});
						
						
					}else{
						alert("패키지 삭제에 실패했습니다!");
					}
				});
					  
				
				
			</script>
		</div>

	</div>
	<br>

	<!-- 커먼 풋터 -->
	<div class="footerArea">
		<jsp:include page="/views/common/footer.jsp"></jsp:include>
	</div>


</body>
</html>