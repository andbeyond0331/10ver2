<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    

<html>
<head>
<title>구매 목록조회</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<!-- CDN(Content Delivery Network) 호스트 사용 -->
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">
	
		//=====기존Code 주석 처리 후  jQuery 변경 ======//
		// 검색 / page 두가지 경우 모두 Form 전송을 위해 JavaScrpt 이용  
		function fncGetPurchaseList(currentPage) {
			//document.getElementById("currentPage").value = currentPage;
			$("#currentPage").val(currentPage)
		   	//document.detailForm.submit();
			
			
			$("form").attr("method" , "POST").attr("action" , "/purchase/listPurchase").submit();
		}
		//===========================================//
		//==> 추가된부분 : "검색" ,  userId link  Event 연결 및 처리
		 $(function() {
			$( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
			 
			//alert( $( ".ct_list_pop td:nth-child(1)" ).data("alice"));
			//alert( $( ".ct_list_pop td:nth-child(3)" ).val());
			//==> 검색 Event 연결처리부분
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함. 
			
			var tranNo=$( ".ct_list_pop td:nth-child(3)" ).data("val");
			
			//alert("tranNO : " + tranNo);
			
			$( ".ct_list_pop td:nth-child(3)" ).on("click" , function() {
				//Debug..
				//alert(  $( this ).text().trim() );
				/////////추가, 변경//////////
				//self.location ="/user/getUser?userId="+$(this).data("val");
				///////////////////////////////
				var userId = $(this).data("val").trim();
				alert("userId : " +userId);
				$.ajax( 
						{
							url : "/user/json/getUser/"+userId ,
							method : "GET" ,
							dataType : "json" ,
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							success : function(JSONData , status) {

								//Debug...
								//alert(status);
								//Debug...
								//alert("JSONData : \n"+JSONData);
								
								var displayValue = "<h3>"
															+"아이디 : "+JSONData.userId+"<br/>"
															+"이  름 : "+JSONData.userName+"<br/>"
															+"이메일 : "+JSONData.email+"<br/>"
															+"ROLE : "+JSONData.role+"<br/>"
															+"등록일 : "+JSONData.regDateString+"<br/>"
															+"</h3>";
								//Debug...									
								//alert(displayValue);
								$("h3").remove();
								$( "#"+userId+"" ).html(displayValue);
							}
					});

			});
			
			$( ".ct_list_pop td:nth-child(1)" ).on("click" , function() {
				//Debug..
				
				//////////////추가 변경 ////////////
				//self.location ="/purchase/getPurchase?tranNo="+$(this).data("val");
				//////////////////////////////////
				var tranNo=$(this).data("val");
				alert( "tranNo : "+tranNo );
				$.ajax(
						{
							url : "/purchase/json/getPurchase/"+tranNo,
							method : "GET",
							dataType : "json",
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							success : function(JSONData, status) {
								alert(status);
								alert("JSONData : " +JSONData);
								var displayValue = "<h3>"
													+"주문번호 : "+JSONData.tranNo+"<br/>"
													+"구매자 아이디 : "+JSONData.userId+"<br/>"
													+"구매 방법 : "+JSONData.paymentOption+"<br/>"
													+"받는 사람 : "+JSONData.receiverName+"<br/>"
													+"연락처 : "+JSONData.receiverPhone+"<br/>"
													+"배송지 : "+JSONData.divyAddr+"<br/>"
													+"요청사항 : "+JSONData.divyRequest+"<br/>"
													+"배송희망날짜 : "+JSONData.divyDateString+"<br/>"
													+"주문날짜 : "+JSONData.orderDate+"<br/>"
								$("h3").remove();
								$("#"+tranNo+"").html(displayValue);
								alert("displayValue : " + displayValue);
							}
							
						});
			});
			
			/* $("#arrive").on("click",function() {
				self.location="/purchase/updateTranCode?tranNo="+tranNo+"&tranCode=003";
			});
			 */
			//==> UI 수정 추가부분  :  userId LINK Event End User 에게 보일수 있도록 
			$("h7").css("color" , "red");
			
			
			//==> 아래와 같이 정의한 이유는 ??
			//==> 아래의 주석을 하나씩 풀어 가며 이해하세요.					
			$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
			//console.log ( $(".ct_list_pop:nth-child(1)" ).html() );
			//console.log ( $(".ct_list_pop:nth-child(2)" ).html() );
			//console.log ( $(".ct_list_pop:nth-child(3)" ).html() );
			//console.log ( $(".ct_list_pop:nth-child(4)" ).html() ); //==> ok
			//console.log ( $(".ct_list_pop:nth-child(5)" ).html() ); 
			//console.log ( $(".ct_list_pop:nth-child(6)" ).html() ); //==> ok
			//console.log ( $(".ct_list_pop:nth-child(7)" ).html() ); 
		});	
	</script>


</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width: 98%; margin-left: 10px;">

<form name="detailForm">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"width="15" height="37"></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">구매 목록조회</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"	width="12" height="37"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
	<%-- /////////////////////// EL / JSTL 적용으로 주석 처리 ////////////////////////
		<td colspan="11">전체 <%=resultPage.getTotalCount() %> 건수, 현재 <%=resultPage.getCurrentPage() %> 페이지</td>
	/////////////////////// EL / JSTL 적용으로 주석 처리 //////////////////////// --%>
		<td colspan="11">전체 ${resultPage.totalCount} 건수, 현재 ${resultPage.currentPage}  페이지</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">회원ID</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">회원명</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">전화번호</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">배송현황</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">정보수정</td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
<%--주석////////////
	
		//int no = list.size();
		for(int i=0; i<list.size(); i++) {
			Purchase vo = (Purchase)list.get(i);

	 --%>
	<c:set var="i" value="0"/>
	<c:forEach var="purchase" items="${list }">
		<c:set var="i" value="${i+1 }"/>
			<tr class="ct_list_pop">
			<td align="center" id="No" data-val="${purchase.tranNo }">
			
			${i }
			
			</td>
			<td></td>
			<td align="left" id="userId" data-val="${user.userId }">
				
				${user.userId }
			
		</td>
		<td></td>
		<%-- <td align="left"><%=vo.getReceiverName() %></td>--%>
		<td align="left">${purchase.receiverName }
		</td>
		<td></td>
		<%--<td align="left"><%=vo.getReceiverPhone() %></td> --%>
		<td align="left">${purchase.receiverPhone }
		</td>
		<td></td>
		<td align="left">현재
			<%--
			<%if(vo.getTranCode()!=null){ %>
				<%if(vo.getTranCode().equals("002")){ %>
					구매 완료 
				<%} else if (vo.getTranCode().equals("003")){ %>
					배송 중
				
				
				<%} else if (vo.getTranCode().equals("000")){ %>
					배송 완료
				<%} else { %>
					알 수 없는
				<%} %>
			<% }else {%>
				판매 중
			<%} %>
				상태 입니다.</td> --%>
			<c:choose>
			<c:when test="${!empty purchase.tranCode && purchase.tranCode eq '002' }">
				구매 완료
			</c:when>
			<c:when test="${!empty purchase.tranCode && purchase.tranCode eq '003' }">
				배송 중
			</c:when>
			<c:when test="${!empty purchase.tranCode && purchase.tranCode eq '000' }">
				배송 완료
			</c:when>
			<c:otherwise> 판매 중</c:otherwise>
			</c:choose>
			상태입니다.</td>
			
		<td></td>
		
		<td align="left" id="arrive">
			<%--
			<% if(vo.getTranCode()!=null){ %>
				<% if (vo.getTranCode().equals("003")){ %>
					<a href="/updateTranCode.do?tranNo=<%=vo.getTranNo() %>&tranCode=003" onClick="return confirm('해당 상품을 수령하셨습니까?')">물건도착</a>
				<%} %>
			<%} %> --%>
			<c:choose>
				<c:when test="${! empty purchase.tranCode }">
					<c:if test="${purchase.tranCode eq '003' }">
						<!-- //////////jQuery /////////////////
						<a href="/purchase/updateTranCode?tranNo=${purchase.tranNo }&tranCode=003" onClick="return confirm('해당 상품을 수령하셨습니까?')">물건도착</a>
						////////////////////////////-->
						<input type="hidden" name="tranNo" value="${purchase.tranNo }"/>
						물건 도착
					</c:if>
				</c:when>
			</c:choose>
		</td>
	</tr>
	<tr>
		<!-- /////////추가, 변경부분////////////
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
		///////// -->
		<td id="${user.userId }" colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>
	<tr>
		
		<td id="${purchase.tranNo }" colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>
	
<%--<% } --%>
</c:forEach>	

</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
	<tr>
		<td align="center">
		<input type="hidden" id="currentPage" name="currentPage" value=""/>
		<%--//////////////////////////////////
			<% if( resultPage.getCurrentPage() <= resultPage.getPageUnit() ){ %>
					◀ 이전
			<% }else{ %>
					<a href="javascript:fncGetPurchaseList('<%=resultPage.getCurrentPage()-1%>')">◀ 이전</a>
			<% } %>

			<%	for(int i=resultPage.getBeginUnitPage();i<= resultPage.getEndUnitPage() ;i++){	%>
					<a href="javascript:fncGetPurchaseList('<%=i %>');"><%=i %></a>
			<% 	}  %>
	
			<% if( resultPage.getEndUnitPage() >= resultPage.getMaxPage() ){ %>
					이후 ▶
			<% }else{ %>
					<a href="javascript:fncGetPurchaseList('<%=resultPage.getEndUnitPage()+1%>')">이후 ▶</a>
			<% } %>
			/////////////////////////// --%>
			<jsp:include page="../common/pageNavigatorPur.jsp"/>
		
		</td>
	</tr>
</table>

<!--  페이지 Navigator 끝 -->
</form>

</div>

</body>
</html>