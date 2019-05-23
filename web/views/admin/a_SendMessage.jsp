<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="java.util.*, com.kh.redding.message.model.vo.*"%>
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
   href="${pageContext.request.contextPath}/css/common/layout.css">
<link rel="stylesheet" type="text/css" 
   href="${pageContext.request.contextPath}/css/admin/a_message.css">
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/css/semantic/semantic.min.css">

<style>

</style>
<title>Insert title here</title>
</head>
<body>
   <div>
      <%@include file="/views/admin/a_nav.jsp"%>
   </div>
   <div class="container-fluid text-center">
      <div class="row content">

      <div class="visible-md visible-lg visible-sm">
         <div class="col-sm-2 sidenav1">
            <div class="sidenavArea">
               <ul class="navList">
                  <li onclick="location.href='a_Company.jsp'">업체 목록</li>
                     <li onclick="location.href='<%=request.getContextPath()%>/views/admin/a_Message.jsp'">받은 쪽지 관리</li>
                     <li onclick="location.href='<%=request.getContextPath()%>/views/admin/a_SendMessage.jsp'">보낸 쪽지 관리</li>
               </ul>
            </div>
         </div>
      </div>
      
      <div class="visible-xs sideListnav2">
               <div class="col-sm-2 sidenav1">
                  <div class="sidenavArea2">
                  <ul class="navList2">
                     <li onclick="location.href='a_Company.jsp'">업체 목록</li>
                     <li onclick="location.href='<%=request.getContextPath()%>/views/admin/a_Message.jsp'">받은 쪽지 관리</li>
                     <li onclick="location.href='<%=request.getContextPath()%>/views/admin/a_SendMessage.jsp'">보낸 쪽지 관리</li>
                  </ul>
               </div>
               </div>
               
               <br><br>
            </div>
         <div class="col-sm-8 text-left">
            <%-- ---------------------------------------------- 여기만 작성하세요 ---------------------------------------------- --%>
            <div class="messageArea">
            
               <div class="message">
                  <br>
                  
                  <div class="sendMessage">
                     <h3 id="text2">보낸 쪽지 목록</h3>
                     <br>
                     <div class="ui category search">
                           <div class="ui icon input">
                              <select></select> <input class="prompt" type="text"> 
                              <i class="search icon"></i>
                           </div>
                        </div>
                     <div class="memberBaseInfo">
                        <br> <br>
                        <table id="sendMesTB">
                           <thead class="sendTH">
                              <tr style="background: lightgray;">
                                 <td></td>
                                 <td>No.</td>
                                 <td>수신인</td>
                                 <td>내용</td>
                                 <td>발신날짜</td>
                                 <td>상태</td>
                              </tr>
                           </thead>
                           <tbody class="sendTBody">
                           
      
                           </tbody>
                           
                           <tfoot class="sendTF">
                              <tr>
                                 <td colspan="6" class="pageBtnArea"><br>
                                    <button class="paging"><<</button>
                                    <button class="paging"><</button>
                                    <button class="paging">1</button>
                                    <button class="paging">></button>
                                    <button class="paging">>></button>                     
                                 </td>
                              </tr>
                           </tfoot>
                        </table>
                     </div>
                  </div>

               </div>
            </div>


            <div class="col-sm-2 sidenav2"></div>
         </div>
      </div>
      </div>

      <!-- 커먼 풋터 -->
      <div class="footerArea">
         <jsp:include page="/views/common/footer.jsp"></jsp:include>
      </div>
      <script>
         $(function(){
            var ckCount = 0;
            var nockCount = 0;
            var totalCount = 0;
            $.ajax({
                url:"<%=request.getContextPath()%>/listCount.mes",
               type:"post",
               success:function(data){
                  //처음에 전체 리스트를 보여주는 함수를 호출해준다.
                  /* console.log(data); */
                  ckCount = data.CK_COUNT;
                  nockCount = data.NOCK_COUNT;
                  totalCount = data.TOTAL_COUNT;
                  /* console.log("ckCount : " + ckCount);
                  console.log("nockCount : " + nockCount);
                  console.log(totalCount); */
                  totalView(1, totalCount);
   
               },
               error:function(){
                  alert("통신불가");
               }
            });
            
            //전체 리스트 가져오는 함수
            function totalView(currentPage,value){
               /* console.log('함수 호출');
               console.log("value : " + value); */
               $.ajax({
                  url:"<%=request.getContextPath()%>/sendList.mes",
                  type:"post",
                  data:{currentPage:currentPage, value:value},
                  success:function(data){
                     listTB(data, value);
                     //console.log(data.cnames);
                  },
                  error:function(){
                     alert('nnnnnnnn');
                  }
               });
            };
            

            //테이블 만들어 주는 함수
            function listTB(data, value){
               $(".sendTBody").empty();
               /* console.log(data.sendList.length); */
               /* console.log(data); */
               for(var i=0 ; i<data.sendList.length ; i++){
                  var list = data.sendList[i];
                  var pi = data.pi;
                  var cnames = data.cnames[i];
                  /* console.log(list);
                  console.log(list.messageCode);
                  console.log("--------------"); */
                  var $listTr = $("<tr>");
                  
                  var $ckTd = $("<td><input type='checkbox' class='ckBtns' style='cursor:pointer;'>");
                  
                  var $numTd = $("<td>").text(pi.startRow);
                  var $codeIn = $("<input type='hidden'>");
                  
                  $codeIn.val(list.messageCode);
                  
                  $numTd.append($codeIn);
                  
                  /* console.log(cnames.memberName); */
                  var $nameTd = $("<td>").text(cnames.memberName);
                  
                  
                  var $contentTd = $("<td>").text(list.mesContent.substr(0,10)+"...");
                  var $disDateTd = $("<td>").text(list.mesDisDate);
                  var $levelIn = $("<input type='hidden'>");
                  $levelIn.val(list.mesLevel);
                  $disDateTd.append($levelIn);
                  
                  var $ckDateTd = $("<td>");
                  
                  var $ckDateDiv = null;

                  if(list.mesCkDate != null){
                     $ckDateDiv = $("<div class='readTd' style='border-radius: 5px;background:white;border:1px solid salmon;color:salmon;'>").text(list.mesCkDate);
                  }else{
                     $ckDateDiv = $("<div class='noreadTd' style='border-radius: 5px;background:salmon;border:1px solid salmon;color:white;'>").text("읽지않음");
                  }
                  $ckDateTd.append($ckDateDiv);
                  var $wtypeIn = $("<input type='hidden'>");
                  $wtypeIn.val(list.mesWType);                  
                  $disDateTd.append($wtypeIn);
                  
                  var $refIn = $("<input type='hidden'>");
                  $refIn.val(list.mesRefCode);
                  $disDateTd.append($refIn);
                  
                  var $cnoIn = $("<input type='hidden'>");
                  $cnoIn.val(list.cno);
                  $disDateTd.append($cnoIn);
                  
                  $listTr.append($ckTd);
                  $listTr.append($numTd);
                  $listTr.append($nameTd);
                  $listTr.append($contentTd);
                  $listTr.append($disDateTd);
                  $listTr.append($ckDateTd);
                  
                  
                  $(".sendTBody").append($listTr);
                  
                  pi.startRow++;
               }
               
               $(".sendRBody").append($("<br>"));
               page(data, value);
            };
            
            function page(data, value){
            	var $page = $(".pageBtnArea");
            	
            	var pi = data.pi;
            	var currentPage = pi.currentPage;
            	var limit = pi.limit;
            	var maxPage = pi.maxPage;
            	var startPage = pi.startPage;
            	var endPage = pi.endPage;
            	
            	$page.empty();
            	
            	$page.append($("<button>").attr("class","paging").text("<<").css({"cursor":"pointer","color":"white","background":"salmon","border-radius":"5px","border":"2px solid white"}).click(function(){
            		totalView(1,value);
 			    }));
            	
            	
            	if(currentPage <= 1) { 
					$page.append($("<button>").attr("class","paging").text("<").attr("disabled",true).css({"cursor":"pointer","color":"white","background":"salmon","border-radius":"5px","border":"2px solid white"}));
				}else{ 
					$page.append($("<button>").attr("class","paging").text("<").css({"cursor":"pointer","color":"white","background":"salmon","border-radius":"5px","border":"2px solid white"}).click(function(){
						   totalView(currentPage - 1,value);
					}));

				} 
				for(var p= startPage; p <= endPage; p++){
					if(p == currentPage){
						$page.append($("<button>").attr("class","paging").text(p).attr("disabled",true).css({"cursor":"pointer","color":"white","background":"salmon","border-radius":"5px","border":"2px solid white"}));
					}else{ 
						$page.append($("<button>").attr("class","paging").css({"cursor":"pointer","color":"white","background":"salmon","border-radius":"5px","border":"2px solid white"}).text(p).click(function(){
							totalView($(this).text(),value);
						}));
					}
				
				} 
				if(currentPage >= maxPage){ 
				 	$page.append($("<button>").attr("class","paging").text(">").attr("disabled",true).css({"cursor":"pointer","color":"white","background":"salmon","border-radius":"5px","border":"2px solid white"}));					
				}else {
				 	$page.append($("<button>").attr("class","paging").text(">").css({"cursor":"pointer","color":"white","background":"salmon","border-radius":"5px","border":"2px solid white"}).click(function(){
				 		totalView(currentPage + 1,value);
				 	}));
				} 
				$page.append($("<button>").attr("class","paging").text(">>").css({"cursor":"pointer","color":"white","background":"salmon","border-radius":"5px","border":"2px solid white"}).click(function(){
				   totalView(maxPage,value);
				}));
            }
            /* //페이징함수
            function pageBtn(data,value){
                var $pageBtnArea = $(".pageBtnArea");
                           
               //BoardPageInfo pi = (BoardPageInfo) session.getAttribute("pi");
               var currentPage = data.pi.currentPage;//pi.getCurrentPage();
               var limit = data.pi.limit;
               var maxPage = data.pi.maxPage;
               var startPage = data.pi.startPage;
               var endPage = data.pi.endPage;
               
                        
               $pageBtnArea.empty();
               
               $pageBtnArea.append($("<br>"));         
               
               $pageBtnArea.append($("<button>").attr("class","paging").text("<<").css("cursor","pointer").click(function(){
                  currentView(1,value);
               }));
                     
               if(currentPage <= 1) { 
                  $pageBtnArea.append($("<button>").attr("class","paging").text("<").attr("disabled",true).css("cursor","pointer"));
               }else{ 
                  $pageBtnArea.append($("<button>").attr("class","paging").text("<").css("cursor","pointer").click(function(){
                        currentView(currentPage - 1,value);
                     }));

                } 
                for(var p= startPage; p <= endPage; p++){
                  if(p == currentPage){
                  $pageBtnArea.append($("<button>").attr("class","paging").text(p).attr("disabled",true).css({"cursor":"pointer","color":"white","background":"salmon"}));
                }else{ 
                  $pageBtnArea.append($("<button>").attr("class","paging").css("cursor","pointer").text(p).click(function(){
                        currentView($(this).text(),value);
                     }));
                }
                  
                } 
                if(currentPage >= maxPage){ 
                   $pageBtnArea.append($("<button>").attr("class","paging").text(">").attr("disabled",true).css("cursor","pointer"));               
                }else {
                   $pageBtnArea.append($("<button>").attr("class","paging").text(">").css("cursor","pointer").click(function(){
                        currentView(currentPage + 1,value);
                     }));
                } 
                   $pageBtnArea.append($("<button>").attr("class","paging").text(">>").click(function(){
                        currentView(maxPage,value);
                     }));
                
               } */
         });
      </script>
</body>
</html>