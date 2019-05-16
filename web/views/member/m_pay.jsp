<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR"
	rel="stylesheet"><!-- 글꼴 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/member/m_header.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/member/m_nav.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common/footer.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/member/m_pay.css">
</head>
<body>
	<!-- 멤버 헤더 (미니메뉴, 로고) -->
	<div class="headerArea">
		<%@ include file="/views/member/m_header.jsp"%>
		<%-- <jsp:include page="/views/member/m_header.jsp"></jsp:include> --%>
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
				<section>
               <div>
                  <br>
                  <h2 align="center" style="color: salmon">OREDR</h2>
               </div>

               <div class="payArea">
                  <br>
                  <table align="center" width="600px">
                     <tr style="background: lightgray;">
                        <th width="300"><input type="checkbox" checked disabled>
                        </th>
                        <th width="300"><label>상품명</label></th>
                        <th width="300"><label>날짜</label></th>
                        <th width="300"><label>금액</label></th>
                     </tr>
                     <tr height="80">
                        <td><input type="checkbox"></td>
                        <td>1</td>
                        <td>1</td>
                        <td>1</td>
                     </tr>
                     <tr height="80">
                        <td><input type="checkbox"></td>
                        <td>1</td>
                        <td>1</td>
                        <td>1</td>
                     </tr>
                  </table>
                  <br>
                  <div class="deletebtn">
                     <button style="float: right">선택삭제</button>
                     </td>
                  </div>
                  <br> <br>

                  <div class="payUserArea">
                     <h4>주문자 정보</h4>
                     <span> <label>김수민</label> &nbsp;
                        <button>수정</button>
                     </span>
                     <h6>휴대전화:</h6>
                     <h6>주소:</h6>
                  </div>
                  <br>


                  <div class="payTotalArea">
                     <h4>결제 금액</h4>
                  </div>

                  <table width="600px">
                     <tr style="background: lightgray; height: 30px">
                        <th width="300"><label>총 주문 금액</label></th>
                        <th width="300"><label>할인가</label></th>
                        <th width="300"><label>금액</label></th>
                     </tr>
                     <tr height="80">
                        <td>1</td>
                        <td>1</td>
                        <td>1</td>
                     </tr>
                  </table>
                  <br>
                  <div class="selectcouponArea">
                     <label>쿠폰적용</label>
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <select style="width: 40%">
                        <option>--선택 해주세요--</option>
                     </select> &nbsp;&nbsp;
                     <button>적용</button>
                  </div>

                  <br>
                  <div class="paypalArea">
                     <h4>결제 수단</h4>

                  </div>
                  <table>
                     <tr>
                        <th width="700" style="background: lightgray;"><label>결제수단</label></th>
                        <th width="400" style="background: lightgray;"><label>금액</label></th>
                        <th rowspan="3" width="300px">
                           <button style="width: 100%; height: 150px" onclick="requestPay();">결제하기</button>
                        </th>

                     </tr>
                     <tr>
                        <td rowspan="3">
                           <input type=radio name="paysel"id="paysel1"><label for="paysel1">카드결제</label><br>
                              <input type=radio name="paysel" id="paysel2"><label for="paysel2">계좌이체</label><br>
                        </td>
                        <td rowspan="3">1</td>
                     </tr>
                  </table>




               </div>
               
            </section>


			</div>

			<!-- 오른쪽 빈공간 -->
			<div class="col-sm-2 sidenav"></div>

		</div>

	</div>
	<br>
	<br>
	<br>
	<br>
	<br>

	<!-- 커먼 풋터 -->
	<div class="footerArea">
		<jsp:include page="/views/common/footer.jsp"></jsp:include>
	</div>

	<script>
	 $(function(){
	      var IMP = window.IMP; // 생략가능
	      IMP.init('imp59683824'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	   });
	   
	   function requestPay(){
	      IMP.request_pay({
	          pg : 'danal', // version 1.1.0부터 지원.
	          pay_method :'card',
	          merchant_uid : 'merchant_' + new Date().getTime(),
	          name : '스드메는 지옥이야',
	          amount : 1000,
	          buyer_email : '<%= loginUser.getEmail() %>',
	          buyer_name : '<%= loginUser.getMemberName() %>',
	          buyer_tel : '<%= loginUser.getPhone() %>',
	          m_redirect_url : 'https://www.yourdomain.com/payments/complete'
	      }, function(rsp) {
	          if ( rsp.success ) {
	              var msg = '결제가 완료되었습니다.';
	              msg += '고유ID : ' + rsp.imp_uid;
	              msg += '상점 거래ID : ' + rsp.merchant_uid;
	              msg += '결제 금액 : ' + rsp.paid_amount;
	              msg += '카드 승인번호 : ' + rsp.apply_num;
	          } else {
	              var msg = '결제에 실패하였습니다.';
	              msg += '에러내용 : ' + rsp.error_msg;
	          }
	          alert(msg);
	      });   
	      
	   }
 
	</script>

</body>
</html>