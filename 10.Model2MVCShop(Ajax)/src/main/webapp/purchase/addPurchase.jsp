<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>
<title>���� �Ϸ�</title>

</head>

<body>

<%-- <form name="updatePurchase" action="/updatePurchaseView.do?tranNo=<%=purchaseVO.getTranNo() %>" method="post">--%>
<form name="updatePurchase" action="/purchase/updatePurchase?tranNo=${puchase.tranNo}" method="post">


������ ���� ���Ű� �Ǿ����ϴ�.

<table border=1>
	<tr>
		<td>��ǰ��ȣ</td>
		<%--<td><%=purchaseVO.getPurchaseProd().getProdNo() %></td> --%>
		<td>${purchase.purchaseProd.prodNo }</td>
		<td></td>
	</tr>
	<tr>
		<td>�����ھ��̵�</td>
		<%-- <td><%=purchaseVO.getBuyer().getUserId() %></td>--%>
		<td>${purchase.buyer.userId }</td>
		<td></td>
	</tr>
	<tr>
		<td>���Ź��</td>
		<td>
		
		<c:if test="${purchase.paymentOption != null }">
			<c:if test="${purchase.paymentOption=='1' }">
				���ݰ���
			</c:if>
			<c:if test="${purchase.paymentOption=='2' }">
				�ſ����
			</c:if>
		</c:if>
			
			
		
		</td>
		<td></td>
	</tr>
	<tr>
		<td>�������̸�</td>
		<%-- <td><%=purchaseVO.getReceiverName() %></td>--%>
		<td>${purchase.receiverName }</td>
		<td></td>
	</tr>
	<tr>
		<td>�����ڿ���ó</td>
		<%--<td><%=purchaseVO.getReceiverPhone() %></td> --%>
		<td>${purchase.receiverPhone }</td>
		<td></td>
	</tr>
	<tr>
		<td>�������ּ�</td>
		<%--<td><%=purchaseVO.getDivyAddr() %></td> --%>
		<td>${purchase.divyAddr}</td>
		<td></td>
	</tr>
		<tr>
		<td>���ſ�û����</td>
		<%--<td><%=purchaseVO.getDivyRequest() %></td> --%>
		<td>${purchase.divyRequest}</td>
		<td></td>
	</tr>
	<tr>
		<td>����������</td>
		<%--<td><%=purchaseVO.getDivyDate() %></td> --%>
		<td>${purchase.divyDate}</td>
		<td></td>
	</tr>
</table>
</form>

</body>
</html>