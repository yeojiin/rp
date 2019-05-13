<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	href="${pageContext.request.contextPath}/css/company/c_main.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common/layout.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/admin/a_event.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common/footer.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/semantic/semantic.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/semantic/modal.min.css">
<script src="<%=request.getContextPath()%>/js/modal.min.js"></script>
<script src="<%=request.getContextPath()%>/js/semantic.min.js"></script>
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
						<div class="esidenavArea">
						<h2>COUPON</h2>
						<button class="ui button createBtn">추가</button>	
						</div>
					</div>
				</div>
				
				
				<!-- 여기는 스마트폰 -->
				<div class="visible-xs sideListnav2">
					<div class="col-sm-2 sidenav1">
					</div>
						<h2>COUPON</h2>
						<button class="ui button createBtn">추가</button>
					<br><br>
				</div>
				
			
			
			<div class="col-sm-8 text-left">
			<%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>
				<div class="CouponArea">
					<h1 align="center">COUPON</h1>
					<div class="ui action input inputArea">
 						 <input type="text" placeholder="Search...">
  						 <button class="ui icon button">
   						 <i class="search icon"></i>
  						 </button>
  						&nbsp;&nbsp;
  						<button class="ui button">수정</button>
  						&nbsp;&nbsp;
  						<button class="ui button">삭제</button>
					</div>
				</div>
				<br><br><br>
			  <div class="CouponDetailArea">
			  	<table border="1">
			  		<tr>
			  			<td>
  							<img src="<%=request.getContextPath()%>/images/dressTest.jpg">
  						</td>
  						<td>
  							<img src="<%=request.getContextPath()%>/images/dressTest.jpg">
  						</td>
  						<td>
  							<img src="<%=request.getContextPath()%>/images/dressTest.jpg">
  						</td>
			  		</tr>
			  		<tr class="contentArea1">
			  			<td>너의 이름은?<input type="checkbox"></td>
			  			<td>너의 이름은?<input type="checkbox"></td>
			  			<td>너의 이름은?<input type="checkbox"></td>
			  		</tr>
			  		<tr class="contentArea2">
			  			<td>너의 이름은?<br>너의 이름은?</td>
			  			<td>너의 이름은?<br>너의 이름은?</td>
			  			<td>너의 이름은?<br>너의 이름은?</td>
			  		</tr>
			  	</table>
			  	<br><br>
			  	
			  	<div class="cselectBtnArea" align="center">
					<label><</label> &nbsp;
					<label>1</label> &nbsp;
					<label>2</label> &nbsp;
					<label>3</label> &nbsp;
					<label>4</label> &nbsp;
					<label>></label>
				</div> 
			  </div>
					
				
			</div>
		</div>
		</div>
		<br><br><br><br>
	<!-- 커먼 풋터 -->
	<div class="footerArea">
		<jsp:include page="/views/common/footer.jsp"></jsp:include>
	</div>
	
	<!-- 쿠폰 등록 모달 -->

	<div class="ui modal">
  		
 	<div class="header">
                  쿠폰 등록
     	<i class="close icon"></i>
  	</div>
  	<div class="modalContent">
  		<div class="image content">
  			<img src="<%=request.getContextPath()%>/images/dressTest.jpg" style="width:40%;">
  			<label style="width:50%; height:30px; float:right; margin-top:2%; margin-right:5%">쿠폰이름</label>
  			<input type="text" style="width:50%; height:30px; float:right; margin-right:5%; margin-top:-22.5%" class="form-control" placeholder="회원 쿠폰 제목 입력">
  			<label style="width:50%; height:20px; float:right; margin-top:-17%; margin-right:5%">시작시간</label>
  			<input type="date" style="width:50%; height:30px; float:right; margin-top:-15%; margin-right:5%" class="form-control">
  			<label style="width:50%; height:30px; float:right; margin-top:-9.5%; margin-right:5%">종료시간</label>
  			<input type="date" style="width:50%; height:30px; float:right; margin-top:-7.5%; margin-right:5%" class="form-control">
  			<label style="width:100%; height:30px; float:left; margin-top:2%; margin-right:5%">쿠폰내용</label>
  			<textarea style="width:100%; float:right; margin-top:-1%; resize:none;" cols="70" rows="7" class="form-control visible-xs"> </textarea>
  			<textarea style="width:100%; float:right; margin-top:-1%; resize:none;" cols="70" rows="5" class="form-control hidden-xs"> </textarea>
  			<label style="width:100%; height:30px; float:left; margin-top:2%; margin-right:5%">사용조건</label>
  			<textarea style="width:100%; float:right; margin-top:-1%; resize:none;" cols="70" rows="7" class="form-control visible-xs"></textarea>
  			<textarea style="width:100%; float:right; margin-top:-1%; resize:none;" cols="70" rows="5" class="form-control hidden-xs"></textarea>	
  		</div>  
  	</div>

  	<div class="actions">
  	<div style="width:100%; height:10px; float:left"></div>
  	<div class="visible-xs" style="width:100%; height:40px; float:left"></div>
    	<div class="ui button">등록 취소</div>
    	<div class="ui button">등록</div>
  	</div>


</div>	
	
	

<script>
$(function(){
	$(".createBtn").click(function(){
		console.log("e");
		$('.ui.modal').modal('show');
	});
	
});
</script>
</body>
</html>