<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link href="https://fonts.googleapis.com/css?family=Sunflower:300" rel="stylesheet">
<!-- 글꼴 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common/footer.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/company/c_nav.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/company/c_CompanyUpdate.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>	
	
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
						href="<%=request.getContextPath()%>/views/company/c_UpdateCompanyPhoto.jsp">업체
							사진 올리기</a></li>
					<li><a
						href="<%=request.getContextPath()%>/views/company/c_UpdateCompanyInfor.jsp">업체
							정보 수정 </a></li>
				</ul>
			</div>
			<div class="col-sm-8 text-left">
				<%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>
				<div class="contentsArea">
					<div class="contentsArea con1">
						<form action = "" method = "post">
						<table>
							<tr>
								<td>
									<h2>비밀번호 변경</h2>
								</td>
							</tr>
							<tr>
								<td>
									<div class="form-group">
										<label for="inputsm">현재 비밀번호</label> 
										<input class="form-control input-sm" id="currentPassword" type="text">
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<div class="form-group">
										<label for="inputsm">변경할 비밀번호</label> <input
											class="form-control input-sm" id="passwordChange" type="text">
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<div class="form-group">
										<label for="inputsm">변경할 비밀번호 확인</label> 
										<input class="form-control input-sm" id="passwordChange2" type="text">
										<p id = "checkPwd"></p>
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<div class="form-group">
										<button id = "pwdbtn" onclick = "PasswordChange();">변경하기</button>
									</div> 
								</td>
							</tr>
						</table>
						</form>
						<hr>
						<form action = "" method = "post">
						<table class = "comTable">
							<tr>
								<td colspan = "2">
									<h3>회원정보 변경</h3>
								</td>
							</tr>
							<tr>
								<th>사업자 등록번호</th>
								<td><input type="text" id="reg_num" name="reg_num"
									maxlength="10">
									<button>확인</button></td>
							</tr>
							<tr>
								<th>아이디</th>
								<td><input type = "text" name = "userId" id = "userId"></td>
							</tr>
							<tr>
								<th>업체 종류</th>
								<td><input type="radio" name="company_type" id="studio"
									value="스튜디오" checked> <label for="studio">스튜디오</label>
									<input type="radio" name="company_type" id="dress" value="드레스">
									<label for="dress">드레스</label> <input type="radio"
									name="company_type" id="make" value="메이크업"> <label
									for="make">메이크업 & 헤어</label></td>
							</tr>
							<tr>
								<th>업체명</th>
								<td><input type="text" maxlength="30" name="name" id="name"></td>
								<td></td>
							</tr>
							<tr>
								<th>대표자 명</th>
								<td><input type="text" maxlength="30" name="rep_name"
									id="rep_name"></td>
								<td></td>
							</tr>
							<tr>
								<th>휴대전화</th>
								<td><input type="text" maxlength="3" name="phone1"
									id="phone1" size="5"> - <input type="text"
									maxlength="4" name="phone2" id="phone2" size="5"> - <input
									type="text" maxlength="4" name="phone3" id="phone3" size="5"></td>
							</tr>
							<tr>
								<th>주소</th>
								<td><input type="text" id="postcode" placeholder="우편번호"
									name="postcode"> <input type="button"
									onclick="execDaumPostcode()" value="우편번호 찾기"><br>
								</td>
							</tr>
							<tr>
								<td></td>
								<td><input type="text" id="address" placeholder="주소"
									name="address"><br></td>
							</tr>
							<tr>
								<td></td>
								<td><input type="text" id="detailAddress"
									placeholder="상세주소" name="detailAddress"> <input
									type="text" id="extraAddress" placeholder="참고항목"
									name="extraAddress"></td>
							</tr>
							<tr>
								<th>입금계좌</th>
								<td><select name="accountcode">
										<option>-- 은행선택 --</option>
										<option value="011">NH농협</option>
										<option value="020">우리은행</option>
										<option value="088">신한은행</option>
										<option value="004">국민은행</option>
										<option value="081">하나은행</option>
										<option value="005">외한은행</option>
										<option value="003">IBK기업은행</option>
										<option value="045">새마을은행</option>
										<option value="032">부산은행</option>
										<option value="039">경남은행</option>
										<option value="034">광주은행</option>
										<option value="037">전북은행</option>
										<option value="048">신협은행</option>
										<option value="023">SC제일은행</option>
										<option value="031">대구은행</option>
										<option value="035">제주은행</option>
										<option value="071">우체국은행</option>
										<option value="007">수협은행</option>
								</select></td>
							</tr>
							<tr>
								<td></td>
								<td><input type="text" name="account_num" id="account_num"
									placeholder="계좌번호(-없이 적어주세요)" style = "width: 350px"></td>
							</tr>
							<tr>
								<td></td>
								<td><input type="text" name="account_name"
									id="account_name" placeholder="예금주"></td>
							</tr>
							<tr>
								<th>이메일</th>
								<td><input type="email" name="email" id="email">
									<button>인증하기</button> <input id="email_check"
									name="email_check" type="hidden" value="인증안됨"></td>
							</tr>
							<tr>
								<th>홈페이지</th>
								<td><input type="url" name="homepage" id="homepage"
									placeholder="http://"></td>
							</tr>
							<tr>
								<th>영업시간</th>
								<td><input type="time" name="strartime" id="strartime">
									~ <input type="time" name="endtime" id="endtime"></td>
							</tr>
							<tr>
								<td>
									<div class="form-group">
										<button id = "combtn">변경하기</button>
									</div>
								</td>
							</tr>
						</table>
						</form>
					</div>


				</div>
				 <!-- Modal -->
				  <div class="modal fade" id="myModal" role="dialog">
				    <div class="modal-dialog">
				    
				      <!-- Modal content-->
				      <div class="modal-content">
				        <div class="modal-header">
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				          <h4 class="modal-title">Modal Header</h4>
				        </div>
				        <div class="modal-body">
				          <p>Some text in the modal.</p>
				        </div>
				        <div class="modal-footer">
				          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				        </div>
				      </div>
				      
				    </div>
				  </div>
								
				
			</div>


			<div class="col-sm-2 sidenav2"></div>
		</div>

	</div>

	<!-- 커먼 풋터 -->
	<div class="footerArea">
		<jsp:include page="/views/common/footer.jsp"></jsp:include>
	</div>

	<script>
		function execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								// 조합된 참고항목을 해당 필드에 넣는다.
								document.getElementById("extraAddress").value = extraAddr;

							} else {
								document.getElementById("extraAddress").value = '';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('postcode').value = data.zonecode;
							document.getElementById("address").value = addr;
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("detailAddress").focus();
						}
					}).open();

		}
		
		function PasswordChange(){
			
		}

		$(function() {
			
			
			$("#pwdbtn").click(function(){
				
			});
		});
	</script>

</body>
</html>