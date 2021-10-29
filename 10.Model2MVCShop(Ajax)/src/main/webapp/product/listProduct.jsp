<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>상품 목록조회</title>

<!--  auto complete를 위한 link -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <!--  auto complete -->
  
<link rel="stylesheet" href="/css/admin.css" type="text/css">

<!-- CDN(Content Delivery Network) 호스트 사용 -->
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
	<script type="text/javascript">
	
		//=====기존Code 주석 처리 후  jQuery 변경 ======//
		// 검색 / page 두가지 경우 모두 Form 전송을 위해 JavaScrpt 이용  
		function fncGetProductList(currentPage) {
			$("#currentPage").val(currentPage)
		   	//document.detailForm.submit();
			
			var menu=$("input[name='menu']").val();
			
			
			alert("menu : " + menu);
			$("form").attr("method","POST").attr("action","/product/listProduct?menu="+menu).submit();
			
		}
		
		 $(function() {
			 
			 var menu=$("input[name='menu']").val();
			 //alert("menu : " + menu);
			//==> 검색 Event 연결처리부분
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함. 
			 $( "td.ct_btn01:contains('검색')" ).on("click" , function() {
				//Debug..
				//alert(  $( "td.ct_btn01:contains('검색')" ).html() );
				fncGetProductList(1);
			});
			
			if(menu == "manage"){
				$( ".ct_list_pop td:nth-child(3)" ).on("click" , function() {
					//Debug..
					//alert(  $( this ).text().trim() );
					self.location ="/product/updateProduct?prodNo="+$(this).find("input[name=prodNo]").val();
				});
				
			} 
			if(menu=="search"){
				//==> userId LINK Event 연결처리
				//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				//==> 3 과 1 방법 조합 : $(".className tagName:filter함수") 사용함.
				$( ".ct_list_pop td:nth-child(3)" ).on("click" , function() {
					//Debug..
					//alert(  $( this ).text().trim() );
					///////////////추가, 변경////////////////////////////
					//self.location ="/product/getProduct?prodNo="+$(this).text().trim();
					//////////////////////////////////////////////////
					var prodNo = $(this).find("input[name=prodNo]").val();
					//alert("prodNo : " +prodNo);
					$.ajax( 
							{
								url : "/product/json/getProduct/"+prodNo ,
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
																+"상 품 번 호 : "+JSONData.prodNo+"<br/>"
																+"상  품  명 : "+JSONData.prodName+"<br/>"
																+"상품  이미지 : "+JSONData.fileName+"<br/>"
																+"상품상세정보 : "+JSONData.prodDetail+"<br/>"
																+"제 조 일 자 : "+JSONData.manuDateString+"<br/>"
																+"가      격 : "+JSONData.price+"<br/>"
																+"등 록 일 자 : "+JSONData.regDateString+"<br/>"
																+"</h3>";
									//Debug...									
									//alert(displayValue);
									$("h3").remove();
									$( "#"+prodNo+"" ).html(displayValue);
								}
						});
						////////////////////////////////////////////////////////////////////////////////////////////
				});
			 }
			
			//==> UI 수정 추가부분  :  userId LINK Event End User 에게 보일수 있도록 
			$( ".ct_list_pop td:nth-child(3)" ).css("background-color" , "black");
			$( ".ct_list_pop td:nth-child(3)" ).css("color" , "lightgreen");
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
			
			
			///////////////auto complete////////////////////////////
			$();
		});	
	</script>		


</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">
<!--  아래 action -> if로 manage랑 search 나눠야 하는가? -->
<!-- ////////////////// jQuery Event 처리로 변경됨 /////////////////////////
<form name="detailForm" action="/product/listProduct?menu=${menu}" method="post">
////////////////////////////////////////////////////////////////////////////////////////////////// -->
<form name="detailForm">



<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">
					
					<c:if test="${menu eq 'search'}">
							상품 목록 조회
					</c:if>
					<c:if test="${menu eq 'manage'}">
							상품 관리
					</c:if>				 
					</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
	<!-- /////////////////////////////
		<c:if test="${menu=='manage'}">
			<td align="right">
				<label><input type="radio" name="shipManagement" value="shipped" ${ ! empty search.shipManagement && search.shipManagement=="shipped" ? "checked" : "" }>미배송순</label>
				<label><input type="radio" name="shipManagement" value="nonshipped" ${ ! empty search.shipManagement && search.shipManagement=="nonshipped" ? "checked" : "" }>기본보기</label>
			</td>
		</c:if>
	
		<td align="right">
			<select name="sortCondition" class="ct_input_g" style="width:80px">
				<option value="0" ${ ! empty search.sortCondition && search.sortCondition==0 ? "selected" : "" }>기본보기</option>
				<option value="1" ${ ! empty search.sortCondition && search.sortCondition==1 ? "selected" : "" }>가격낮은순</option>
				<option value="2" ${ ! empty search.sortCondition && search.sortCondition==2 ? "selected" : "" }>가격높은순</option>
			</select>
			
		</td>
		///////////////////////// -->	

		<td align="right">
			<select name="searchCondition" class="ct_input_g" style="width:80px">
				<%-- /////////////////////// EL / JSTL 적용으로 주석 처리 ////////////////////////
				<option value="0" <%= (searchCondition.equals("0") ? "selected" : "")%>>상품번호</option>
				<option value="1" <%= (searchCondition.equals("1") ? "selected" : "")%>>상품명</option>
				<option value="2" <%= (searchCondition.equals("2") ? "selected" : "")%>>상품가격</option>
				/////////////////////// EL / JSTL 적용으로 주석 처리 //////////////////////// --%>
				<option value="0" ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>상품번호</option>
				<option value="1" ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>상품명</option>
				<option value="2" ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>상품가격</option>
			</select>
			
			<input type="text" name="searchKeyword" 
					value="${!empty search.searchKeyword ? search.searchKeyword : '' }"  
					class="ct_input_g" style="width:200px; height:19px" />
		</td>

		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						<!-- ////////////////// jQuery Event 처리로 변경됨 /////////////////////////
						<a href="javascript:fncGetProductList('1');">검색</a>
						/////////////////////////////////////////////-->
						검색
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<%-- 
		<td colspan="11" >
			전체 <%=resultPage.getTotalCount() %> 건수, 현재 <%= resultPage.getCurrentPage() %> 페이지
		</td>
		--%>
		<td colspan="11" >
			전체 ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage } 페이지
		</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<!-- ////////////////// jQuery Event 처리로 변경됨 /////////////////////////
		<td class="ct_list_b" width="150">상품명</td>
		////////////////////////////////////////////////////////////-->
		<td class="ct_list_b" width="150">
			상품명<br>
			<h7>(id click:상세정보)</h7>
		</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">가격</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">등록일</td>	
		<td class="ct_line02"></td>
		<td class="ct_list_b">현재상태</td>	
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	
	<c:set var="i" value="0"/>
	<c:forEach var="product" items="${list }">
		<c:set var="i" value="${ i+1 }"></c:set>
			<tr class="ct_list_pop">
			<td align="center">${ i }</td>
			<td></td>
			<td align="left">
			
			<%--//////추가기능////// 
				<c:choose>
				<c:when test="${!empty product.proTranCode && product.proTranCode eq '002'}">${product.prodName }</c:when>
				<c:when test="${!empty product.proTranCode && product.proTranCode eq '003'}">${product.prodName }</c:when>
				<c:when test="${!empty product.proTranCode && product.proTranCode eq '000'}">${product.prodName }</c:when>
				<c:otherwise>
					<a href="/getProduct.do?prodNo=${product.prodNo}&menu=${param.menu}">${product.prodName}
					</a>
				</c:otherwise>
				</c:choose>
			//////추가기능//////--%>
			<!-- ////////////////// jQuery Event 처리로 변경됨 /////////////////////////
					<a href="/product/getProduct?prodNo=${product.prodNo}&menu=${menu}&tranCode=${product.proTranCode}">${product.prodName}</a>
			///////////////////////////-->
			${product.prodName}
			 <input type="hidden" id="prodNo" name="prodNo" value="${product.prodNo}"/>
			 <input type="hidden" id="menu" name="menu" value="${param.menu}"/>
			 
			</td>
		
		<td></td>
		<td align="left">${product.price}</td>
		<td></td>
		<td align="left">${product.regDate}</td>
		<td></td>
		<td align="left">
			
			
				<c:choose>
					<c:when test="${!empty product.proTranCode && product.proTranCode eq '002'}">
				
					구매 완료
					<c:choose>
						<c:when test="${menu eq 'manage'}">
								<!-- ////////////////// jQuery Event 처리로 변경됨 /////////////////////////
							<a href="/purchase/updateTranCodeByProd?prodNo=${product.prodNo}&tranCode=${product.proTranCode}" onClick="return confirm('해당 상품 배송을 시작하시겠습니까?')">배송하기
							</a>
							//////////////////////-->
							배송하기
						</c:when>
					</c:choose>
				</c:when>
					
				<c:when test="${!empty product.proTranCode && product.proTranCode eq '003'}">배송 중</c:when>
				<c:when test="${!empty product.proTranCode && product.proTranCode eq '000'}">재고 없음</c:when>
				<c:otherwise>판매 중</c:otherwise>
				</c:choose>
			
			
			
		</td>	
	</tr>
	<tr>
		<!-- //////////////////////////// 추가 , 변경된 부분 /////////////////////////////
			<td colspan="11" bgcolor="D6D7D6" height="1"></td>
			////////////////////////////////////////////////////////////////////////////////////////////  -->
			<td id="${product.prodNo}" colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>	
	</c:forEach>
</table>

<!-- 페이지 Navigator 시작 -->
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="center">
		   <input type="hidden" id="currentPage" name="currentPage" value=""/>
		  
			<jsp:include page="../common/pageNavigatorPro.jsp"/>
		
    	</td>
	</tr>
</table>
<!--  페이지 Navigator 끝 -->

</form>

</div>
</body>
</html>
