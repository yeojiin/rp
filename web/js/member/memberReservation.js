$(function(){
			
			$(document).on('click', '.selectPay', function(){
				var value = $(this).siblings('input').val();
				$.ajax({
					url:"../../package.me",
					type:"get",
					data:{subno:value, mno:$("#mno").val()},
					success:function(data){
						 console.log(data);
						 
						 $(".ui.modal").modal('show');
					},
					error:function(data){
						
					}
				})
				
			});
			
			
			//예약대기, 결제대기, 결제완료 카운트를 리턴
			$.ajax({
				url:"../../selectCount.me",
				type:"post",
				data:{mno:$("#mno").val()},
				success:function(data){
					$("#resWait").text(data.resWait);
					$("#payWait").text(data.payWait);
					$("#payFinal").text(data.payFinal);
				
				},
				error:function(data){
					console.log(data);
				}
				
				
			});
			
			//호출함수
			$("#resWait").click(function(){
				currentView(1,10);				
			});
			
			$("#payWait").click(function(){
				currentView(1,20);
			});
			
			$("#payFinal").click(function(){
				currentView(1,30);
			});
			
			$(".searchBtn").click(function(){
				currentView(1,$(".searchSelect").val());		 
			 });
			
			
			
			//페이징 처리를 하며 리스트를 리턴받음
			function currentView(currentPage,value){
				if(value == 40 || value == 50 || value == 60 || value == 70){
					var firstDate = $(".firstDate").val();
					var lastDate = $(".lastDate").val();
					 
					var firstDateArr = new Array();
					var lastDateArr = new Array();
					 //firstDate.split("-");	 
					for(var i=0; i<firstDate.split("-").length; i++){
						 firstDateArr[i] = firstDate.split("-")[i];
						 lastDateArr[i] = lastDate.split("-")[i];
					 }
					console.log(firstDateArr.join(""));
					console.log(lastDateArr.join(""));
				}else{
					var firstDateArr = new Array();
					var lastDateArr = new Array();
				}
				var sysdate = new Date().getFullYear()+getMonth(new Date().getMonth())+new Date().getDate() + '';
				 if(sysdate === lastDateArr.join("")){
					 var dateform = new Date();
					 dateform.setDate(dateform.getDate() + 1);				 
					 lastDateArr = dateform.getFullYear() + getMonth(dateform.getMonth()) + dateform.getDate() + '';
				}else{
					lastDateArr = lastDateArr.join("");
				}
				 
				 
				$.ajax({
					url:"../../revSelect.me",
					type:"get",
					data:{mno:$("#mno").val(), value:value, currentPage:currentPage, firstDate:firstDateArr.join(""), lastDate:lastDateArr},
					success:function(data){
						viewTable(data,value);						
					},
					error:function(data){
						console.log("error");
					}
					
				});
			
				
			}
			
			
		   //넘겨 받은 pageInfo 객체를  통해 페이징
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
		 	
		   }
		   			
			
		   //초기 날짜를 3개월로 설정
		   getDate(90);
		   
		   
		   //클릭시 날짜를 계산해주는 함수로 인자값을 전송
		   $(".dateSelect").click(function(){
			
			var value = $(this).val();
			
			getDate(value);
		
		 });
		   
		 
		 //넘겨받은 값에 따라 날짜를 계산해주는 포맷
		 function getDate(value){
			
			 var date = new Date();
			 
				if(value == 7){
					date.setDate(date.getDate() - 7);					
				}else if(value == 30){
					date.setMonth(date.getMonth() - 1);
				}else if(value == 90){
					date.setMonth(date.getMonth() - 3);
				}else if(value == 180){
					date.setMonth(date.getMonth() - 6);
				}
			 
			 var month = getMonth(date.getMonth());
			 
			 $(".firstDate").val(date.getFullYear()+ "-" + month + "-" + date.getDate());
			 $(".lastDate").val(new Date().getFullYear()+ "-" + getMonth(new Date().getMonth()) + "-" + new Date().getDate());
			 
		 }
		 
		 
		 //월을 포맷에 맞게 리턴
		 function getMonth(month){
			 		 
			 if(month < 9){
				   month = ('0' + (month+1));
				   
			   }else{
				   month = (month+1);				   
			   }
			 
			 
			 return month;
		 }
		 
		 
			
			function viewTable(data,value){
				$(".infoTable").empty();
				
				if(value==10 || value==20 || value==40 || value == 50){
					$(".statusPayTd").text("예약일");
				}else if(value == 70){
					$(".statusPayTd").text("예약일/결제취소일");
				}else{
					$(".statusPayTd").text("예약일/결제일");
				}
				
				console.log(data);
				
				for(var i=0; i<data.list.length; i++){
					var list = data.list[i];
					
					if(value == 10 || value == 20  || value == 40 || value == 50){
					var $infoTr = $("<tr>");
					var $noTd = $("<td>").text(list.rnum);
					var $pNameTd = $("<td>").text(list.pName);
					var $cNameTd = $("<td>").text(list.cName);
					var $priceTd = $("<td>").text(list.price);
					var $rapplyTd = $("<td>").text(list.rapply.split(" ")[0]);
					
					if(value == 10 || value==40 ) {
						$status = $("<td>").text("예약대기");
						$button = $("<button>").text("예약취소").attr("class","cancellation").css("margin-top","3px");
					}else if(value == 20 || value == 50){
						$status = $("<td>").text("예약승인").css("color","green");
						$paybutton =$("<button>").text("결제하기").attr("class","cancellation selectPay").css("margin-top","3px");
						$button = $("<button>").text("예약취소요청").attr("class","cancellation").css("margin-top","3px");						
						
						var $div = $("<div>")
						$div.append($paybutton);
						$div.append("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
						$div.append($button);
						$div.append(($("<input>").attr("type","hidden").attr("class","subno").val(list.subno)));
						
					}else{
						$status = $("<td>").text("대기");
					}
					
					$infoTr.append($noTd);
					$infoTr.append($cNameTd);
					$infoTr.append($pNameTd);
					$infoTr.append($rapplyTd);
					$infoTr.append($priceTd);
					$infoTr.append($status);										
					if(value == 10 || value==40 ){
						$infoTr.append($button);
					}else{
						$infoTr.append($div);
					}
									
					$(".infoTable").append($infoTr);
					
					}else if(value == 30 || value == 60 || value == 70){
						var $infoTr = $("<tr>");
						var $noTd = $("<td>").text(list.rnum);
						var $pNameTd = $("<td>").text(list.pName);
						var $cNameTd = $("<td>").text(list.cName);
						var $priceTd = $("<td>").text(list.price);
						var $rapplyTd = $("<td>").text(list.rapply.split(" ")[0] + "/" + list.approval.split(" ")[0]);
						//var $approvalTd = $("<td>").text(list.approval.split(" ")[0]);
						
						if(value == 70){
							var $status = $("<td>").text("결제취소").css("color","red");
						}else{
							var $status = $("<td>").text("결제완료").css("color","salmon");
						}
												
						var $div = $("<div>");
						$div.empty();
						
						if(value == 70){
							
						}else{						
						var $button = $("<button>").text("후기작성").attr("class","cancellation").css("margin-top","3px");								
						var $cancleBtn = $("<button>").text("결제취소요청").attr("class","cancellation").css("margin-top","3px");
						}
						
						$div.append($button);
						$div.append("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
						$div.append($cancleBtn);
						
						$infoTr.append($noTd);
						$infoTr.append($cNameTd);
						$infoTr.append($pNameTd);
						$infoTr.append($rapplyTd);
						//$infoTr.append($approvalTd);
						$infoTr.append($priceTd);
						$infoTr.append($status);
						$infoTr.append($div);
						$(".infoTable").append($infoTr);
						
						
					}
						
				}
										
				pageBtn(data,value);
			}
			
			
			
			
		});
		
		