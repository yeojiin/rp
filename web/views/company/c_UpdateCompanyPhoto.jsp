<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"  import = "java.util.* , com.kh.redding.attachment.model.vo.* , com.kh.redding.member.model.vo.*"%>
<% 
	ArrayList<Attachment> list = (ArrayList<Attachment>) request.getAttribute("list");
	Member loginUser = (Member) session.getAttribute("loginUser");

%>
<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Sunflower:300"
	rel="stylesheet">
<!-- 글꼴 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common/footer.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/company/c_nav.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/company/c_CompanyUpdate.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>

/* Set height of the grid so .sidenav can be 100% (adjust as needed) */
.row.content {
	height: 600px;
}

/* Set gray background color and 100% height */
.sidenav1 {
	padding-top: 20px;
	height: 100%;
	text-align: left;
	font-size: 17px;
}

.sidenav1 a {
	text-decoration: none;
	color: black;
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

	<!-- 업체 나브 -->
	<div>
		<jsp:include page="/views/company/c_nav.jsp"></jsp:include>
	</div>

	<div class="container-fluid text-center">
		<div class="row content">

			<div class="col-sm-2 sidenav1">
				<ul>
					<li><a
						href="<%=request.getContextPath()%>/selectPhoto.co">업체
							사진 올리기</a></li>
					<li><a href="<%=request.getContextPath()%>/selectcom.me">업체 정보 수정 </a></li>
				</ul>
			</div>
			<div class="col-sm-8 text-left">
				<%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>
				<% if (list.size() == 0){ %>
					<form action = "<%=request.getContextPath() %>/insertPhoto.co" method = "post"  encType= "multipart/form-data" id = "insertPhoto">
				<% }else { %>
					<form action = "<%=request.getContextPath() %>/UpdatePhoto.co" method = "post"  encType= "multipart/form-data" id = "UpdatePhoto">
					<input type = "hidden" value = "<%=list.get(0).getMno()%>" name = "mno" id = "mno">
				<% } %>	
					<h2>대표사진</h2>
					<h3 style = "color:red; text-align : center;">반드시 이미지 등록을 해주세요</h3>
					<div id = "titlePicture">
						<img src = "/redding/images/redding.png" alt = "대표사진" id = "titleimg">
						<input type = "hidden" name = "Aid" id = "Atitleid">
						<input type = "hidden" name = "ChangeName" id = "Atitlechangename">
					</div>
					<hr>
					<h2>서브사진</h2>
					<h4 style = "color:red; text-align : center;">이미지를 순차적으로 등록을 해주세요</h4>
					<div id = "subPicture">
						<table id="imgTable">
					  		<tbody>
					  			<tr>
					  				<td>
					  					<div class = "imgArea" id = "subimg">
					  						<img  src = "/redding/images/redding.png"   id = "subimg1" name = "subimg1"  class = "subimg">
					  						<input type = "hidden" name = "Aid1" id = "subAid1">
											<input type = "hidden" name = "ChangeName1" id = "subChangeName1">
					  					</div>
					  				</td> 
					  				<td>
					  					<div class = "imgArea" id = "subimg">
					  						<img src = "/redding/images/redding.png"  id = "subimg2" name = "subimg2" class = "subimg">
					  						<input type = "hidden" name = "Aid2" id = "subAid2">
											<input type = "hidden" name = "ChangeName2" id = "subChangeName2">
					  					</div>
					  				</td> 
					  			</tr>
					  			<tr>
					  				<td>
					  					<div class = "imgArea" id = "subimg">
						  					<img src = "/redding/images/redding.png"  id = "subimg3" name = "subimg3"  class = "subimg">
						  					<input type = "hidden" name = "Aid3" id = "subAid3">
											<input type = "hidden" name = "ChangeName3" id = "subChangeName3">
					  					</div>
					  				</td> 
					  				<td>
					  					<div class = "imgArea" id = "subimg">
						  						<img src = "/redding/images/redding.png"  id = "subimg4" name = "subimg4" class = "subimg">
						  						<input type = "hidden" name = "Aid4" id = "subAid4">
											<input type = "hidden" name = "ChangeName4" id = "subChangeName4">
					  					
					  					</div>
					  				</td> 
					  			</tr>
					  			<tr>
					  				<td>
					  					<div class = "imgArea" id = "subimg">
						  						<img src = "/redding/images/redding.png"  id = "subimg5" name = "subimg5"  class = "subimg">
						  						<input type = "hidden" name = "Aid5" id = "subAid5">
												<input type = "hidden" name = "ChangeName5" id = "subChangeName5">
					  					</div>
					  				</td> 
					  				<td>
					  					<div class = "imgArea" id = "subimg">
						  						<img src = "/redding/images/redding.png"  id = "subimg6" name = "subimg6" class = "subimg">
						  						<input type = "hidden" name = "Aid6" id = "subAid6">
												<input type = "hidden" name = "ChangeName6" id = "subChangeName6">
					  					</div>
					  				</td> 
					  			</tr>
					  			<tr>
					  				<td>
					  					<div class = "imgArea" id = "subimg">
						  						<img src = "/redding/images/redding.png"  id = "subimg7" name = "subimg7"  class = "subimg">
						  						<input type = "hidden" name = "Aid7" id = "subAid7">
												<input type = "hidden" name = "ChangeName7" id = "subChangeName7">
					  					</div>
					  				</td> 
					  				<td>
					  					<div class = "imgArea" id = "subimg">
						  						<img src = "/redding/images/redding.png"  id = "subimg8" name = "subimg8" class = "subimg">
						  						<input type = "hidden" name = "Aid8" id = "subAid8">
												<input type = "hidden" name = "ChangeName8" id = "subChangeName8">
					  					</div>
					  				</td> 
					  			</tr>
					  			<tr>
					  				<td>
					  					<div class = "imgArea" id = "subimg">
						  					<img src = "/redding/images/redding.png"  id = "subimg9" name = "subimg9"  class = "subimg">
						  					<input type = "hidden" name = "Aid9" id = "subAid9">
											<input type = "hidden" name = "ChangeName9" id = "subChangeName9">
					  					</div>
					  				</td> 
					  				<td>
					  					<div class = "imgArea" id = "subimg">
						  					<img src = "/redding/images/redding.png"  id = "subimg10" name = "subimg10" class = "subimg">
						  					<input type = "hidden" name = "Aid10" id = "subAid10">
											<input type = "hidden" name = "ChangeName10" id = "subChangeName10">
					  					</div>
					  				</td> 
					  			</tr>
					  			
					  		</tbody>
						</table>
					</div>
					<div id = "fileArea" align = "left">
					<input type = "file" id = "CompanyImg1" name = "CompanyImg1" onchange = "loadImg(this,1)">
					<input type = "file" id = "CompanyImg2" name = "CompanyImg2" onchange = "loadImg(this,2)">
					<input type = "file" id = "CompanyImg3" name = "CompanyImg3" onchange = "loadImg(this,3)">
					<input type = "file" id = "CompanyImg4" name = "CompanyImg4" onchange = "loadImg(this,4)">
					<input type = "file" id = "CompanyImg5" name = "CompanyImg5" onchange = "loadImg(this,5)">
					<input type = "file" id = "CompanyImg6" name = "CompanyImg6" onchange = "loadImg(this,6)">
					<input type = "file" id = "CompanyImg7" name = "CompanyImg7" onchange = "loadImg(this,7)">
					<input type = "file" id = "CompanyImg8" name = "CompanyImg8" onchange = "loadImg(this,8)">
					<input type = "file" id = "CompanyImg9" name = "CompanyImg9" onchange = "loadImg(this,9)">
					<input type = "file" id = "CompanyImg10" name = "CompanyImg10" onchange = "loadImg(this,10)">
					<input type = "file" id = "CompanyImg11" name = "CompanyImg11" onchange = "loadImg(this,11)">
					</div>
				</form>
			</div>

			<div class="col-sm-2 sidenav2">
				<div class="sideMenu2">
					<% if (list.size() == 0){ %>
					<button id="photoSubmit">등록하기</button>
					<% }else { %>
					<button id="photoUpdate">변경하기</button>
					<% } %>
				</div>
			</div>
		</div>
	</div>

	<!-- 커먼 풋터 -->
	<div class="footerArea">
		<jsp:include page="/views/common/footer.jsp"></jsp:include>
	</div>
	<script>
		$(function(){
			$("#fileArea").hide();
			
			$("#titlePicture").click(function(){
				$("#CompanyImg1").click();
			});
			
			$("#subimg1").click(function(){
				$("#CompanyImg2").click();
			});
			
			$("#subimg2").click(function(){
				$("#CompanyImg3").click();
			});
			
			$("#subimg3").click(function(){
				$("#CompanyImg4").click();
			});
			
			$("#subimg4").click(function(){
				$("#CompanyImg5").click();
			});
			
			$("#subimg5").click(function(){
				$("#CompanyImg6").click();
			});
			
			$("#subimg6").click(function(){
				$("#CompanyImg7").click();
			});
			
			$("#subimg7").click(function(){
				$("#CompanyImg8").click();
			});
			
			$("#subimg8").click(function(){
				$("#CompanyImg9").click();
			});
			
			$("#subimg9").click(function(){
				$("#CompanyImg10").click();
			});
			
			$("#subimg10").click(function(){
				$("#CompanyImg11").click();
			});
			
			$("#photoSubmit").click(function(){
				if ($("#titleimg").attr("src") == "/redding/images/redding.png"){
					alert("대표사진을 넣어주세요");
				}else{
					$("#insertPhoto").submit();
				}
			});
			

			
			/* $("#photoUpdate").click(function(){
				var check = confirm("변경하시면 기존의 이미지를 모두 삭제합니다.\n 그래도 계속 진행하시겠습니까?");
			
				if (check == true ){
					$("#UpdatePhoto").submit();
				}else {
					alert("사진 변경을 취소합니다.");
				}
			}); */
						
			<%if (list != null){ %>
				<%for (int i = 0 ; i < list.size() ; i++){ %>
					<%switch(i){
					case 0 :%>		
						<% System.out.println(i+":"+list.get(i)); %>
						$("#titleimg").attr("src", "<%=request.getContextPath()%>/company_upload/<%=list.get(0).getChangename()%>" )
						
					<% break;
					case 1 :%>	
						<% System.out.println(i+":"+list.get(i)); %>
						$("#subimg1").attr("src", "<%=request.getContextPath()%>/company_upload/<%=list.get(1).getChangename()%>" )
					<% break;
					case 2 :%>
						<% System.out.println(i+":"+list.get(i)); %>
						$("#subimg2").attr("src", "<%=request.getContextPath()%>/company_upload/<%=list.get(2).getChangename()%>" )
					<% break;
					case 3 :%>	
						$("#subimg3").attr("src", "<%=request.getContextPath()%>/company_upload/<%=list.get(i).getChangename()%>"  )
					<% break;
					case 4 :%>	
						$("#subimg4").attr("src", "<%=request.getContextPath()%>/company_upload/<%=list.get(i).getChangename()%>"   )
						$("#subAid4").val("<%=list.get(i).getAid()%>");
						$("#subChangeName4").val("<%=list.get(i).getChangename()%>");
					<% break;
					case 5 :%>	
						$("#subimg5").attr("src", "<%=request.getContextPath()%>/company_upload/<%=list.get(i).getChangename()%>"  )
					<% break;
					case 6 :%>	
						$("#subimg6").attr("src", "<%=request.getContextPath()%>/company_upload/<%=list.get(i).getChangename()%>"  )
					<% break;
					case 7 :%>	
						$("#subimg7").attr("src", "<%=request.getContextPath()%>/company_upload/<%=list.get(i).getChangename()%>"  )
					<% break;
					case 8 :%>	
						$("#subimg8").attr("src", "<%=request.getContextPath()%>/company_upload/<%=list.get(i).getChangename()%>"  )
					<% break;
					case 9 :%>
						$("#subimg9").attr("src", "<%=request.getContextPath()%>/company_upload/<%=list.get(i).getChangename()%>"  )
					<% break;
					case 10 :%>	
						$("#subimg10").attr("src", "<%=request.getContextPath()%>/company_upload/<%=list.get(i).getChangename()%>"  )
					<%break;
					}%>
				<%} %>
				
			<%}%>
			
	 });
		
		
		function loadImg(value, num) {
			if (value.files && value.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					switch (num) {
					case 1:
						$("#titleimg").attr("src", e.target.result);
						break;
					case 2 : 
						$("#subimg1").attr("src" , e.target.result);
						break;
					case 3 : 
						$("#subimg2").attr("src" , e.target.result);
						break;
					case 4 : 
						$("#subimg3").attr("src" , e.target.result);
						break;
					case 5 : 
						$("#subimg4").attr("src" , e.target.result);
						break;
					case 6 : 
						$("#subimg5").attr("src" , e.target.result);
						break;
					case 7 : 
						$("#subimg6").attr("src" , e.target.result);
						break;
					case 8 : 
						$("#subimg7").attr("src" , e.target.result);
						break;
					case 9 : 
						$("#subimg8").attr("src" , e.target.result);
						break;
					case 10 : 
						$("#subimg9").attr("src" , e.target.result);
						break;
					case 11 : 
						$("#subimg10").attr("src" , e.target.result);
						break;
					}
				}
				reader.readAsDataURL(value.files[0]);
			}
		}
	
		
	</script>

</body>
</html>