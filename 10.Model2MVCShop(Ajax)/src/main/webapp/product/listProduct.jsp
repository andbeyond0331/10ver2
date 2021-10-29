<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>��ǰ �����ȸ</title>

<!--  auto complete�� ���� link -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <!--  auto complete -->
  
<link rel="stylesheet" href="/css/admin.css" type="text/css">

<!-- CDN(Content Delivery Network) ȣ��Ʈ ��� -->
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
	<script type="text/javascript">
	
		//=====����Code �ּ� ó�� ��  jQuery ���� ======//
		// �˻� / page �ΰ��� ��� ��� Form ������ ���� JavaScrpt �̿�  
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
			//==> �˻� Event ����ó���κ�
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����. 
			 $( "td.ct_btn01:contains('�˻�')" ).on("click" , function() {
				//Debug..
				//alert(  $( "td.ct_btn01:contains('�˻�')" ).html() );
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
				//==> userId LINK Event ����ó��
				//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				//==> 3 �� 1 ��� ���� : $(".className tagName:filter�Լ�") �����.
				$( ".ct_list_pop td:nth-child(3)" ).on("click" , function() {
					//Debug..
					//alert(  $( this ).text().trim() );
					///////////////�߰�, ����////////////////////////////
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
																+"�� ǰ �� ȣ : "+JSONData.prodNo+"<br/>"
																+"��  ǰ  �� : "+JSONData.prodName+"<br/>"
																+"��ǰ  �̹��� : "+JSONData.fileName+"<br/>"
																+"��ǰ������ : "+JSONData.prodDetail+"<br/>"
																+"�� �� �� �� : "+JSONData.manuDateString+"<br/>"
																+"��      �� : "+JSONData.price+"<br/>"
																+"�� �� �� �� : "+JSONData.regDateString+"<br/>"
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
			
			//==> UI ���� �߰��κ�  :  userId LINK Event End User ���� ���ϼ� �ֵ��� 
			$( ".ct_list_pop td:nth-child(3)" ).css("background-color" , "black");
			$( ".ct_list_pop td:nth-child(3)" ).css("color" , "lightgreen");
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
			
			
			///////////////auto complete////////////////////////////
			$();
		});	
	</script>		


</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">
<!--  �Ʒ� action -> if�� manage�� search ������ �ϴ°�? -->
<!-- ////////////////// jQuery Event ó���� ����� /////////////////////////
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
							��ǰ ��� ��ȸ
					</c:if>
					<c:if test="${menu eq 'manage'}">
							��ǰ ����
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
				<label><input type="radio" name="shipManagement" value="shipped" ${ ! empty search.shipManagement && search.shipManagement=="shipped" ? "checked" : "" }>�̹�ۼ�</label>
				<label><input type="radio" name="shipManagement" value="nonshipped" ${ ! empty search.shipManagement && search.shipManagement=="nonshipped" ? "checked" : "" }>�⺻����</label>
			</td>
		</c:if>
	
		<td align="right">
			<select name="sortCondition" class="ct_input_g" style="width:80px">
				<option value="0" ${ ! empty search.sortCondition && search.sortCondition==0 ? "selected" : "" }>�⺻����</option>
				<option value="1" ${ ! empty search.sortCondition && search.sortCondition==1 ? "selected" : "" }>���ݳ�����</option>
				<option value="2" ${ ! empty search.sortCondition && search.sortCondition==2 ? "selected" : "" }>���ݳ�����</option>
			</select>
			
		</td>
		///////////////////////// -->	

		<td align="right">
			<select name="searchCondition" class="ct_input_g" style="width:80px">
				<%-- /////////////////////// EL / JSTL �������� �ּ� ó�� ////////////////////////
				<option value="0" <%= (searchCondition.equals("0") ? "selected" : "")%>>��ǰ��ȣ</option>
				<option value="1" <%= (searchCondition.equals("1") ? "selected" : "")%>>��ǰ��</option>
				<option value="2" <%= (searchCondition.equals("2") ? "selected" : "")%>>��ǰ����</option>
				/////////////////////// EL / JSTL �������� �ּ� ó�� //////////////////////// --%>
				<option value="0" ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>��ǰ��ȣ</option>
				<option value="1" ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>��ǰ��</option>
				<option value="2" ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>��ǰ����</option>
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
						<!-- ////////////////// jQuery Event ó���� ����� /////////////////////////
						<a href="javascript:fncGetProductList('1');">�˻�</a>
						/////////////////////////////////////////////-->
						�˻�
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
			��ü <%=resultPage.getTotalCount() %> �Ǽ�, ���� <%= resultPage.getCurrentPage() %> ������
		</td>
		--%>
		<td colspan="11" >
			��ü ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage } ������
		</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<!-- ////////////////// jQuery Event ó���� ����� /////////////////////////
		<td class="ct_list_b" width="150">��ǰ��</td>
		////////////////////////////////////////////////////////////-->
		<td class="ct_list_b" width="150">
			��ǰ��<br>
			<h7>(id click:������)</h7>
		</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����</td>	
		<td class="ct_line02"></td>
		<td class="ct_list_b">�������</td>	
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
			
			<%--//////�߰����////// 
				<c:choose>
				<c:when test="${!empty product.proTranCode && product.proTranCode eq '002'}">${product.prodName }</c:when>
				<c:when test="${!empty product.proTranCode && product.proTranCode eq '003'}">${product.prodName }</c:when>
				<c:when test="${!empty product.proTranCode && product.proTranCode eq '000'}">${product.prodName }</c:when>
				<c:otherwise>
					<a href="/getProduct.do?prodNo=${product.prodNo}&menu=${param.menu}">${product.prodName}
					</a>
				</c:otherwise>
				</c:choose>
			//////�߰����//////--%>
			<!-- ////////////////// jQuery Event ó���� ����� /////////////////////////
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
				
					���� �Ϸ�
					<c:choose>
						<c:when test="${menu eq 'manage'}">
								<!-- ////////////////// jQuery Event ó���� ����� /////////////////////////
							<a href="/purchase/updateTranCodeByProd?prodNo=${product.prodNo}&tranCode=${product.proTranCode}" onClick="return confirm('�ش� ��ǰ ����� �����Ͻðڽ��ϱ�?')">����ϱ�
							</a>
							//////////////////////-->
							����ϱ�
						</c:when>
					</c:choose>
				</c:when>
					
				<c:when test="${!empty product.proTranCode && product.proTranCode eq '003'}">��� ��</c:when>
				<c:when test="${!empty product.proTranCode && product.proTranCode eq '000'}">��� ����</c:when>
				<c:otherwise>�Ǹ� ��</c:otherwise>
				</c:choose>
			
			
			
		</td>	
	</tr>
	<tr>
		<!-- //////////////////////////// �߰� , ����� �κ� /////////////////////////////
			<td colspan="11" bgcolor="D6D7D6" height="1"></td>
			////////////////////////////////////////////////////////////////////////////////////////////  -->
			<td id="${product.prodNo}" colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>	
	</c:forEach>
</table>

<!-- ������ Navigator ���� -->
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="center">
		   <input type="hidden" id="currentPage" name="currentPage" value=""/>
		  
			<jsp:include page="../common/pageNavigatorPro.jsp"/>
		
    	</td>
	</tr>
</table>
<!--  ������ Navigator �� -->

</form>

</div>
</body>
</html>
