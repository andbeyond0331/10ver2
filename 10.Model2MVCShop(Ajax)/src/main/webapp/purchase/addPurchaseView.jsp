<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--  /////////////// EL / JSTL 적용으로 주석 처리 ///////////////////////////

 <%@ page import="com.model2.mvc.service.domain.*"%>


<%
	//ProductVO productVO = (ProductVO)session.getAttribute("productVO");
	Purchase purchaseVO = (Purchase)session.getAttribute("purchaseVO");
	//UserVO userVO = (UserVO)session.getAttribute("user");
%>

/////////////// EL / JSTL 적용으로 주석 처리 ///////////////////////////--%>
<html>
<head>
<!--  달력 데이터 추가(jQuery) -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>상품 구매</title>
<!--  달력 데이터 추가(jQuery) -->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<!--///////////////////  jQuery 사용으로 주석 처리 
<script type="text/javascript" src="../javascript/calendar.js">
</script>//////////////////////////-->

<!-- CDN(Content Delivery Network) 호스트 사용 -->
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script src="http://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>

<script type="text/javascript">
//====기존Code 주석 처리 후 jQuery 변경 =====//
function fncAddPurchase(){
	

	
	$("form").attr("method", "POST").attr("action","/purchase/addPurchase").submit();
}

/*===========jQuery 변경 주석처리 ========
function resetData(){
	document.detailForm.reset();
}============================*/
//==> 추가된 부분 : "취소:" Event 처리 및 연결
$(function(){
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
	 $( "td.ct_btn01:contains('취소')" ).on("click" , function() {
			//Debug..
			//alert(  $( "td.ct_btn01:contains('취소')" ).html() );
			$("form")[0].reset();
	});
	
	 $( "td.ct_btn01:contains('구매')" ).on("click" , function() {
			//Debug..
			//alert(  $( "td.ct_btn01:contains('구매')" ).html() );
			fncAddPurchase();
	});
	 
	 $($('input:text[name="receiverDate"]')).datepicker({
			showOn : "button",
			buttonImage: "../images/ct_icon_date.gif",
			buttonImageOnly: true,
			buttonText: "Select date"
			
		});

		$($('input:text[name="receiverDate"]')).datepicker( "option", "showAnim", "bounce" );
		$($('input:text[name="receiverDate"]')).datepicker( "option", "dateFormat", "yy-mm-dd" );
});	

</script>

</head>

<body>

<form name="addPurchase">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37">
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">상품 구매</td>
					<td width="20%" align="right">&nbsp;</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>

<%-- <input type="hidden" name="prodNo" value="<%=purchaseVO.getPurchaseProd().getProdNo()%>" />--%>
<input type="hidden" name="prodNo" value="${purchase.purchaseProd.prodNo }" />

<table width="600" border="0" cellspacing="0" cellpadding="0"	align="center" style="margin-top: 13px;">
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="300" class="ct_write">
			상품번호 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01" width="299">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<%--<td width="105"><%=purchaseVO.getPurchaseProd().getProdNo()%></td> --%>
					<td width="105">${purchase.purchaseProd.prodNo }</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			상품명 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<%-- <td class="ct_write01"><%=purchaseVO.getPurchaseProd().getProdName()%></td>--%>
		<td class="ct_write01">${purchase.purchaseProd.prodName }</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			상품상세정보 <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<%-- <td class="ct_write01"><%=purchaseVO.getPurchaseProd().getProdDetail()%></td>--%>
		<td class="ct_write01">${purchase.purchaseProd.prodDetail }</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">제조일자</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<%-- <td class="ct_write01"><%=purchaseVO.getPurchaseProd().getManuDate()%></td>--%>
		<td class="ct_write01">${purchase.purchaseProd.manuDate}</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">가격</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<%-- <td class="ct_write01"><%=purchaseVO.getPurchaseProd().getPrice()%></td>--%>
		<td class="ct_write01">${purchase.purchaseProd.price}</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">등록일자</td>
		<td bgcolor="D6D6D6" width="1"></td>
		
		<%-- <td class="ct_write01"><%=purchaseVO.getPurchaseProd().getRegDate()%></td>--%>
		<td class="ct_write01">${purchase.purchaseProd.regDate}</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			구매자아이디 <img 	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<%-- <td class="ct_write01"><%=purchaseVO.getBuyer().getUserId()%></td>--%>
		<td class="ct_write01">${user.userId}</td>
		<%--<input type="hidden" name="buyerId" value="<%=purchaseVO.getBuyer().getUserId()%>" /> --%>
		<input type="hidden" name="buyerId" value="${user.userId}" />
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">구매방법</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<select 	name="paymentOption"		class="ct_input_g" 
							style="width: 100px; height: 19px" maxLength="20">
				<option value="1" selected="selected">현금구매</option>
				<option value="2">신용구매</option>
			</select>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">구매자이름</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<%--<input type="text" name="receiverName" 	class="ct_input_g" 
						style="width: 100px; height: 19px" maxLength="20" value="<%=purchaseVO.getReceiverName()%>" /> --%>
			<input type="text" name="receiverName" 	class="ct_input_g" 
						style="width: 100px; height: 19px" maxLength="20" value="${purchase.receiverName}" />
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">구매자연락처</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<%--<input type="text" name="receiverPhone" 	class="ct_input_g" 
						style="width: 100px; height: 19px" maxLength="20" value="<%=purchaseVO.getReceiverPhone()%>" /> --%>
			<input type="text" name="receiverPhone" 	class="ct_input_g" 
						style="width: 100px; height: 19px" maxLength="20" value="${purchase.receiverPhone}" />
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">구매자주소</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<%--<input type="text" name="receiverAddr" 	class="ct_input_g" 
						style="width: 100px; height: 19px" maxLength="20" value="<%=purchaseVO.getDivyAddr()%>" /> --%>
			<input type="text" name="divyAddr" 	class="ct_input_g" 
						style="width: 100px; height: 19px" maxLength="20" value="${purchase.divyAddr}" />
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">구매요청사항</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<%--<input type="text" name="receiverRequest" 	class="ct_input_g" 
						style="width: 100px; height: 19px" maxLength="20" value="<%=purchaseVO.getDivyRequest()%>" /> --%>
			<input type="text" name="divyRequest" 	class="ct_input_g" 
						style="width: 100px; height: 19px" maxLength="20" value="${purchase.divyRequest}" />
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">배송희망일자</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td width="200" class="ct_write01">
			<!-- //////jQuery 적용으로 주석
			<input 	type="text" readonly="readonly" name="receiverDate" class="ct_input_g" 
							style="width: 100px; height: 19px" maxLength="20"/>
			<img 	src="../images/ct_icon_date.gif" width="15" height="15"	
						onclick="show_calendar('document.addPurchase.receiverDate', document.addPurchase.receiverDate.value)"/>
			//////////////// -->
			<input type="text" name="receiverDate" class="ct_input_g" style="width: 100px; height: 19px" maxLength="10" minLength="6"/>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
	<tr>
		<td width="53%"></td>
		<td align="center">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
					<!-- jQuery로 인한 주석 처리..///////////// 
					<a href="javascript:fncAddPurchase();" onClick="return confirm('구매하시겠습니까?')">구매</a>
					 ////////////////////-->
					 구매
					
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
					<td width="30"></td>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
						<!-- jQuery로 인한 주석 처리..///////////// 
						<a href="javascript:history.go(-1)">취소</a>
						 ////////////////////-->
						 취소
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</form>

</body>
</html>