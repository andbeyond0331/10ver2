<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>
<title>구매 완료</title>

</head>

<body>

<%-- <form name="updatePurchase" action="/updatePurchaseView.do?tranNo=<%=purchaseVO.getTranNo() %>" method="post">--%>
<form name="updatePurchase" action="/purchase/updatePurchase?tranNo=${puchase.tranNo}" method="post">


다음과 같이 구매가 되었습니다.

<table border=1>
	<tr>
		<td>물품번호</td>
		<%--<td><%=purchaseVO.getPurchaseProd().getProdNo() %></td> --%>
		<td>${purchase.purchaseProd.prodNo }</td>
		<td></td>
	</tr>
	<tr>
		<td>구매자아이디</td>
		<%-- <td><%=purchaseVO.getBuyer().getUserId() %></td>--%>
		<td>${purchase.buyer.userId }</td>
		<td></td>
	</tr>
	<tr>
		<td>구매방법</td>
		<td>
		
		<c:if test="${purchase.paymentOption != null }">
			<c:if test="${purchase.paymentOption=='1' }">
				현금결제
			</c:if>
			<c:if test="${purchase.paymentOption=='2' }">
				신용결제
			</c:if>
		</c:if>
			
			
		
		</td>
		<td></td>
	</tr>
	<tr>
		<td>구매자이름</td>
		<%-- <td><%=purchaseVO.getReceiverName() %></td>--%>
		<td>${purchase.receiverName }</td>
		<td></td>
	</tr>
	<tr>
		<td>구매자연락처</td>
		<%--<td><%=purchaseVO.getReceiverPhone() %></td> --%>
		<td>${purchase.receiverPhone }</td>
		<td></td>
	</tr>
	<tr>
		<td>구매자주소</td>
		<%--<td><%=purchaseVO.getDivyAddr() %></td> --%>
		<td>${purchase.divyAddr}</td>
		<td></td>
	</tr>
		<tr>
		<td>구매요청사항</td>
		<%--<td><%=purchaseVO.getDivyRequest() %></td> --%>
		<td>${purchase.divyRequest}</td>
		<td></td>
	</tr>
	<tr>
		<td>배송희망일자</td>
		<%--<td><%=purchaseVO.getDivyDate() %></td> --%>
		<td>${purchase.divyDate}</td>
		<td></td>
	</tr>
</table>
</form>

</body>
</html>