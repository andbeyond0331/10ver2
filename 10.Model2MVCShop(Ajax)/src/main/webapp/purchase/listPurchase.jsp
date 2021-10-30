<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    

<html>
<head>
<title>���� �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<!-- CDN(Content Delivery Network) ȣ��Ʈ ��� -->
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">
	
		//=====����Code �ּ� ó�� ��  jQuery ���� ======//
		// �˻� / page �ΰ��� ��� ��� Form ������ ���� JavaScrpt �̿�  
		function fncGetPurchaseList(currentPage) {
			//document.getElementById("currentPage").value = currentPage;
			$("#currentPage").val(currentPage)
		   	//document.detailForm.submit();
			
			
			$("form").attr("method" , "POST").attr("action" , "/purchase/listPurchase").submit();
		}
		//===========================================//
		//==> �߰��Ⱥκ� : "�˻�" ,  userId link  Event ���� �� ó��
		 $(function() {
			$( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
			 
			//alert( $( ".ct_list_pop td:nth-child(1)" ).data("alice"));
			//alert( $( ".ct_list_pop td:nth-child(3)" ).val());
			//==> �˻� Event ����ó���κ�
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����. 
			
			var tranNo=$( ".ct_list_pop td:nth-child(3)" ).data("val");
			
			//alert("tranNO : " + tranNo);
			
			$( ".ct_list_pop td:nth-child(3)" ).on("click" , function() {
				//Debug..
				//alert(  $( this ).text().trim() );
				self.location ="/user/getUser?userId="+$(this).data("val");
			});
			
			$( ".ct_list_pop td:nth-child(1)" ).on("click" , function() {
				//Debug..
				//alert(  $( this ).text().trim() );
				self.location ="/purchase/getPurchase?tranNo="+$(this).data("val");
			});
			
			/* $("#arrive").on("click",function() {
				self.location="/purchase/updateTranCode?tranNo="+tranNo+"&tranCode=003";
			});
			 */
			//==> UI ���� �߰��κ�  :  userId LINK Event End User ���� ���ϼ� �ֵ��� 
			$("h7").css("color" , "red");
			
			
			//==> �Ʒ��� ���� ������ ������ ??
			//==> �Ʒ��� �ּ��� �ϳ��� Ǯ�� ���� �����ϼ���.					
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
					<td width="93%" class="ct_ttl01">���� �����ȸ</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"	width="12" height="37"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
	<%-- /////////////////////// EL / JSTL �������� �ּ� ó�� ////////////////////////
		<td colspan="11">��ü <%=resultPage.getTotalCount() %> �Ǽ�, ���� <%=resultPage.getCurrentPage() %> ������</td>
	/////////////////////// EL / JSTL �������� �ּ� ó�� //////////////////////// --%>
		<td colspan="11">��ü ${resultPage.totalCount} �Ǽ�, ���� ${resultPage.currentPage}  ������</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">ȸ��ID</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">ȸ����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">��ȭ��ȣ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����Ȳ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">��������</td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
<%--�ּ�////////////
	
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
		<td align="left">����
			<%--
			<%if(vo.getTranCode()!=null){ %>
				<%if(vo.getTranCode().equals("002")){ %>
					���� �Ϸ� 
				<%} else if (vo.getTranCode().equals("003")){ %>
					��� ��
				
				
				<%} else if (vo.getTranCode().equals("000")){ %>
					��� �Ϸ�
				<%} else { %>
					�� �� ����
				<%} %>
			<% }else {%>
				�Ǹ� ��
			<%} %>
				���� �Դϴ�.</td> --%>
			<c:choose>
			<c:when test="${!empty purchase.tranCode && purchase.tranCode eq '002' }">
				���� �Ϸ�
			</c:when>
			<c:when test="${!empty purchase.tranCode && purchase.tranCode eq '003' }">
				��� ��
			</c:when>
			<c:when test="${!empty purchase.tranCode && purchase.tranCode eq '000' }">
				��� �Ϸ�
			</c:when>
			<c:otherwise> �Ǹ� ��</c:otherwise>
			</c:choose>
			�����Դϴ�.</td>
			
		<td></td>
		
		<td align="left" id="arrive">
			<%--
			<% if(vo.getTranCode()!=null){ %>
				<% if (vo.getTranCode().equals("003")){ %>
					<a href="/updateTranCode.do?tranNo=<%=vo.getTranNo() %>&tranCode=003" onClick="return confirm('�ش� ��ǰ�� �����ϼ̽��ϱ�?')">���ǵ���</a>
				<%} %>
			<%} %> --%>
			<c:choose>
				<c:when test="${! empty purchase.tranCode }">
					<c:if test="${purchase.tranCode eq '003' }">
						<!-- //////////jQuery /////////////////
						<a href="/purchase/updateTranCode?tranNo=${purchase.tranNo }&tranCode=003" onClick="return confirm('�ش� ��ǰ�� �����ϼ̽��ϱ�?')">���ǵ���</a>
						////////////////////////////-->
						<input type="hidden" name="tranNo" value="${purchase.tranNo }"/>
						���� ����
					</c:if>
				</c:when>
			</c:choose>
		</td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
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
					�� ����
			<% }else{ %>
					<a href="javascript:fncGetPurchaseList('<%=resultPage.getCurrentPage()-1%>')">�� ����</a>
			<% } %>

			<%	for(int i=resultPage.getBeginUnitPage();i<= resultPage.getEndUnitPage() ;i++){	%>
					<a href="javascript:fncGetPurchaseList('<%=i %>');"><%=i %></a>
			<% 	}  %>
	
			<% if( resultPage.getEndUnitPage() >= resultPage.getMaxPage() ){ %>
					���� ��
			<% }else{ %>
					<a href="javascript:fncGetPurchaseList('<%=resultPage.getEndUnitPage()+1%>')">���� ��</a>
			<% } %>
			/////////////////////////// --%>
			<jsp:include page="../common/pageNavigatorPur.jsp"/>
		
		</td>
	</tr>
</table>

<!--  ������ Navigator �� -->
</form>

</div>

</body>
</html>