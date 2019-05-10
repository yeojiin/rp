<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
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
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR"
   rel="stylesheet">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!-- 글꼴 -->
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/css/member/m_header.css">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/css/member/m_nav.css">
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/css/common/footer.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
<style>
.container {
   width: 100%;
   color: salmon;
   font-family: 'Noto Sans KR', sans-serif;
}

.row.content {
   height: 490px;
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
            <br><br>
            <div id="board">
                <div class="input-append span12" align="right">
                   <button type="button" class="btn btn-outline-success slideright">정보공유</button>
                    <button type="button" class="btn btn-outline-success slideright">질문있어요</button>
                    <input type="text" class="search-query" placeholder="Search">
                    <button type="submit" class="btn"><i class="fas fa-search"></i></button>
                </div>
               <table class="table table-striped" style="width:80%; margin-left:10%;">
                  <thead>
                     <tr>
                        <th>카테고리</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>작성일</th>
                        <th>조회수</th>
                        <th>좋아요</th>
                     </tr>
                  </thead>
                  <tbody>
                     <tr style="color:salmon">
                        <td>공지</td>
                        <td>제목1</td>
                        <td>관리자</td>
                        <td>19.04.16</td>
                        <td>10</td>
                        <td>15</td>
                     </tr>
                     <tr style="color:salmon">
                        <td>공지</td>
                        <td>제목2</td>
                        <td>관리자</td>
                        <td>19.04.16</td>
                        <td>14</td>
                        <td>2</td>
                     </tr>
                     <tr>
                        <td>정보공유</td>
                        <td>제목3</td>
                        <td>전효정</td>
                        <td>19.05.16</td>
                        <td>20</td>
                        <td>35</td>
                     </tr>
                     <tr>
                        <td>질문있어요</td>
                        <td>제목4</td>
                        <td>문지원</td>
                        <td>19.05.16</td>
                        <td>50</td>
                        <td>85</td>
                     </tr>
                  </tbody>
               </table>
               <!-- <hr style="align:center; border-color:black; width:100%;" > -->
               <a class="btn btn-default" style="margin-left:10%">글쓰기</a>
               
               <div class="text-center">
                  <ul class="pagination">
                     <li><a href="#">1</a></li>
                     <li><a href="#">2</a></li>
                     <li><a href="#">3</a></li>
                     <li><a href="#">4</a></li>
                     <li><a href="#">5</a></li>
                  </ul>
               </div>
            </div>
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